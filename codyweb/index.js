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
    "name": "codyweb",
    "mailFrom": "info@cody-cms.org",
    "smtp": "smtpmailer.howest.be",
    "version": "V0.1",
    "defaultlanguage": "en",
    "hostnames" : "cody.local,vpn.cody-cms.org,howest.cody-cms.org,www.cody-cms.org,cody-cms.org",
    "dbuser": "cody",
    "dbpassword": "ydoc",
    "dbhost": "localhost",
    "datapath": "/usr/local/data/codyweb",
    "db": "codyweb",
    "controllers": require("./controllers/")
  },
  function() {
    console.log("Loaded web app....");
    cody.server.listen(3001);
    console.log('Listening on port ' + cody.server.get('port'));
  }
);


if (!process.stderr.isTTY) {
    process.on('uncaughtException', function (err) {
        console.error('Uncaught exception : ' + err.stack);
    });
}
