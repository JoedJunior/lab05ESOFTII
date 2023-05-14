CREATE DATABASE  IF NOT EXISTS `sistemaeleitoral` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistemaeleitoral`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemaeleitoral
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `candidato`
--

DROP TABLE IF EXISTS `candidato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato` (
  `idCandidato` int NOT NULL AUTO_INCREMENT,
  `nomeCompleto` varchar(50) NOT NULL,
  `nomePartido` varchar(30) NOT NULL,
  PRIMARY KEY (`idCandidato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleitor`
--

DROP TABLE IF EXISTS `eleitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eleitor` (
  `idEleitor` int NOT NULL AUTO_INCREMENT,
  `nomeCompleto` varchar(50) NOT NULL,
  `numeroBI` char(14) NOT NULL,
  `dataNascimento` date NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `situacaoEleitoral` enum('regular','suspenso') DEFAULT (_utf8mb4'regular'),
  PRIMARY KEY (`idEleitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleitor`
--

LOCK TABLES `eleitor` WRITE;
/*!40000 ALTER TABLE `eleitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `eleitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `idPartido` int NOT NULL AUTO_INCREMENT,
  `nomePartido` varchar(30) NOT NULL,
  `siglaPatido` varchar(8) DEFAULT NULL,
  `presidentePartido` varchar(50) NOT NULL,
  PRIMARY KEY (`idPartido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voto`
--

DROP TABLE IF EXISTS `voto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voto` (
  `idVoto` int NOT NULL AUTO_INCREMENT,
  `idEleitor` int DEFAULT NULL,
  `idCandidato` int DEFAULT NULL,
  `dataVoto` datetime NOT NULL,
  `observacao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idVoto`),
  KEY `idEleitor` (`idEleitor`),
  KEY `idCandidato` (`idCandidato`),
  CONSTRAINT `voto_ibfk_1` FOREIGN KEY (`idEleitor`) REFERENCES `eleitor` (`idEleitor`),
  CONSTRAINT `voto_ibfk_2` FOREIGN KEY (`idCandidato`) REFERENCES `candidato` (`idCandidato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voto`
--

LOCK TABLES `voto` WRITE;
/*!40000 ALTER TABLE `voto` DISABLE KEYS */;
/*!40000 ALTER TABLE `voto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-04 19:53:26
