/**
 * Tim Coppieters
 * september 2013
 */
var cody  = require("cody/index.js");
var moment = require("moment");
var Deal   = require("../models/Deal.js");
var Category = require("../models/Category.js");

function DealController(context) {
  console.log("DealController construct");

  cody.Controller.call(this, context);

  // setup moment for the views
  this.context.moment = moment;
  moment.lang(this.context.page.language);
}
DealController.prototype = Object.create(cody.Controller.prototype);

DealController.prototype.doRequest = function (finish) {
  var self = this;

  // request for displaying the login screen
  if (self.isRequest("") || this.isRequest("list")) {
    self.doList(finish);

  } else if (self.isRequest("show")) {
    self.doShow(this.getId(), finish);

  } else {
    finish();
  }


    //cody.Controller.prototype.doRequest.call(self, finish);
};

DealController.prototype.doList = function (finish) {
  var self = this;

  var date        = self.context.date        = this.getDate("date");
  var date_format = self.context.date_format = this.getParam("date");
  var category_id = self.context.category_id = this.getInt("category", 0);

  Deal.active(self, {date: date}, function (err, deals) {
    Category.all(self, function (err, categories) {
      self.context.deals = deals;
      self.context.categories = categories;
      self.context.dates = Deal.dateFilters(self, 5);
      finish();
    });
  });
};

DealController.prototype.doShow = function (id, finish) {
  var self = this;

  Deal.getById(self, id, function (err, deal) {
    Deal.active(self, {limit: 5}, function (err, deals) {
      console.log(deal);
      self.context.deal = deal;
      self.context.deals = deals;
      finish();
    });
  });
};


module.exports = DealController;

