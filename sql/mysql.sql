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
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `armazem_armazem_usuario_id_47ce4d48_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `armazem_armazem_usuario_id_47ce4d48_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armazem_armazem`
--

LOCK TABLES `armazem_armazem` WRITE;
/*!40000 ALTER TABLE `armazem_armazem` DISABLE KEYS */;
INSERT INTO `armazem_armazem` VALUES (1,'FIOCRUZ MS','Rua Gabriel Abrão','92','Escritório','L1','2016-08-22 17:37:54.084821','2016-08-22 17:37:54.084821',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add armazem',7,'add_armazem'),(20,'Can change armazem',7,'change_armazem'),(21,'Can delete armazem',7,'delete_armazem'),(22,'Pode Administrar',7,'pode_administrar'),(23,'Can add estado',8,'add_estado'),(24,'Can change estado',8,'change_estado'),(25,'Can delete estado',8,'delete_estado'),(26,'Can add municipio',9,'add_municipio'),(27,'Can change municipio',9,'change_municipio'),(28,'Can delete municipio',9,'delete_municipio'),(29,'Can add fornecedor',10,'add_fornecedor'),(30,'Can change fornecedor',10,'change_fornecedor'),(31,'Can delete fornecedor',10,'delete_fornecedor'),(32,'Pode Administrar',10,'pode_administrar'),(33,'Can add item',11,'add_item'),(34,'Can change item',11,'change_item'),(35,'Can delete item',11,'delete_item'),(36,'Pode Administrar',11,'pode_administrar'),(41,'Can add compra',13,'add_compra'),(42,'Can change compra',13,'change_compra'),(43,'Can delete compra',13,'delete_compra'),(44,'Pode Administrar',13,'pode_administrar'),(45,'Can add compra item',14,'add_compraitem'),(46,'Can change compra item',14,'change_compraitem'),(47,'Can delete compra item',14,'delete_compraitem'),(48,'Pode Administrar',14,'pode_administrar');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$RwCWowXrfyBa$/l8HftktAlzU0i5dKPTpfzCyRfXPD2hdejFGAeloAiQ=','2016-08-29 17:08:06.124784',1,'admin','Administrador','Administrador','administrador@matogrossodosul.fiocruz.br',1,1,'2016-08-22 16:57:04.000000'),(2,'pbkdf2_sha256$24000$rKZ1Us2iZtHP$ipMolYUKpEirGJWOUcN8pzaiDk01M6YdE7YYR0WIsS4=','2016-08-25 12:46:06.809154',0,'master','master','master','master@matogrossodosul.fiocruz.br',0,1,'2016-08-23 11:18:53.000000'),(3,'pbkdf2_sha256$24000$B2f3bKKXRcf5$tiWIfl7lvXcdGjOW4tRFtVF68JzCuWurXEuIy5g3nZk=','2016-08-23 11:21:20.769952',0,'usuario','Usuário','Usuário','usuario@matogrossodosul.fiocruz.br',0,1,'2016-08-23 11:20:20.000000');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (4,2,22),(2,2,32),(3,2,36),(1,2,48);
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
  `notafiscal` varchar(20) NOT NULL,
  `data_compra` date NOT NULL,
  `data_entrega` date NOT NULL,
  `situacao` tinyint(1) NOT NULL,
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compra_compra_abfe0f96` (`usuario_id`),
  CONSTRAINT `compra_compra_usuario_id_978e855e_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_compra`
--

LOCK TABLES `compra_compra` WRITE;
/*!40000 ALTER TABLE `compra_compra` DISABLE KEYS */;
INSERT INTO `compra_compra` VALUES (4,'1','2016-08-29','2016-08-29',0,'2016-08-29 17:36:50.972439','2016-08-29 17:36:50.972439',1),(5,'2','2016-08-29','2016-08-29',1,'2016-08-29 17:46:34.106793','2016-08-29 17:46:34.106793',1),(6,'2','2016-08-29','2016-08-29',1,'2016-08-29 17:47:10.079850','2016-08-29 17:47:10.079850',1),(7,'4','2016-08-29','2016-08-29',0,'2016-08-29 17:49:37.127261','2016-08-29 17:49:37.127261',1);
/*!40000 ALTER TABLE `compra_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_compraitem`
--

DROP TABLE IF EXISTS `compra_compraitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_compraitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `custo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compra_compraitem_item_id_d6890d7b_fk_item_item_id` (`item_id`),
  CONSTRAINT `compra_compraitem_item_id_d6890d7b_fk_item_item_id` FOREIGN KEY (`item_id`) REFERENCES `item_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_compraitem`
--

LOCK TABLES `compra_compraitem` WRITE;
/*!40000 ALTER TABLE `compra_compraitem` DISABLE KEYS */;
INSERT INTO `compra_compraitem` VALUES (1,10,1,9.90);
/*!40000 ALTER TABLE `compra_compraitem` ENABLE KEYS */;
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
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_estado`
--

LOCK TABLES `core_estado` WRITE;
/*!40000 ALTER TABLE `core_estado` DISABLE KEYS */;
INSERT INTO `core_estado` VALUES (1,'MS','Mato Grosso do Sul','2016-08-22 17:40:23.423883','2016-08-22 17:42:02.484057');
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
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_municipio_estado_id_8d07bbda_fk_core_estado_id` (`estado_id`),
  CONSTRAINT `core_municipio_estado_id_8d07bbda_fk_core_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `core_estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_municipio`
--

LOCK TABLES `core_municipio` WRITE;
/*!40000 ALTER TABLE `core_municipio` DISABLE KEYS */;
INSERT INTO `core_municipio` VALUES (1,'Campo Grande','2016-08-22 17:41:50.565636','2016-08-22 17:41:50.565636',1);
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
  `action_time` datetime(6) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-08-23 11:18:00.287485','1','admin',2,'Modificado first_name e last_name.',4,1),(2,'2016-08-23 11:18:32.574332','1','admin',2,'Modificado last_name.',4,1),(3,'2016-08-23 11:18:53.741542','2','master',1,'Adicionado.',4,1),(4,'2016-08-23 11:20:04.169571','2','master',2,'Modificado first_name, last_name, email e user_permissions.',4,1),(5,'2016-08-23 11:20:20.968531','3','usuario',1,'Adicionado.',4,1),(6,'2016-08-23 11:20:45.508935','3','usuario',2,'Modificado first_name, last_name e email.',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'armazem','armazem'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'compra','compra'),(14,'compra','compraitem'),(5,'contenttypes','contenttype'),(8,'core','estado'),(9,'core','municipio'),(10,'fornecedor','fornecedor'),(11,'item','item'),(6,'sessions','session');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-08-22 16:55:36.114405'),(2,'auth','0001_initial','2016-08-22 16:55:49.530429'),(3,'admin','0001_initial','2016-08-22 16:55:52.837635'),(4,'admin','0002_logentry_remove_auto_add','2016-08-22 16:55:53.165235'),(5,'armazem','0001_initial','2016-08-22 16:55:54.538038'),(6,'contenttypes','0002_remove_content_type_name','2016-08-22 16:55:56.238441'),(7,'auth','0002_alter_permission_name_max_length','2016-08-22 16:55:57.455243'),(8,'auth','0003_alter_user_email_max_length','2016-08-22 16:55:58.500445'),(9,'auth','0004_alter_user_username_opts','2016-08-22 16:55:58.609645'),(10,'auth','0005_alter_user_last_login_null','2016-08-22 16:55:59.842047'),(11,'auth','0006_require_contenttypes_0002','2016-08-22 16:55:59.904447'),(12,'auth','0007_alter_validators_add_error_messages','2016-08-22 16:56:00.013647'),(13,'core','0001_initial','2016-08-22 16:56:05.021256'),(14,'fornecedor','0001_initial','2016-08-22 16:56:09.779265'),(15,'item','0001_initial','2016-08-22 16:56:14.240872'),(16,'compra','0001_initial','2016-08-22 16:56:25.004891'),(17,'sessions','0001_initial','2016-08-22 16:56:26.206093'),(18,'compra','0002_remove_itemcompra_fornecedor','2016-08-22 17:17:59.489390'),(19,'compra','0003_auto_20160822_1436','2016-08-22 17:36:31.669876'),(20,'compra','0004_compra_fornecedor','2016-08-22 17:48:09.771102'),(21,'compra','0005_auto_20160822_1452','2016-08-22 17:52:46.281588'),(22,'compra','0006_auto_20160822_1511','2016-08-22 18:11:41.109015'),(23,'compra','0007_compraitem_custo','2016-08-22 18:30:43.815634'),(24,'compra','0008_auto_20160824_0805','2016-08-24 11:06:04.787693'),(25,'compra','0009_auto_20160824_0830','2016-08-24 11:30:22.361440'),(26,'compra','0010_auto_20160829_1349','2016-08-29 16:50:00.491689'),(27,'compra','0010_auto_20160829_1428','2016-08-29 17:29:05.531818');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('o1k1d0yezbbjo8ujdjbh59hhrvh6y1cw','MmI1ZmUyOTRlOWRkZDY5NGFhNGQwNjY4ZTcxYWQyOWViMDI5NDZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGMzZjYxMjE4NWQ0OWE5YmZhNWQwZjVjZjJkNDA0NDhiM2UxMTlkNSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-12 17:08:06.338796');
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
  `bairro` varchar(40) NOT NULL,
  `endereco` varchar(40) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `complemento` varchar(40) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `contato` varchar(40) NOT NULL,
  `email` varchar(254) NOT NULL,
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  `situacao` tinyint(1) NOT NULL,
  `cidade_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fornecedor_fornecedor_cidade_id_f55ba7fa_fk_core_municipio_id` (`cidade_id`),
  KEY `fornecedor_fornecedor_estado_id_cc29b1e6_fk_core_estado_id` (`estado_id`),
  KEY `fornecedor_fornecedor_usuario_id_0c6232f8_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `fornecedor_fornecedor_cidade_id_f55ba7fa_fk_core_municipio_id` FOREIGN KEY (`cidade_id`) REFERENCES `core_municipio` (`id`),
  CONSTRAINT `fornecedor_fornecedor_estado_id_cc29b1e6_fk_core_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `core_estado` (`id`),
  CONSTRAINT `fornecedor_fornecedor_usuario_id_0c6232f8_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_fornecedor`
--

LOCK TABLES `fornecedor_fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor_fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor_fornecedor` VALUES (1,'Zilioto Indústria, Atacado, Comércio e Representações Ltda','ZORNIMAT','15491434000109','CNAE 4789007','Vila Glória','Rua Quatorze de Julho','931','Loja','79004391','(67) 3025-7272','Luzia','contato@zornimat.com.br','2016-08-22 17:45:20.838406','2016-08-23 11:27:01.466439',1,1,1,2),(2,'Livromat Livraria e Papelaria Ltda - EPP','LIVROMAT','00.885.905/000','CNAE 4789007','Vila Cidade','Av Calogeras','2411','Loja','79002001','(67) 3321-3809','João Lima','livromat@livromat.com.br','2016-08-23 18:00:52.351477','2016-08-23 18:01:23.760273',1,1,1,2);
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
  `estoque_minimo` int(11) NOT NULL,
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  `armazem_id` int(11) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_item_armazem_id_6fbf1c0f_fk_armazem_armazem_id` (`armazem_id`),
  KEY `item_item_fornecedor_id_b849e10b_fk_fornecedor_fornecedor_id` (`fornecedor_id`),
  KEY `item_item_usuario_id_69c4918c_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `item_item_armazem_id_6fbf1c0f_fk_armazem_armazem_id` FOREIGN KEY (`armazem_id`) REFERENCES `armazem_armazem` (`id`),
  CONSTRAINT `item_item_fornecedor_id_b849e10b_fk_fornecedor_fornecedor_id` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor_fornecedor` (`id`),
  CONSTRAINT `item_item_usuario_id_69c4918c_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_item`
--

LOCK TABLES `item_item` WRITE;
/*!40000 ALTER TABLE `item_item` DISABLE KEYS */;
INSERT INTO `item_item` VALUES (1,'Bloco A4 500 Folhas',10,2,'2016-08-22 17:45:52.865262','2016-08-22 17:45:52.865262',1,1,1),(2,'Caneta cor Preta',50,5,'2016-08-22 18:00:59.328043','2016-08-22 18:00:59.328043',1,1,1);
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

-- Dump completed on 2016-08-29 14:55:37
