-- MySQL dump 10.13  Distrib 5.1.33, for Win32 (ia32)
--
-- Host: localhost    Database: onlineshopping
-- ------------------------------------------------------
-- Server version	5.1.33-community

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Pincode` varchar(100) DEFAULT NULL,
  `Fkcustid` int(11) DEFAULT NULL,
  `Mobile` varchar(50) DEFAULT NULL,
  `addid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`addid`),
  KEY `Fkcustid` (`Fkcustid`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`Fkcustid`) REFERENCES `userdetail` (`contactno`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('Nikhil','Sharma','nikhilsharma35299@gmail.com','H no. 47 suger mill colony near sunariyan chowk , Rohtak','India','Haryana','124001',9191,'+919992662601',4),('aman','Sharma','nikhilsharma35299@gmail.com','H no. 47 Suger mill colony Sunarian chowk ,rohtak','India','Haryana','124001',9191,'9466531633',5),('Nikhil','Sharma','nikhilsharma35299@gmail.com','H no. 47 suger mill colony near sunariyan chowk , Rohtak','India','Haryana','124001',9191,'+919992662601',6),('Nikhil','Sharma','nikhilsharma35299@gmail.com','H no. 47 suger mill colony near sunariyan chowk , Rohtak','India','Haryana','124001',3131,'+919992662601',8),('Nikhil','Sharma','nikhilsharma35299@gmail.com','H no. 47 suger mill colony near sunariyan chowk , Rohtak','India','Haryana','124001',1111,'+919992662601',9),('Naveen','Kumar','naveen@gmail.com','Janta Colony','India','Haryana','124001',123456,'',10),('naveen ','kumar','naveen@gmail.com','Housing Board','India','Haryana','124001',123456,'',11);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `Serialno` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(50) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Serialno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Adidas','Cloth'),(2,'Iphone','Electronics'),(3,'Dell','Electronics'),(4,'nike','footwear'),(5,'Hp','Electronics');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `customerid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `IsEnable` varchar(50) DEFAULT NULL,
  `Serialno` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` int(11) DEFAULT '-1',
  PRIMARY KEY (`Serialno`),
  KEY `fkCust` (`customerid`),
  KEY `fkProduct` (`productid`),
  CONSTRAINT `fkCust` FOREIGN KEY (`customerid`) REFERENCES `userdetail` (`contactno`),
  CONSTRAINT `fkProduct` FOREIGN KEY (`productid`) REFERENCES `producttable` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (9191,1,1,'P','1',146,-1),(9191,3,1,'P','1',147,-1),(9191,2,1,'P','1',148,-1),(3131,1,1,'P','1',149,-1),(9191,2,1,'R','1',150,-1),(9191,1,1,'P','1',151,-1),(9191,3,1,'P','1',152,-1),(9191,1,1,'P','1',153,-1),(9191,2,1,'R','1',154,-1),(9191,2,10,'P','1',155,-1),(9191,1,1,'P','1',156,-1),(9191,1,10,'P','1',157,-1),(9191,1,1,'R','1',158,-1),(9191,1,10,'P','1',159,12),(3131,1,1,'R','1',160,-1),(3131,1,10,'P','1',161,13),(9191,1,10,'P','1',162,14),(9191,2,1,'P','1',163,14),(9191,3,11,'P','1',164,14),(9191,4,12,'P','1',165,14),(9191,1,1,'P','1',166,15),(9191,1,1,'P','1',167,15),(9191,1,10,'P','1',168,15),(9191,1,1,'P','1',169,16),(9191,2,1,'P','1',170,16),(9191,1,10,'P','1',171,17),(9191,1,1,'R','1',172,17),(9191,1,1,'P','1',173,18),(9191,3,1,'R','1',174,18),(9191,1,1,'P','1',175,19),(9191,3,1,'P','1',176,19),(9191,1,1,'P','1',177,22),(9191,1,1,'P','1',178,22),(9191,1,1,'P','1',179,23),(1111,1,1,'R','1',180,-1),(9191,1,1,'P','1',181,24),(9191,1,5,'P','1',182,24),(9191,4,21,'NP','1',183,-1),(1111,2,1,'P','1',184,25),(1111,2121,2,'P','1',185,25),(9191,1,4,'NP','1',186,-1),(123456,2,1,'R','1',187,-1),(123456,4444,1,'P','1',188,26);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `Serialno` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Serialno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Cloth'),(2,'Electronics'),(3,'grocery'),(4,'fo'),(5,'footwear');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imageid` int(11) NOT NULL,
  `imagepath` varchar(200) DEFAULT NULL,
  `productid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertable`
--

DROP TABLE IF EXISTS `ordertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordertable` (
  `Orderno` int(11) NOT NULL AUTO_INCREMENT,
  `Custid` int(11) NOT NULL,
  `Orderdate` date NOT NULL,
  `Addid` int(11) NOT NULL,
  `paytype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Orderno`),
  KEY `Custid` (`Custid`),
  KEY `Addid` (`Addid`),
  CONSTRAINT `ordertable_ibfk_1` FOREIGN KEY (`Custid`) REFERENCES `userdetail` (`contactno`),
  CONSTRAINT `ordertable_ibfk_2` FOREIGN KEY (`Addid`) REFERENCES `address` (`addid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertable`
--

LOCK TABLES `ordertable` WRITE;
/*!40000 ALTER TABLE `ordertable` DISABLE KEYS */;
INSERT INTO `ordertable` VALUES (6,9191,'2022-03-05',6,NULL),(7,9191,'2022-03-06',6,NULL),(8,3131,'2022-03-06',5,NULL),(9,9191,'2022-03-06',6,NULL),(10,9191,'2022-03-06',6,NULL),(11,9191,'2022-03-06',6,NULL),(12,9191,'2022-03-06',6,NULL),(13,3131,'2022-03-06',8,NULL),(14,9191,'2022-03-06',5,NULL),(15,9191,'2022-03-06',6,'cod'),(16,9191,'2022-03-06',6,'cod'),(17,9191,'2022-03-06',6,'cod'),(18,9191,'2022-03-06',6,'cod'),(19,9191,'2022-03-06',6,'cod'),(20,9191,'2022-03-06',6,'cod'),(21,9191,'2022-03-06',6,'cod'),(22,9191,'2022-03-06',6,'cod'),(23,9191,'2022-03-07',5,'banktransfer   '),(24,9191,'2022-03-09',6,'cod'),(25,1111,'2022-03-12',9,'cod'),(26,123456,'2022-03-14',10,'cod');
/*!40000 ALTER TABLE `ordertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttable`
--

DROP TABLE IF EXISTS `producttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producttable` (
  `productid` int(11) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `catogory` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `ContactNO` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `ContactNO` (`ContactNO`),
  CONSTRAINT `producttable_ibfk_1` FOREIGN KEY (`ContactNO`) REFERENCES `userdetail` (`contactno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttable`
--

LOCK TABLES `producttable` WRITE;
/*!40000 ALTER TABLE `producttable` DISABLE KEYS */;
INSERT INTO `producttable` VALUES (1,'headphone','boat','full',1000,'10','mobile accessories','headphone.jfif',1111,NULL),(2,'sunglass','rayben','full',6,'11','eyewear','Sunglasses.jfif',1111,NULL),(3,'Shoes','Nike','8',1000,'1000','footwear','shoes2.jfif',1111,NULL),(4,'Shoes','Adidas','7',1000,'12','footwear','adidasShoes.jpg',1111,NULL),(116,'T-shirt','Adidas','M',500,'100','Cloth','tshirt.webp',1111,NULL),(151,'Shoes','Adidas','7',4000,'12','footwear','adishoes.jpg',1111,NULL),(515,'iphone 13','Iphone','12.2cm',70000,'10','Electronics','iphone13.jpg',1111,NULL),(1414,'shoes','Asics','8',2000,'200','footwear','asicsShoes.jpg',1111,NULL),(2121,'Dell Laptop','dell','full',50000,'498','Electronics','dell laptop.jpg',1111,NULL),(3131,'T-shirt','Puma','M',500,'100','Cloth','pumatshirt.jpg',1111,NULL),(4141,'shoes','Asics','7',5000,'6','footwear','asicsShoes2.jpg',1111,NULL),(4444,'Hp Laptop','Hp','44cm',50000,'43','Electronics','hplaptop.jpg',1111,3),(5151,'iphone 12','iphone','12.2cm',69.999,'1000','IphoneElectronics','iphone 12.jpg',1111,NULL),(6161,'iphone 13 pro','Iphone','12.2cm',7000,'1000','Electronics','iphone 13pro.jpg',1111,NULL),(31313,'iphone X','Iphone','12inch',40000,'1000','Electronics','iphoneX.jpg',1111,NULL),(90909,'Shoes','Puma','8',2099,'99','footwear','pumaShoes.jpg',1111,NULL);
/*!40000 ALTER TABLE `producttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetail`
--

DROP TABLE IF EXISTS `userdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdetail` (
  `contactno` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `bankdetail` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `isenable` varchar(50) DEFAULT NULL,
  `logindate` date DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`contactno`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetail`
--

LOCK TABLES `userdetail` WRITE;
/*!40000 ALTER TABLE `userdetail` DISABLE KEYS */;
INSERT INTO `userdetail` VALUES (2,'22','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'employee'),(5,'5','5',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'employee'),(121,'happy','nikhil',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'employee'),(999,'nikhil','nikhil','nikhil','Rohtak','nikhilsharma3358@gmail.com','male',NULL,NULL,'1','2022-01-16','admin'),(1111,'abhi','abhi','abhi','Rohtak','nikhilsharma3358@gmail.com','male',NULL,NULL,'1','2022-01-16','employee'),(1212,'aman','nikhil','nikhil','rohtak','nikhil123','male','12345',20,'1',NULL,'employee'),(3131,'3131','3131','aman',NULL,NULL,NULL,NULL,NULL,'1',NULL,'customer'),(8888,'999','nikhil','nikhil',NULL,NULL,NULL,NULL,NULL,'1',NULL,'customer'),(9191,'nikhilsharma123@gmail.com','nikhil','Nikhil',NULL,NULL,NULL,NULL,NULL,'1',NULL,'customer'),(9999,'sumit','sumit','sumit',NULL,NULL,NULL,NULL,NULL,'1',NULL,'employee'),(22222,'rohit','rohit','rohit','Rohtak','nikhilsharma3358@gmail.com','male',NULL,NULL,'1','2022-01-16','customer'),(55555,'55555','555555',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'employee'),(123456,'naveen@gmail.com','123456','naveen',NULL,NULL,NULL,NULL,NULL,'1',NULL,'customer');
/*!40000 ALTER TABLE `userdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v1`
--

DROP TABLE IF EXISTS `v1`;
/*!50001 DROP VIEW IF EXISTS `v1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v1` (
  `contactno` int(11),
  `username` varchar(50),
  `password` varchar(50),
  `name` varchar(50),
  `address` varchar(50),
  `emailid` varchar(50),
  `gender` varchar(20),
  `bankdetail` varchar(50),
  `age` int(11),
  `isenable` varchar(50),
  `logindate` date,
  `usertype` varchar(50),
  `productid` int(11),
  `OrdQty` int(11),
  `status` varchar(50),
  `serialno` int(11),
  `product_name` varchar(50),
  `brand` varchar(50),
  `size` varchar(50),
  `rate` float,
  `Stock` varchar(50),
  `catogory` varchar(50),
  `image` varchar(50)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'onlineshopping'
--
/*!50003 DROP PROCEDURE IF EXISTS `add2Cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add2Cart`(cid int,prodid int,q int)
begin
if exists (select * from cart where customerid = cid and status = 'NP' and productid = prodid) then
begin
update cart set Quantity = Quantity + q where customerid = cid and status = 'NP' and productid = prodid;
end;
else
begin
insert into cart (Customerid,Productid,Quantity,Status,IsEnable)values(cid,prodid,q,'NP','1');
end ;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getallorderdetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `getallorderdetail`(cid int)
begin
Select a.orderno,a.orderdate, a.addid, a.custid, b.serialno as 'cartno', b.productid, b.quantity, c.*,d.*  from ordertable a, cart b, address c,producttable d where a.custid= cid  and a.orderno=b.orderno and a.addid = c.addid and b.productid = d.productid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getorderdetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `getorderdetail`(cid int)
begin
Select a.orderno,a.orderdate, a.addid, a.custid, b.serialno as 'cartno', b.productid, b.quantity, c.*,d.*  from ordertable a, cart b, address c,producttable d where a.custid= cid and a.orderno=(Select max(orderno)from ordertable where custid=cid) and a.orderno=b.orderno and a.addid = c.addid and b.productid = d.productid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `proc_order`(cid int, aid int, ptype varchar(100))
begin
insert into ordertable(custid,orderdate,addid,paytype) values(cid,curdate(),aid,ptype);

update cart set status = 'P', orderno=(select max(orderno) from ordertable) where customerid in (cid) and status='NP';

update producttable p
inner join cart c on p.productid = c.productid     
set p.quantity = p.quantity - c.quantity where c.orderno = (select max(orderno) from ordertable where custid = cid);

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v1`
--

/*!50001 DROP TABLE `v1`*/;
/*!50001 DROP VIEW IF EXISTS `v1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v1` AS select `a`.`contactno` AS `contactno`,`a`.`username` AS `username`,`a`.`password` AS `password`,`a`.`name` AS `name`,`a`.`address` AS `address`,`a`.`emailid` AS `emailid`,`a`.`gender` AS `gender`,`a`.`bankdetail` AS `bankdetail`,`a`.`age` AS `age`,`a`.`isenable` AS `isenable`,`a`.`logindate` AS `logindate`,`a`.`usertype` AS `usertype`,`b`.`productid` AS `productid`,`b`.`Quantity` AS `OrdQty`,`b`.`Status` AS `status`,`b`.`Serialno` AS `serialno`,`c`.`product_name` AS `product_name`,`c`.`brand` AS `brand`,`c`.`size` AS `size`,`c`.`rate` AS `rate`,`c`.`quantity` AS `Stock`,`c`.`catogory` AS `catogory`,`c`.`image` AS `image` from ((`userdetail` `a` join `cart` `b` on((`a`.`contactno` = `b`.`customerid`))) join `producttable` `c` on((`b`.`productid` = `c`.`productid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-21 11:47:34
