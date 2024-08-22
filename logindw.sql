-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: logindw
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `tb_auditoria`
--

DROP TABLE IF EXISTS `tb_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_auditoria` (
  `id_auditoria` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usu` int(11) DEFAULT NULL,
  `fecha_evento` datetime DEFAULT NULL,
  `inicio_sesion` enum('exitoso','fallido') DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`),
  KEY `cod_usu` (`cod_usu`),
  CONSTRAINT `tb_auditoria_ibfk_1` FOREIGN KEY (`cod_usu`) REFERENCES `tb_usuario` (`cod_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_auditoria`
--

LOCK TABLES `tb_auditoria` WRITE;
/*!40000 ALTER TABLE `tb_auditoria` DISABLE KEYS */;
INSERT INTO `tb_auditoria` VALUES (1,1,'2024-08-19 06:58:14','fallido'),(2,4,'2024-08-19 06:59:20','exitoso'),(3,2,'2024-08-19 06:59:46','fallido'),(4,2,'2024-08-19 06:59:55','exitoso'),(5,7,'2024-08-19 07:03:09','fallido'),(6,7,'2024-08-19 07:03:32','fallido'),(7,7,'2024-08-19 07:03:56','fallido'),(8,7,'2024-08-19 07:08:02','exitoso'),(9,1,'2024-08-19 14:03:34','exitoso'),(10,1,'2024-08-19 14:03:53','fallido'),(11,3,'2024-08-19 14:04:14','fallido'),(12,3,'2024-08-19 14:04:26','fallido'),(13,3,'2024-08-19 14:07:22','exitoso'),(14,2,'2024-08-19 14:07:48','exitoso'),(15,1,'2024-08-19 14:12:17','exitoso'),(16,1,'2024-08-19 14:13:48','exitoso'),(17,1,'2024-08-19 14:17:07','exitoso'),(18,3,'2024-08-19 14:20:53','exitoso'),(19,2,'2024-08-19 14:23:08','exitoso'),(20,2,'2024-08-19 14:26:27','exitoso'),(21,3,'2024-08-19 14:32:48','fallido'),(22,3,'2024-08-19 14:32:56','exitoso'),(23,1,'2024-08-19 14:37:37','exitoso'),(24,1,'2024-08-19 14:43:15','exitoso'),(25,3,'2024-08-19 14:44:33','exitoso'),(26,2,'2024-08-19 14:44:52','exitoso'),(27,1,'2024-08-19 14:48:44','exitoso'),(28,1,'2024-08-19 14:49:35','exitoso'),(29,1,'2024-08-19 14:53:17','exitoso'),(30,1,'2024-08-19 17:14:55','exitoso'),(31,1,'2024-08-19 17:15:04','exitoso'),(32,1,'2024-08-19 17:16:07','exitoso'),(33,1,'2024-08-19 17:25:32','exitoso'),(34,1,'2024-08-19 17:35:47','exitoso'),(35,1,'2024-08-19 17:42:20','exitoso'),(36,1,'2024-08-19 17:44:26','exitoso'),(37,1,'2024-08-19 17:46:03','exitoso'),(38,1,'2024-08-19 17:47:26','exitoso'),(39,2,'2024-08-19 17:51:57','exitoso'),(40,2,'2024-08-19 17:52:14','exitoso'),(41,2,'2024-08-19 17:53:02','exitoso'),(42,2,'2024-08-19 17:53:38','exitoso'),(43,2,'2024-08-19 17:56:28','exitoso'),(44,3,'2024-08-19 17:57:24','fallido'),(45,3,'2024-08-19 17:57:41','exitoso'),(46,3,'2024-08-19 17:58:22','exitoso'),(47,1,'2024-08-19 18:00:24','exitoso'),(48,1,'2024-08-19 18:09:00','exitoso'),(49,1,'2024-08-19 18:09:48','exitoso'),(50,1,'2024-08-19 18:10:21','exitoso'),(51,1,'2024-08-19 18:10:59','exitoso'),(52,1,'2024-08-19 18:11:28','exitoso'),(53,1,'2024-08-19 18:14:21','exitoso'),(54,1,'2024-08-19 18:16:31','exitoso'),(55,1,'2024-08-19 18:19:20','exitoso'),(56,1,'2024-08-19 18:22:02','exitoso'),(57,3,'2024-08-19 18:22:21','exitoso'),(58,2,'2024-08-19 18:22:52','exitoso'),(59,1,'2024-08-19 18:23:50','fallido'),(60,1,'2024-08-19 18:23:56','fallido'),(61,1,'2024-08-19 18:24:00','fallido'),(62,1,'2024-08-19 18:24:27','exitoso'),(63,1,'2024-08-19 18:26:13','fallido'),(64,1,'2024-08-19 18:26:42','exitoso'),(65,1,'2024-08-19 18:30:31','exitoso'),(66,3,'2024-08-19 18:31:29','exitoso'),(67,1,'2024-08-19 21:46:20','exitoso'),(68,3,'2024-08-19 21:48:30','fallido'),(69,3,'2024-08-19 21:48:38','exitoso'),(70,2,'2024-08-19 21:49:54','exitoso'),(71,1,'2024-08-19 21:51:48','fallido'),(72,1,'2024-08-19 21:52:41','exitoso'),(73,1,'2024-08-19 21:54:17','exitoso'),(74,1,'2024-08-19 21:56:27','exitoso'),(75,1,'2024-08-19 21:57:02','exitoso'),(76,3,'2024-08-19 21:57:14','exitoso'),(77,1,'2024-08-19 21:58:06','exitoso'),(78,1,'2024-08-19 21:59:51','exitoso');
/*!40000 ALTER TABLE `tb_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_credenciales`
--

DROP TABLE IF EXISTS `tb_credenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_credenciales` (
  `DNI` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `usuarme` varchar(50) DEFAULT NULL,
  `gmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE KEY `usuarme` (`usuarme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_credenciales`
--

LOCK TABLES `tb_credenciales` WRITE;
/*!40000 ALTER TABLE `tb_credenciales` DISABLE KEYS */;
INSERT INTO `tb_credenciales` VALUES ('43977571','Nicole Zambrano','nicole','nicole@utp.edu.pe'),('53058721','Daniel Rojas','daniel','daniel@utp.edu.pe'),('72651951','Juan Pérez','admin','jperez@admi.com'),('74985023','John Mendez','john','john@utp.edu.pe'),('76329177','Tatiana González','tatiana','tatiana@utp.edu.pe'),('83726549','Miguel Flores','miguel','miguel@utp.edu.pe'),('84031954','Elias Caseres','elias','elias@utp.edu.pe'),('95275526','Alejandro Martín','Alejandro','a_martin@utp.edu.pe');
/*!40000 ALTER TABLE `tb_credenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rol`
--

DROP TABLE IF EXISTS `tb_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rol` (
  `idrol` int(11) NOT NULL,
  `tipo_rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rol`
--

LOCK TABLES `tb_rol` WRITE;
/*!40000 ALTER TABLE `tb_rol` DISABLE KEYS */;
INSERT INTO `tb_rol` VALUES (1,'Administrador'),(2,'Docente'),(3,'Estudiante');
/*!40000 ALTER TABLE `tb_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `cod_usu` int(11) NOT NULL AUTO_INCREMENT,
  `usuarme` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cod_usu`),
  KEY `usuarme` (`usuarme`),
  KEY `idrol` (`idrol`),
  CONSTRAINT `tb_usuario_ibfk_1` FOREIGN KEY (`usuarme`) REFERENCES `tb_credenciales` (`usuarme`),
  CONSTRAINT `tb_usuario_ibfk_2` FOREIGN KEY (`idrol`) REFERENCES `tb_rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'admin','$2y$10$ljCyy92.hwTw4d0WlRIvsOBtDZuF6EKzKVRpsUJxHV4BmSHH8AKTG',1,'activo'),(2,'Alejandro','$2y$10$X7cZYDAlXpeb0.tigXc6Butv/DBpwXna3nSUaF0phGrO2hItRvBx6',2,'Activo'),(3,'elias','$2y$10$yk/V4rmf2zfKxjSyPq9sSOBjb45fk8/wuSfwkLKHuPLR91qG.4rL6',3,'activo'),(4,'john','$2y$10$kA70sOjqk1Tt7inJH7PO6elz.4bo8WrmJ7NlQTblXUxo.3cpGVQFq',3,'Activo'),(5,'nicole','$2y$10$UQyEGPxuRRbyjpN.nx2BWOTb32WizP0QgG1y45d9L5buKzFyujGg.',3,'Activo'),(6,'miguel','$2y$10$W.Z1wb8ffuG/yaBYucdkGeIQ95xZNpdmBkNIuo2xnFqAvOFw8tFKi',2,'Activo'),(7,'tatiana','$2y$10$TrQy5cCuole/.4spl5QPMeNYU2dbsJd4vyN.cl0mc4GEVxEoG4miq',3,'Activo'),(8,'daniel','$2y$10$/lU.cJDzi6elqI5RIib7/OflkBo6YgHQ0diDCZSdA8eUB3HIVJIY6',3,'Activo');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 22:00:29
