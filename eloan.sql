CREATE DATABASE IF NOT EXISTS `eloan`;
USE `eloan`;

-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: eloan
-- ------------------------------------------------------

--
-- Table structure for table `approvedloan`
--
DROP TABLE IF EXISTS `approvedloan`;
DROP TABLE IF EXISTS `loaninfo`;

--
-- Table structure for table `loaninfo`
--
CREATE TABLE `loaninfo` (
  `applno` varchar(6) NOT NULL,
  `purpose` varchar(45) NOT NULL,
  `amtrequest` int NOT NULL,
  `doa` varchar(45) NOT NULL,
  `bstructure` varchar(45) NOT NULL,
  `bindicator` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'PENDING',
  PRIMARY KEY (`applno`),
  UNIQUE KEY `idloaninfo_UNIQUE` (`applno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `approvedloan` (
  `applno` varchar(6) NOT NULL,
  `amotsanctioned` int NOT NULL,
  `loanterm` int unsigned NOT NULL,
  `psd` varchar(45) NOT NULL,
  `lcd` varchar(45) NOT NULL,
  `termpayment` decimal(10,0) NOT NULL,
  `emi` decimal(10,0) NOT NULL,
  UNIQUE KEY `applno_UNIQUE` (`applno`),
  CONSTRAINT `applno` FOREIGN KEY (`applno`) REFERENCES `loaninfo` (`applno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `user`
--
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(8) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `iduser_UNIQUE` (`userid`),
  UNIQUE KEY `usercol_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `mobilenum_UNIQUE` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
