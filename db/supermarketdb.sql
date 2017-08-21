-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2017 at 06:44 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supermarketdb`
--
CREATE DATABASE IF NOT EXISTS `supermarketdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `supermarketdb`;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IName` varchar(255) NOT NULL,
  `Des` varchar(255) DEFAULT '',
  `Cost` int(11) NOT NULL,
  `Barcode` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Barcode` (`Barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Id`, `IName`, `Des`, `Cost`, `Barcode`) VALUES
(1, 'Soap', 'Lux Soap', 100, 'k001'),
(2, 'Maggi', 'Noodles', 20, 'k002');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tid` int(11) DEFAULT NULL,
  `Iid` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT '1',
  `TrolleyNo` int(11) DEFAULT NULL,
  `Paid` int(11) DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Trans_Item` (`Tid`,`Iid`),
  KEY `Iid` (`Iid`),
  KEY `TrolleyNo` (`TrolleyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`Id`, `Tid`, `Iid`, `qty`, `TrolleyNo`, `Paid`) VALUES
(1, 100, 1, 1, 1, 0),
(2, 100, 2, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `trolleys`
--

DROP TABLE IF EXISTS `trolleys`;
CREATE TABLE IF NOT EXISTS `trolleys` (
  `TrolleyNo` int(11) NOT NULL,
  `Tid` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TrolleyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trolleys`
--

INSERT INTO `trolleys` (`TrolleyNo`, `Tid`) VALUES
(1, 100);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`Iid`) REFERENCES `items` (`Id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`TrolleyNo`) REFERENCES `trolleys` (`TrolleyNo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
