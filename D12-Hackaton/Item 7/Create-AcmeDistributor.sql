start transaction;

create database `AcmeDistributor`;

use `AcmeDistributor`;

create user 'acme-user'@'%'identified by password
	'*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%'identified by password
	'*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete
	on `AcmeDistributor`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter,
		create temporary tables, lock tables, create view, create routine,
		alter routine, execute, trigger, show view
	on `AcmeDistributor`.* to 'acme-manager'@'%';


-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: AcmeDistributor
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `itemSource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ga0pnb7dqgnu7oy42rr99u9sr` (`customer_id`),
  KEY `FK_lo2dx86detdgp6hts5lfeurcw` (`itemSource_id`),
  CONSTRAINT `FK_lo2dx86detdgp6hts5lfeurcw` FOREIGN KEY (`itemSource_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_ga0pnb7dqgnu7oy42rr99u9sr` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (42,0,'Este es un comentario de prueba',25,12);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `contactPhone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `cvvCode` int(11) NOT NULL,
  `expirationMonth` int(11) NOT NULL,
  `expirationYear` int(11) NOT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `shoppingCart_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qv2l4kfmx51um4ry4wlfu52l9` (`shoppingCart_id`),
  UNIQUE KEY `UK_pwmktpkay2yx7v00mrwmuscl8` (`userAccount_id`),
  CONSTRAINT `FK_pwmktpkay2yx7v00mrwmuscl8` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_qv2l4kfmx51um4ry4wlfu52l9` FOREIGN KEY (`shoppingCart_id`) REFERENCES `shoppingcart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (25,0,'C\\Tumblr nº2 10011, Lugar','1988-11-08 00:00:00','Cust1','123564211','manuprueb@gmail.com','Manuel','Prueba',5,'brand1',123,12,2016,'holder1','5374215859088602',0,8),(26,0,'C\\Rapther nº2 92891, Juniperolandia','1990-11-11 00:00:00','Cust2','874514211','anafromJuni@gmail.com','Ana','Chicle',6,'brand2',563,10,2015,'holder2','5351311848690579',0,9),(27,0,'C\\Maus nº3 1ºA 00821, Helm','1988-05-10 00:00:00','Cust3','238749823','rathaus@gmail.com','Katze','Hund',7,'brand1',904,9,2017,'holder3','5285018735898923',0,10);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor`
--

DROP TABLE IF EXISTS `distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `contactPhone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4qh52fng4ngb7goyw14ru1t3c` (`userAccount_id`),
  CONSTRAINT `FK_4qh52fng4ngb7goyw14ru1t3c` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor`
--

LOCK TABLES `distributor` WRITE;
/*!40000 ALTER TABLE `distributor` DISABLE KEYS */;
INSERT INTO `distributor` VALUES (17,0,'C\\Inventada nº1 21012, Ciudad','1992-07-01 00:00:00','Distr1','923234411','distr@gmail.com','Alfonso','de Rojas',1),(24,0,'C\\Noexiste nº3 21012, Ciudad','1993-12-03 00:00:00','Distr2','321746676','merche@gmail.com','Mercedes','de Verdes',2);
/*!40000 ALTER TABLE `distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entryregister`
--

DROP TABLE IF EXISTS `entryregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entryregister` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_470rhh7vr2hykr404xcqwbkel` (`item_id`),
  KEY `FK_ctqnl0m4s26nlq3pt3vlmmde0` (`warehouse_id`),
  CONSTRAINT `FK_ctqnl0m4s26nlq3pt3vlmmde0` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`),
  CONSTRAINT `FK_470rhh7vr2hykr404xcqwbkel` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entryregister`
--

LOCK TABLES `entryregister` WRITE;
/*!40000 ALTER TABLE `entryregister` DISABLE KEYS */;
INSERT INTO `entryregister` VALUES (15,0,'2015-02-01 00:00:00',3,18,'eur',12,16);
/*!40000 ALTER TABLE `entryregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `actorId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (28,0,17,'inbox'),(29,0,17,'outbox'),(30,0,24,'inbox'),(31,0,24,'outbox'),(32,0,25,'inbox'),(33,0,25,'outbox'),(34,0,26,'inbox'),(35,0,26,'outbox'),(36,0,27,'inbox'),(37,0,27,'outbox'),(38,0,11,'inbox'),(39,0,11,'outbox'),(40,0,22,'inbox'),(41,0,22,'outbox');
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historyprice`
--

DROP TABLE IF EXISTS `historyprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historyprice` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `salePrice` double DEFAULT NULL,
  `saleCurrency` varchar(255) DEFAULT NULL,
  `finishDate` datetime DEFAULT NULL,
  `producerPrice` double DEFAULT NULL,
  `producerCurrency` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4hyhn8a6maxca73x6wfhuv07x` (`item_id`),
  CONSTRAINT `FK_4hyhn8a6maxca73x6wfhuv07x` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historyprice`
--

LOCK TABLES `historyprice` WRITE;
/*!40000 ALTER TABLE `historyprice` DISABLE KEYS */;
INSERT INTO `historyprice` VALUES (13,0,10,'eur','2015-01-04 00:00:00',6,'eur','2015-01-01 00:00:00',12),(14,0,12,'eur',NULL,8,'eur','2015-02-04 00:00:00',12),(21,0,19.5,'eur',NULL,10,'eur','2015-02-04 00:00:00',20);
/*!40000 ALTER TABLE `historyprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `orderNumber` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iwj9mkp2uthv4ihhqvc751npl` (`customer_id`),
  CONSTRAINT `FK_iwj9mkp2uthv4ihhqvc751npl` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `producer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p1jshkdtqidbprjlbqulx1u5l` (`producer_id`),
  CONSTRAINT `FK_p1jshkdtqidbprjlbqulx1u5l` FOREIGN KEY (`producer_id`) REFERENCES `producer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (12,0,'Utensilio','Objeto 1','Alf001',11),(20,0,'Utensilio','Objeto 2','Alf002',11);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_tax`
--

DROP TABLE IF EXISTS `item_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_tax` (
  `Item_id` int(11) NOT NULL,
  `taxes_id` int(11) NOT NULL,
  KEY `FK_3gegyi8vt520aro0p978365lj` (`taxes_id`),
  KEY `FK_oaebqjlxekgyg9evsxet5gwdc` (`Item_id`),
  CONSTRAINT `FK_oaebqjlxekgyg9evsxet5gwdc` FOREIGN KEY (`Item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_3gegyi8vt520aro0p978365lj` FOREIGN KEY (`taxes_id`) REFERENCES `tax` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_tax`
--

LOCK TABLES `item_tax` WRITE;
/*!40000 ALTER TABLE `item_tax` DISABLE KEYS */;
INSERT INTO `item_tax` VALUES (12,19),(20,19);
/*!40000 ALTER TABLE `item_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `recipientId` int(11) NOT NULL,
  `senderId` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `folder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7t1ls63lqb52igs4ms20cf94t` (`folder_id`),
  CONSTRAINT `FK_7t1ls63lqb52igs4ms20cf94t` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `contactPhone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bi369mmiqqm7ho04vvmodqpef` (`userAccount_id`),
  CONSTRAINT `FK_bi369mmiqqm7ho04vvmodqpef` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (11,0,'C\\Paseo nº5 41012, Pueblo','1990-06-01 00:00:00','Prod1','986234231','amarillo@gmail.com','Juan','Amarillo',3),(22,0,'C\\Vientos nº2 21010, Villa','1995-12-12 00:00:00','Prod2','745120682','poli@gmail.com','Amapola','Pérez',4);
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES (8,0),(9,0),(10,0);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingline`
--

DROP TABLE IF EXISTS `shoppingline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingline` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `shoppingCart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nhgn1pp6h3uwg4ywr8uot6ubd` (`invoice_id`),
  KEY `FK_dr8uw60pe8b8dlxdmwcfk2igp` (`item_id`),
  KEY `FK_sqlgh8ju17aytdmj5mldq1w1g` (`shoppingCart_id`),
  CONSTRAINT `FK_sqlgh8ju17aytdmj5mldq1w1g` FOREIGN KEY (`shoppingCart_id`) REFERENCES `shoppingcart` (`id`),
  CONSTRAINT `FK_dr8uw60pe8b8dlxdmwcfk2igp` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_nhgn1pp6h3uwg4ywr8uot6ubd` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingline`
--

LOCK TABLES `shoppingline` WRITE;
/*!40000 ALTER TABLE `shoppingline` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pa9w3orhxcvhr0x8lku6ggbtd` (`item_id`),
  KEY `FK_9ue517nvpkc5vkjqpi3r40v3q` (`warehouse_id`),
  CONSTRAINT `FK_9ue517nvpkc5vkjqpi3r40v3q` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`),
  CONSTRAINT `FK_pa9w3orhxcvhr0x8lku6ggbtd` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (18,0,3,12,16);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percent` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
INSERT INTO `tax` VALUES (19,0,'IVA',0.21);
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_item`
--

DROP TABLE IF EXISTS `tax_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_item` (
  `Tax_id` int(11) NOT NULL,
  `sellingItems_id` int(11) NOT NULL,
  KEY `FK_6ujfkltv0vdqi134wytfrvysv` (`sellingItems_id`),
  KEY `FK_4qw6xcautnixbe2fi3syv03yg` (`Tax_id`),
  CONSTRAINT `FK_4qw6xcautnixbe2fi3syv03yg` FOREIGN KEY (`Tax_id`) REFERENCES `tax` (`id`),
  CONSTRAINT `FK_6ujfkltv0vdqi134wytfrvysv` FOREIGN KEY (`sellingItems_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_item`
--

LOCK TABLES `tax_item` WRITE;
/*!40000 ALTER TABLE `tax_item` DISABLE KEYS */;
INSERT INTO `tax_item` VALUES (19,12),(19,20);
/*!40000 ALTER TABLE `tax_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (1,0,'6a7e55d956c5538583fc3b1d2c2ea463','distri1'),(2,0,'170752a1bed4132f699d5541bfd374ff','distri2'),(3,0,'10bf261fff0ffe061a646294dc164998','produc1'),(4,0,'b3a81a99791a2f9a4a4dd0a2069599d1','produc2'),(5,0,'1f07921f4416f182a32c483ccac2b0e6','cust1'),(6,0,'979f4582d8aabe8d3e4c25aaa1825213','cust2'),(7,0,'e586578ee387c0bf19b8094fba871b80','cust3');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (1,'DISTRIBUTOR'),(2,'DISTRIBUTOR'),(3,'PRODUCER'),(4,'PRODUCER'),(5,'CUSTOMER'),(6,'CUSTOMER'),(7,'CUSTOMER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contactPhone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `distributor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g6j4th28642phdvcem5hdiq4o` (`distributor_id`),
  CONSTRAINT `FK_g6j4th28642phdvcem5hdiq4o` FOREIGN KEY (`distributor_id`) REFERENCES `distributor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (16,0,'C/SinNombre nº2, 21012','987345123','distrAlfonso@gmail.com','Distribuidora Alfonso',17),(23,0,'C/de la Manzana s/n, 21014','911390908','tallerDartesano@gmail.com','Taller del artesano',24);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_stock`
--

DROP TABLE IF EXISTS `warehouse_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_stock` (
  `Warehouse_id` int(11) NOT NULL,
  `stocks_id` int(11) NOT NULL,
  KEY `FK_shucuq3ycah12vpvv334es5kl` (`stocks_id`),
  KEY `FK_tdh2m2wigkkubans5w3vccmt0` (`Warehouse_id`),
  CONSTRAINT `FK_tdh2m2wigkkubans5w3vccmt0` FOREIGN KEY (`Warehouse_id`) REFERENCES `warehouse` (`id`),
  CONSTRAINT `FK_shucuq3ycah12vpvv334es5kl` FOREIGN KEY (`stocks_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_stock`
--

LOCK TABLES `warehouse_stock` WRITE;
/*!40000 ALTER TABLE `warehouse_stock` DISABLE KEYS */;
INSERT INTO `warehouse_stock` VALUES (16,18);
/*!40000 ALTER TABLE `warehouse_stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-05 14:09:48


commit;