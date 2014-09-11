/**
 * Tim Coppieters
 * september 2013
 */

var moment       = require('moment');

var Model        = require('./Model.js');
var DealSlot     = require('./DealSlot.js');


  var Deal = Model.extend(
    "deals",
    ["deal_template_id", "date"], {
    // prototype properties
    discount: function () {
      return Math.ceil((1 - (this.price / this.normal_price)) * 100);
    },
    fetchRemaining: function (controller, fn) {
      var self  = this;
      var query = " SELECT s.id AS slot_id, (s.quantity - SUM(IFNULL(r.quantity, 0))) AS remaining" +
                  " FROM deal_slots AS s left outer join reservations AS r ON" +
                  " r.deal_slot_id = s.id" +
                  " WHERE s.deal_id = ?" +
                  " GROUP BY s.id";
      controller.query(query, this.id, function (err, rows) {
        if (err) throw err;
        var sum = 0;
        self.remaining = {};
        rows.forEach(function (row) {
          self.remaining[row.slot_id] = row.remaining;
          sum += row.remaining;
        });
        self.total_remaining = sum;
        fn(undefined, self);
      });
    },
    scrapeFrom: function(controller, deal_template_id) {
        this.date = controller.getDate("date");
        this.deal_template_id = deal_template_id;
    }
    }, {
    // constructor properties
    active: function (controller, options, fn) {
      // options: { date: Date }
      var date = options.date || new Date();
      var query = " SELECT d.id, d.date, d.deal_template_id, t.title, t.description, t.normal_price, t.price, t.image_ext " +
                  " FROM deals AS d JOIN deal_templates AS t ON" +
                  " d.deal_template_id = t.id" +
                  " WHERE d.date > NOW() AND DATE(d.date) > DATE(?)";
      controller.query(query, [date], function (err, deals) {
        if (err) throw err;
        fn(deals);
      });
    },

    listSeller: function(controller, seller_id, fn) {
      controller.query("SELECT d.id, d.date, t.id as dealtemplate_id, t.title, t.description, t.image_ext, t.price, t.normal_price, t.seller_id" +
        " FROM deal_templates t left outer JOIN deals d ON d.deal_template_id = t.id" +
        " where t.seller_id = ?", [ seller_id ], function(err, result) {
        var list = [];
        if (! err) { result.forEach(function (row) { list.push(row); }); }
        fn(err, list);
      });
    },

    getById: function (controller, id, fn) {
      var query = " SELECT d.id, d.date," +
                         " d.deal_template_id, t.title, t.description, t.image_ext, t.price, t.normal_price," +
                         " t.seller_id," +
                         " s.id AS deal_slot_id, s.start_time, s.end_time, s.quantity " +
                  " FROM deals AS d" +
                  " JOIN deal_templates as t ON d.deal_template_id = t.id" +
                  " LEFT JOIN deal_slots as s ON s.deal_id = d.id" +
                  " where d.id = ?";
      controller.query(query, [id], function (err, rows) {
        if (err) throw err;
        var deal;
        if (rows.length > 0) {
          deal = new Deal(rows[0]);
          deal.slots = rows.map(function (row) {
            return new DealSlot().fromRecord(row, "deal_slot_id");
          });
          deal.fetchRemaining(controller, fn);
        }
      });
    },

    dateFilters: function (controller, num) {
      var today = moment();
      today.hour(0)
           .minute(0)
           .second(0)
           .millisecond(0);
      var tomorrow = moment(today).add('days', '1');
      var all = {
        listFormat: function () {
          return controller.context.render({name: 'everything'});
        },
        format: function () {
          return 0;
        }
      };
      today.listFormat = function () { return controller.context.render({name: 'today'}); };
      today.format     = function () { return controller.context.formatDate(this.toDate()); };
      tomorrow.listFormat = function () { return controller.context.render({name: 'tomorrow'}); };
      tomorrow.format     = function () { return controller.context.formatDate(this.toDate()); };
      var dates = [all, today, tomorrow];
      function makeListFormat() {
        return function () {
          return this.format("dd - DD/MM/YYYY");
        };
      }
      function makeFormat() {
        return function () {
          return controller.context.formatDate(this.toDate());
        };
      }
      for (var i = 2; i < num; i++) {
        var date = moment(today).add('days', i);
        date.listFormat = makeListFormat();
        date.format = makeFormat();
        dates.push(date);
      }
      return dates;
    }
  });

module.exports = Deal;