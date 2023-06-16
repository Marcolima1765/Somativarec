-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: formativahogwarts
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `emprestimo_livro`
--

DROP TABLE IF EXISTS `emprestimo_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo_livro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `aluno` bigint NOT NULL,
  `funcionario` bigint NOT NULL,
  `data_comeco_devolucao` date NOT NULL,
  `data_fim_devolucao` date NOT NULL,
  `data_real_devolucao` date DEFAULT NULL,
  `livro_fk` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno` (`aluno`),
  KEY `funcionario` (`funcionario`),
  KEY `livro_fk` (`livro_fk`),
  CONSTRAINT `emprestimo_livro_ibfk_1` FOREIGN KEY (`aluno`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `emprestimo_livro_ibfk_2` FOREIGN KEY (`funcionario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `emprestimo_livro_ibfk_3` FOREIGN KEY (`livro_fk`) REFERENCES `livros` (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo_livro`
--

LOCK TABLES `emprestimo_livro` WRITE;
/*!40000 ALTER TABLE `emprestimo_livro` DISABLE KEYS */;
INSERT INTO `emprestimo_livro` VALUES (1,1,2,'2020-07-23','2023-08-23','2023-09-10',2),(2,3,4,'2023-10-01','2023-11-01',NULL,1);
/*!40000 ALTER TABLE `emprestimo_livro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-15 23:17:33
