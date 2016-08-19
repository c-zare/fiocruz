-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: producao
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `armazem_armazem`
--

DROP TABLE IF EXISTS `armazem_armazem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `armazem_armazem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `endereco` varchar(40) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `complemento` varchar(40) DEFAULT NULL,
  `localizador` varchar(10) NOT NULL,
  `criado` datetime NOT NULL,
  `atualizado` datetime NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `armazem_armazem_abfe0f96` (`usuario_id`),
  CONSTRAINT `armazem_armazem_usuario_id_47ce4d48_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armazem_armazem`
--

LOCK TABLES `armazem_armazem` WRITE;
/*!40000 ALTER TABLE `armazem_armazem` DISABLE KEYS */;
INSERT INTO `armazem_armazem` VALUES (1,'FIOCRUZ MS','Rua Gabriel Abrão','92','Não há','L001','2016-07-29 18:50:22','2016-08-01 20:04:20',3),(2,'FIOCRUZ RJ','Av Brasil','4365','N/A','L001','2016-08-10 18:43:21','2016-08-10 18:43:21',3);
/*!40000 ALTER TABLE `armazem_armazem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add armazem',7,'add_armazem'),(20,'Can change armazem',7,'change_armazem'),(21,'Can delete armazem',7,'delete_armazem'),(22,'Pode Administrar',7,'pode_administrar'),(23,'Can add estado',8,'add_estado'),(24,'Can change estado',8,'change_estado'),(25,'Can delete estado',8,'delete_estado'),(26,'Can add municipio',9,'add_municipio'),(27,'Can change municipio',9,'change_municipio'),(28,'Can delete municipio',9,'delete_municipio'),(29,'Can add fornecedor',10,'add_fornecedor'),(30,'Can change fornecedor',10,'change_fornecedor'),(31,'Can delete fornecedor',10,'delete_fornecedor'),(32,'Pode Administrar',10,'pode_administrar'),(33,'Can add item',11,'add_item'),(34,'Can change item',11,'change_item'),(35,'Can delete item',11,'delete_item'),(36,'Pode Administrar',11,'pode_administrar'),(37,'Can add itemcompra',12,'add_itemcompra'),(38,'Can change itemcompra',12,'change_itemcompra'),(39,'Can delete itemcompra',12,'delete_itemcompra'),(40,'Pode Administrar',12,'pode_administrar'),(41,'Can add compra',13,'add_compra'),(42,'Can change compra',13,'change_compra'),(43,'Can delete compra',13,'delete_compra'),(44,'Pode Administrar',13,'pode_administrar');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$VmyS8ArgTQXz$DD5BnKtIVagxTPsl0VL+TGM2u/3eRRuxD/Ef3RY3MCc=','2016-08-19 12:18:14',1,'admin','Administrador','Administrador','admin@matogrossodosul.fiocruz.br',1,1,'2016-07-20 16:30:56'),(2,'pbkdf2_sha256$24000$wshnIBVPgWHz$dZPcMJf4WXju5Ns+C6HZpxVPqEhCx8OAGU5QROq963U=','2016-08-12 18:20:14',0,'usuario','Usuário','Usuário','usuario@matogrossodosul.fiocruz.br',0,1,'2016-07-20 16:31:33'),(3,'pbkdf2_sha256$24000$aq6EpV0KAKe6$RTVLqngfDet4eq1xDSrDtWaJhWAU331cWLXvrfeu2UE=','2016-08-19 16:18:16',0,'master','Master','Master','master@matogrossodosul.fiocruz.br',0,1,'2016-07-20 16:31:56');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (3,3,22),(1,3,32),(2,3,36),(4,3,44);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_compra`
--

DROP TABLE IF EXISTS `compra_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_compra` date NOT NULL,
  `data_entrega` date NOT NULL,
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `situacao` tinyint(1) NOT NULL,
  `nota` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compra_compra_abfe0f96` (`usuario_id`),
  CONSTRAINT `compra_compra_usuario_id_978e855e_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_compra`
--

LOCK TABLES `compra_compra` WRITE;
/*!40000 ALTER TABLE `compra_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_compra_item_compra`
--

DROP TABLE IF EXISTS `compra_compra_item_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_compra_item_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compra_id` int(11) NOT NULL,
  `itemcompra_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `compra_compra_item_compra_compra_id_3dd4165b_uniq` (`compra_id`,`itemcompra_id`),
  KEY `compra_compra_ite_itemcompra_id_7e8467b2_fk_compra_itemcompra_id` (`itemcompra_id`),
  CONSTRAINT `compra_compra_ite_itemcompra_id_7e8467b2_fk_compra_itemcompra_id` FOREIGN KEY (`itemcompra_id`) REFERENCES `compra_itemcompra` (`id`),
  CONSTRAINT `compra_compra_item_compra_compra_id_ed685b68_fk_compra_compra_id` FOREIGN KEY (`compra_id`) REFERENCES `compra_compra` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_compra_item_compra`
--

LOCK TABLES `compra_compra_item_compra` WRITE;
/*!40000 ALTER TABLE `compra_compra_item_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_compra_item_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_itemcompra`
--

DROP TABLE IF EXISTS `compra_itemcompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_itemcompra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) NOT NULL,
  `custo` decimal(10,2) NOT NULL,
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compra_itemco_fornecedor_id_75fb471a_fk_fornecedor_fornecedor_id` (`fornecedor_id`),
  KEY `compra_itemcompra_item_id_6d9a99fc_fk_item_item_id` (`item_id`),
  KEY `compra_itemcompra_usuario_id_170783e6_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `compra_itemco_fornecedor_id_75fb471a_fk_fornecedor_fornecedor_id` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor_fornecedor` (`id`),
  CONSTRAINT `compra_itemcompra_item_id_6d9a99fc_fk_item_item_id` FOREIGN KEY (`item_id`) REFERENCES `item_item` (`id`),
  CONSTRAINT `compra_itemcompra_usuario_id_170783e6_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_itemcompra`
--

LOCK TABLES `compra_itemcompra` WRITE;
/*!40000 ALTER TABLE `compra_itemcompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_itemcompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_estado`
--

DROP TABLE IF EXISTS `core_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(2) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `criado` datetime NOT NULL,
  `atualizado` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_estado`
--

LOCK TABLES `core_estado` WRITE;
/*!40000 ALTER TABLE `core_estado` DISABLE KEYS */;
INSERT INTO `core_estado` VALUES (1,'AC','Acre','2016-07-21 10:03:57','2016-07-21 10:03:57'),(2,'AL','Alagoas','2016-07-21 10:04:07','2016-07-21 10:04:07'),(3,'AP','Amapá','2016-07-21 10:04:19','2016-07-21 10:04:19'),(4,'AM','Amazonas','2016-07-21 10:04:30','2016-07-21 10:04:30'),(5,'BA','Bahia','2016-07-21 10:04:38','2016-07-21 10:04:38'),(6,'CE','Ceará','2016-07-21 10:05:05','2016-07-21 10:05:05'),(7,'DF','Distrito Federal','2016-07-21 10:05:15','2016-07-21 10:05:15'),(8,'GO','Goiás','2016-07-21 10:05:43','2016-07-21 10:05:43'),(9,'MA','Maranhão','2016-07-21 10:06:08','2016-07-21 10:06:08'),(10,'MT','Mato Grosso','2016-07-21 10:06:17','2016-07-21 10:06:17'),(11,'MS','Mato Grosso do Sul','2016-07-21 10:06:26','2016-07-21 10:06:26'),(12,'MG','Minas Gerais','2016-07-21 10:06:38','2016-07-21 10:06:38'),(13,'PA','Pará','2016-07-21 10:06:52','2016-07-21 10:06:52'),(14,'PB','Paraíba','2016-07-21 10:07:02','2016-07-21 10:07:02'),(15,'PR','Paraná','2016-07-21 10:07:12','2016-07-21 10:07:12'),(16,'PE','Pernambuco','2016-07-21 10:07:25','2016-07-21 10:07:25'),(17,'PI','Piauí','2016-07-21 10:07:40','2016-07-21 10:07:40'),(18,'RJ','Rio de Janeiro','2016-07-21 10:07:50','2016-07-21 10:07:50'),(19,'RN','Rio Grande do Norte','2016-07-21 10:08:10','2016-07-21 10:08:10'),(20,'RS','Rio Grande do Sul','2016-07-21 10:08:18','2016-07-21 10:08:18'),(21,'RO','Rondônia','2016-07-21 10:08:31','2016-07-21 10:10:38'),(22,'RR','Roraima','2016-07-21 10:08:38','2016-07-21 10:08:38'),(23,'SC','Santa Catarina','2016-07-21 10:08:53','2016-07-21 10:08:53'),(24,'SP','São Paulo','2016-07-21 10:09:03','2016-07-21 10:09:03'),(25,'SE','Sergipe','2016-07-21 10:09:12','2016-07-21 10:09:12'),(26,'TO','Tocantins','2016-07-21 10:09:23','2016-07-21 10:09:23');
/*!40000 ALTER TABLE `core_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_municipio`
--

DROP TABLE IF EXISTS `core_municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `criado` datetime NOT NULL,
  `atualizado` datetime NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_municipio_estado_id_8d07bbda_fk_core_estado_id` (`estado_id`),
  CONSTRAINT `core_municipio_estado_id_8d07bbda_fk_core_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `core_estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_municipio`
--

LOCK TABLES `core_municipio` WRITE;
/*!40000 ALTER TABLE `core_municipio` DISABLE KEYS */;
INSERT INTO `core_municipio` VALUES (1,'Água Clara','2016-07-21 10:14:10','2016-07-21 10:14:10',11),(2,'Alcinópolis','2016-07-21 10:18:06','2016-07-21 10:18:06',11),(3,'Amambai','2016-07-21 10:18:18','2016-07-21 10:18:18',11),(4,'Anastácio','2016-07-21 10:18:26','2016-07-21 10:18:26',11),(5,'Anaurilândia','2016-07-21 10:18:36','2016-07-21 10:18:36',11),(6,'Angélica','2016-07-21 10:18:43','2016-07-21 10:18:43',11),(7,'Antônio João','2016-07-21 10:18:54','2016-07-21 10:18:54',11),(8,'Aparecida do Taboado','2016-07-21 10:19:09','2016-07-21 10:19:09',11),(9,'Aquidauana','2016-07-21 10:19:21','2016-07-21 10:19:21',11),(10,'Aral Moreira','2016-07-21 10:19:29','2016-07-21 10:19:29',11),(11,'Bandeirantes','2016-07-21 10:19:38','2016-07-21 10:19:38',11),(12,'Bataguassu','2016-07-21 10:19:49','2016-07-21 10:19:49',11),(13,'Batayporã','2016-07-21 10:20:01','2016-07-21 10:20:01',11),(14,'Bela Vista','2016-07-21 10:20:10','2016-07-21 10:20:10',11),(15,'Bodoquena','2016-07-21 10:20:44','2016-07-21 10:20:44',11),(16,'Bonito','2016-07-21 10:20:50','2016-07-21 10:20:50',11),(17,'Brasilândia','2016-07-21 10:20:59','2016-07-21 10:20:59',11),(18,'Caarapó','2016-07-21 10:21:07','2016-07-21 10:21:07',11),(19,'Camapuã','2016-07-21 10:21:16','2016-07-21 10:21:16',11),(20,'Campo Grande','2016-07-21 10:21:25','2016-07-21 10:21:25',11),(21,'Caracol','2016-07-21 10:21:32','2016-07-21 10:21:32',11),(22,'Cassilândia','2016-07-21 10:21:43','2016-07-21 10:21:43',11),(23,'Chapadão do Sul','2016-07-21 10:21:53','2016-07-21 10:21:53',11),(24,'Corguinho','2016-07-21 10:22:02','2016-07-21 10:22:02',11),(25,'Coronel Sapucaia','2016-07-21 10:22:10','2016-07-21 10:22:10',11),(26,'Corumbá','2016-07-21 10:22:16','2016-07-21 10:22:16',11),(27,'Costa Rica','2016-07-21 10:22:22','2016-07-21 10:22:22',11),(28,'Coxim','2016-07-21 10:22:27','2016-07-21 10:22:27',11),(29,'Deodápolis','2016-07-21 10:22:36','2016-07-21 10:22:36',11),(30,'Dois Irmãos do Buriti','2016-07-21 10:22:53','2016-07-21 10:22:53',11),(31,'Douradina','2016-07-21 10:23:12','2016-07-21 10:23:12',11),(32,'Dourados','2016-07-21 10:23:19','2016-07-21 10:23:19',11),(33,'Eldorado','2016-07-21 10:23:26','2016-07-21 10:23:26',11),(34,'Fátima do Sul','2016-07-21 10:23:34','2016-07-21 10:23:34',11),(35,'Figueirão','2016-07-21 10:23:41','2016-07-21 10:23:41',11),(36,'Glória de Dourados','2016-07-21 10:23:51','2016-07-21 10:23:51',11),(37,'Guia Lopes da Laguna','2016-07-21 10:24:02','2016-07-21 10:24:02',11),(38,'Iguatemi','2016-07-21 10:24:10','2016-07-21 10:24:10',11),(39,'Inocência','2016-07-21 10:24:16','2016-07-21 10:24:16',11),(40,'Itaporã','2016-07-21 10:24:25','2016-07-21 10:24:25',11),(41,'Itaquiraí','2016-07-21 10:24:39','2016-07-21 10:24:39',11),(42,'Ivinhema','2016-07-21 10:24:50','2016-07-21 10:24:50',11),(43,'Japorã','2016-07-21 10:24:59','2016-07-21 10:24:59',11),(44,'Jaraguari','2016-07-21 10:25:07','2016-07-21 10:25:07',11),(45,'Jardim','2016-07-21 10:25:11','2016-07-21 10:25:11',11),(46,'Jateí','2016-07-21 10:25:21','2016-07-21 10:25:21',11),(47,'Juti','2016-07-21 10:25:27','2016-07-21 10:25:27',11),(48,'Ladário','2016-07-21 10:25:35','2016-07-21 10:25:35',11),(49,'Laguna Carapã','2016-07-21 10:25:42','2016-07-21 10:25:42',11),(50,'Maracaju','2016-07-21 10:25:50','2016-07-21 10:25:50',11),(51,'Miranda','2016-07-21 10:25:55','2016-07-21 10:25:55',11),(52,'Mundo Novo','2016-07-21 10:26:01','2016-07-21 10:26:01',11),(53,'Naviraí','2016-07-21 10:26:10','2016-07-21 10:26:10',11),(54,'Nioaque','2016-07-21 10:26:20','2016-07-21 10:26:20',11),(55,'Nova Alvorada do Sul','2016-07-21 10:26:48','2016-07-21 10:26:48',11),(56,'Nova Andradina','2016-07-21 10:26:56','2016-07-21 10:26:56',11),(57,'Novo Horizonte do Sul','2016-07-21 10:27:06','2016-07-21 10:27:06',11),(58,'Paraíso das Águias','2016-07-21 10:27:20','2016-07-21 10:27:20',11),(59,'Paranaíba','2016-07-21 10:27:34','2016-07-21 10:27:34',11),(60,'Paranhos','2016-07-21 10:27:38','2016-07-21 10:27:38',11),(61,'Pedro Gomes','2016-07-21 10:27:44','2016-07-21 10:27:44',11),(62,'Ponta Porã','2016-07-21 10:27:52','2016-07-21 10:27:52',11),(63,'Porto Murtinho','2016-07-21 10:28:00','2016-07-21 10:28:00',11),(64,'Ribas do Rio Pardo','2016-07-21 10:28:10','2016-07-21 10:28:10',11),(65,'Rio Brilhante','2016-07-21 10:28:27','2016-07-21 10:28:27',11),(66,'Rio Negro','2016-07-21 10:28:34','2016-07-21 10:28:34',11),(67,'Rio Verde de Mato Grosso','2016-07-21 10:28:44','2016-07-21 10:28:44',11),(68,'Rochedo','2016-07-21 10:28:51','2016-07-21 10:28:51',11),(69,'Santa Rita do Pardo','2016-07-21 10:29:04','2016-07-21 10:29:04',11),(70,'São Gabriel do Oeste','2016-07-21 10:29:14','2016-07-21 10:29:14',11),(71,'Selviria','2016-07-21 10:29:23','2016-07-21 10:29:23',11),(72,'Sete Quedas','2016-07-21 10:29:29','2016-07-21 10:29:29',11),(73,'Sidrolândia','2016-07-21 10:29:37','2016-07-21 10:29:37',11),(74,'Sonora','2016-07-21 10:29:44','2016-07-21 10:29:44',11),(75,'Tacuru','2016-07-21 10:29:50','2016-07-21 10:29:50',11),(76,'Taquarussu','2016-07-21 10:29:58','2016-07-21 10:29:58',11),(77,'Terenos','2016-07-21 10:30:06','2016-07-21 10:30:06',11),(78,'Três Lagoas','2016-07-21 10:30:12','2016-07-21 10:30:12',11),(79,'Vicentina','2016-07-21 10:30:18','2016-07-21 10:30:18',11),(80,'Acrelandia','2016-08-03 18:13:00','2016-08-03 18:13:00',1),(81,'Assis Brasil','2016-08-03 18:16:22','2016-08-03 18:16:22',1),(82,'Brasiléia','2016-08-03 18:16:31','2016-08-03 18:16:31',1),(83,'Bujari','2016-08-03 18:16:38','2016-08-03 18:16:38',1),(84,'Capixaba','2016-08-03 18:16:48','2016-08-03 18:16:48',1),(85,'Cruzeiro do Sul','2016-08-03 18:16:58','2016-08-03 18:16:58',1),(86,'Epitaciolândia','2016-08-03 18:17:13','2016-08-03 18:17:13',1),(87,'Feijo','2016-08-03 18:17:20','2016-08-03 18:17:20',1),(88,'Jordão','2016-08-03 18:17:27','2016-08-03 18:17:27',1),(89,'Mâncio Lima','2016-08-03 18:17:36','2016-08-03 18:17:36',1),(90,'Manoel Urbano','2016-08-03 18:17:45','2016-08-03 18:17:45',1),(91,'Marechal Thaumaturgo','2016-08-03 18:17:59','2016-08-03 18:17:59',1),(92,'Plácido de Castro','2016-08-03 18:18:10','2016-08-03 18:18:10',1),(93,'Porto Acre','2016-08-03 18:18:18','2016-08-03 18:18:18',1),(94,'Porto Walter','2016-08-03 18:18:25','2016-08-03 18:18:25',1),(95,'Rio Branco','2016-08-03 18:18:35','2016-08-03 18:18:35',1),(96,'Rodrigues Alves','2016-08-03 18:18:44','2016-08-03 18:18:44',1),(97,'Santa Rosa do Purus','2016-08-03 18:18:56','2016-08-03 18:18:56',1),(98,'Sena Madureira','2016-08-03 18:19:05','2016-08-03 18:19:05',1),(99,'Senador Guiomard','2016-08-03 18:19:14','2016-08-03 18:19:14',1),(100,'Tarauacá','2016-08-03 18:19:22','2016-08-03 18:19:22',1),(101,'Xupuri','2016-08-03 18:19:31','2016-08-03 18:19:31',1),(102,'Brasília','2016-08-03 18:22:30','2016-08-03 18:22:30',7),(103,'Água Branca','2016-08-03 18:25:59','2016-08-03 18:27:22',2),(104,'Anadia','2016-08-03 18:28:11','2016-08-03 18:28:11',2),(105,'Arapiraca','2016-08-03 18:28:23','2016-08-03 18:28:23',2),(106,'Atalaia','2016-08-03 18:28:34','2016-08-03 18:28:34',2),(107,'Barra de Santo Antônio','2016-08-03 18:28:46','2016-08-03 18:28:46',2),(108,'Barra de São Miguel','2016-08-03 18:28:58','2016-08-03 18:28:58',2),(109,'Batalha','2016-08-03 18:29:07','2016-08-03 18:29:07',2),(110,'Belém','2016-08-03 18:29:14','2016-08-03 18:29:14',2),(111,'Belo Monte','2016-08-03 18:29:20','2016-08-03 18:29:20',2),(112,'Boca da Mata','2016-08-03 18:29:28','2016-08-03 18:29:28',2),(113,'Branquinha','2016-08-03 18:29:36','2016-08-03 18:29:36',2),(114,'Cacimbinhas','2016-08-03 18:29:45','2016-08-03 18:29:45',2),(115,'Cajueiro','2016-08-03 18:29:54','2016-08-03 18:29:54',2),(116,'Campestre','2016-08-03 18:30:01','2016-08-03 18:30:01',2),(117,'Campo Alegre','2016-08-03 18:30:10','2016-08-03 18:30:10',2),(118,'Campo Grande','2016-08-03 18:30:21','2016-08-03 18:30:21',2),(119,'Canapi','2016-08-03 18:30:38','2016-08-03 18:30:38',2),(120,'Capela','2016-08-03 18:30:45','2016-08-03 18:30:45',2),(121,'Carneiros','2016-08-03 18:30:52','2016-08-03 18:30:52',2),(122,'Chã Preta','2016-08-03 18:31:00','2016-08-03 18:31:00',2),(123,'Coité do Nóia','2016-08-03 18:31:14','2016-08-03 18:31:14',2),(124,'Colônia Leopoldina','2016-08-03 18:31:25','2016-08-03 18:31:25',2),(125,'Coqueiro Seco','2016-08-03 18:31:33','2016-08-03 18:31:33',2),(126,'Coruripe','2016-08-03 18:32:00','2016-08-03 18:32:00',2),(127,'Craíbas','2016-08-03 18:32:10','2016-08-03 18:32:10',2),(128,'Delmiro Gouveia','2016-08-03 18:32:23','2016-08-03 18:32:23',2),(129,'Dois Riachos','2016-08-03 18:32:30','2016-08-03 18:32:30',2),(130,'Estrela de Alagoas','2016-08-03 18:32:42','2016-08-03 18:32:42',2),(131,'Feira Grande','2016-08-03 18:32:51','2016-08-03 18:32:51',2),(132,'Feliz Deserto','2016-08-03 18:33:01','2016-08-03 18:33:01',2),(133,'Flexeiras','2016-08-03 18:33:11','2016-08-03 18:33:11',2),(134,'Girau do Ponciano','2016-08-03 18:33:22','2016-08-03 18:33:22',2),(135,'Ibateguara','2016-08-03 18:33:32','2016-08-03 18:33:32',2),(136,'Igaci','2016-08-03 18:33:40','2016-08-03 18:33:40',2),(137,'Igreja Nova','2016-08-03 18:33:49','2016-08-03 18:33:49',2),(138,'Inhapi','2016-08-03 18:33:58','2016-08-03 18:33:58',2),(139,'Jacaré dos Homens','2016-08-03 18:34:09','2016-08-03 18:34:09',2),(140,'Jacuípe','2016-08-03 18:34:19','2016-08-03 18:34:19',2),(141,'Japaratinga','2016-08-03 18:34:32','2016-08-03 18:34:32',2),(142,'Japamataia','2016-08-03 18:34:39','2016-08-03 18:34:39',2),(143,'Jequiá da Praia','2016-08-03 18:34:51','2016-08-03 18:34:51',2),(144,'Joaquim Gomes','2016-08-03 18:35:00','2016-08-03 18:35:00',2),(145,'Jundiá','2016-08-03 18:35:06','2016-08-03 18:35:06',2),(146,'Junqueiro','2016-08-03 18:35:11','2016-08-03 18:35:11',2),(147,'Lagoa da Canoa','2016-08-03 18:35:25','2016-08-03 18:35:25',2),(148,'Limoeiro de Anadia','2016-08-03 18:35:37','2016-08-03 18:35:37',2),(149,'Maceió','2016-08-03 18:35:46','2016-08-03 18:35:46',2),(150,'Major Isidoro','2016-08-03 18:35:55','2016-08-03 18:35:55',2),(151,'Mar Vermelho','2016-08-03 18:36:04','2016-08-03 18:36:04',2),(152,'Maragogi','2016-08-03 18:36:15','2016-08-03 18:36:15',2),(153,'Maravilha','2016-08-03 18:36:23','2016-08-03 18:36:23',2),(154,'Marechal Deodoro','2016-08-03 18:36:33','2016-08-03 18:36:33',2),(155,'Maribondo','2016-08-03 18:36:43','2016-08-03 18:36:43',2),(156,'Mata Grande','2016-08-03 18:36:52','2016-08-03 18:36:52',2),(157,'Matriz de Camaragibe','2016-08-03 18:37:04','2016-08-03 18:37:04',2),(158,'Messias','2016-08-03 18:37:12','2016-08-03 18:37:12',2),(159,'Minador do Negrão','2016-08-03 18:37:21','2016-08-03 18:37:21',2),(160,'Monteirópolis','2016-08-03 18:37:33','2016-08-03 18:37:33',2),(161,'Murici','2016-08-03 18:37:40','2016-08-03 18:37:40',2),(162,'Novo Lino','2016-08-03 18:38:02','2016-08-03 18:38:02',2),(163,'Olho d Ágia das Flores','2016-08-03 18:38:22','2016-08-03 18:46:26',2),(164,'Olho d Água do Casado','2016-08-03 18:38:31','2016-08-03 18:46:57',2),(165,'Olho d Água Grande','2016-08-03 18:38:37','2016-08-03 18:47:24',2),(166,'Olivença','2016-08-03 18:38:54','2016-08-03 18:38:54',2),(167,'Ouro branco','2016-08-03 18:39:04','2016-08-03 18:39:04',2),(168,'Palestina','2016-08-03 18:39:13','2016-08-03 18:39:13',2),(169,'Palmeira dos Índios','2016-08-03 18:39:26','2016-08-03 18:39:26',2),(170,'Pão de Açucar','2016-08-03 18:39:37','2016-08-03 18:39:37',2),(171,'Pariconha','2016-08-03 18:39:46','2016-08-03 18:39:46',2),(172,'Paripueira','2016-08-03 18:39:59','2016-08-03 18:39:59',2),(173,'Passo de Camaragibe','2016-08-03 18:40:12','2016-08-03 18:40:12',2),(174,'Paulo Jacinto','2016-08-03 18:40:22','2016-08-03 18:40:22',2),(175,'Penedo','2016-08-03 18:40:29','2016-08-03 18:40:29',2),(176,'Piaçabuçu','2016-08-03 18:40:45','2016-08-03 18:40:45',2),(177,'Pilar','2016-08-03 18:40:52','2016-08-03 18:40:52',2),(178,'Pindoba','2016-08-03 18:40:59','2016-08-03 18:40:59',2),(179,'Piranhas','2016-08-03 18:41:06','2016-08-03 18:41:06',2),(180,'Poço das Trincheiras','2016-08-03 18:41:18','2016-08-03 18:41:18',2),(181,'Porto Calvo','2016-08-03 18:41:27','2016-08-03 18:41:27',2),(182,'Porto de Pedras','2016-08-03 18:41:35','2016-08-03 18:41:35',2),(183,'Porto Real do Colégio','2016-08-03 18:41:47','2016-08-03 18:41:47',2),(184,'Quebrangulo','2016-08-03 18:41:59','2016-08-03 18:41:59',2),(185,'Rio Largo','2016-08-03 18:42:06','2016-08-03 18:42:06',2),(186,'Roteiro','2016-08-03 18:42:11','2016-08-03 18:42:11',2),(187,'Santa Luzia do Norte','2016-08-03 18:42:27','2016-08-03 18:42:27',2),(188,'Santana do Ipanema','2016-08-03 18:42:38','2016-08-03 18:42:38',2),(189,'Santana do Mundaú','2016-08-03 18:42:47','2016-08-03 18:42:47',2),(190,'São Brás','2016-08-03 18:42:55','2016-08-03 18:42:55',2),(191,'São José da Laje','2016-08-03 18:43:05','2016-08-03 18:43:05',2),(192,'São José da Tapera','2016-08-03 18:43:11','2016-08-03 18:43:11',2),(193,'São Luís do Quitunde','2016-08-03 18:43:26','2016-08-03 18:43:26',2),(194,'São Miguel dos Campos','2016-08-03 18:43:35','2016-08-03 18:43:35',2),(195,'São Miguel dos Milagres','2016-08-03 18:43:42','2016-08-03 18:43:42',2),(196,'São Sebastião','2016-08-03 18:43:52','2016-08-03 18:43:52',2),(197,'Satuba','2016-08-03 18:43:58','2016-08-03 18:43:58',2),(198,'Senador Rui Palmeira','2016-08-03 18:44:15','2016-08-03 18:44:15',2),(199,'Tanque d Arca','2016-08-03 18:44:26','2016-08-03 18:44:26',2),(200,'Taquarana','2016-08-03 18:44:36','2016-08-03 18:44:36',2),(201,'Teotônio Vilela','2016-08-03 18:44:46','2016-08-03 18:44:46',2),(202,'União dos Palmares','2016-08-03 18:44:56','2016-08-03 18:44:56',2),(203,'Viçosa','2016-08-03 18:45:04','2016-08-03 18:45:04',2);
/*!40000 ALTER TABLE `core_municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-07-20 16:31:33','2','usuario',1,'Adicionado.',4,1),(2,'2016-07-20 16:31:56','3','master',1,'Adicionado.',4,1),(3,'2016-07-20 16:32:30','3','master',2,'Modificado user_permissions.',4,1),(4,'2016-07-20 16:33:31','3','master',2,'Modificado first_name, last_name e email.',4,1),(5,'2016-07-20 16:33:55','2','usuario',2,'Modificado first_name, last_name e email.',4,1),(6,'2016-07-21 09:37:58','1','admin',2,'Modificado first_name e last_name.',4,1),(7,'2016-08-02 16:31:45','3','master',2,'Modificado password.',4,1),(8,'2016-08-19 12:30:08','3','master',2,'Modificado user_permissions.',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'armazem','armazem'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'compra','compra'),(12,'compra','itemcompra'),(5,'contenttypes','contenttype'),(8,'core','estado'),(9,'core','municipio'),(10,'fornecedor','fornecedor'),(11,'item','item'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-07-20 16:26:20'),(2,'auth','0001_initial','2016-07-20 16:26:28'),(3,'admin','0001_initial','2016-07-20 16:26:29'),(4,'admin','0002_logentry_remove_auto_add','2016-07-20 16:26:30'),(5,'armazem','0001_initial','2016-07-20 16:26:31'),(6,'armazem','0002_auto_20160705_1022','2016-07-20 16:26:37'),(7,'armazem','0003_auto_20160706_1516','2016-07-20 16:26:37'),(8,'armazem','0004_auto_20160711_1442','2016-07-20 16:26:38'),(9,'contenttypes','0002_remove_content_type_name','2016-07-20 16:26:39'),(10,'auth','0002_alter_permission_name_max_length','2016-07-20 16:26:40'),(11,'auth','0003_alter_user_email_max_length','2016-07-20 16:26:41'),(12,'auth','0004_alter_user_username_opts','2016-07-20 16:26:41'),(13,'auth','0005_alter_user_last_login_null','2016-07-20 16:26:41'),(14,'auth','0006_require_contenttypes_0002','2016-07-20 16:26:42'),(15,'auth','0007_alter_validators_add_error_messages','2016-07-20 16:26:42'),(16,'core','0001_initial','2016-07-20 16:26:42'),(17,'core','0002_delete_estado','2016-07-20 16:26:42'),(18,'core','0003_estado','2016-07-20 16:26:42'),(19,'core','0004_auto_20160609_1322','2016-07-20 16:26:43'),(20,'core','0005_municipio','2016-07-20 16:26:44'),(21,'core','0006_auto_20160706_1512','2016-07-20 16:26:44'),(22,'core','0007_auto_20160706_1513','2016-07-20 16:26:44'),(23,'fornecedor','0001_initial','2016-07-20 16:26:45'),(24,'fornecedor','0002_auto_20160608_1542','2016-07-20 16:26:52'),(25,'fornecedor','0003_fornecedor_situacao','2016-07-20 16:26:53'),(26,'fornecedor','0004_auto_20160608_1558','2016-07-20 16:26:53'),(27,'fornecedor','0005_auto_20160609_1322','2016-07-20 16:26:55'),(28,'fornecedor','0006_auto_20160609_1839','2016-07-20 16:26:57'),(29,'fornecedor','0007_fornecedor_usuario','2016-07-20 16:26:58'),(30,'fornecedor','0008_auto_20160706_1544','2016-07-20 16:26:59'),(31,'fornecedor','0009_auto_20160711_1439','2016-07-20 16:26:59'),(32,'fornecedor','0010_auto_20160711_1442','2016-07-20 16:27:00'),(33,'item','0001_initial','2016-07-20 16:27:00'),(34,'item','0002_item_usuario','2016-07-20 16:27:02'),(35,'item','0003_auto_20160706_1545','2016-07-20 16:27:02'),(36,'sessions','0001_initial','2016-07-20 16:27:04'),(37,'fornecedor','0011_fornecedor_bairro','2016-08-03 12:39:49'),(38,'item','0004_item_armazem','2016-08-10 18:40:21'),(39,'item','0005_item_fornecedor','2016-08-11 11:28:28'),(40,'item','0006_item_estoque_minimo','2016-08-11 12:15:48'),(41,'item','0007_auto_20160811_1009','2016-08-11 13:09:59'),(42,'item','0008_auto_20160811_1039','2016-08-11 13:40:10'),(43,'item','0009_auto_20160811_1106','2016-08-11 14:07:02'),(44,'fornecedor','0012_auto_20160811_1326','2016-08-11 16:26:48'),(45,'armazem','0005_auto_20160811_1337','2016-08-11 16:37:54'),(46,'fornecedor','0013_fornecedor_email','2016-08-12 16:17:53'),(47,'fornecedor','0014_auto_20160812_1323','2016-08-12 16:23:36'),(48,'fornecedor','0015_auto_20160812_1503','2016-08-12 18:03:37'),(49,'compra','0001_initial','2016-08-18 18:33:06'),(50,'compra','0002_compra_estoque','2016-08-19 13:05:53'),(51,'compra','0003_auto_20160819_1021','2016-08-19 13:21:50'),(52,'compra','0004_auto_20160819_1248','2016-08-19 15:48:25'),(53,'compra','0005_auto_20160819_1256','2016-08-19 15:56:23');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1u2jci4ttofljglg8f7ss1wmdmbl2war','NDM3ZTFmNzNmNmY3ZDczOTE5NWQzZTBhNWZiMDVmMjNmMjg0MmI3Njp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MTExNjVlMjlkZmJkYjYxYjZjYTk3OTg0ZDY1YjBmZGJiODFhZjg0In0=','2016-08-31 11:40:20'),('5lmys74muamiphx3btvty1qqwbgr0gk7','NDM3ZTFmNzNmNmY3ZDczOTE5NWQzZTBhNWZiMDVmMjNmMjg0MmI3Njp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MTExNjVlMjlkZmJkYjYxYjZjYTk3OTg0ZDY1YjBmZGJiODFhZjg0In0=','2016-08-30 12:08:38'),('whksw2pz86nulljpmkm33kngfx1y5r0z','ODE2MzMxMzQwMTIwYjc0ZWU1NjBmMGVjMjVhOWUyMDY3MzUwNzc1YTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjU1MjZiNGFmZWE0MmYyMmIxYmQwYTU0NmVmOTI2Yjc5MmIyYzk3In0=','2016-08-04 10:35:37');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_fornecedor`
--

DROP TABLE IF EXISTS `fornecedor_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor_fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razaosocial` varchar(80) NOT NULL,
  `nomefantasia` varchar(40) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `atividade` varchar(20) NOT NULL,
  `endereco` varchar(40) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `complemento` varchar(40) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `contato` varchar(40) NOT NULL,
  `criado` datetime NOT NULL,
  `atualizado` datetime NOT NULL,
  `cidade_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `situacao` tinyint(1) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fornecedor_fornecedor_estado_id_cc29b1e6_uniq` (`estado_id`),
  KEY `fornecedor_fornecedor_cidade_id_f55ba7fa_uniq` (`cidade_id`),
  KEY `fornecedor_fornecedor_abfe0f96` (`usuario_id`),
  CONSTRAINT `fornecedor_fornecedor_cidade_id_f55ba7fa_fk_core_municipio_id` FOREIGN KEY (`cidade_id`) REFERENCES `core_municipio` (`id`),
  CONSTRAINT `fornecedor_fornecedor_estado_id_cc29b1e6_fk_core_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `core_estado` (`id`),
  CONSTRAINT `fornecedor_fornecedor_usuario_id_0c6232f8_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_fornecedor`
--

LOCK TABLES `fornecedor_fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor_fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor_fornecedor` VALUES (1,'Zilioto Indústria, Atacado, Comércio e Representações Ltda','ZORNIMAT','15491434000109','CNAE 4789007','Rua Quatorze de Julho','931','Loja','79004391','(67) 3025-7272','Marcio Rodrigues','2016-07-21 10:34:45','2016-08-12 18:04:00',20,11,1,3,'Vila Glória','contato@zornimat.com.br'),(2,'Suprimaq Equipamentos Para Escritorio Eireli','SUPRIMAC','15569643000128','CNAE 4789007','Rua 14 de Julho','446','Loja','79004392','(67) 33223200','Fernando Gonçalves','2016-08-12 11:06:30','2016-08-19 11:45:46',20,11,1,3,'Jardim Alvorada','suprimac@suprimac.com.br');
/*!40000 ALTER TABLE `fornecedor_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_item`
--

DROP TABLE IF EXISTS `item_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `estoque` int(11) NOT NULL,
  `criado` datetime NOT NULL,
  `atualizado` datetime NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `armazem_id` int(11) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `estoque_minimo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_item_abfe0f96` (`usuario_id`),
  KEY `item_item_3234dc18` (`armazem_id`),
  KEY `item_item_0074dfda` (`fornecedor_id`),
  CONSTRAINT `item_item_armazem_id_6fbf1c0f_fk_armazem_armazem_id` FOREIGN KEY (`armazem_id`) REFERENCES `armazem_armazem` (`id`),
  CONSTRAINT `item_item_fornecedor_id_b849e10b_fk_fornecedor_fornecedor_id` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor_fornecedor` (`id`),
  CONSTRAINT `item_item_usuario_id_69c4918c_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_item`
--

LOCK TABLES `item_item` WRITE;
/*!40000 ALTER TABLE `item_item` DISABLE KEYS */;
INSERT INTO `item_item` VALUES (1,'Caneta cor Preta',22,'2016-07-29 18:49:43','2016-08-12 16:40:05',3,1,2,1),(3,'Lápis preto 2B',0,'2016-08-11 16:42:54','2016-08-11 16:42:54',3,1,1,1),(6,'Cadeira Padrão',5,'2016-08-12 11:07:16','2016-08-12 12:35:08',3,1,1,1);
/*!40000 ALTER TABLE `item_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'producao'
--

--
-- Dumping routines for database 'producao'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-19 13:22:42
