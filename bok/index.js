//
// Johan Coppieters - jan 2013 - Cody CMS
//
// website for Cody CMS
//
//

var cody = require('cody');
var express = cody.express;
var fs = cody.fs;
var mysql = cody.mysql;

var ejs = cody.ejs;

cody.server = express();
var bodyParser = cody.bodyParser;
var expressSession = cody.expressSession;
var multer = cody.multer;


// use the new 4.x middleware
cody.server.use(bodyParser());
cody.server.use(expressSession({secret: 'a secret', cookie: { maxAge: 60*60*1000 }}));
cody.server.use(bodyParser.urlencoded({ extended: true }));
cody.server.use(multer());


// startup a routing for all static content of cody (images, javascript, css)
cody.server.get("/cody/static/*", function (req, res) {
    var fileserver = new cody.Static(req, res, "");
    fileserver.serve();
});


cody.startWebApp(cody.server, {
    "name": "bok",
    "mailFrom": "info@cody-cms.org",
    "smtp": "smtpmailer.howest.be",
    "version": "V0.1",
    "defaultlanguage": "en",
    "hostnames" : "bok.coppieters.be,bok.local,bok.bike,www.bok.bike",
    "dbuser": "cody",
    "dbpassword": "ydoc",
    "dbhost": "localhost",
    "datapath": "/usr/local/data/bok",
    "db": "bok",
    "controllers": require("./controllers/")
  },
  function() {
    console.log("Loaded BOK web app....");
    var portNr = 3002;
    cody.server.listen(portNr);
    console.log('Listening on port ' + portNr);
  }
);


if (!process.stderr.isTTY) {
    process.on('uncaughtException', function (err) {
        console.error('Uncaught exception : ' + err.stack);
    });
}
