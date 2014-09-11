/**
 * Tim Coppieters
 * september 2013
 */

var Model = require('./Model.js');
var User  = require('../../cody/models/User.js');

var Buyer = Model.extend(
  "buyers",
  ["name", "family_name", "user_id"], {

  }, {
    create: function (controller, props, finish) {
      var self = this;
      var fullname = props.name + " " + props.family_name;
      console.log(props);
      var user = new User({name: fullname,
                           password: props.password,
                           email   : props.email,
                           username: props.email,
                           domain  : "buyer"});
      user.doUpdate(controller, function () {
        var create = self.__parent__.create;
        create.call(self, controller, {name       : props.name,
                                       family_name: props.family_name,
                                       user_id    : user.id}, finish);
      });
    },
    emailExists: function (controller, email, finish) {
      controller.query("SELECT * FROM users WHERE email = ?", [email], function (err, rows) {
        if (err)
          return finish(err);
        finish(undefined, rows.length > 0);
      });
    }
  }
);


module.exports = Buyer;