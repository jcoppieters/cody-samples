/**
 * Tim Coppieters
 * september 2013
 */
var Model        = require('./Model.js');

var DealSlot = Model.extend(
  "deal_slots",
  ["deal_id", "start_time", "end_time", "quantity"],
  {
    scrapeFrom: function(controller, nr, deal_id) {
      this.start_time = makeTime(controller.getParam("start_time"+nr),"00", "00");
      this.end_time = makeTime(controller.getParam("end_time"+nr), "23", "59");
      this.quantity = controller.getInt("quantity"+nr, 0);
      this.id = controller.getInt("slot"+nr, 0);
      this.deal_id = deal_id;
    },

    isEmpty: function() {
      return (this.start_time + this.end_time + this.quantity === "00:0023:590");
    }
   }
);

DealSlot.scrapeList = function(controller, deal_id) {
  var nr = 1;
  var list = [];
  while (controller.getParam("slot"+nr, "") !== "") {
    var slot = new DealSlot();
    slot.scrapeFrom(controller, nr, deal_id);
    list.push(slot);
    nr++;
  }
  return list;
};

function makeTime(str, defHH, defMM) {
  var HH = defHH;
  var MM = defMM;
  if (str.indexOf(":") < 0) {
    str = str.substr(0,2) + ":" + str.substr(2,2);
  }
  var parts = str.split(":");

  var i = parseInt(parts[0], 10);
  if (! isNaN(i)) {
    if (i > 23) i = 23;
    HH = (i < 10) ? ("0"+i) : (""+i);
  }

  if (parts.length > 1) {
    i = parseInt(parts[1], 10);
    if (! isNaN(i)) {
      if (i > 59) i = 59;
      MM = (i < 10) ? ("0"+i) : (""+i);
    }
  }
  return HH + ":" + MM;
}
module.exports = DealSlot;