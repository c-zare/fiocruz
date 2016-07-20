-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: producao
-- ------------------------------------------------------
-- Server version	5.5.49-0+deb8u1

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
-- Current Database: `producao`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `producao` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `producao`;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armazem_armazem`
--

LOCK TABLES `armazem_armazem` WRITE;
/*!40000 ALTER TABLE `armazem_armazem` DISABLE KEYS */;
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$VmyS8ArgTQXz$DD5BnKtIVagxTPsl0VL+TGM2u/3eRRuxD/Ef3RY3MCc=','2016-07-20 16:33:07',1,'admin','','','admin@matogrossodosul.fiocruz.br',1,1,'2016-07-20 16:30:56'),(2,'pbkdf2_sha256$24000$wshnIBVPgWHz$dZPcMJf4WXju5Ns+C6HZpxVPqEhCx8OAGU5QROq963U=','2016-07-20 16:34:10',0,'usuario','Usuário','Usuário','usuario@matogrossodosul.fiocruz.br',0,1,'2016-07-20 16:31:33'),(3,'pbkdf2_sha256$24000$mZ8kdn3yNKgj$zOITOSpaVGQOvuxtsVMCM2dTGEnlb8Olk9CsQZIL9g8=','2016-07-20 16:34:23',0,'master','Master','Master','master@matogrossodosul.fiocruz.br',0,1,'2016-07-20 16:31:56');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_estado`
--

LOCK TABLES `core_estado` WRITE;
/*!40000 ALTER TABLE `core_estado` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_municipio`
--

LOCK TABLES `core_municipio` WRITE;
/*!40000 ALTER TABLE `core_municipio` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-07-20 16:31:33','2','usuario',1,'Adicionado.',4,1),(2,'2016-07-20 16:31:56','3','master',1,'Adicionado.',4,1),(3,'2016-07-20 16:32:30','3','master',2,'Modificado user_permissions.',4,1),(4,'2016-07-20 16:33:31','3','master',2,'Modificado first_name, last_name e email.',4,1),(5,'2016-07-20 16:33:55','2','usuario',2,'Modificado first_name, last_name e email.',4,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_fornecedor`
--

LOCK TABLES `fornecedor_fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor_fornecedor` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_item`
--

LOCK TABLES `item_item` WRITE;
/*!40000 ALTER TABLE `item_item` DISABLE KEYS */;
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

-- Dump completed on 2016-07-20 12:38:07
