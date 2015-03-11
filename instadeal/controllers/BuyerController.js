/**
 * Tim Coppieters
 * september 2013
 */
var cody  = require("cody/index.js");
var Buyer = require("../models/buyer.js");

function BuyerController(context) {
  console.log("buyer construct");
  cody.Controller.call(this, context);
}
BuyerController.prototype = Object.create(cody.Controller.prototype);


BuyerController.prototype.doRequest = function (finish) {
  var self = this;
  console.log('dorequest');

  if (this.isRequest("register"))
     return this.doRegister(finish);

  cody.Controller.prototype.doRequest.call(self, finish);
};

BuyerController.prototype.doRegister = function (finish) {
  var self = this;
  var name = self.getParam("name");
  var family_name = self.getParam("family_name");
  var email = self.getParam("email");
  var password = self.getParam("password");

  Buyer.emailExists(self, email, function (err, exists) {
    // Check if a buyer with that email already exists
    if (exists) {
      self.context.emailExists = true;
      return finish("buyer/register.ejs");
    }

    // Create new buyer
    Buyer.create(self, {name: name, family_name: family_name, email: email, password: password}, function (err, buyer) {
      if (err) throw err;
      self.context.registered = true;
      finish();
    });
  });
};

module.exports = BuyerController;
