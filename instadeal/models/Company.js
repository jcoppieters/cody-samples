/**
 * Tim Coppieters
 * september 2013
 */

var Model = require('./Model.js');


var Company = Model.extend(
  "companies",
  ["name", "btw", "image_ext", "description", "user_id", "location_id", "category_id"],
  {
    // Prototype Methods
    getPath: function () {
      return this.id + "." + this.image_ext;
    }
  }
);


module.exports = Company;