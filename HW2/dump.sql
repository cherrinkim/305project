-- MySQL dump 10.13  Distrib 5.6.31, for osx10.8 (x86_64)
--
-- Host: localhost    Database: wolfiebook
-- ------------------------------------------------------
-- Server version	5.6.31

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
-- Table structure for table `Advertisements`
--

DROP TABLE IF EXISTS `Advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Advertisements` (
  `advertisementId` int(11) NOT NULL AUTO_INCREMENT,
  `employeeId` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `company` varchar(50) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `unitPrice` decimal(7,2) NOT NULL,
  `availableUnits` int(11) NOT NULL,
  PRIMARY KEY (`advertisementId`),
  KEY `employeeId` (`employeeId`),
  CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `Employees` (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Advertisements`
--

LOCK TABLES `Advertisements` WRITE;
/*!40000 ALTER TABLE `Advertisements` DISABLE KEYS */;
INSERT INTO `Advertisements` VALUES (1,1,'cars','2016-06-14 10:30:00','Ford','2016 Ford Somethingorother','A car with 4 wheel drive!',25000.00,1000),(2,5,'cars','2016-06-14 10:30:00','Subaru','2016 Subaru Outback','The best car you\'ll ever drive.',22000.00,2000),(3,5,'clothing','2016-06-14 10:30:00','Levi\'s','Levi\'s Boot Cut Jeans','Comfy jeans!',59.99,135),(4,7,'food','2016-07-03 10:30:00','Subway','Subway Sandwiches','Eat fresh(tm).',5.00,100000),(5,6,'computers','2016-07-15 10:30:00','Apple','Apple Macbook Pro','A fancy new computer.',999.99,50000),(6,6,'computers','2016-07-15 10:30:00','Samsung','Samsung Galaxy Note 7','Hope it doesn\'t explode.',999.99,50000),(7,4,'movies','2016-09-05 10:30:00','Disney','Doctor Strange','Buy tickets for the new Marvel movie!',9.99,1000000),(8,3,'books','2016-09-07 10:30:00','Random House','Database Systems for Dummies','Learn MySQL with this new book.',29.99,250000),(9,8,'toys','2016-09-08 10:30:00','Tiger Electronics','Furby','Own a weird robot pet!',59.99,123000),(10,10,'cars','2016-09-13 10:30:00','Honda','2017 Honda Accord','A reliable car.',22355.00,67000);
/*!40000 ALTER TABLE `Advertisements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `postId` int(11) NOT NULL,
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `authorId` (`authorId`),
  KEY `postId` (`postId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `Users` (`userId`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `Posts` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES (1,1,2,'2016-09-02 09:35:33','Hello 1!'),(1,2,4,'2016-09-02 10:11:01','Hello 2!'),(2,3,2,'2016-10-02 10:30:00','How are you?'),(5,4,5,'2016-09-09 10:30:00','I don\'t'),(5,5,4,'2016-09-09 14:23:01','I do'),(6,6,4,'2016-09-11 10:30:00','I agree'),(8,7,1,'2016-09-17 08:33:13','Cool'),(8,8,2,'2016-09-18 16:14:01','Me too'),(9,9,3,'2016-10-20 10:30:00','Thanks!'),(10,10,6,'2016-10-22 13:02:17','Woohoo!');
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees` (
  `employeeId` int(11) NOT NULL AUTO_INCREMENT,
  `employeePassword` char(64) NOT NULL,
  `ssn` char(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `address` varchar(95) NOT NULL,
  `city` varchar(35) NOT NULL,
  `state` char(2) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `telephone` char(12) NOT NULL,
  `dateStarted` date NOT NULL,
  `hourlyRate` decimal(7,2) NOT NULL,
  `isManager` tinyint(1) NOT NULL,
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','123-45-6789','John','Doe','7746 South Young St','Halethorpe','MD','21227','123-456-7890','2012-06-14',9.25,1),(2,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','246-83-6790','Jane','Doe','7746 North Young St','Halethorpe','MD','21227','123-456-7890','2012-06-18',10.25,1),(3,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','111-34-2020','Angus','McDonald','717 Lincoln St','Dayton','OH','45420','222-328-7712','2016-08-03',3.30,0),(4,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','222-45-3131','Oliver','Williams','200 Lincoln St','Dayton','OH','45420','913-123-0924','2016-03-23',9.00,0),(5,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','123-54-9813','Lisa','Hollands','81 Second Ave','Matawan','NJ','07747','346-912-8701','1993-10-13',45.00,1),(6,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','213-13-3568','Marcus','Smith','401 Magnolia St','Aliquippa','PA','15001','121-984-3256','2014-11-25',12.00,0),(7,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','074-26-1348','Joe','Schmoe','123 North St','Aliquippa','PA','15001','121-234-1349','2014-11-25',10.00,0),(8,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','213-13-3568','Jenna','Sanders','38 Somewhere Dr','Aliquippa','PA','15001','121-434-2382','2014-11-23',10.15,0),(9,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','012-86-2016','Sofia','Stocio','7114 Stonybrook Ct','Central Islip','NY','11722','631-983-3999','2015-04-03',11.50,0),(10,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','312-31-4311','Kevin','Nadeau','880 Winchester Rd','Concord','NH','03301','121-872-0894','2013-06-01',11.00,0);
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Friends`
--

DROP TABLE IF EXISTS `Friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Friends` (
  `friend1` int(11) NOT NULL,
  `friend2` int(11) NOT NULL,
  PRIMARY KEY (`friend1`,`friend2`),
  KEY `friend2` (`friend2`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`friend1`) REFERENCES `Users` (`userId`),
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend2`) REFERENCES `Users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Friends`
--

LOCK TABLES `Friends` WRITE;
/*!40000 ALTER TABLE `Friends` DISABLE KEYS */;
INSERT INTO `Friends` VALUES (1,2),(1,3),(2,3),(2,4),(3,4),(4,5),(2,7),(6,7),(7,8),(8,9),(9,10);
/*!40000 ALTER TABLE `Friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupMembers`
--

DROP TABLE IF EXISTS `GroupMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupMembers` (
  `userId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`groupId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `groupmembers_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`userId`),
  CONSTRAINT `groupmembers_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `Groups` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupMembers`
--

LOCK TABLES `GroupMembers` WRITE;
/*!40000 ALTER TABLE `GroupMembers` DISABLE KEYS */;
INSERT INTO `GroupMembers` VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,3),(7,3),(8,3),(1,4),(4,4),(5,4),(9,5),(10,5),(4,6),(6,7),(8,7),(9,7),(8,8),(2,9),(3,9),(5,9),(6,10),(10,10);
/*!40000 ALTER TABLE `GroupMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Groups` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `ownerId` int(11) NOT NULL,
  PRIMARY KEY (`groupId`),
  KEY `ownerId` (`ownerId`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`ownerId`) REFERENCES `Users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups`
--

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;
INSERT INTO `Groups` VALUES (1,'CSE305 Project','team',3),(2,'Stony Brook CS Department','organization',5),(3,'Illuminati','organization',6),(4,'Car Fans','club',5),(5,'Volunteer Club','club',9),(6,'Stony Brook Swim Team','team',4),(7,'Pen Pals','club',9),(8,'Republican National Committee','organization',8),(9,'ABC Club','club',2),(10,'123 Club','club',3);
/*!40000 ALTER TABLE `Groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LikedComments`
--

DROP TABLE IF EXISTS `LikedComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LikedComments` (
  `userId` int(11) NOT NULL,
  `commentId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`commentId`),
  KEY `commentId` (`commentId`),
  CONSTRAINT `likedcomments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`userId`),
  CONSTRAINT `likedcomments_ibfk_2` FOREIGN KEY (`commentId`) REFERENCES `Comments` (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LikedComments`
--

LOCK TABLES `LikedComments` WRITE;
/*!40000 ALTER TABLE `LikedComments` DISABLE KEYS */;
INSERT INTO `LikedComments` VALUES (1,3),(2,3),(4,4),(5,4),(4,5),(5,5),(2,7),(1,9),(7,10),(8,10);
/*!40000 ALTER TABLE `LikedComments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LikedPosts`
--

DROP TABLE IF EXISTS `LikedPosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LikedPosts` (
  `userId` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`postId`),
  KEY `postId` (`postId`),
  CONSTRAINT `likedposts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`userId`),
  CONSTRAINT `likedposts_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `Posts` (`postId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LikedPosts`
--

LOCK TABLES `LikedPosts` WRITE;
/*!40000 ALTER TABLE `LikedPosts` DISABLE KEYS */;
INSERT INTO `LikedPosts` VALUES (2,1),(3,1),(8,1),(3,2),(4,2),(8,2),(5,5),(4,6),(6,10),(8,10);
/*!40000 ALTER TABLE `LikedPosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Messages` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `dateSent` datetime DEFAULT CURRENT_TIMESTAMP,
  `subject` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  PRIMARY KEY (`messageId`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `Users` (`userId`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `Users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
INSERT INTO `Messages` VALUES (1,'2016-09-02 10:30:00','Hello','This is a sample message',1,2),(2,'2016-09-03 10:30:00','Hello again','This is another sample message',1,2),(3,'2016-09-04 11:33:00','RE: Hello again','This is a sample reply',2,1),(4,'2016-10-13 01:30:00','Exam Grade','Your grade is 96',4,3),(5,'2016-10-14 18:13:56','Good job','Wolfiebook > Facebook',7,2),(6,'2016-10-15 13:33:33','hey there','aefqeipjqfipjqw',8,9),(7,'2016-10-15 14:30:00','Shopping list','Milk, eggs, juice',9,10),(8,'2016-10-18 12:00:56','Party','Want to come over Friday?',6,7),(9,'2016-10-18 12:01:50','RE: Party','Sure :-)',7,6),(10,'2016-10-25 10:30:00','Classes','What are you teaching next semester?',5,4);
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pages`
--

DROP TABLE IF EXISTS `Pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pages` (
  `pageId` int(11) NOT NULL AUTO_INCREMENT,
  `ownerId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `postCount` int(11) DEFAULT '0',
  PRIMARY KEY (`pageId`),
  KEY `ownerId` (`ownerId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`ownerId`) REFERENCES `Users` (`userId`),
  CONSTRAINT `pages_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `Groups` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pages`
--

LOCK TABLES `Pages` WRITE;
/*!40000 ALTER TABLE `Pages` DISABLE KEYS */;
INSERT INTO `Pages` VALUES (1,1,NULL,1),(2,2,NULL,1),(3,3,NULL,2),(4,4,NULL,0),(5,5,NULL,0),(6,6,NULL,0),(7,7,NULL,0),(8,8,NULL,0),(9,9,NULL,0),(10,10,NULL,0),(11,NULL,1,2),(12,NULL,2,3),(13,NULL,3,1),(14,NULL,4,0),(15,NULL,5,0),(16,NULL,6,0),(17,NULL,7,0),(18,NULL,8,0),(19,NULL,9,0),(20,NULL,10,0);
/*!40000 ALTER TABLE `Pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Posts` (
  `pageId` int(11) NOT NULL,
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `content` text,
  `commentCount` int(11) DEFAULT '0',
  PRIMARY KEY (`postId`),
  KEY `pageId` (`pageId`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`pageId`) REFERENCES `Pages` (`pageId`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`authorId`) REFERENCES `Users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES (1,1,1,'2016-09-02 09:25:33','Hello, World!',2),(2,2,2,'2016-09-02 10:30:00','This is my wall.',1),(3,3,1,'2016-09-05 23:25:33','Hello',0),(3,4,2,'2016-09-07 22:05:00','Hello 2',0),(12,5,4,'2016-09-08 10:00:11','I teach CSE305',2),(12,6,5,'2016-09-10 04:00:01','Computers are fun',1),(12,7,4,'2016-09-10 04:33:22','I also teach CSE114',0),(11,8,3,'2016-09-10 13:11:01','I\'m working on assignment 2',2),(11,9,2,'2016-10-20 09:25:33','I updated the sql file',1),(13,10,7,'2016-10-21 09:25:33','Yay!',1);
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preferences`
--

DROP TABLE IF EXISTS `Preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Preferences` (
  `userId` int(11) NOT NULL,
  `adType` varchar(50) NOT NULL,
  KEY `userId` (`userId`),
  CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preferences`
--

LOCK TABLES `Preferences` WRITE;
/*!40000 ALTER TABLE `Preferences` DISABLE KEYS */;
INSERT INTO `Preferences` VALUES (1,'cars'),(1,'clothing'),(6,'computers'),(4,'food'),(5,'cars'),(9,'books'),(2,'movies'),(9,'computers'),(7,'clothing'),(4,'cars');
/*!40000 ALTER TABLE `Preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sales` (
  `transactionId` int(11) NOT NULL AUTO_INCREMENT,
  `buyerId` int(11) NOT NULL,
  `cardNumber` char(16) NOT NULL,
  `dateSold` datetime DEFAULT CURRENT_TIMESTAMP,
  `advertisementId` int(11) NOT NULL,
  `numberOfUnits` int(11) NOT NULL,
  `overseerId` int(11) DEFAULT NULL,
  `chargeAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`transactionId`),
  KEY `advertisementId` (`advertisementId`),
  KEY `buyerId` (`buyerId`),
  KEY `overseerId` (`overseerId`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`advertisementId`) REFERENCES `Advertisements` (`advertisementId`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`buyerId`) REFERENCES `Users` (`userId`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`overseerId`) REFERENCES `Employees` (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (1,1,'1947234500008264','2016-07-14 10:30:00',1,1,1,25000.00),(2,7,'4444999912345555','2016-07-18 10:30:00',2,250,3,5500000.00),(3,9,'1234123412341234','2016-08-01 11:20:00',5,5,6,4999.95),(4,6,'9000900080006000','2016-08-19 10:30:00',5,500,6,499995.00),(5,8,'3511927539490047','2016-10-03 10:20:00',9,5000,8,299950.00),(6,8,'3511927539490047','2016-10-04 04:31:00',10,1,10,22355.00),(7,4,'1111111111111111','2016-10-20 10:30:00',8,1,3,29.99),(8,4,'1111111111111111','2016-10-20 19:30:00',8,3,3,89.97),(9,3,'9999444477772222','2016-10-22 10:30:00',4,2,7,10.00),(10,5,'2234983513786645','2016-10-25 10:30:00',6,5,6,4999.95);
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userPassword` char(64) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `address` varchar(95) NOT NULL,
  `city` varchar(35) NOT NULL,
  `state` char(2) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `telephone` char(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `accountCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creditCard` char(16) DEFAULT NULL,
  `purchaseRating` int(1) NOT NULL,
  PRIMARY KEY (`userId`),
  FULLTEXT KEY `firstName` (`firstName`,`lastName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'password','Bryan','Koelbel','123 South Dr','Stony Brook','NY','11790','631-123-4567','bryan.koelbel@stonybrook.edu','2016-04-27 10:25:32','1947234500008264',1),(2,'15E2B0D3C33891EBB0F1EF609EC419420C20E320CE94C65FBC8C3312448EB225','Jeonghoon','Kim','131 Sunnyside Ave','Stony Brook','NY','11790','516-244-9813','jeonghoon.kim@stonybrook.edu','2016-04-28 09:13:12',NULL,0),(3,'5C80565DB6F29DA0B01AA12522C37B32F121CBE47A861EF7F006CB22922DFFA1','Chaerin','Kim','24 Oakwood Rd','Port Jefferson','NY','11777','631-343-2265','chaerin.kim@stonybrook.edu','2016-04-28 15:45:07','9999444477772222',2),(4,'A50254F20F695550A6F7B51665CC30708C014C8F2FF07ED146F0E41DC664E884','Paul','Fodor','5 East Ave','Smithtown','NY','11787','516-333-7635','paul.fodor@stonybrook.edu','2016-06-13 08:00:00','1111111111111111',4),(5,'940C54EC003028B3358F5B5594CDD53353524F52F2545D9A9A6E5327C3C1D333','Jennifer','Wong','32 Creativename St','Commack','NY','11725','631-130-2398','jwong@cs.sunysb.edu','2016-06-15 06:30:11','2234983513786645',5),(6,'7513C5FF72CC853C191C04A497B9293A4EAFF4A1BD43CCDA98A04C9BA81DD3CE','Tim','Cook','1 Infinite Loop','Cupertino','CA','95014','408-996-1010','tcook@apple.com','2016-07-01 09:25:33',NULL,0),(7,'DDAE32B0096467007D69A31736C61BF53D9D07184D90E63E2FA1B2C63B3AE4B8','Mark','Zuckerberg','1 Hacker Way','Menlo Park','CA','94025','650-543-4800','zuck@facebook.com','2016-07-01 09:25:33','4444999912345555',250),(8,'5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8','Ben','Carson','43 Main St','West Palm Beach','FL','33411','231-456-8888','benny1248@yahoo.com','2016-07-30 22:15:01','3511927539490047',5001),(9,'15E2B0D3C33891EBB0F1EF609EC419420C20E320CE94C65FBC8C3312448EB225','Melissa','Randomperson','236 Lancaster St','Bloomington','IN','47401','212-985-6439','somerando636@gmail.com','2016-08-04 19:55:59','1234123412341234',5),(10,'15E2B0D3C33891EBB0F1EF609EC419420C20E320CE94C65FBC8C3312448EB225','Joe','Randomperson','236 Lancaster St','Bloomington','IN','47401','212-985-6439','someotherrando636@gmail.com','2016-08-08 09:25:33',NULL,0);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-07 17:11:13
