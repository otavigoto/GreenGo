CREATE DATABASE  IF NOT EXISTS `physisbd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `physisbd`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: physisbd
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `class_cons`
--

DROP TABLE IF EXISTS `class_cons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_cons` (
  `id_class_cons` int NOT NULL AUTO_INCREMENT,
  `id_classificação` int DEFAULT NULL,
  `id_consumo` int DEFAULT NULL,
  PRIMARY KEY (`id_class_cons`),
  KEY `id_classificação` (`id_classificação`),
  KEY `id_consumo` (`id_consumo`),
  CONSTRAINT `class_cons_ibfk_1` FOREIGN KEY (`id_classificação`) REFERENCES `classificacao` (`id_classificacao`),
  CONSTRAINT `class_cons_ibfk_2` FOREIGN KEY (`id_consumo`) REFERENCES `consumo` (`id_consumo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_cons`
--

LOCK TABLES `class_cons` WRITE;
/*!40000 ALTER TABLE `class_cons` DISABLE KEYS */;
INSERT INTO `class_cons` VALUES (7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `class_cons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificacao`
--

DROP TABLE IF EXISTS `classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificacao` (
  `id_classificacao` int NOT NULL AUTO_INCREMENT,
  `indice_agua` int DEFAULT NULL,
  `indice_energia` int DEFAULT NULL,
  `indice_lixo` int DEFAULT NULL,
  `indice_transporte` int DEFAULT NULL,
  `indice_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_classificacao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao`
--

LOCK TABLES `classificacao` WRITE;
/*!40000 ALTER TABLE `classificacao` DISABLE KEYS */;
INSERT INTO `classificacao` VALUES (7,1,1,1,1,1.00),(8,3,1,3,2,2.25),(9,2,1,3,2,2.00),(10,2,3,2,2,2.25);
/*!40000 ALTER TABLE `classificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo`
--

DROP TABLE IF EXISTS `consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo` (
  `id_consumo` int NOT NULL AUTO_INCREMENT,
  `lixo_reciclavel_kg` decimal(10,2) DEFAULT NULL,
  `lixo_nao_reciclavel_kg` decimal(10,2) DEFAULT NULL,
  `agua_litros` decimal(10,2) DEFAULT NULL,
  `energia_kwh` decimal(10,2) DEFAULT NULL,
  `tipo_transporte` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_consumo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo`
--

LOCK TABLES `consumo` WRITE;
/*!40000 ALTER TABLE `consumo` DISABLE KEYS */;
INSERT INTO `consumo` VALUES (7,1.00,1000.00,110000.00,10000.00,'1'),(8,101.00,100.00,15.00,15.00,'2'),(9,10.00,1.00,150.00,150.00,'2'),(10,50.00,50.00,150.00,1.00,'2');
/*!40000 ALTER TABLE `consumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indice`
--

DROP TABLE IF EXISTS `indice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indice` (
  `id_indice` int NOT NULL AUTO_INCREMENT,
  `id_classificacao` int DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_indice`),
  KEY `id_classificação` (`id_classificacao`),
  KEY `cpf` (`cpf`),
  CONSTRAINT `indice_ibfk_1` FOREIGN KEY (`id_classificacao`) REFERENCES `classificacao` (`id_classificacao`),
  CONSTRAINT `indice_ibfk_2` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indice`
--

LOCK TABLES `indice` WRITE;
/*!40000 ALTER TABLE `indice` DISABLE KEYS */;
INSERT INTO `indice` VALUES (7,7,'02293115046'),(8,8,'02293115046'),(9,9,'02293115046'),(10,10,'02293115046');
/*!40000 ALTER TABLE `indice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(14) NOT NULL,
  `id_consumo` int NOT NULL,
  `data_consumo` date NOT NULL,
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (7,'02293115046',7,'2025-05-16'),(8,'02293115046',8,'2025-05-17'),(9,'02293115046',9,'2025-05-18'),(10,'02293115046',10,'2025-05-19');
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cpf` varchar(14) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('02293115046','Otávio Augusto Antunes Marquez','otavio2912@gmail.com','pcrscm','2005-12-29'),('02393115046','Otávio Augusto Antunes Marquez','juju2912@gmail.com','yzyzihmhrx','2005-12-29'),('12345678910','Otávio Augusto','teste@gmail.com','qdfgtcih','2000-02-09');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-19  9:34:01
