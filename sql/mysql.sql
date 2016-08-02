-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: producao
-- ------------------------------------------------------
-- Server version	5.5.50-0+deb8u1

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
INSERT INTO `armazem_armazem` VALUES (1,'FIOCRUZ MS','Rua Gabriel Abrão','92','Não há','L001','2016-07-29 18:50:22','2016-08-01 20:04:20',3);
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
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add armazem',7,'add_armazem'),(20,'Can change armazem',7,'change_armazem'),(21,'Can delete armazem',7,'delete_armazem'),(22,'Pode Administrar',7,'pode_administrar'),(23,'Can add estado',8,'add_estado'),(24,'Can change estado',8,'change_estado'),(25,'Can delete estado',8,'delete_estado'),(26,'Can add municipio',9,'add_municipio'),(27,'Can change municipio',9,'change_municipio'),(28,'Can delete municipio',9,'delete_municipio'),(29,'Can add fornecedor',10,'add_fornecedor'),(30,'Can change fornecedor',10,'change_fornecedor'),(31,'Can delete fornecedor',10,'delete_fornecedor'),(32,'Pode Administrar',10,'pode_administrar'),(33,'Can add item',11,'add_item'),(34,'Can change item',11,'change_item'),(35,'Can delete item',11,'delete_item'),(36,'Pode Administrar',11,'pode_administrar');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$VmyS8ArgTQXz$DD5BnKtIVagxTPsl0VL+TGM2u/3eRRuxD/Ef3RY3MCc=','2016-08-01 19:57:23',1,'admin','Administrador','Administrador','admin@matogrossodosul.fiocruz.br',1,1,'2016-07-20 16:30:56'),(2,'pbkdf2_sha256$24000$wshnIBVPgWHz$dZPcMJf4WXju5Ns+C6HZpxVPqEhCx8OAGU5QROq963U=','2016-08-02 12:50:24',0,'usuario','Usuário','Usuário','usuario@matogrossodosul.fiocruz.br',0,1,'2016-07-20 16:31:33'),(3,'pbkdf2_sha256$24000$mZ8kdn3yNKgj$zOITOSpaVGQOvuxtsVMCM2dTGEnlb8Olk9CsQZIL9g8=','2016-08-02 12:50:43',0,'master','Master','Master','master@matogrossodosul.fiocruz.br',0,1,'2016-07-20 16:31:56');
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
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (3,3,22),(1,3,32),(2,3,36);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_municipio`
--

LOCK TABLES `core_municipio` WRITE;
/*!40000 ALTER TABLE `core_municipio` DISABLE KEYS */;
INSERT INTO `core_municipio` VALUES (1,'Água Clara','2016-07-21 10:14:10','2016-07-21 10:14:10',11),(2,'Alcinópolis','2016-07-21 10:18:06','2016-07-21 10:18:06',11),(3,'Amambai','2016-07-21 10:18:18','2016-07-21 10:18:18',11),(4,'Anastácio','2016-07-21 10:18:26','2016-07-21 10:18:26',11),(5,'Anaurilândia','2016-07-21 10:18:36','2016-07-21 10:18:36',11),(6,'Angélica','2016-07-21 10:18:43','2016-07-21 10:18:43',11),(7,'Antônio João','2016-07-21 10:18:54','2016-07-21 10:18:54',11),(8,'Aparecida do Taboado','2016-07-21 10:19:09','2016-07-21 10:19:09',11),(9,'Aquidauana','2016-07-21 10:19:21','2016-07-21 10:19:21',11),(10,'Aral Moreira','2016-07-21 10:19:29','2016-07-21 10:19:29',11),(11,'Bandeirantes','2016-07-21 10:19:38','2016-07-21 10:19:38',11),(12,'Bataguassu','2016-07-21 10:19:49','2016-07-21 10:19:49',11),(13,'Batayporã','2016-07-21 10:20:01','2016-07-21 10:20:01',11),(14,'Bela Vista','2016-07-21 10:20:10','2016-07-21 10:20:10',11),(15,'Bodoquena','2016-07-21 10:20:44','2016-07-21 10:20:44',11),(16,'Bonito','2016-07-21 10:20:50','2016-07-21 10:20:50',11),(17,'Brasilândia','2016-07-21 10:20:59','2016-07-21 10:20:59',11),(18,'Caarapó','2016-07-21 10:21:07','2016-07-21 10:21:07',11),(19,'Camapuã','2016-07-21 10:21:16','2016-07-21 10:21:16',11),(20,'Campo Grande','2016-07-21 10:21:25','2016-07-21 10:21:25',11),(21,'Caracol','2016-07-21 10:21:32','2016-07-21 10:21:32',11),(22,'Cassilândia','2016-07-21 10:21:43','2016-07-21 10:21:43',11),(23,'Chapadão do Sul','2016-07-21 10:21:53','2016-07-21 10:21:53',11),(24,'Corguinho','2016-07-21 10:22:02','2016-07-21 10:22:02',11),(25,'Coronel Sapucaia','2016-07-21 10:22:10','2016-07-21 10:22:10',11),(26,'Corumbá','2016-07-21 10:22:16','2016-07-21 10:22:16',11),(27,'Costa Rica','2016-07-21 10:22:22','2016-07-21 10:22:22',11),(28,'Coxim','2016-07-21 10:22:27','2016-07-21 10:22:27',11),(29,'Deodápolis','2016-07-21 10:22:36','2016-07-21 10:22:36',11),(30,'Dois Irmãos do Buriti','2016-07-21 10:22:53','2016-07-21 10:22:53',11),(31,'Douradina','2016-07-21 10:23:12','2016-07-21 10:23:12',11),(32,'Dourados','2016-07-21 10:23:19','2016-07-21 10:23:19',11),(33,'Eldorado','2016-07-21 10:23:26','2016-07-21 10:23:26',11),(34,'Fátima do Sul','2016-07-21 10:23:34','2016-07-21 10:23:34',11),(35,'Figueirão','2016-07-21 10:23:41','2016-07-21 10:23:41',11),(36,'Glória de Dourados','2016-07-21 10:23:51','2016-07-21 10:23:51',11),(37,'Guia Lopes da Laguna','2016-07-21 10:24:02','2016-07-21 10:24:02',11),(38,'Iguatemi','2016-07-21 10:24:10','2016-07-21 10:24:10',11),(39,'Inocência','2016-07-21 10:24:16','2016-07-21 10:24:16',11),(40,'Itaporã','2016-07-21 10:24:25','2016-07-21 10:24:25',11),(41,'Itaquiraí','2016-07-21 10:24:39','2016-07-21 10:24:39',11),(42,'Ivinhema','2016-07-21 10:24:50','2016-07-21 10:24:50',11),(43,'Japorã','2016-07-21 10:24:59','2016-07-21 10:24:59',11),(44,'Jaraguari','2016-07-21 10:25:07','2016-07-21 10:25:07',11),(45,'Jardim','2016-07-21 10:25:11','2016-07-21 10:25:11',11),(46,'Jateí','2016-07-21 10:25:21','2016-07-21 10:25:21',11),(47,'Juti','2016-07-21 10:25:27','2016-07-21 10:25:27',11),(48,'Ladário','2016-07-21 10:25:35','2016-07-21 10:25:35',11),(49,'Laguna Carapã','2016-07-21 10:25:42','2016-07-21 10:25:42',11),(50,'Maracaju','2016-07-21 10:25:50','2016-07-21 10:25:50',11),(51,'Miranda','2016-07-21 10:25:55','2016-07-21 10:25:55',11),(52,'Mundo Novo','2016-07-21 10:26:01','2016-07-21 10:26:01',11),(53,'Naviraí','2016-07-21 10:26:10','2016-07-21 10:26:10',11),(54,'Nioaque','2016-07-21 10:26:20','2016-07-21 10:26:20',11),(55,'Nova Alvorada do Sul','2016-07-21 10:26:48','2016-07-21 10:26:48',11),(56,'Nova Andradina','2016-07-21 10:26:56','2016-07-21 10:26:56',11),(57,'Novo Horizonte do Sul','2016-07-21 10:27:06','2016-07-21 10:27:06',11),(58,'Paraíso das Águias','2016-07-21 10:27:20','2016-07-21 10:27:20',11),(59,'Paranaíba','2016-07-21 10:27:34','2016-07-21 10:27:34',11),(60,'Paranhos','2016-07-21 10:27:38','2016-07-21 10:27:38',11),(61,'Pedro Gomes','2016-07-21 10:27:44','2016-07-21 10:27:44',11),(62,'Ponta Porã','2016-07-21 10:27:52','2016-07-21 10:27:52',11),(63,'Porto Murtinho','2016-07-21 10:28:00','2016-07-21 10:28:00',11),(64,'Ribas do Rio Pardo','2016-07-21 10:28:10','2016-07-21 10:28:10',11),(65,'Rio Brilhante','2016-07-21 10:28:27','2016-07-21 10:28:27',11),(66,'Rio Negro','2016-07-21 10:28:34','2016-07-21 10:28:34',11),(67,'Rio Verde de Mato Grosso','2016-07-21 10:28:44','2016-07-21 10:28:44',11),(68,'Rochedo','2016-07-21 10:28:51','2016-07-21 10:28:51',11),(69,'Santa Rita do Pardo','2016-07-21 10:29:04','2016-07-21 10:29:04',11),(70,'São Gabriel do Oeste','2016-07-21 10:29:14','2016-07-21 10:29:14',11),(71,'Selviria','2016-07-21 10:29:23','2016-07-21 10:29:23',11),(72,'Sete Quedas','2016-07-21 10:29:29','2016-07-21 10:29:29',11),(73,'Sidrolândia','2016-07-21 10:29:37','2016-07-21 10:29:37',11),(74,'Sonora','2016-07-21 10:29:44','2016-07-21 10:29:44',11),(75,'Tacuru','2016-07-21 10:29:50','2016-07-21 10:29:50',11),(76,'Taquarussu','2016-07-21 10:29:58','2016-07-21 10:29:58',11),(77,'Terenos','2016-07-21 10:30:06','2016-07-21 10:30:06',11),(78,'Três Lagoas','2016-07-21 10:30:12','2016-07-21 10:30:12',11),(79,'Vicentina','2016-07-21 10:30:18','2016-07-21 10:30:18',11);
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-07-20 16:31:33','2','usuario',1,'Adicionado.',4,1),(2,'2016-07-20 16:31:56','3','master',1,'Adicionado.',4,1),(3,'2016-07-20 16:32:30','3','master',2,'Modificado user_permissions.',4,1),(4,'2016-07-20 16:33:31','3','master',2,'Modificado first_name, last_name e email.',4,1),(5,'2016-07-20 16:33:55','2','usuario',2,'Modificado first_name, last_name e email.',4,1),(6,'2016-07-21 09:37:58','1','admin',2,'Modificado first_name e last_name.',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'armazem','armazem'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'core','estado'),(9,'core','municipio'),(10,'fornecedor','fornecedor'),(11,'item','item'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-07-20 16:26:20'),(2,'auth','0001_initial','2016-07-20 16:26:28'),(3,'admin','0001_initial','2016-07-20 16:26:29'),(4,'admin','0002_logentry_remove_auto_add','2016-07-20 16:26:30'),(5,'armazem','0001_initial','2016-07-20 16:26:31'),(6,'armazem','0002_auto_20160705_1022','2016-07-20 16:26:37'),(7,'armazem','0003_auto_20160706_1516','2016-07-20 16:26:37'),(8,'armazem','0004_auto_20160711_1442','2016-07-20 16:26:38'),(9,'contenttypes','0002_remove_content_type_name','2016-07-20 16:26:39'),(10,'auth','0002_alter_permission_name_max_length','2016-07-20 16:26:40'),(11,'auth','0003_alter_user_email_max_length','2016-07-20 16:26:41'),(12,'auth','0004_alter_user_username_opts','2016-07-20 16:26:41'),(13,'auth','0005_alter_user_last_login_null','2016-07-20 16:26:41'),(14,'auth','0006_require_contenttypes_0002','2016-07-20 16:26:42'),(15,'auth','0007_alter_validators_add_error_messages','2016-07-20 16:26:42'),(16,'core','0001_initial','2016-07-20 16:26:42'),(17,'core','0002_delete_estado','2016-07-20 16:26:42'),(18,'core','0003_estado','2016-07-20 16:26:42'),(19,'core','0004_auto_20160609_1322','2016-07-20 16:26:43'),(20,'core','0005_municipio','2016-07-20 16:26:44'),(21,'core','0006_auto_20160706_1512','2016-07-20 16:26:44'),(22,'core','0007_auto_20160706_1513','2016-07-20 16:26:44'),(23,'fornecedor','0001_initial','2016-07-20 16:26:45'),(24,'fornecedor','0002_auto_20160608_1542','2016-07-20 16:26:52'),(25,'fornecedor','0003_fornecedor_situacao','2016-07-20 16:26:53'),(26,'fornecedor','0004_auto_20160608_1558','2016-07-20 16:26:53'),(27,'fornecedor','0005_auto_20160609_1322','2016-07-20 16:26:55'),(28,'fornecedor','0006_auto_20160609_1839','2016-07-20 16:26:57'),(29,'fornecedor','0007_fornecedor_usuario','2016-07-20 16:26:58'),(30,'fornecedor','0008_auto_20160706_1544','2016-07-20 16:26:59'),(31,'fornecedor','0009_auto_20160711_1439','2016-07-20 16:26:59'),(32,'fornecedor','0010_auto_20160711_1442','2016-07-20 16:27:00'),(33,'item','0001_initial','2016-07-20 16:27:00'),(34,'item','0002_item_usuario','2016-07-20 16:27:02'),(35,'item','0003_auto_20160706_1545','2016-07-20 16:27:02'),(36,'sessions','0001_initial','2016-07-20 16:27:04');
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
INSERT INTO `django_session` VALUES ('whksw2pz86nulljpmkm33kngfx1y5r0z','ODE2MzMxMzQwMTIwYjc0ZWU1NjBmMGVjMjVhOWUyMDY3MzUwNzc1YTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjU1MjZiNGFmZWE0MmYyMmIxYmQwYTU0NmVmOTI2Yjc5MmIyYzk3In0=','2016-08-04 10:35:37');
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
  `contato` varchar(40) DEFAULT NULL,
  `criado` datetime NOT NULL,
  `atualizado` datetime NOT NULL,
  `cidade_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `situacao` tinyint(1) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fornecedor_fornecedor_estado_id_cc29b1e6_uniq` (`estado_id`),
  KEY `fornecedor_fornecedor_cidade_id_f55ba7fa_uniq` (`cidade_id`),
  KEY `fornecedor_fornecedor_abfe0f96` (`usuario_id`),
  CONSTRAINT `fornecedor_fornecedor_cidade_id_f55ba7fa_fk_core_municipio_id` FOREIGN KEY (`cidade_id`) REFERENCES `core_municipio` (`id`),
  CONSTRAINT `fornecedor_fornecedor_estado_id_cc29b1e6_fk_core_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `core_estado` (`id`),
  CONSTRAINT `fornecedor_fornecedor_usuario_id_0c6232f8_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_fornecedor`
--

LOCK TABLES `fornecedor_fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor_fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor_fornecedor` VALUES (1,'ZILIOTTO INDÚSTRIA, ATACADO, COMERCIO E REPRESENTACOES LTDA','ZORNIMAT','15491434000109','Fabricação de móveis','Rua Quatorze de Julho','931','Loja','79004391','(67) 3025-7272','Marcio Rodrigues','2016-07-21 10:34:45','2016-08-01 20:02:24',20,11,1,3);
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
  PRIMARY KEY (`id`),
  KEY `item_item_abfe0f96` (`usuario_id`),
  CONSTRAINT `item_item_usuario_id_69c4918c_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_item`
--

LOCK TABLES `item_item` WRITE;
/*!40000 ALTER TABLE `item_item` DISABLE KEYS */;
INSERT INTO `item_item` VALUES (1,'Caneta cor Preta',22,'2016-07-29 18:49:43','2016-08-01 20:09:05',3);
/*!40000 ALTER TABLE `item_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-02  9:02:53
