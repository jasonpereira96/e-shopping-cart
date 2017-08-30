-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2017 at 05:41 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Id`, `IName`, `Des`, `Cost`, `Barcode`) VALUES
(1, 'My Soap', 'Lux Soap', 40, 'k001'),
(2, 'Maggi', 'Noodles', 20, 'k002'),
(3, 'Bread', 'White Bread', 35, 'k003'),
(4, 'Tropicana', 'Orange Juice', 20, 'k004'),
(6, 'Oreo', 'Chocolate Biscuit', 60, 'k005');

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
  UNIQUE KEY `My_Uni_Key` (`Iid`,`Tid`,`TrolleyNo`),
  KEY `Iid` (`Iid`),
  KEY `TrolleyNo` (`TrolleyNo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`Id`, `Tid`, `Iid`, `qty`, `TrolleyNo`, `Paid`) VALUES
(1, 100, 4, 3, 3, 0),
(11, 100, 4, 2, 2, 0),
(12, 102, 4, 2, 1, 1),
(13, 103, 6, 1, 1, 1),
(14, 103, 1, 3, 1, 1),
(15, 103, 3, 1, 1, 1),
(16, 103, 2, 1, 1, 1),
(17, 104, 1, 2, 1, 0);

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
(1, 104),
(2, 100),
(3, 100);

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
