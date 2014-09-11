/**
 * Tim Coppieters
 * september 2013
 */
var Model        = require('./Model.js');

var Category = Model.extend(
  "categories",
  ["name"]
);

module.exports = Category;