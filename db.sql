-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for oms
CREATE DATABASE IF NOT EXISTS `oms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `oms`;

-- Dumping structure for table oms.buystocks
CREATE TABLE IF NOT EXISTS `buystocks` (
  `buystock_id` int(100) NOT NULL AUTO_INCREMENT,
  `clientid` varchar(100) NOT NULL,
  `instrumentid` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `buy_date` datetime NOT NULL,
  PRIMARY KEY (`buystock_id`),
  KEY `buy_stocks_ibfk_1` (`clientid`),
  KEY `buy_stocks_ibfk_2` (`instrumentid`),
  CONSTRAINT `buy_stocks_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `client` (`clientid`),
  CONSTRAINT `buy_stocks_ibfk_2` FOREIGN KEY (`instrumentid`) REFERENCES `instrument` (`instrumentid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table oms.buystocks: ~5 rows (approximately)
/*!40000 ALTER TABLE `buystocks` DISABLE KEYS */;
REPLACE INTO `buystocks` (`buystock_id`, `clientid`, `instrumentid`, `quantity`, `price`, `buy_date`) VALUES
	(3, 'DBS002', 'I002', 25, 50, '2021-09-20 11:51:08'),
	(6, 'DBS001', 'I002', 25, 100, '2021-09-20 14:26:00'),
	(11, 'DBS001', 'I004', 50, 67, '2021-09-20 15:23:25'),
	(13, 'DBS001', 'I004', 25, 67, '2021-09-20 16:16:11'),
	(15, 'DBS001', 'I003', 50, 100, '2021-09-20 16:46:49');
/*!40000 ALTER TABLE `buystocks` ENABLE KEYS */;

-- Dumping structure for table oms.client
CREATE TABLE IF NOT EXISTS `client` (
  `clientid` varchar(100) NOT NULL,
  `clientname` varchar(100) NOT NULL,
  `transactionlimit` double NOT NULL,
  `custodianid` varchar(100) NOT NULL,
  PRIMARY KEY (`clientid`),
  KEY `client_ibfk_1` (`custodianid`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`custodianid`) REFERENCES `custodian` (`custodianid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table oms.client: ~33 rows (approximately)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
REPLACE INTO `client` (`clientid`, `clientname`, `transactionlimit`, `custodianid`) VALUES
	('DBS001', 'MACQUARIE BANK LIMITED', 14000000, 'CS001'),
	('DBS002', 'LLOYDS BANK CORPORATE MARKETS PLC', 14000000, 'CS001'),
	('DBS003', 'KEYBANK NATIONAL ASSOCIATION', 18000000, 'CS001'),
	('DBS004', 'JP MORGAN SECURITIES LLC', 5000000, 'CS001'),
	('DBS005', 'JEFFERIES FINANCIAL SERVICES, INC.', 21000006, 'CS002'),
	('DBS006', 'JB DRAX HONORE UK LTD', 21000006, 'CS002'),
	('DBS007', 'J ARON & COMPANY SINGAPORE PTE', 18000006, 'CS002'),
	('DBS008', 'J ARON & COMPANY LLC', 7500003, 'CS002'),
	('DBS009', 'INTESA SANPAOLO SPA', 21000012, 'CS002'),
	('DBS010', 'ING CAPITAL MARKETS LLC', 21000012, 'CS002'),
	('DBS011', 'ICBC STANDARD BANK PLC', 18000012, 'CS002'),
	('DBS012', 'HSBC BANK USA NA', 5000004, 'CS002'),
	('DBS013', 'HSBC BANK PLC', 17500015, 'CS003'),
	('DBS014', 'GOLDMAN SACHS PARIS INC ET CIE', 28000024, 'CS003'),
	('DBS015', 'GOLDMAN SACHS MEXICO CASA DE BOLSA SA DE CV', 12000012, 'CS003'),
	('DBS016', 'GAIN GTX LLC', 12500015, 'CS003'),
	('DBS017', 'FIFTH THIRD BANK NATIONAL ASSOCIATION', 7000008, 'CS003'),
	('DBS018', 'ED&F MAN DERIVATIVE PRODUCTS INC', 28000032, 'CS003'),
	('DBS019', 'DEUTSCHE BANK AG', 12000016, 'CS003'),
	('DBS020', 'DARBY SWAP TRADING LLC', 7500012, 'CS003'),
	('DBS021', 'DANSKE BANK AS', 21000030, 'CS003'),
	('DBS022', 'CREDIT SUISSE SECURITIES EUROPE LIMITED', 35000050, 'CS003'),
	('DBS023', 'COOPERATIEVE RABOBANK UA', 12000020, 'CS003'),
	('DBS024', 'COMMONWEALTH BANK OF AUSTRALIA', 7500015, 'CS004'),
	('DBS025', 'CITIGROUP ENERGY INC', 21000036, 'CS004'),
	('DBS026', 'CITIBANK N A', 14000024, 'CS004'),
	('DBS027', 'CITADEL SECURITIES SWAP DEALER LLC', 36000072, 'CS004'),
	('DBS028', 'CARGILL INCORPORATED', 10000024, 'CS005'),
	('DBS029', 'CAPITAL ONE NATIONAL ASSOCIATION', 10500021, 'CS005'),
	('DBS030', 'CANTOR FITZGERALD SECURITIES', 21000042, 'CS005'),
	('DBS031', 'CANADIAN IMPERIAL BANK OF COMMERCE', 12000028, 'CS005'),
	('DBS032', 'BP ENERGY COMPANY', 7500021, 'CS006'),
	('DBS033', 'BOFA SECURITIES JAPAN CO LTD', 1500000, 'CS006');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Dumping structure for table oms.clientinstrument
CREATE TABLE IF NOT EXISTS `clientinstrument` (
  `clientid` varchar(100) NOT NULL,
  `instrumentid` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `clientinstrument_ibfk_1` (`clientid`),
  KEY `clientinstrument_ibfk_2` (`instrumentid`),
  CONSTRAINT `clientinstrument_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `client` (`clientid`),
  CONSTRAINT `clientinstrument_ibfk_2` FOREIGN KEY (`instrumentid`) REFERENCES `instrument` (`instrumentid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table oms.clientinstrument: ~9 rows (approximately)
/*!40000 ALTER TABLE `clientinstrument` DISABLE KEYS */;
REPLACE INTO `clientinstrument` (`clientid`, `instrumentid`, `quantity`, `id`) VALUES
	('DBS002', 'I003', 0, 1),
	('DBS001', 'I003', 50, 2),
	('DBS001', 'I001', 75, 3),
	('DBS003', 'I001', 75, 4),
	('DBS001', 'I002', 75, 5),
	('DBS003', 'I002', 25, 6),
	('DBS002', 'I004', 50, 7),
	('DBS001', 'I004', 50, 8),
	('DBS004', 'I005', 50, 9),
	('DBS001', 'I005', 50, 10);
/*!40000 ALTER TABLE `clientinstrument` ENABLE KEYS */;

-- Dumping structure for table oms.custodian
CREATE TABLE IF NOT EXISTS `custodian` (
  `custodianid` varchar(100) NOT NULL,
  `custodianname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`custodianid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table oms.custodian: ~6 rows (approximately)
/*!40000 ALTER TABLE `custodian` DISABLE KEYS */;
REPLACE INTO `custodian` (`custodianid`, `custodianname`, `password`) VALUES
	('CS001', 'BNP Paribas Securities ServicesFrance', 'root'),
	('CS002', 'The Bank of New York Mellon CorporationU.S.', 'root'),
	('CS003', 'EuroclearBelgium', 'root'),
	('CS004', 'HSBC Securities ServicesUnited Kingdom', 'root'),
	('CS005', 'Credit SuisseSwitzerland', 'root'),
	('CS006', 'Northern Trust CorporationU.S.', 'root');
/*!40000 ALTER TABLE `custodian` ENABLE KEYS */;

-- Dumping structure for procedure oms.deletebuystockrecord
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletebuystockrecord`(in buyid int)
BEGIN
	delete from buystocks where buystock_id = buyid;
END//
DELIMITER ;

-- Dumping structure for procedure oms.getbuystockid
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `getbuystockid`(out buyid int)
BEGIN
	select buystock_id into buyid from buystocks where
 	buy_date = (select max(buy_date) from buystocks);
END//
DELIMITER ;

-- Dumping structure for procedure oms.getsellstockid
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `getsellstockid`(out sellid int)
BEGIN
	select sellstock_id into sellid from sellstocks where
 	sell_date = (select max(sell_date) from sellstocks);
END//
DELIMITER ;

-- Dumping structure for procedure oms.getuniqueTransactionId
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `getuniqueTransactionId`(out tid int)
BEGIN
	select max(transactionid) into tid from transactions;
END//
DELIMITER ;

-- Dumping structure for procedure oms.insertBuyClient
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertBuyClient`(cid varchar(20),
instid varchar(20),
quant int
)
begin
  IF EXISTS (select * from clientinstrument where clientid = cid and instrumentid = instid) THEN
    update clientinstrument set quantity = quantity+quant 
	 where clientid = cid and instrumentid = instid;
  ELSE 
    insert into clientinstrument(clientid,instrumentid,quantity)
	  values (cid,instid,quant);
  END IF;
end//
DELIMITER ;

-- Dumping structure for procedure oms.insertSellClient
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSellClient`(cid varchar(20),
instid varchar(20),
quant int
)
begin
  IF EXISTS (select * from clientinstrument where clientid = cid and instrumentid = instid) THEN
    update clientinstrument set quantity = quantity-quant 
	 where clientid = cid and instrumentid = instid;
  ELSE 
    insert into clientinstrument(clientid,instrumentid,quantity)
	  values (cid,instid,quant);
  END IF;
end//
DELIMITER ;

-- Dumping structure for table oms.instrument
CREATE TABLE IF NOT EXISTS `instrument` (
  `instrumentid` varchar(50) NOT NULL,
  `instrumentname` varchar(100) NOT NULL,
  `facevalue` int(10) DEFAULT NULL,
  `expirydate` datetime DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`instrumentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table oms.instrument: ~5 rows (approximately)
/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
REPLACE INTO `instrument` (`instrumentid`, `instrumentname`, `facevalue`, `expirydate`, `quantity`) VALUES
	('I001', 'US treasury Bills', 100, '2021-09-17 09:28:12', 25),
	('I002', 'RBI-2026 -6.5%', 1000, '2021-09-17 09:28:12', 50),
	('I003', 'RBI-2045 -8%', 1000, '2021-09-17 09:28:12', 75),
	('I004', 'USDINR', 1000, '2021-09-17 09:28:12', 100),
	('I005', 'EUR USD-FUT', 1000, '2021-09-17 09:28:12', 100);
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;

-- Dumping structure for table oms.sellstocks
CREATE TABLE IF NOT EXISTS `sellstocks` (
  `sellstock_id` int(100) NOT NULL AUTO_INCREMENT,
  `clientid` varchar(100) NOT NULL,
  `instrumentid` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `sell_date` datetime NOT NULL,
  PRIMARY KEY (`sellstock_id`),
  KEY `sell_stocks_ibfk_1` (`clientid`),
  KEY `sell_stocks_ibfk_2` (`instrumentid`),
  CONSTRAINT `sell_stocks_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `client` (`clientid`),
  CONSTRAINT `sell_stocks_ibfk_2` FOREIGN KEY (`instrumentid`) REFERENCES `instrument` (`instrumentid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table oms.sellstocks: ~3 rows (approximately)
/*!40000 ALTER TABLE `sellstocks` DISABLE KEYS */;
REPLACE INTO `sellstocks` (`sellstock_id`, `clientid`, `instrumentid`, `quantity`, `price`, `sell_date`) VALUES
	(15, 'DBS001', 'I005', 25, 300, '2021-09-20 15:33:39'),
	(16, 'DBS001', 'I003', 0, 1212, '2021-09-20 15:39:42');
/*!40000 ALTER TABLE `sellstocks` ENABLE KEYS */;

-- Dumping structure for table oms.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `transactionid` int(20) NOT NULL,
  `buyer_client` varchar(100) NOT NULL,
  `seller_client` varchar(100) NOT NULL,
  `buyer_custodian` varchar(100) NOT NULL,
  `seller_custodian` varchar(100) NOT NULL,
  `instrumentid` varchar(50) NOT NULL,
  `transfer_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total_amount` double NOT NULL,
  PRIMARY KEY (`transactionid`),
  KEY `transactions_ibfk_1` (`buyer_client`),
  KEY `transactions_ibfk_2` (`seller_client`),
  KEY `transactions_ibfk_3` (`buyer_custodian`),
  KEY `transactions_ibfk_4` (`seller_custodian`),
  KEY `transactions_ibfk_5` (`instrumentid`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`buyer_client`) REFERENCES `client` (`clientid`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`seller_client`) REFERENCES `client` (`clientid`),
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`buyer_custodian`) REFERENCES `custodian` (`custodianid`),
  CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`seller_custodian`) REFERENCES `custodian` (`custodianid`),
  CONSTRAINT `transactions_ibfk_5` FOREIGN KEY (`instrumentid`) REFERENCES `instrument` (`instrumentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table oms.transactions: ~11 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
REPLACE INTO `transactions` (`transactionid`, `buyer_client`, `seller_client`, `buyer_custodian`, `seller_custodian`, `instrumentid`, `transfer_date`, `quantity`, `price`, `total_amount`) VALUES
	(0, 'DBS002', 'DBS001', 'CS001', 'CS001', 'I004', '2021-09-20 12:09:02', 75, 200, 15000),
	(1, 'DBS002', 'DBS001', 'CS001', 'CS001', 'I003', '2021-09-20 12:10:09', 25, 100, 2500),
	(2, 'DBS001', 'DBS001', 'CS001', 'CS001', 'I003', '2021-09-20 12:14:44', 50, 20, 1000),
	(3, 'DBS002', 'DBS001', 'CS001', 'CS001', 'I003', '2021-09-20 14:27:42', 25, 100, 2500),
	(4, 'DBS002', 'DBS001', 'CS001', 'CS001', 'I003', '2021-09-20 15:16:26', 75, 100, 7500),
	(5, 'DBS001', 'DBS002', 'CS001', 'CS001', 'I003', '2021-09-20 15:18:40', 100, 20, 2000),
	(6, 'DBS001', 'DBS003', 'CS001', 'CS001', 'I001', '2021-09-20 15:20:13', 75, 20, 1500),
	(7, 'DBS001', 'DBS003', 'CS001', 'CS001', 'I002', '2021-09-20 15:20:28', 50, 20, 1000),
	(8, 'DBS002', 'DBS001', 'CS001', 'CS001', 'I004', '2021-09-20 15:25:00', 50, 67, 3350),
	(9, 'DBS001', 'DBS003', 'CS001', 'CS001', 'I002', '2021-09-20 16:18:49', 25, 20, 500),
	(10, 'DBS004', 'DBS001', 'CS001', 'CS001', 'I005', '2021-09-20 16:51:10', 50, 300, 15000);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for procedure oms.updatebuyersrecord
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatebuyersrecord`(in buyid int, in buyquantity int)
BEGIN
	update buystocks set quantity = buyquantity where buystock_id = buyid;
END//
DELIMITER ;

-- Dumping structure for procedure oms.updatesellrecord
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatesellrecord`(in sellid int, in sellquantity int)
BEGIN
	update sellstocks set quantity = sellquantity where sellstock_id = sellid;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
