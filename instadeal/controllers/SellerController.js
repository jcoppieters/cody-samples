/**
 * Tim Coppieters
 * september 2013
 */
console.log("loading " + module.id);

var cody   = require("cody/index.js");
var fs     = require("fs");
var moment = require("moment");
var Deal   = require("../models/Deal.js");
var DealSlot     = require("../models/DealSlot.js");
var DealTemplate = require("../models/DealTemplate.js");

function SellerController(context) {
  console.log("SellerController construct");

  this.seller_id = context.login.id;

  // add labels from level above
  context.addStrings(context.page.parent, 'S');

  cody.Controller.call(this, context);

  // setup moment for the views
  this.context.moment = moment;
  moment.lang(this.context.page.language);
}
SellerController.prototype = Object.create(cody.Controller.prototype);
module.exports = SellerController;


SellerController.prototype.doRequest = function (finish) {
  var self = this;
  if (self.isRequest("")) { self.setRequest("list"); }
  var domain = (self.context.path.domain.indexOf("seller-") === 0) ? self.context.path.domain.substring(7) : "deals";


  if (domain === "deals") {
    self.context.fn = "seller/deals.ejs";
    self.doDeals(finish);


  } else if (domain === "reservations") {
    self.context.fn = "seller/reservations.ejs";
    self.doReservations(finish);


  } else if (domain === "account") {
    self.context.fn = "seller/account.ejs";
    self.doAccount(finish);

  } else {
    finish();
  }

};

//////////////////////////////////////////////////////////////
//
// Deals of Seller
//
SellerController.prototype.doDeals = function (finish) {
  var self = this;

  if (self.isRequest("list")) {
    self.doListDeals(finish);


  } else if (self.isRequest("new")) {
    self.context.fn = "seller/deals-new.ejs";
    self.context.deal = new DealTemplate({image_ext: ""});
    finish();


  } else if (self.isRequest("save")) {
    self.saveDealTemplate( function() {
      self.setRequest("list");
      self.doListDeals(finish);
    });


  } else if (self.isRequest("edit")) {
    self.context.fn = "seller/deals-new.ejs";
    DealTemplate.getById(self, this.getId(), function(err, dealTemplate) {
      self.context.deal = dealTemplate;
      finish();
    });


  } else if (self.isRequest("activate")) {
    self.doPrepareActivate(finish);

  } else if (self.isRequest("activation")) {
    self.doActivation(finish);


  } else if (self.isRequest("manage")) {
    self.doPrepareManagement(finish);

  } else if (self.isRequest("management")) {
  self.doManagement(finish);


  } else {
    finish();
  }
};


SellerController.prototype.doListDeals = function( finish ) {
  var self = this;

  Deal.listSeller(self, self.seller_id, function(err, result) {
    if (err) { throw err; }
    self.context.deals = result;
    finish();
  });
};


SellerController.prototype.doPrepareActivate = function(finish) {
  var self = this;
  // deal template exists, but no deal nor slots
  self.context.fn = "seller/deals-activate.ejs";
  DealTemplate.getById(self, this.getId(), function(err, deal) {
    // make a deal from a deal template record
    deal.date = new Date();
    deal.slots = [];
    deal.deal_template_id = deal.id;
    deal.id = 0;
    self.context.deal = deal;
    self.context.activationTitle = 'activate deal';
    finish();
  });
};


SellerController.prototype.doActivation = function(finish) {
  var self = this;
  // deal template exists, but no deal nor slots
  // create deal and nr of slots
  var deal = new Deal();
  deal.scrapeFrom(self, self.getInt("deal_template_id"));
  deal.save(self, function(err, deal) {
    var slots = DealSlot.scrapeList(self, deal.id);
    cody.Application.each(slots, function(next) {
      if (this.isEmpty())
        next();
      else
        this.save(self, function(err) { next(); });
    }, function() {
      self.doListDeals(finish);
    });
  });
};


SellerController.prototype.doPrepareManagement = function(finish) {
  var self = this;
  // deal template, deal and a nr of slots exist
  self.context.fn = "seller/deals-activate.ejs";
  Deal.getById(self, this.getId(), function(err, deal) {
    self.context.deal = deal;
    self.context.activationTitle = 'manage deal';
    finish();
  });
};


SellerController.prototype.doManagement = function(finish) {
  var self = this;
  // deal template, deal and a nr of slots exist
  // save change to deal and nr of slots
  var deal = new Deal();
  deal.scrapeFrom(self, self.getInt("deal_template_id"));
  deal.id = self.getInt("deal_id");
  deal.save(self, function(err, deal) {
    var slots = DealSlot.scrapeList(self, deal.id);
    cody.Application.each(slots, function(next) {
      if (this.isEmpty())
        this.delete(self, function(err) { next(); });
      else
        this.save(self, function(err) { next(); });
    }, function() {
      self.doListDeals(finish);
    });
  });
};

SellerController.prototype.saveDealTemplate = function( finish ) {
  var self = this;
  var id = self.getId();
  console.log("SellerController.saveDealTemplate: node = " + id );

  DealTemplate.getById(self, id, function(err, dealTemplate) {

    if (typeof dealTemplate === "undefined") {
      dealTemplate = new DealTemplate({image_ext: "", seller_id: self.seller_id});
    }
    dealTemplate.scrapeFrom(self);

    // update or create new dealTemplate (depending on the value of id)
    dealTemplate.save(self, function(err, val) {
      if (err) { throw err; }

      // see if there are files attached (image of the dealTemplate)
      var F = self.context.req.files;

      if ((typeof F !== "undefined") && (typeof F.fileToUpload !== "undefined")) {
        F = F.fileToUpload;

        if (F.size !== 0) {
          // find the extension of the file
          dealTemplate.image_ext = F.name.substring(F.name.lastIndexOf(".")+1);
          // construct the path in our dynamic datastore
          var newPath = self.app.getDataPath() + dealTemplate.getPath();

          // move the tmp file to our datastore
          console.log("SellerController.saveDealTemplate: moving file from " + F.path + " to " + newPath);
          fs.rename(F.path, newPath, function(err) {
            if (err) {
              console.log(err);
              self.feedBack(false, "unable to rename uploaded file to " + newPath);
              finish();
            } else {
              // update the dealTemplate to register it has a file (with extension 'ext')
              self.feedBack(false, "Deal info and file saved");
              dealTemplate.save(self, function(err, val) {
                if (err) { throw err; }
                finish();
              });
            }
          });

        } else {
          // empty file to upload
          self.feedBack(false, "Deal info saved");
          finish();
        }
      } else {
        // no  file to upload
        self.feedBack(false, "Deal info saved");
        finish();
      }

    });

  });

};

//////////////////////////////////////////////////////////////
//
// Reservations of Seller
//
SellerController.prototype.doReservations = function (finish) {
  finish();
};

//////////////////////////////////////////////////////////////
//
// Account info of Seller
//
SellerController.prototype.doAccount = function (finish) {
  finish();
};
