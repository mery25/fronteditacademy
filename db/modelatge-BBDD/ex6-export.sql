-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `adreça`
--

DROP TABLE IF EXISTS `adreça`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adreça` (
  `id_adreça` int NOT NULL AUTO_INCREMENT,
  `carrer` varchar(45) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `pis` varchar(45) DEFAULT NULL,
  `porta` varchar(45) DEFAULT NULL,
  `ciutat` varchar(45) DEFAULT NULL,
  `codi_postal` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_adreça`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adreça`
--

LOCK TABLES `adreça` WRITE;
/*!40000 ALTER TABLE `adreça` DISABLE KEYS */;
INSERT INTO `adreça` VALUES (1,'Lleida',1,'1','B','Barcelona','08001','Espanya'),(2,'Sta Carme',2,'3','3','Igualada','08700','Espanya'),(3,'Aribau',12,'2','A','Barcelona','08002','Espanya'),(4,'Odena',5,'0','B','Igualada','08700','Espanya'),(5,'Sant Antoni Abat',26,'6','C','Barcelona','08020','Espanya');
/*!40000 ALTER TABLE `adreça` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `data_registre` datetime DEFAULT CURRENT_TIMESTAMP,
  `correu_electronic` varchar(45) DEFAULT NULL,
  `id_client_recomanacio` int DEFAULT NULL,
  `id_adreça` int NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `fk_client_client1_idx` (`id_client_recomanacio`),
  KEY `fk_client_adreça1_idx` (`id_adreça`),
  CONSTRAINT `fk_client_adreça1` FOREIGN KEY (`id_adreça`) REFERENCES `adreça` (`id_adreça`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_client_client1` FOREIGN KEY (`id_client_recomanacio`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Carolina','938033456','2020-07-13 22:43:48','carol@gmail.com',NULL,3),(2,'Ramon','607789654','2020-07-13 22:43:48','rmt@gmail.com',1,4),(3,'Roser','677123456','2020-07-13 22:43:48','rus12@gmail.com',2,5),(4,'Carolina','938033456','2020-07-13 22:43:48','carol@gmail.com',NULL,3),(5,'Ramon','607789654','2020-07-13 22:43:48','rmt@gmail.com',1,4),(6,'Roser','677123456','2020-07-13 22:43:48','rus12@gmail.com',2,5);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `id_proveidor` int NOT NULL,
  PRIMARY KEY (`id_marca`),
  KEY `fk_marca_proveidor1_idx` (`id_proveidor`),
  CONSTRAINT `fk_marca_proveidor1` FOREIGN KEY (`id_proveidor`) REFERENCES `proveidor` (`id_proveidor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Ray ban',1),(2,'Ralph Lauren',2),(3,'Nike',2);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidor`
--

DROP TABLE IF EXISTS `proveidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidor` (
  `id_proveidor` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `nif` varchar(45) DEFAULT NULL,
  `id_adreça` int NOT NULL,
  PRIMARY KEY (`id_proveidor`),
  KEY `fk_proveidor_adreça1_idx` (`id_adreça`),
  CONSTRAINT `fk_proveidor_adreça1` FOREIGN KEY (`id_adreça`) REFERENCES `adreça` (`id_adreça`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidor`
--

LOCK TABLES `proveidor` WRITE;
/*!40000 ALTER TABLE `proveidor` DISABLE KEYS */;
INSERT INTO `proveidor` VALUES (1,'monica','6000000','2232343','47111111X',1),(2,'andorrana','6000001','2232343','51111111Y',2);
/*!40000 ALTER TABLE `proveidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `id_ulleres` int NOT NULL AUTO_INCREMENT,
  `graduacio_esquerre` varchar(45) DEFAULT NULL,
  `graduacio_dret` varchar(45) DEFAULT NULL,
  `tipus_muntura` varchar(45) DEFAULT NULL,
  `color_muntura` varchar(45) DEFAULT NULL,
  `color_vidre_esquerre` varchar(45) DEFAULT NULL,
  `color_vidre_dret` varchar(45) DEFAULT NULL,
  `preu` decimal(10,0) DEFAULT NULL,
  `id_marca` int NOT NULL,
  `empleat_compra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ulleres`),
  KEY `fk_ulleres_marca1_idx` (`id_marca`),
  CONSTRAINT `fk_ulleres_marca1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
INSERT INTO `ulleres` VALUES (1,'– 1 +075 70° Ad 225','– 125 +075 135° Ad 225','completa','blau','blanc','blanc',300,1,'Anna'),(2,'– 1 +075 70° Ad 225','– 125 +075 135° Ad 225','invisible','rosa','blanc','blanc',150,2,'Carles'),(3,'– 1 +075 70° Ad 225','– 125 +075 135° Ad 225','parcial inferior','vermell','groc','groc',80,3,NULL),(4,'– 1 +075 70° Ad 225','– 125 +075 135° Ad 225','parcial superior','negre','blanc','blanc',120,3,'Josep'),(5,'– 1 +075 70° Ad 225','– 125 +075 135° Ad 225','parcial superior','negre','blanc','blanc',120,3,'Josep');
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-13 22:51:32
