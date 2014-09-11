/**
 * Tim Coppieters
 * september 2013
 */

var Model        = require('./Model.js');


var DealTemplate = Model.extend(
  "deal_templates",
  ["title", "description", "image_ext", "price", "normal_price", "seller_id"],
  {
    // Prototype Methods
    getPath: function () {
      return "/deals/" + this.id + "." + this.image_ext;
    },

    scrapeFrom: function(controller) {
      this.title = controller.getParam("title");
      this.description = controller.getParam("description");
      this.price = controller.getNum("price");
      this.normal_price = controller.getNum("normal_price");
    }
  }
);


module.exports = DealTemplate;