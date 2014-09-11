-- MySQL dump 10.13  Distrib 5.5.5-m3, for osx10.6 (i386)
--
-- Host: localhost    Database: instadeal
-- ------------------------------------------------------
-- Server version	5.5.5-m3-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atoms`
--

DROP TABLE IF EXISTS `atoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL DEFAULT '0',
  `sortorder` int(11) DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `note` varchar(255) DEFAULT NULL,
  `extention` varchar(3) DEFAULT '',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atoms`
--

LOCK TABLES `atoms` WRITE;
/*!40000 ALTER TABLE `atoms` DISABLE KEYS */;
INSERT INTO `atoms` VALUES (1,0,10,'Images','','','2012-07-09 14:18:36','2012-07-09 14:18:36'),(2,0,20,'Files','','','2012-07-09 14:18:36','2012-07-09 14:18:36'),(3,0,20,'Forms','','','2012-07-09 14:18:36','2012-07-09 14:18:36'),(4,0,10,'Layout','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(11,4,10,'Logo','','---','2010-01-01 00:00:00','2010-01-01 00:00:00'),(12,4,10,'Header','','---','2010-01-01 00:00:00','2010-01-01 00:00:00'),(13,4,10,'Footer','','---','2010-01-01 00:00:00','2010-01-01 00:00:00'),(21,1,10,'Global','','','2012-08-15 18:55:51','2012-08-15 18:55:54'),(22,21,10,'Map','Tim','jpg','2012-08-15 20:57:34','2013-07-09 15:34:34'),(31,2,10,'a file','','pdf','2012-08-15 18:55:51','2012-08-15 18:55:54'),(32,1,5,'New item','','---','2013-09-28 21:42:33','2013-09-28 21:42:53'),(33,1,5,'ff','icon-pdf','png','2013-09-28 22:52:04','2013-09-28 22:53:38'),(34,1,5,'simon','tmp-contactfoto','jpg','2013-09-28 23:00:49','2013-09-28 23:04:42');
/*!40000 ALTER TABLE `atoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyers`
--

DROP TABLE IF EXISTS `buyers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `family_name` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyers`
--

LOCK TABLES `buyers` WRITE;
/*!40000 ALTER TABLE `buyers` DISABLE KEYS */;
INSERT INTO `buyers` VALUES (1,'Voornaam','Achternaam',10),(2,'Tim','Coppieters',11),(3,'tim','coppieters',110),(4,'tim','coppieters',111),(5,'tim','coppieters',112),(6,'','',113);
/*!40000 ALTER TABLE `buyers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Entertainment'),(2,'Beauty & Wellness'),(3,'Horeca');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `btw` varchar(128) NOT NULL DEFAULT '',
  `image_ext` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Naam Bedrijf','BE 0123.345.678','jpg','beschrijving van verkoper',12,1,12),(2,'Mantype','BE 9876.543.210','jpg','kapsalon voor mannen door mannen zonder afspraak',13,1,12);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL DEFAULT '0',
  `language` varchar(2) NOT NULL DEFAULT 'nl',
  `sortorder` int(11) DEFAULT '0',
  `intro` char(1) NOT NULL DEFAULT 'N',
  `kind` char(1) NOT NULL DEFAULT 'T',
  `atom` int(11) DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`item`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,97,'nl',10,'N','T',0,'','<p><span>Cody draagt zorg voor uw privacy. Lees deze Privacyverklaring om meer te weten te komen over de manier waarop persoonsgegevens worden ingezameld en verwerkt op deze website. In dit geval handelt Cody Howest daarbij steeds in overeenstemming met de bepalingen van de Belgische privacywet (Wet van 8 december 1992 tot bescherming van de persoonlijke levenssfeer ten opzichte van de verwerking van persoonsgegevens). De persoonlijke gegevens beperken zich enkel tot uw e-mailadres.</span></p>\n<p><span><strong>Verantwoordelijke</strong></span></p>\n<p><span>De verantwoordelijke voor de verwerking is Cody Howest; Rijselstraat 5, 8000 Brugge.</span></p>\n<p><span><strong>Kennisname</strong></span></p>\n<p><span>U kan van deze persoonsgegevens kennis nemen door een aanvraag te richten aan Cody Howest</span><span>(brief, fax of e-mail) en ze, indien nodig, doen verbeteren of verwijderen. Indien u niet gecontacteerd wenst te worden in het kader van email marketing, zullen uw gegevens op uw verzoek kosteloos uit de betrokken lijsten worden</span></p>\n<p><span><strong>Cookies</strong></span></p>\n<p><span>Wij gebruiken cookies om uw toekomstig bezoek aan onze site vlotter te laten verlopen. Een cookie is een klein stukje tekst dat op uw harde schijf wordt geplaatst. Cookies worden veel gebruikt om een hoger functionaliteit, en dus betere dienst, aan de bezoekers te kunnen aanbieden. [U kan het gebruik van cookies uitschakelen, al leidt dit er wel toe dat effecten opsommen die ten gevolge van het uitschakelen van cookies worden veroorzaakt.]</span></p>\n<p><span><strong>Veiligheid</strong></span></p>\n<p><span>Cody Howest verbindt zich ertoe om al de gepaste technische en organisatorische maatregelen te treffen om uw persoonsgegevens te beschermen tegen vernietiging, verlies, onbedoelde wijziging, beschadiging of openbaarmaking.</span></p>\n<p><span><strong>Toestemming</strong></span></p>\n<p><span>Door u akkoord te verklaren met deze voorwaarden en condities geeft u ook uw toestemming voor de verwerking van uw persoonsgegevens voor de doeleinden zoals hierboven beschreven.</span></p>'),(2,98,'nl',10,'N','T',0,'','<p><span>Door gebruik te maken van deze website verklaart u zich akkoord met onderstaande voorwaarden en condities.</span></p>\n<p><span><strong>1. Website</strong></span></p>\n<p>De eigenaar van deze website is&nbsp;<br /> Cody Howest,<br /> Rijselstraat 5<br /> 8000, Brugge,&nbsp;<br /> Belgi&euml;<br /> Tel: 32(0)50 xx,&nbsp;<br /> E-mail: info@howest.be&nbsp;<br />ON: xx</p>\n<p><span>Als u niet akkoord gaat met onderstaande voorwaarden wordt u verzocht de website te verlaten. Cody behoudt zich het recht voor deze voorwaarden periodisch aan te passen waarna de leden op de hoogte zullen worden gebracht van deze wijzigingen. Wanneer u na deze kennisgeving de website blijft gebruiken verklaart u zich akkoord met de doorgevoerde wijzigingen. Cody Howest&nbsp; kan eventueel andere diensten aanbieden aan de gebruikers van deze site. In dat geval zullen de geldende voorwaarden apart worden medegedeeld.</span></p>\n<p><span><strong>2. Toegankelijkheid</strong></span></p>\n<p><span>Cody Howest&nbsp; probeert zo goed als mogelijk de website 24 uur per dag toegankelijk te houden, nochtans kan het gebeuren dat de website ontoegankelijk is voor een korte periode omwille van onderhoudswerken, aanpassingen of technische redenen.</span></p>\n<p><span><strong>3. Verantwoordelijkheid</strong></span></p>\n<p><span>Cody Howest weerlegt elke verantwoordelijkheid met betrekking tot deze website en de aangeboden informatie. Cody Howest&nbsp; verzekert niet dat de informatie op deze website correct, compleet of actueel is. Alle informatie, producten en diensten op deze website kunnen fouten bevatten. De gebruiker wordt verzocht hiermee rekening te houden.</span></p>\n<div><span><br /></span></div>'),(3,97,'en',10,'N','T',0,'','<p><span>Cody draagt zorg voor uw privacy. Lees deze Privacyverklaring om meer te weten te komen over de manier waarop persoonsgegevens worden ingezameld en verwerkt op deze website. In dit geval handelt Cody Howest daarbij steeds in overeenstemming met de bepalingen van de Belgische privacywet (Wet van 8 december 1992 tot bescherming van de persoonlijke levenssfeer ten opzichte van de verwerking van persoonsgegevens). De persoonlijke gegevens beperken zich enkel tot uw e-mailadres.</span></p>\n<p><span><strong>Verantwoordelijke</strong></span></p>\n<p><span>De verantwoordelijke voor de verwerking is Cody Howest; Rijselstraat 5, 8000 Brugge.</span></p>\n<p><span><strong>Kennisname</strong></span></p>\n<p><span>U kan van deze persoonsgegevens kennis nemen door een aanvraag te richten aan Cody Howest</span><span>(brief, fax of e-mail) en ze, indien nodig, doen verbeteren of verwijderen. Indien u niet gecontacteerd wenst te worden in het kader van email marketing, zullen uw gegevens op uw verzoek kosteloos uit de betrokken lijsten worden</span></p>\n<p><span><strong>Cookies</strong></span></p>\n<p><span>Wij gebruiken cookies om uw toekomstig bezoek aan onze site vlotter te laten verlopen. Een cookie is een klein stukje tekst dat op uw harde schijf wordt geplaatst. Cookies worden veel gebruikt om een hoger functionaliteit, en dus betere dienst, aan de bezoekers te kunnen aanbieden. [U kan het gebruik van cookies uitschakelen, al leidt dit er wel toe dat effecten opsommen die ten gevolge van het uitschakelen van cookies worden veroorzaakt.]</span></p>\n<p><span><strong>Veiligheid</strong></span></p>\n<p><span>Cody Howest verbindt zich ertoe om al de gepaste technische en organisatorische maatregelen te treffen om uw persoonsgegevens te beschermen tegen vernietiging, verlies, onbedoelde wijziging, beschadiging of openbaarmaking.</span></p>\n<p><span><strong>Toestemming</strong></span></p>\n<p><span>Door u akkoord te verklaren met deze voorwaarden en condities geeft u ook uw toestemming voor de verwerking van uw persoonsgegevens voor de doeleinden zoals hierboven beschreven.</span></p>'),(4,98,'en',10,'N','T',0,'','<p><span>Door gebruik te maken van deze website verklaart u zich akkoord met onderstaande voorwaarden en condities.</span></p>\n<p><span><strong>1. Website</strong></span></p>\n<p>De eigenaar van deze website is&nbsp;<br /> Cody Howest,<br /> Rijselstraat 5<br /> 8000, Brugge,&nbsp;<br /> Belgi&euml;<br /> Tel: 32(0)50 xx,&nbsp;<br /> E-mail: info@howest.be&nbsp;<br />ON: xx</p>\n<p><span>Als u niet akkoord gaat met onderstaande voorwaarden wordt u verzocht de website te verlaten. Cody behoudt zich het recht voor deze voorwaarden periodisch aan te passen waarna de leden op de hoogte zullen worden gebracht van deze wijzigingen. Wanneer u na deze kennisgeving de website blijft gebruiken verklaart u zich akkoord met de doorgevoerde wijzigingen. Cody Howest&nbsp; kan eventueel andere diensten aanbieden aan de gebruikers van deze site. In dat geval zullen de geldende voorwaarden apart worden medegedeeld.</span></p>\n<p><span><strong>2. Toegankelijkheid</strong></span></p>\n<p><span>Cody Howest&nbsp; probeert zo goed als mogelijk de website 24 uur per dag toegankelijk te houden, nochtans kan het gebeuren dat de website ontoegankelijk is voor een korte periode omwille van onderhoudswerken, aanpassingen of technische redenen.</span></p>\n<p><span><strong>3. Verantwoordelijkheid</strong></span></p>\n<p><span>Cody Howest weerlegt elke verantwoordelijkheid met betrekking tot deze website en de aangeboden informatie. Cody Howest&nbsp; verzekert niet dat de informatie op deze website correct, compleet of actueel is. Alle informatie, producten en diensten op deze website kunnen fouten bevatten. De gebruiker wordt verzocht hiermee rekening te houden.</span></p>\n<div><span><br /></span></div>'),(8,1,'en',10,'Y','S',0,'phone','050-705336'),(10,1,'en',20,'Y','S',0,'address','myStreet 007 - 54321 Bond City'),(11,104,'nl',10,'N','T',0,'Text','<p>Ik weet iets, niet veel, maar toch...</p>\r\n<p>iedereen weet iets</p>'),(15,1,'en',30,'N','S',0,'footer.first','left'),(16,1,'en',40,'N','S',0,'footer.second','right'),(17,1,'en',50,'N','S',0,'footer.third','middle'),(55,-105,'*',10,'N','S',0,'show deals',''),(60,-106,'*',10,'N','S',0,'name',''),(62,-106,'*',20,'N','S',0,'address',''),(63,-106,'*',30,'N','S',0,'contact',''),(64,-106,'*',40,'N','S',0,'btw',''),(65,1,'nl',10,'N','S',0,'name','Instadeal BVBA'),(66,1,'nl',20,'N','S',0,'address','Karel De Stoutestraat 39, 9000 Gent'),(67,1,'nl',30,'N','S',0,'contact','<a href=\"mailto:contact@instadeal.be\">contact@instadeal.be</a>'),(68,1,'nl',40,'N','S',0,'btw','BTW-nummer: ###########'),(71,-105,'*',20,'N','S',0,'previous deal',''),(72,-105,'*',30,'N','S',0,'next deal',''),(73,-105,'*',40,'N','S',0,'deal description title',''),(74,-105,'*',50,'N','S',0,'validity title',''),(75,-105,'*',60,'N','S',0,'valid for',''),(76,-105,'*',70,'N','S',0,'person',''),(77,-105,'*',80,'N','S',0,'until',''),(78,-105,'*',90,'N','S',0,'reserve now',''),(79,-105,'*',100,'N','S',0,'payment on spot',''),(80,-105,'*',110,'N','S',0,'currency',''),(81,-105,'*',120,'N','S',0,'normal price',''),(82,-105,'*',130,'N','S',0,'discount',''),(83,-105,'*',140,'N','S',0,'price',''),(84,-105,'*',150,'N','S',0,'amount',''),(85,-105,'*',160,'N','S',0,'deal still',''),(86,-105,'*',170,'N','S',0,'available',''),(87,-105,'*',180,'N','S',0,'still',''),(88,-105,'*',190,'N','S',0,'deals',''),(89,-105,'*',200,'N','S',0,'share with friends',''),(90,-105,'*',210,'N','S',0,'contact data title',''),(91,-105,'*',220,'N','S',0,'show deal',''),(92,112,'en',10,'N','S',0,'show deals',''),(93,112,'en',20,'N','S',0,'previous deal',''),(94,112,'en',30,'N','S',0,'next deal',''),(95,112,'en',40,'N','S',0,'deal description title',''),(96,112,'en',50,'N','S',0,'validity title',''),(97,112,'en',60,'N','S',0,'valid for',''),(98,112,'en',70,'N','S',0,'person',''),(99,112,'en',80,'N','S',0,'until',''),(100,112,'en',90,'N','S',0,'reserve now',''),(101,112,'en',100,'N','S',0,'payment on spot',''),(102,112,'en',110,'N','S',0,'currency',''),(103,112,'en',120,'N','S',0,'normal price',''),(104,112,'en',130,'N','S',0,'discount',''),(105,112,'en',140,'N','S',0,'price',''),(106,112,'en',150,'N','S',0,'amount',''),(107,112,'en',160,'N','S',0,'deal still',''),(108,112,'en',170,'N','S',0,'available',''),(109,112,'en',180,'N','S',0,'still',''),(110,112,'en',190,'N','S',0,'deals',''),(111,112,'en',200,'N','S',0,'share with friends',''),(112,112,'en',210,'N','S',0,'contact data title',''),(113,112,'en',220,'N','S',0,'show deal',''),(114,112,'nl',10,'N','S',0,'show deals','Terug naar overzicht'),(115,112,'nl',50,'N','S',0,'previous deal','Vorige deal'),(116,112,'nl',60,'N','S',0,'next deal','Volgende deal'),(117,112,'nl',70,'N','S',0,'deal description title','Omschrijving van de deal'),(118,112,'nl',80,'N','S',0,'validity title','Geldigheid'),(119,112,'nl',90,'N','S',0,'valid for','Deze aanbieding is geldig voor '),(120,112,'nl',100,'N','S',0,'person','persoon'),(121,112,'nl',110,'N','S',0,'until','tot'),(122,112,'nl',120,'N','S',0,'reserve now','Reserveer Nu'),(123,112,'nl',130,'N','S',0,'payment on spot','Betaling gebeurt ter plaatse'),(124,112,'nl',140,'N','S',0,'currency','€'),(125,112,'nl',150,'N','S',0,'normal price','Normaal'),(126,112,'nl',160,'N','S',0,'discount','Korting'),(127,112,'nl',170,'N','S',0,'price','Prijs'),(128,112,'nl',180,'N','S',0,'amount','Bedrag'),(129,112,'nl',190,'N','S',0,'deal still','Dit aanbod is nog'),(130,112,'nl',200,'N','S',0,'available','geldig'),(131,112,'nl',210,'N','S',0,'still','nog'),(132,112,'nl',220,'N','S',0,'deals','aanbiedingen'),(133,112,'nl',230,'N','S',0,'share with friends','Deel met je vrienden'),(134,112,'nl',240,'N','S',0,'contact data title','Contactgegevens'),(135,112,'nl',260,'N','S',0,'show deal','Bekijk Aanbieding'),(136,112,'nl',40,'N','S',0,'hour tag','uur'),(137,112,'nl',20,'N','S',0,'minute tag','min'),(138,112,'nl',30,'N','S',0,'second tag','sec'),(139,-105,'*',230,'N','S',0,'hour tag',''),(140,-105,'*',240,'N','S',0,'min tag',''),(141,-105,'*',250,'N','S',0,'sec tag',''),(142,-105,'*',260,'N','S',0,'day tag',''),(143,112,'nl',280,'N','S',0,'day tag','dag'),(144,-105,'*',270,'N','S',0,'days tag',''),(145,112,'nl',300,'N','S',0,'days tag','dagen'),(147,-104,'*',10,'N','S',0,'register',''),(149,-104,'*',20,'N','S',0,'intro text',''),(151,-104,'*',30,'N','S',0,'view deal',''),(155,-104,'*',40,'N','S',0,'learn more',''),(157,-104,'*',50,'N','S',0,'everything',''),(159,-104,'*',60,'N','S',0,'today',''),(162,-104,'*',70,'N','S',0,'tomorrow',''),(164,-104,'*',80,'N','S',0,'date',''),(166,-104,'*',90,'N','S',0,'days tag',''),(167,-104,'*',100,'N','S',0,'day tag',''),(168,-104,'*',110,'N','S',0,'hour tag',''),(169,-104,'*',120,'N','S',0,'min tag',''),(170,-104,'*',130,'N','S',0,'sec tag',''),(180,112,'nl',250,'N','S',0,'min tag','Min'),(181,112,'nl',270,'N','S',0,'sec tag','Sec'),(182,-104,'*',140,'N','S',0,'expired',''),(183,-105,'*',280,'N','S',0,'expired',''),(185,112,'nl',290,'N','S',0,'expired','Niet meer beschikbaar'),(195,-4,'*',10,'N','S',0,'next',''),(196,-4,'*',20,'N','S',0,'prev',''),(197,-4,'*',30,'N','S',0,'more',''),(198,4,'nl',10,'N','S',0,'next','Next'),(199,4,'nl',20,'N','S',0,'prev','Previous'),(200,4,'nl',30,'N','S',0,'more','To add more strings: 1. Add to the template \'Strings\'\r\n2. Click \'Adjust\' on this page.'),(201,4,'en',10,'N','S',0,'next','Next'),(202,4,'en',20,'N','S',0,'prev','Previous'),(203,4,'en',30,'N','S',0,'more','Add more to the template \'Strings\' and click \'Adjust\''),(204,-4,'*',40,'N','S',0,'all',''),(205,4,'nl',40,'N','S',0,'all','Alles'),(206,-4,'*',50,'N','S',0,'register',''),(207,4,'nl',50,'N','S',0,'register','Registreer'),(208,-108,'*',10,'N','S',0,'name tag',''),(209,-108,'*',20,'N','S',0,'family name tag',''),(210,-108,'*',30,'N','S',0,'email tag',''),(211,-108,'*',40,'N','S',0,'password tag',''),(212,108,'nl',10,'N','S',0,'name tag','Jouw voornaam'),(213,108,'nl',30,'N','S',0,'surname tag','Jouw voornaam'),(214,108,'nl',40,'N','S',0,'email tag','Jouw e-mailadres'),(215,108,'nl',50,'N','S',0,'password tag','Wachtwoord'),(216,-108,'*',50,'N','S',0,'show password tag',''),(217,108,'nl',60,'N','S',0,'show password tag','Toon wachtwoord'),(218,-108,'*',60,'N','S',0,'read policy',''),(219,108,'nl',70,'N','S',0,'read policy','Ik heb de <a href=\"#\">gebruikersvoorwaarden</a> gelezen en goedgekeurd'),(220,-108,'*',70,'N','S',0,'what is instadeal?',''),(222,-108,'*',80,'N','S',0,'how does it work?',''),(226,-108,'*',90,'N','I',0,'example image',''),(227,108,'nl',80,'N','S',0,'what is instadeal?','Wat is instadeal?'),(228,108,'nl',90,'N','S',0,'how does it work?','Hoe werkt Instadeal?'),(232,108,'nl',120,'N','I',32,'example image',''),(237,-108,'*',100,'N','T',0,'what is instadeal - text 1',''),(238,-108,'*',110,'N','T',0,'what is instadeal - text 2',''),(239,108,'nl',100,'N','T',0,'what is instadeal - text 1','<p>Aenean lacinia bibendum nulla sed consectetur. Nullam quis risus eget urna mollis ornare vel eu leo. Nulla vitae elit libero, a pharetra augue. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Maecenas sed diam eget risus varius blandit sit amet non magna. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>'),(240,108,'nl',110,'N','T',0,'what is instadeal - text 2','<p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Etiam porta sem malesuada magna mollis euismod. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Etiam porta sem malesuada magna mollis euismod.</p>'),(241,-108,'*',120,'N','T',0,'example title',''),(242,108,'nl',130,'N','T',0,'example title','<p>Lorem ipsum dolor sit amet, onsectetur ipiscing</p>'),(243,-108,'*',130,'N','T',0,'step 1',''),(244,-108,'*',140,'N','T',0,'step 2',''),(245,-108,'*',150,'N','T',0,'step 3',''),(246,108,'nl',140,'N','T',0,'step 1','<p>Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Sed posuere consectetur est at lobortis.</p>'),(247,108,'nl',160,'N','T',0,'step 2','<p>Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Sed posuere consectetur est at lobortis.</p>'),(248,108,'nl',150,'N','T',0,'step 3','<p>Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Sed posuere consectetur est at lobortis.</p>'),(249,-108,'*',160,'N','S',0,'show deals',''),(250,-108,'*',170,'N','S',0,'information for sellers',''),(251,108,'nl',170,'N','S',0,'show deals','Bekijk de aanbiedingen'),(252,108,'nl',180,'N','S',0,'information for sellers','Informatie voor verkopers'),(254,-106,'*',50,'N','S',0,'terms and conditions',''),(255,1,'nl',50,'N','S',0,'terms and conditions','Algemene voorwaarden'),(256,-107,'*',10,'N','S',0,'email tag',''),(257,-107,'*',20,'N','S',0,'password tag',''),(258,-107,'*',30,'N','S',0,'read policy',''),(259,-107,'*',40,'N','S',0,'register as seller',''),(260,-107,'*',50,'N','S',0,'show password',''),(261,-107,'*',60,'N','S',0,'what is instadeal?',''),(262,-107,'*',70,'N','S',0,'example title',''),(263,-107,'*',80,'N','S',0,'how does it work?',''),(264,-107,'*',90,'N','S',0,'show deals',''),(267,-107,'*',100,'N','T',0,'what is instadeal - text 1',''),(268,-107,'*',110,'N','T',0,'what is instadeal - text 2',''),(269,-107,'*',120,'N','T',0,'step 1',''),(270,-107,'*',130,'N','T',0,'step 2',''),(271,-107,'*',140,'N','T',0,'step 3',''),(272,109,'nl',10,'N','S',0,'email tag','Jouw e-mailadres'),(273,109,'nl',20,'N','S',0,'password tag','Wachtwoord'),(274,109,'nl',30,'N','S',0,'read policy','Ik heb de <a href=\"#\">gebruikersvoorwaarden</a> gelezen en goedgekeurd'),(275,109,'nl',40,'N','S',0,'register as seller','Registreer als verkoper'),(276,109,'nl',50,'N','S',0,'show password','Toon wachtwoord'),(277,109,'nl',60,'N','S',0,'what is instadeal?','Wat is Instadeal?'),(278,109,'nl',70,'N','S',0,'example title','Lorem ipsum dolor sit amet, onsectetur ipiscing'),(279,109,'nl',80,'N','S',0,'how does it work?','Hoe werkt Instadeal?'),(280,109,'nl',90,'N','S',0,'show deals','Bekijk De Aanbiedingen'),(281,109,'nl',100,'N','T',0,'what is instadeal - text 1','<p><span>Aenean lacinia bibendum nulla sed consectetur. Nullam quis risus eget urna mollis ornare vel eu leo. Nulla vitae elit libero, a pharetra augue. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Maecenas sed diam eget risus varius blandit sit amet non magna. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</span></p>'),(282,109,'nl',110,'N','T',0,'what is instadeal - text 2','<p><span>Aenean lacinia bibendum nulla sed consectetur. Nullam quis risus eget urna mollis ornare vel eu leo. Nulla vitae elit libero, a pharetra augue. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Maecenas sed diam eget risus varius blandit sit amet non magna. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</span></p>'),(283,109,'nl',120,'N','T',0,'step 1','<p><span>Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Sed posuere consectetur est at lobortis.</span></p>'),(284,109,'nl',130,'N','T',0,'step 2','<p><span>Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Sed posuere consectetur est at lobortis.</span></p>'),(285,109,'nl',140,'N','T',0,'step 3','<p><span>Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Sed posuere consectetur est at lobortis.</span></p>'),(286,-110,'*',10,'N','I',0,'image',''),(287,-110,'*',20,'N','S',0,'name',''),(288,-110,'*',30,'N','S',0,'number',''),(289,-110,'*',40,'N','S',0,'email',''),(290,-110,'*',50,'N','T',0,'description',''),(291,115,'nl',10,'N','I',34,'image',''),(292,115,'nl',20,'N','S',0,'name','Jonas Demedts'),(293,115,'nl',30,'N','S',0,'number','Tel: 0486 45 85 20'),(294,115,'nl',40,'N','S',0,'email','<a href=\"mailto:simon@instadeal.be\">simon@instadeal.be</a>'),(295,115,'nl',50,'N','T',0,'description','<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nulla vitae elit libero, a pharetra augue. Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>'),(296,116,'en',10,'N','I',0,'image',''),(297,116,'en',20,'N','S',0,'name',''),(298,116,'en',30,'N','S',0,'number',''),(299,116,'en',40,'N','S',0,'email',''),(300,116,'en',50,'N','T',0,'description',''),(301,116,'nl',10,'N','I',34,'image',''),(302,116,'nl',20,'N','S',0,'name','Simon Savaete'),(303,116,'nl',30,'N','S',0,'number','Tel: 0486 45 85 20'),(304,116,'nl',40,'N','S',0,'email','<a href=\"mailto:simon@instadeal.be\">simon@instadeal.be</a>'),(305,116,'nl',50,'N','T',0,'description','<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nulla vitae elit libero, a pharetra augue. Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>'),(306,-109,'*',10,'N','S',0,'contact',''),(307,103,'nl',10,'N','S',0,'contact','Contact'),(326,-102,'*',10,'N','S',0,'only active',''),(327,-102,'*',20,'N','S',0,'new deal',''),(328,-102,'*',30,'N','S',0,'manage deal',''),(329,-102,'*',40,'N','S',0,'show preview',''),(330,-102,'*',50,'N','S',0,'activate deal',''),(331,-102,'*',50,'N','S',0,'manage activation',''),(332,117,'en',10,'N','S',0,'only active','Show only active deals'),(333,117,'en',20,'N','S',0,'new deal','New Deal'),(334,117,'en',30,'N','S',0,'manage deal','Manage Deal'),(335,117,'en',40,'N','S',0,'show preview','Show preview'),(336,117,'en',50,'N','S',0,'activate deal','Activate Deal'),(337,117,'en',60,'N','S',0,'manage activation','Manage Activation'),(338,117,'nl',10,'N','S',0,'only active','Toon enkel de actieve deals'),(339,117,'nl',20,'N','S',0,'new deal','Nieuwe Deal'),(340,117,'nl',30,'N','S',0,'manage deal','Deal Beheren'),(341,117,'nl',40,'N','S',0,'show preview','Bekijk preview'),(342,117,'nl',50,'N','S',0,'activate deal','Deal Activeren'),(343,117,'nl',60,'N','S',0,'manage activation','Activatie beheren'),(344,108,'nl',20,'N','S',0,'family name tag','Jouw achternaam'),(345,-108,'*',180,'N','S',0,'email exists',''),(346,108,'nl',190,'N','S',0,'email exists','Een gebruiker met dit e-mailadres bestaat al.'),(347,-108,'*',190,'N','S',0,'registered',''),(348,108,'nl',200,'N','S',0,'registered','Uw registratie werd ontvangen. Volg de instructies van de verzonden mail om de registratie te voltooien!');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_slots`
--

DROP TABLE IF EXISTS `deal_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deal_slots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `start_time` char(5) NOT NULL,
  `end_time` char(5) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_slots`
--

LOCK TABLES `deal_slots` WRITE;
/*!40000 ALTER TABLE `deal_slots` DISABLE KEYS */;
INSERT INTO `deal_slots` VALUES (1,1,'14:00','14:30',5),(2,1,'14:30','15:00',2),(3,1,'15:00','15:30',1),(4,2,'16:00','16:30',1),(5,3,'15:00','15:30',5),(6,3,'15:30','16:30',5),(7,4,'15:00','15:30',4),(8,5,'15:00','15:30',3),(9,6,'15:00','15:30',1),(10,7,'15:00','15:30',2),(11,8,'15:00','15:30',10),(12,8,'15:00','15:30',23),(13,8,'15:00','15:30',1);
/*!40000 ALTER TABLE `deal_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_templates`
--

DROP TABLE IF EXISTS `deal_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deal_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `image_ext` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `normal_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_templates`
--

LOCK TABLES `deal_templates` WRITE;
/*!40000 ALTER TABLE `deal_templates` DISABLE KEYS */;
INSERT INTO `deal_templates` VALUES (1,'Titel van deal 1','Beschrijving van deal 1.','jpg',10.00,20.00,1),(2,'Titel van deal 2','Beschrijving van deal 2.','jpg',100.00,200.00,1),(3,'Frisse snit voor mannen','Een frisse snit voor mannen, uitzonderlijk op afspraak voor deze deal. Studentenkaart verplicht','jpg',15.00,21.00,2);
/*!40000 ALTER TABLE `deal_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deals`
--

DROP TABLE IF EXISTS `deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_template_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deals`
--

LOCK TABLES `deals` WRITE;
/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
INSERT INTO `deals` VALUES (1,1,'2013-09-20 00:00:00'),(2,1,'2013-09-22 00:00:00'),(3,1,'2013-09-29 15:30:00'),(4,3,'2013-09-29 16:30:00'),(5,3,'2013-09-30 15:30:00'),(6,3,'2013-10-01 15:30:00'),(7,3,'2013-10-02 15:30:00'),(8,3,'2013-10-03 15:30:00');
/*!40000 ALTER TABLE `deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(32) DEFAULT '?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES ('admin','Admin'),('cms','CMS Users'),('user','Users'),('user','Users'),('user','Users'),('user','Users'),('user','Users'),('user','Users'),('user','Users');
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `user` int(11) DEFAULT '0',
  `template` int(11) NOT NULL DEFAULT '1',
  `orderby` char(1) DEFAULT 'A',
  `sortorder` int(11) DEFAULT '0',
  `dated` date DEFAULT '0000-00-00',
  `validfrom` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `validto` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `showcontent` char(1) DEFAULT 'Y',
  `needslogin` char(1) DEFAULT 'N',
  `defaultrequest` varchar(32) DEFAULT '',
  `alloweddomains` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `parent_idx` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Website',-1,1,106,'M',100,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','S',NULL,'list',''),(2,'Login',3,1,2,'A',99,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','N','',''),(3,'Pages',-1,1,100,'M',0,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','Y','',''),(4,'Strings',3,1,4,'M',0,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','Y','list',''),(9,'Dashboard',-1,1,9,'M',0,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','Y','',''),(10,'CMS',9,1,2,'M',10,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','S','Y','',''),(11,'CMS - Page',10,1,11,'A',10,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','Y','',''),(12,'CMS - Images',10,1,12,'A',20,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','Y','',''),(13,'CMS - Files',10,1,13,'A',30,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','Y','',''),(14,'CMS - Forms',10,1,14,'A',40,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','Y','',''),(15,'CMS - Users',10,1,15,'A',50,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','Y','list',''),(16,'CMS - Templates',10,1,16,'A',60,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','Y','list',''),(17,'CMS - System',10,1,17,'A',70,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','Y','',''),(97,'Privacy Verklaring',4,1,100,'A',0,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','N','',''),(98,'Disclaimer',4,1,100,'A',0,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','N','',''),(99,'Global',3,1,100,'A',0,'2010-01-01','2010-01-01 00:00:00','2100-01-01 00:00:00','Y','N','',''),(103,'About',1,1,109,'A',60,'2013-07-11','2013-07-11 00:00:00','2101-01-31 00:00:00','Y',NULL,'list',''),(106,'Deal',1,1,104,'u',10,'2012-12-25','2012-12-25 00:00:00','2101-01-31 00:00:00','u',NULL,'list',''),(108,'How it works',1,1,108,'A',20,'2012-12-26','2012-12-26 00:00:00','2101-01-31 00:00:00','Y',NULL,'list',''),(109,'Verkoper?',1,1,107,'A',30,'2012-12-26','2012-12-26 00:00:00','2101-01-31 00:00:00','Y',NULL,'list',''),(112,'Deal2',106,1,105,'u',5,'2012-12-26','2012-12-26 00:00:00','2101-01-31 00:00:00','u',NULL,'list',''),(113,'Deals Admin',9,1,101,'M',5,'2013-09-27','2013-09-27 17:05:46','2101-01-31 23:59:59','Y','Y','list',''),(114,'list deals',113,1,101,'M',5,'2013-09-27','2013-09-27 17:06:08','2101-01-31 23:59:59','Y','Y','list',''),(115,'Jonas',103,1,110,'A',5,'2013-09-28','2013-09-28 00:00:00','2101-01-31 00:00:00','Y',NULL,'list',''),(116,'Simon',103,1,110,'A',5,'2013-09-28','2013-09-28 00:00:00','2101-01-31 00:00:00','Y',NULL,'list',''),(117,'Seller',1,1,112,'A',5,'2013-09-28','2013-09-28 00:00:00','2101-01-31 00:00:00','Y',NULL,'list',''),(118,'Deals',117,1,111,'A',5,'2013-09-28','2013-09-28 00:00:00','2101-01-31 00:00:00','Y',NULL,'list',''),(119,'Reservations',117,1,111,'A',5,'2013-09-28','2013-09-28 00:00:00','2101-01-31 00:00:00','Y',NULL,'list',''),(120,'Account',117,1,111,'A',5,'2013-09-28','2013-09-28 00:00:00','2101-01-31 00:00:00','Y',NULL,'list','');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` varchar(4) NOT NULL DEFAULT '',
  `name` varchar(32) DEFAULT '',
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES ('en','English',1),('nl','Nederlands',2);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (2,'user'),(50,'admin'),(99,'super');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Gent');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `item` int(11) NOT NULL DEFAULT '0',
  `language` varchar(2) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `active` char(1) DEFAULT 'Y',
  `keywords` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`item`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'en','Website','welcome','Y','','','2010-01-01 00:00:00','2013-07-11 17:35:20'),(1,'nl','Instadeal','','Y','','','2010-01-01 00:00:00','2013-09-28 21:20:31'),(2,'en','Login','login','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(2,'nl','Login','login','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(3,'en','Pages','','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(3,'nl','Pages','','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(4,'en','Translations','strings','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(4,'nl','Vertalingen','strings','Y','','','2010-01-01 00:00:00','2013-09-28 20:49:57'),(9,'en','Dashboard','dashboard','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(9,'nl','Dashboard','dashboard','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(10,'en','Website CMS','cms','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(10,'nl','Website CMS','cms','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(11,'en','Structure','pages','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(11,'nl','Structuur','pages','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(12,'en','Images','images','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(12,'nl','Beelden','images','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(13,'en','Files','files','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(13,'nl','Bestanden','files','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(14,'en','Forms','forms','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(14,'nl','Formulieren','forms','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(15,'en','Users','users','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(15,'nl','Gebruikers','users','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(16,'en','Templates','templates','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(16,'nl','Sjablonen','templates','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(17,'en','System','system','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(17,'nl','Systeem','system','Y','','','2010-01-01 00:00:00','2010-01-01 00:00:00'),(97,'en','Privacy','privacy','Y','','','2010-01-01 00:00:00','2013-03-19 09:30:30'),(97,'nl','Privacy Verklaring','privacy','Y','','','2010-01-01 00:00:00','2013-03-19 09:30:30'),(98,'en','Disclaimer','disclaimer','Y','','','2010-01-01 00:00:00','2012-08-20 17:09:50'),(98,'nl','Disclaimer','disclaimer','Y','','','2010-01-01 00:00:00','2012-08-20 17:09:50'),(99,'en','Global','global','Y','','','2010-01-01 00:00:00','2012-08-15 22:02:59'),(99,'nl','Global','global','Y','','','2010-01-01 00:00:00','2012-08-15 22:02:59'),(103,'en','About','about','Y','','','2013-07-11 16:00:47','2013-07-11 16:01:01'),(103,'nl','Contact','contact','Y','','','2013-07-11 16:00:47','2013-09-28 22:36:39'),(106,'en','Deal','deal','Y','','','2013-09-25 10:49:02','2013-09-25 21:02:37'),(106,'nl','Aanbiedingen','deals','Y','','','2013-09-25 10:49:02','2013-09-28 08:34:00'),(108,'en','How it works','','Y','','','2013-09-26 13:01:06','2013-09-26 13:01:36'),(108,'nl','Hoe werkt het?','buyer','Y','','','2013-09-26 13:01:06','2013-09-29 13:08:40'),(109,'en','Verkoper?','','Y','','','2013-09-26 13:02:17','2013-09-26 13:02:21'),(109,'nl','Verkoper?','company','Y','','','2013-09-26 13:02:17','2013-09-29 09:57:55'),(112,'en','Deal2','','Y','','','2013-09-26 15:34:41','2013-09-26 15:34:44'),(112,'nl','Deal','deal','Y','','','2013-09-26 15:34:41','2013-09-28 08:34:15'),(113,'en','Deals Admin','','Y','','','2013-09-27 17:05:46','2013-09-27 17:05:54'),(113,'nl','Deals Admin','','Y','','','2013-09-27 17:05:46','2013-09-27 17:05:53'),(114,'en','list deals','','Y','','','2013-09-27 17:06:08','2013-09-27 17:06:13'),(114,'nl','list deals','','Y','','','2013-09-27 17:06:08','2013-09-27 17:06:13'),(115,'en','Jonas','','Y','','','2013-09-28 22:22:47','2013-09-28 22:22:50'),(115,'nl','Jonas','','Y','','','2013-09-28 22:22:47','2013-09-28 23:01:37'),(116,'en','Simon','','Y','','','2013-09-28 22:30:09','2013-09-28 22:30:13'),(116,'nl','Simon','','Y','','','2013-09-28 22:30:10','2013-09-28 23:01:22'),(117,'en','Seller','','Y','','','2013-09-28 17:46:31','2013-09-28 17:46:35'),(117,'nl','Seller','','Y','','','2013-09-28 17:46:31','2013-09-28 17:46:38'),(118,'en','Deals','','Y','','','2013-09-28 17:49:40','2013-09-28 17:49:49'),(118,'nl','Deals','seller-deals','Y','','','2013-09-28 17:49:40','2013-09-28 17:51:18'),(119,'en','Reservations','','Y','','','2013-09-28 17:51:25','2013-09-28 17:51:30'),(119,'nl','Reservations','seller-reservations','Y','','','2013-09-28 17:51:25','2013-09-28 17:52:03'),(120,'en','Account','','Y','','','2013-09-28 17:51:39','2013-09-28 17:51:43'),(120,'nl','Account','seller-account','Y','','','2013-09-28 17:51:39','2013-09-28 17:51:55');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_slot_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,1,1,1),(2,1,1,2),(3,3,1,1),(4,5,1,2),(5,10,1,7);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `btw` varchar(128) NOT NULL DEFAULT '',
  `image` varchar(128) DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `location_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'BE 0123.345.678','','beschrijving van verkoper',11,1),(2,'BE 9876.543.210','','kapsalon voor mannen door mannen zonder afspraak',12,1);
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '',
  `description` varchar(127) DEFAULT '',
  `controller` varchar(64) DEFAULT '',
  `fn` varchar(128) DEFAULT '',
  `allowedtemplates` varchar(255) DEFAULT '',
  `maxnumber` int(11) DEFAULT '99999',
  `system` char(1) DEFAULT 'N',
  `defaultchild` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (2,'Login','','LoginController','-/login.ejs','',0,'Y',0),(4,'Strings','','Controller','index.ejs','4',0,'Y',4),(9,'Dashboard','','DashboardController','-/cms/dashboard.ejs','',0,'Y',0),(11,'CMS-Page','','PageController','-/cms/pages.ejs','',0,'Y',0),(12,'CMS-Images','','ImageController','-/cms/images.ejs','',0,'Y',0),(13,'CMS-Files','','FileController','-/cms/files.ejs','',0,'Y',0),(14,'CMS-Forms','','FormController','-/cms/forms.ejs','',0,'Y',0),(15,'CMS-Users','','UserController','-/cms/users.ejs','',0,'Y',0),(16,'CMS-Templates','','TemplateController','-/cms/templates.ejs','',0,'Y',0),(17,'CMS-System','','SystemController','','',0,'Y',0),(100,'Content without intro','Shows all content of a page excluding the intro\'s','ContentController','index.ejs','',999,'N',100),(101,'Full Content','Shows all content of a page','ContentController','page.ejs','',0,'N',0),(103,'Included sub-page intros','Displays also all intro content of the pages below','ContentController','intros.ejs','',0,'N',0),(104,'Deals','homepage deals','DealController','deals.ejs','0',999,'N',104),(105,'Deal','','DealController','deal.ejs','0',999,'N',105),(106,'Main','Main template van instadeal','ContentController','index.ejs','100',999,'N',106),(107,'Register Company','','CompanyController','register-company.ejs','0',999,'N',107),(108,'Register Buyer','','BuyerController','buyer/register.ejs','0',999,'N',108),(109,'Contact','','ContentController','contact.ejs','0',999,'N',110),(110,'Contact Ticket','','ContentController','contact-ticket.ejs','0',999,'N',0),(111,'Seller','Front end interface for sellers','SellerController','seller/deals.ejs','0',999,'N',101),(112,'Seller wrapper','Front end interface for sellers wrapper','SellerController','seller/deals.ejs','0',999,'N',101);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL DEFAULT '-',
  `name` varchar(128) NOT NULL DEFAULT '-',
  `password` varchar(32) NOT NULL DEFAULT '-',
  `domain` varchar(32) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `badlogins` int(11) NOT NULL DEFAULT '0',
  `maxbadlogins` int(11) NOT NULL DEFAULT '999',
  `active` char(1) NOT NULL DEFAULT 'Y',
  `email` varchar(128) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `nomail` char(1) NOT NULL DEFAULT 'N',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_idx` (`username`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'rsuper','rWorks Super','akitest','rWorks',99,0,99,'Y','johan577@mac.com','','N',0),(2,'radmin','rWorks Admin','akitest','rWorks',50,0,99,'Y','johan577@mac.com','','N',0),(3,'rtest','rWorks Test','akitest','rWorks',2,0,99,'Y','johan577@mac.com','','N',0),(9,'codyweb','Cody User','ydoc','user',50,0,99,'Y','cody@cody.com','','N',0),(10,'koper@gmail.com','Koper','password','buyer',50,0,99,'Y','koper@gmail.com','','N',0),(11,'tim@gmail.com','Acek','password','buyer',50,0,99,'Y','tim@gmail.com','','N',0),(12,'verkoper@gmail.com','Verkoper','password','seller',50,0,99,'Y','verkoper@gmail.com','','N',0),(13,'mantype@gmail.com','Mantype','password','seller',50,0,99,'Y','mantype@gmail.com','','N',0),(99,'cody-empty','Cody User','ydoc','user',50,0,99,'Y','cody@cody.com','','N',0),(106,'tim@meil.com','tim coppieters','pw','buyer',0,0,999,'N','tim@meil.com','','N',10),(107,'tim@foo.com','tim coppietes','pw','buyer',0,0,999,'N','tim@foo.com','','N',10),(108,'tim@fooo.com','tim coppieters','tim','buyer',0,0,999,'N','tim@fooo.com','','N',10),(109,'tim@fooooo.com','tim coppieters','pw','buyer',0,0,999,'N','tim@fooooo.com','','N',10),(110,'tim@me.com','tim coppieters','pw','buyer',0,0,999,'N','tim@me.com','','N',10),(111,'adfasdfdaf@adf.com','tim coppieters','pw','buyer',0,0,999,'N','adfasdfdaf@adf.com','','N',10),(112,'tim@foooooo.com','tim coppieters','pw','buyer',0,0,999,'N','tim@foooooo.com','','N',10),(113,'tim@rusty.be',' ','','buyer',0,0,999,'N','tim@rusty.be','','N',10);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-29 14:02:08
