/**
 * Tim Coppieters
 * september 2013
 */
var cody  = require("cody/index.js");

function CompanyController(context) {
  cody.Controller.call(this, context);
}
CompanyController.prototype = Object.create(cody.Controller.prototype);


CompanyController.prototype.doRequest = function (finish) {
  var self = this;

  if (this.isRequest("register"))
    return this.doRegisterBuyer(finish);

  cody.Controller.prototype.doRequest.call(self, finish);
};


CompanyController.prototype.doRegister = function (finish) {

};
