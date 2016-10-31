-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: 305_project
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisements` (
  `advertisement_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `company` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `unit_price` decimal(7,2) NOT NULL,
  `available_units` int(11) NOT NULL,
  PRIMARY KEY (`advertisement_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisements`
--

LOCK TABLES `advertisements` WRITE;
/*!40000 ALTER TABLE `advertisements` DISABLE KEYS */;
INSERT INTO `advertisements` VALUES (1,1,'cars','2016-06-14 10:30:00','Ford','2016 Ford Somethingorother','A car with 4 wheel drive!',25000.00,1000),(2,5,'cars','2016-06-14 10:30:00','Subaru','2016 Subaru Outback','The best car you\'ll ever drive.',22000.00,2000),(3,5,'clothing','2016-06-14 10:30:00','Levi\'s','Levi\'s Boot Cut Jeans','Comfy jeans!',59.99,135),(4,7,'food','2016-07-03 10:30:00','Subway','Subway Sandwiches','Eat fresh(tm).',5.00,100000),(5,6,'computers','2016-07-15 10:30:00','Apple','Apple Macbook Pro','A fancy new computer.',999.99,50000),(6,6,'computers','2016-07-15 10:30:00','Samsung','Samsung Galaxy Note 7','Hope it doesn\'t explode.',999.99,50000),(7,4,'movies','2016-09-05 10:30:00','Disney','Doctor Strange','Buy tickets for the new Marvel movie!',9.99,1000000),(8,3,'books','2016-09-07 10:30:00','Random House','Database Systems for Dummies','Learn MySQL with this new book.',29.99,250000),(9,8,'toys','2016-09-08 10:30:00','Tiger Electronics','Furby','Own a weird robot pet!',59.99,123000),(10,10,'cars','2016-09-13 10:30:00','Honda','2017 Honda Accord','A reliable car.',22355.00,67000);
/*!40000 ALTER TABLE `advertisements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `post_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `author_id` (`author_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,2,'2016-09-02 09:35:33','Hello 1!'),(1,2,4,'2016-09-02 10:11:01','Hello 2!'),(2,3,2,'2016-10-02 10:30:00','How are you?'),(5,4,5,'2016-09-09 10:30:00','I don\'t'),(5,5,4,'2016-09-09 14:23:01','I do'),(6,6,4,'2016-09-11 10:30:00','I agree'),(8,7,1,'2016-09-17 08:33:13','Cool'),(8,8,2,'2016-09-18 16:14:01','Me too'),(9,9,3,'2016-10-20 10:30:00','Thanks!'),(10,10,6,'2016-10-22 13:02:17','Woohoo!');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_password` char(40) NOT NULL,
  `ssn` char(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` varchar(95) NOT NULL,
  `city` varchar(35) NOT NULL,
  `state` char(2) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `telephone` char(12) NOT NULL,
  `date_started` date NOT NULL,
  `hourly_rate` decimal(7,2) NOT NULL,
  `is_manager` tinyint(1) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'5f4dcc3b5aa765d61d8327deb882cf99','123-45-6789','John','Doe','7746 South Young St','Halethorpe','MD','21227','123-456-7890','2012-06-14',9.25,1),(2,'5f4dcc3b5aa765d61d8327deb882cf99','246-83-6790','Jane','Doe','7746 North Young St','Halethorpe','MD','21227','123-456-7890','2012-06-18',10.25,1),(3,'5f4dcc3b5aa765d61d8327deb882cf99','111-34-2020','Angus','McDonald','717 Lincoln St','Dayton','OH','45420','222-328-7712','2016-08-03',3.30,0),(4,'5f4dcc3b5aa765d61d8327deb882cf99','222-45-3131','Oliver','Williams','200 Lincoln St','Dayton','OH','45420','913-123-0924','2016-03-23',9.00,0),(5,'5f4dcc3b5aa765d61d8327deb882cf99','123-54-9813','Lisa','Hollands','81 Second Ave','Matawan','NJ','07747','346-912-8701','1993-10-13',45.00,1),(6,'5f4dcc3b5aa765d61d8327deb882cf99','213-13-3568','Marcus','Smith','401 Magnolia St','Aliquippa','PA','15001','121-984-3256','2014-11-25',12.00,0),(7,'5f4dcc3b5aa765d61d8327deb882cf99','074-26-1348','Joe','Schmoe','123 North St','Aliquippa','PA','15001','121-234-1349','2014-11-25',10.00,0),(8,'5f4dcc3b5aa765d61d8327deb882cf99','213-13-3568','Jenna','Sanders','38 Somewhere Dr','Aliquippa','PA','15001','121-434-2382','2014-11-23',10.15,0),(9,'5f4dcc3b5aa765d61d8327deb882cf99','012-86-2016','Sofia','Stocio','7114 Stonybrook Ct','Central Islip','NY','11722','631-983-3999','2015-04-03',11.50,0),(10,'5f4dcc3b5aa765d61d8327deb882cf99','312-31-4311','Kevin','Nadeau','880 Winchester Rd','Concord','NH','03301','121-872-0894','2013-06-01',11.00,0);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `friend1` int(11) NOT NULL,
  `friend2` int(11) NOT NULL,
  PRIMARY KEY (`friend1`,`friend2`),
  KEY `friend2` (`friend2`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`friend1`) REFERENCES `users` (`user_id`),
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend2`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,2),(1,3),(2,3),(2,4),(3,4),(4,5),(2,7),(6,7),(7,8),(8,9),(9,10);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupmembers`
--

DROP TABLE IF EXISTS `groupmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupmembers` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `groupmembers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `groupmembers_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupmembers`
--

LOCK TABLES `groupmembers` WRITE;
/*!40000 ALTER TABLE `groupmembers` DISABLE KEYS */;
INSERT INTO `groupmembers` VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,3),(7,3),(8,3),(1,4),(4,4),(5,4),(9,5),(10,5),(4,6),(6,7),(8,7),(9,7),(8,8),(2,9),(3,9),(5,9),(6,10),(10,10);
/*!40000 ALTER TABLE `groupmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'CSE305 Project','team',3),(2,'Stony Brook CS Department','organization',5),(3,'Illuminati','organization',6),(4,'Car Fans','club',5),(5,'Volunteer Club','club',9),(6,'Stony Brook Swim Team','team',4),(7,'Pen Pals','club',9),(8,'Republican National Committee','organization',8),(9,'ABC Club','club',2),(10,'123 Club','club',3);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likedcomments`
--

DROP TABLE IF EXISTS `likedcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likedcomments` (
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `likedcomments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `likedcomments_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likedcomments`
--

LOCK TABLES `likedcomments` WRITE;
/*!40000 ALTER TABLE `likedcomments` DISABLE KEYS */;
INSERT INTO `likedcomments` VALUES (1,3),(2,3),(4,4),(5,4),(4,5),(5,5),(2,7),(1,9),(7,10),(8,10);
/*!40000 ALTER TABLE `likedcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likedposts`
--

DROP TABLE IF EXISTS `likedposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likedposts` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `likedposts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `likedposts_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likedposts`
--

LOCK TABLES `likedposts` WRITE;
/*!40000 ALTER TABLE `likedposts` DISABLE KEYS */;
INSERT INTO `likedposts` VALUES (2,1),(3,1),(8,1),(3,2),(4,2),(8,2),(5,5),(4,6),(6,10),(8,10);
/*!40000 ALTER TABLE `likedposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_sent` datetime DEFAULT CURRENT_TIMESTAMP,
  `subject` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `users` (`user_id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'2016-09-02 10:30:00','Hello','This is a sample message',1,2),(2,'2016-09-03 10:30:00','Hello again','This is another sample message',1,2),(3,'2016-09-04 11:33:00','RE: Hello again','This is a sample reply',2,1),(4,'2016-10-13 01:30:00','Exam Grade','Your grade is 96',4,3),(5,'2016-10-14 18:13:56','Good job','Wolfiebook > Facebook',7,2),(6,'2016-10-15 13:33:33','hey there','aefqeipjqfipjqw',8,9),(7,'2016-10-15 14:30:00','Shopping list','Milk, eggs, juice',9,10),(8,'2016-10-18 12:00:56','Party','Want to come over Friday?',6,7),(9,'2016-10-18 12:01:50','RE: Party','Sure :-)',7,6),(10,'2016-10-25 10:30:00','Classes','What are you teaching next semester?',5,4);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `post_count` int(11) DEFAULT '0',
  PRIMARY KEY (`page_id`),
  KEY `owner_id` (`owner_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `pages_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,1,NULL,1),(2,2,NULL,1),(3,3,NULL,2),(4,4,NULL,0),(5,5,NULL,0),(6,6,NULL,0),(7,7,NULL,0),(8,8,NULL,0),(9,9,NULL,0),(10,10,NULL,0),(11,NULL,1,2),(12,NULL,2,3),(13,NULL,3,1),(14,NULL,4,0),(15,NULL,5,0),(16,NULL,6,0),(17,NULL,7,0),(18,NULL,8,0),(19,NULL,9,0),(20,NULL,10,0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `page_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `content` text,
  `comment_count` int(11) DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `page_id` (`page_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `pages` (`page_id`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,1,'2016-09-02 09:25:33','Hello, World!',2),(2,2,2,'2016-09-02 10:30:00','This is my wall.',1),(3,3,1,'2016-09-05 23:25:33','Hello',0),(3,4,2,'2016-09-07 22:05:00','Hello 2',0),(12,5,4,'2016-09-08 10:00:11','I teach CSE305',2),(12,6,5,'2016-09-10 04:00:01','Computers are fun',1),(12,7,4,'2016-09-10 04:33:22','I also teach CSE114',0),(11,8,3,'2016-09-10 13:11:01','I\'m working on assignment 2',2),(11,9,2,'2016-10-20 09:25:33','I updated the sql file',1),(13,10,7,'2016-10-21 09:25:33','Yay!',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferences` (
  `user_id` int(11) NOT NULL,
  `ad_type` varchar(50) NOT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (1,'cars'),(1,'clothing'),(6,'computers'),(4,'food'),(5,'cars'),(9,'books'),(2,'movies'),(9,'computers'),(7,'clothing'),(4,'cars');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) DEFAULT NULL,
  `date_sold` datetime DEFAULT CURRENT_TIMESTAMP,
  `advertisement_id` int(11) NOT NULL,
  `number_of_units` int(11) NOT NULL,
  `overseer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `advertisement_id` (`advertisement_id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `overseer_id` (`overseer_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`advertisement_id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`overseer_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,'2016-07-14 10:30:00',1,1,1),(2,7,'2016-07-18 10:30:00',2,250,3),(3,9,'2016-08-01 11:20:00',5,5,6),(4,6,'2016-08-19 10:30:00',5,500,6),(5,8,'2016-10-03 10:20:00',9,5000,8),(6,8,'2016-10-04 04:31:00',10,1,10),(7,4,'2016-10-20 10:30:00',8,1,3),(8,4,'2016-10-20 19:30:00',8,3,3),(9,3,'2016-10-22 10:30:00',4,2,7),(10,5,'2016-10-25 10:30:00',6,5,6);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_password` char(40) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` varchar(95) NOT NULL,
  `city` varchar(35) NOT NULL,
  `state` char(2) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `telephone` char(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `account_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `credit_card` char(16) DEFAULT NULL,
  `purchase_rating` int(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'6ca9d2479e0081472bf07069274c3c06','Bryan','Koelbel','123 South Dr','Stony Brook','NY','11790','631-123-4567','bryan.koelbel@stonybrook.edu','2016-04-27 10:25:32','1947234500008264',1),(2,'25f9e794323b453885f5181f1b624d0b','Jeonghoon','Kim','131 Sunnyside Ave','Stony Brook','NY','11790','516-244-9813','jeonghoon.kim@stonybrook.edu','2016-04-28 09:13:12',NULL,0),(3,'c44a471bd78cc6c2fea32b9fe028d30a','Chaerin','Kim','24 Oakwood Rd','Port Jefferson','NY','11777','631-343-2265','chaerin.kim@stonybrook.edu','2016-04-28 15:45:07','9999444477772222',2),(4,'f8c0921e52fb066b4d69e8dbbe70d230','Paul','Fodor','5 East Ave','Smithtown','NY','11787','516-333-7635','paul.fodor@stonybrook.edu','2016-06-13 08:00:00','1111111111111111',4),(5,'5c7523cad7e20bdfc86e5f1ed4e52ff3','Jennifer','Wong','32 Creativename St','Commack','NY','11725','631-130-2398','jwong@cs.sunysb.edu','2016-06-15 06:30:11','2234983513786645',5),(6,'bd06b11bc05c5e6efbe587e7df91e4b4','Tim','Cook','1 Infinite Loop','Cupertino','CA','95014','408-996-1010','tcook@apple.com','2016-07-01 09:25:33',NULL,0),(7,'aaef13f2e58a39be28c7d86a2a2e6a1b','Mark','Zuckerberg','1 Hacker Way','Menlo Park','CA','94025','650-543-4800','zuck@facebook.com','2016-07-01 09:25:33','4444999912345555',250),(8,'5f4dcc3b5aa765d61d8327deb882cf99','Ben','Carson','43 Main St','West Palm Beach','FL','33411','231-456-8888','benny1248@yahoo.com','2016-07-30 22:15:01','3511927539490047',5001),(9,'25f9e794323b453885f5181f1b624d0b','Melissa','Randomperson','236 Lancaster St','Bloomington','IN','47401','212-985-6439','somerando636@gmail.com','2016-08-04 19:55:59','1234123412341234',5),(10,'25f9e794323b453885f5181f1b624d0b','Joe','Randomperson','236 Lancaster St','Bloomington','IN','47401','212-985-6439','someotherrando636@gmail.com','2016-08-08 09:25:33',NULL,0);
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

-- Dump completed on 2016-10-31 11:20:32
