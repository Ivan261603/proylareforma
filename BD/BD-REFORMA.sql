-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_adsi
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

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
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `id_departamento` int(11) unsigned NOT NULL,
  `departamento` varchar(255) NOT NULL DEFAULT '',
  `personas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (5,'ANTIOQUIA',NULL),(8,'ATLÁNTICO',NULL),(11,'BOGOTÁ, D.C.',NULL),(13,'BOLÍVAR',NULL),(15,'BOYACÁ',NULL),(17,'CALDAS',NULL),(18,'CAQUETÁ',NULL),(19,'CAUCA',NULL),(20,'CESAR',NULL),(23,'CÓRDOBA',NULL),(25,'CUNDINAMARCA',NULL),(27,'CHOCÓ',NULL),(41,'HUILA',NULL),(44,'LA GUAJIRA',NULL),(47,'MAGDALENA',NULL),(50,'META',NULL),(52,'NARIÑO',NULL),(54,'NORTE DE SANTANDER',NULL),(63,'QUINDIO',NULL),(66,'RISARALDA',NULL),(68,'SANTANDER',NULL),(70,'SUCRE',NULL),(73,'TOLIMA',NULL),(76,'VALLE DEL CAUCA',NULL),(81,'ARAUCA',NULL),(85,'CASANARE',NULL),(86,'PUTUMAYO',NULL),(88,'ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA',NULL),(91,'AMAZONAS',NULL),(94,'GUAINÍA',NULL),(95,'GUAVIARE',NULL),(97,'VAUPÉS',NULL),(99,'VICHADA',NULL);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egresos`
--

DROP TABLE IF EXISTS `egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egresos` (
  `idegresos` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `concepto` varchar(45) NOT NULL,
  `fecha` date DEFAULT NULL,
  `valor_gasto` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idegresos`),
  KEY `usuario_egresos` (`usuario`),
  CONSTRAINT `usuario_egresos` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`identificacion_per`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresos`
--

LOCK TABLES `egresos` WRITE;
/*!40000 ALTER TABLE `egresos` DISABLE KEYS */;
INSERT INTO `egresos` VALUES (1,'Servicios','luz','2021-06-14',50000,NULL),(2,'Gastos Generales','productos de aseo','2021-06-14',30000,NULL),(3,'Gastos Generales','productos de aseo','2021-06-14',40000,NULL),(4,'Servicios','pago de energía ','2021-06-16',45000,NULL),(5,'Gastos Generales','compra de productos','2021-07-13',15000,NULL),(6,'Gastos Generales','Compra de papelería para las impresoras','2021-09-02',50000,NULL);
/*!40000 ALTER TABLE `egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresos` (
  `idingresos` int(11) NOT NULL AUTO_INCREMENT,
  `ofrenda` int(11) DEFAULT NULL,
  `diezmo` int(11) DEFAULT NULL,
  `primicia` int(11) DEFAULT NULL,
  `otros` int(11) DEFAULT NULL,
  `fecha_i` date DEFAULT NULL,
  `personas` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `total_ingreso` int(255) DEFAULT NULL,
  PRIMARY KEY (`idingresos`),
  KEY `personas_ingresos` (`personas`),
  KEY `usuario_ingresos` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (1,2000,0,0,NULL,'2021-05-17',3,0,2000),(2,3000,10000,NULL,NULL,'2021-04-12',4,0,13000),(3,1000,200,200,NULL,'2021-05-17',2,0,1400),(11,800,0,0,900,'2021-05-22',1,0,1700),(12,600,0,500,0,'2021-05-22',2,0,1100),(13,600,0,500,0,'2021-05-22',3,0,1100),(14,600,0,500,0,'2021-05-22',3,0,1100),(15,600,0,500,0,'2021-05-22',5,0,1100),(16,400,0,500,0,'2021-05-22',5,0,900),(19,400,0,800,0,'2021-05-22',1067,0,1200),(20,0,600,0,0,'2021-05-22',5,0,600),(21,700,0,0,0,'2021-12-12',7,0,700),(39,0,700,0,0,'2021-05-23',4,NULL,700),(47,10000,50000,100,0,'2021-08-12',1066,NULL,60100),(48,5000,0,0,0,'2021-06-14',1067,NULL,5000),(49,50000,0,0,0,'2021-06-16',3,NULL,50000),(50,50000,20000,0,0,'2021-06-16',1121,NULL,70000),(51,5000,10000,0,0,'2021-06-28',1066,NULL,15000),(52,10000,10000,0,0,'2021-07-02',15,NULL,20000),(53,5000,5000,0,5000,'2021-07-02',6,NULL,15000),(54,5000,15000,0,0,'2021-07-13',1067,NULL,20000),(55,4000,5000,0,3000,'2021-08-07',4,NULL,12000),(56,10000,10000,0,0,'2021-09-28',1115,NULL,20000);
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `id_municipio` int(11) unsigned NOT NULL,
  `municipio` varchar(255) NOT NULL DEFAULT '',
  `estado` int(1) unsigned NOT NULL,
  `departamento_id` int(2) unsigned NOT NULL,
  `personas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `departamento_id` (`departamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'Abriaquí',1,5,NULL),(2,'Acacías',1,50,NULL),(3,'Acandí',1,27,NULL),(4,'Acevedo',1,41,NULL),(5,'Achí',1,13,NULL),(6,'Agrado',1,41,NULL),(7,'Agua de Dios',1,25,NULL),(8,'Aguachica',1,20,NULL),(9,'Aguada',1,68,NULL),(10,'Aguadas',1,17,NULL),(11,'Aguazul',1,85,NULL),(12,'Agustín Codazzi',1,20,NULL),(13,'Aipe',1,41,NULL),(14,'Albania',1,18,NULL),(15,'Albania',1,44,NULL),(16,'Albania',1,68,NULL),(17,'Albán',1,25,NULL),(18,'Albán (San José)',1,52,NULL),(19,'Alcalá',1,76,NULL),(20,'Alejandria',1,5,NULL),(21,'Algarrobo',1,47,NULL),(22,'Algeciras',1,41,NULL),(23,'Almaguer',1,19,NULL),(24,'Almeida',1,15,NULL),(25,'Alpujarra',1,73,NULL),(26,'Altamira',1,41,NULL),(27,'Alto Baudó (Pie de Pato)',1,27,NULL),(28,'Altos del Rosario',1,13,NULL),(29,'Alvarado',1,73,NULL),(30,'Amagá',1,5,NULL),(31,'Amalfi',1,5,NULL),(32,'Ambalema',1,73,NULL),(33,'Anapoima',1,25,NULL),(34,'Ancuya',1,52,NULL),(35,'Andalucía',1,76,NULL),(36,'Andes',1,5,NULL),(37,'Angelópolis',1,5,NULL),(38,'Angostura',1,5,NULL),(39,'Anolaima',1,25,NULL),(40,'Anorí',1,5,NULL),(41,'Anserma',1,17,NULL),(42,'Ansermanuevo',1,76,NULL),(43,'Anzoátegui',1,73,NULL),(44,'Anzá',1,5,NULL),(45,'Apartadó',1,5,NULL),(46,'Apulo',1,25,NULL),(47,'Apía',1,66,NULL),(48,'Aquitania',1,15,NULL),(49,'Aracataca',1,47,NULL),(50,'Aranzazu',1,17,NULL),(51,'Aratoca',1,68,NULL),(52,'Arauca',1,81,NULL),(53,'Arauquita',1,81,NULL),(54,'Arbeláez',1,25,NULL),(55,'Arboleda (Berruecos)',1,52,NULL),(56,'Arboledas',1,54,NULL),(57,'Arboletes',1,5,NULL),(58,'Arcabuco',1,15,NULL),(59,'Arenal',1,13,NULL),(60,'Argelia',1,5,NULL),(61,'Argelia',1,19,NULL),(62,'Argelia',1,76,NULL),(63,'Ariguaní (El Difícil)',1,47,NULL),(64,'Arjona',1,13,NULL),(65,'Armenia',1,5,NULL),(66,'Armenia',1,63,NULL),(67,'Armero (Guayabal)',1,73,NULL),(68,'Arroyohondo',1,13,NULL),(69,'Astrea',1,20,NULL),(70,'Ataco',1,73,NULL),(71,'Atrato (Yuto)',1,27,NULL),(72,'Ayapel',1,23,NULL),(73,'Bagadó',1,27,NULL),(74,'Bahía Solano (Mútis)',1,27,NULL),(75,'Bajo Baudó (Pizarro)',1,27,NULL),(76,'Balboa',1,19,NULL),(77,'Balboa',1,66,NULL),(78,'Baranoa',1,8,NULL),(79,'Baraya',1,41,NULL),(80,'Barbacoas',1,52,NULL),(81,'Barbosa',1,5,NULL),(82,'Barbosa',1,68,NULL),(83,'Barichara',1,68,NULL),(84,'Barranca de Upía',1,50,NULL),(85,'Barrancabermeja',1,68,NULL),(86,'Barrancas',1,44,NULL),(87,'Barranco de Loba',1,13,NULL),(88,'Barranquilla',1,8,NULL),(89,'Becerríl',1,20,NULL),(90,'Belalcázar',1,17,NULL),(91,'Bello',1,5,NULL),(92,'Belmira',1,5,NULL),(93,'Beltrán',1,25,NULL),(94,'Belén',1,15,NULL),(95,'Belén',1,52,NULL),(96,'Belén de Bajirá',1,27,NULL),(97,'Belén de Umbría',1,66,NULL),(98,'Belén de los Andaquíes',1,18,NULL),(99,'Berbeo',1,15,NULL),(100,'Betania',1,5,NULL),(101,'Beteitiva',1,15,NULL),(102,'Betulia',1,5,NULL),(103,'Betulia',1,68,NULL),(104,'Bituima',1,25,NULL),(105,'Boavita',1,15,NULL),(106,'Bochalema',1,54,NULL),(107,'Bogotá D.C.',1,11,NULL),(108,'Bojacá',1,25,NULL),(109,'Bojayá (Bellavista)',1,27,NULL),(110,'Bolívar',1,5,NULL),(111,'Bolívar',1,19,NULL),(112,'Bolívar',1,68,NULL),(113,'Bolívar',1,76,NULL),(114,'Bosconia',1,20,NULL),(115,'Boyacá',1,15,NULL),(116,'Briceño',1,5,NULL),(117,'Briceño',1,15,NULL),(118,'Bucaramanga',1,68,NULL),(119,'Bucarasica',1,54,NULL),(120,'Buenaventura',1,76,NULL),(121,'Buenavista',1,15,NULL),(122,'Buenavista',1,23,NULL),(123,'Buenavista',1,63,NULL),(124,'Buenavista',1,70,NULL),(125,'Buenos Aires',1,19,NULL),(126,'Buesaco',1,52,NULL),(127,'Buga',1,76,NULL),(128,'Bugalagrande',1,76,NULL),(129,'Burítica',1,5,NULL),(130,'Busbanza',1,15,NULL),(131,'Cabrera',1,25,NULL),(132,'Cabrera',1,68,NULL),(133,'Cabuyaro',1,50,NULL),(134,'Cachipay',1,25,NULL),(135,'Caicedo',1,5,NULL),(136,'Caicedonia',1,76,NULL),(137,'Caimito',1,70,NULL),(138,'Cajamarca',1,73,NULL),(139,'Cajibío',1,19,NULL),(140,'Cajicá',1,25,NULL),(141,'Calamar',1,13,NULL),(142,'Calamar',1,95,NULL),(143,'Calarcá',1,63,NULL),(144,'Caldas',1,5,NULL),(145,'Caldas',1,15,NULL),(146,'Caldono',1,19,NULL),(147,'California',1,68,NULL),(148,'Calima (Darién)',1,76,NULL),(149,'Caloto',1,19,NULL),(150,'Calí',1,76,NULL),(151,'Campamento',1,5,NULL),(152,'Campo de la Cruz',1,8,NULL),(153,'Campoalegre',1,41,NULL),(154,'Campohermoso',1,15,NULL),(155,'Canalete',1,23,NULL),(156,'Candelaria',1,8,NULL),(157,'Candelaria',1,76,NULL),(158,'Cantagallo',1,13,NULL),(159,'Cantón de San Pablo',1,27,NULL),(160,'Caparrapí',1,25,NULL),(161,'Capitanejo',1,68,NULL),(162,'Caracolí',1,5,NULL),(163,'Caramanta',1,5,NULL),(164,'Carcasí',1,68,NULL),(165,'Carepa',1,5,NULL),(166,'Carmen de Apicalá',1,73,NULL),(167,'Carmen de Carupa',1,25,NULL),(168,'Carmen de Viboral',1,5,NULL),(169,'Carmen del Darién (CURBARADÓ)',1,27,NULL),(170,'Carolina',1,5,NULL),(171,'Cartagena',1,13,NULL),(172,'Cartagena del Chairá',1,18,NULL),(173,'Cartago',1,76,NULL),(174,'Carurú',1,97,NULL),(175,'Casabianca',1,73,NULL),(176,'Castilla la Nueva',1,50,NULL),(177,'Caucasia',1,5,NULL),(178,'Cañasgordas',1,5,NULL),(179,'Cepita',1,68,NULL),(180,'Cereté',1,23,NULL),(181,'Cerinza',1,15,NULL),(182,'Cerrito',1,68,NULL),(183,'Cerro San Antonio',1,47,NULL),(184,'Chachaguí',1,52,NULL),(185,'Chaguaní',1,25,NULL),(186,'Chalán',1,70,NULL),(187,'Chaparral',1,73,NULL),(188,'Charalá',1,68,NULL),(189,'Charta',1,68,NULL),(190,'Chigorodó',1,5,NULL),(191,'Chima',1,68,NULL),(192,'Chimichagua',1,20,NULL),(193,'Chimá',1,23,NULL),(194,'Chinavita',1,15,NULL),(195,'Chinchiná',1,17,NULL),(196,'Chinácota',1,54,NULL),(197,'Chinú',1,23,NULL),(198,'Chipaque',1,25,NULL),(199,'Chipatá',1,68,NULL),(200,'Chiquinquirá',1,15,NULL),(201,'Chiriguaná',1,20,NULL),(202,'Chiscas',1,15,NULL),(203,'Chita',1,15,NULL),(204,'Chitagá',1,54,NULL),(205,'Chitaraque',1,15,NULL),(206,'Chivatá',1,15,NULL),(207,'Chivolo',1,47,NULL),(208,'Choachí',1,25,NULL),(209,'Chocontá',1,25,NULL),(210,'Chámeza',1,85,NULL),(211,'Chía',1,25,NULL),(212,'Chíquiza',1,15,NULL),(213,'Chívor',1,15,NULL),(214,'Cicuco',1,13,NULL),(215,'Cimitarra',1,68,NULL),(216,'Circasia',1,63,NULL),(217,'Cisneros',1,5,NULL),(218,'Ciénaga',1,15,NULL),(219,'Ciénaga',1,47,NULL),(220,'Ciénaga de Oro',1,23,NULL),(221,'Clemencia',1,13,NULL),(222,'Cocorná',1,5,NULL),(223,'Coello',1,73,NULL),(224,'Cogua',1,25,NULL),(225,'Colombia',1,41,NULL),(226,'Colosó (Ricaurte)',1,70,NULL),(227,'Colón',1,86,NULL),(228,'Colón (Génova)',1,52,NULL),(229,'Concepción',1,5,NULL),(230,'Concepción',1,68,NULL),(231,'Concordia',1,5,NULL),(232,'Concordia',1,47,NULL),(233,'Condoto',1,27,NULL),(234,'Confines',1,68,NULL),(235,'Consaca',1,52,NULL),(236,'Contadero',1,52,NULL),(237,'Contratación',1,68,NULL),(238,'Convención',1,54,NULL),(239,'Copacabana',1,5,NULL),(240,'Coper',1,15,NULL),(241,'Cordobá',1,63,NULL),(242,'Corinto',1,19,NULL),(243,'Coromoro',1,68,NULL),(244,'Corozal',1,70,NULL),(245,'Corrales',1,15,NULL),(246,'Cota',1,25,NULL),(247,'Cotorra',1,23,NULL),(248,'Covarachía',1,15,NULL),(249,'Coveñas',1,70,NULL),(250,'Coyaima',1,73,NULL),(251,'Cravo Norte',1,81,NULL),(252,'Cuaspud (Carlosama)',1,52,NULL),(253,'Cubarral',1,50,NULL),(254,'Cubará',1,15,NULL),(255,'Cucaita',1,15,NULL),(256,'Cucunubá',1,25,NULL),(257,'Cucutilla',1,54,NULL),(258,'Cuitiva',1,15,NULL),(259,'Cumaral',1,50,NULL),(260,'Cumaribo',1,99,NULL),(261,'Cumbal',1,52,NULL),(262,'Cumbitara',1,52,NULL),(263,'Cunday',1,73,NULL),(264,'Curillo',1,18,NULL),(265,'Curití',1,68,NULL),(266,'Curumaní',1,20,NULL),(267,'Cáceres',1,5,NULL),(268,'Cáchira',1,54,NULL),(269,'Cácota',1,54,NULL),(270,'Cáqueza',1,25,NULL),(271,'Cértegui',1,27,NULL),(272,'Cómbita',1,15,NULL),(273,'Córdoba',1,13,NULL),(274,'Córdoba',1,52,NULL),(275,'Cúcuta',1,54,NULL),(276,'Dabeiba',1,5,NULL),(277,'Dagua',1,76,NULL),(278,'Dibulla',1,44,NULL),(279,'Distracción',1,44,NULL),(280,'Dolores',1,73,NULL),(281,'Don Matías',1,5,NULL),(282,'Dos Quebradas',1,66,NULL),(283,'Duitama',1,15,NULL),(284,'Durania',1,54,NULL),(285,'Ebéjico',1,5,NULL),(286,'El Bagre',1,5,NULL),(287,'El Banco',1,47,NULL),(288,'El Cairo',1,76,NULL),(289,'El Calvario',1,50,NULL),(290,'El Carmen',1,54,NULL),(291,'El Carmen',1,68,NULL),(292,'El Carmen de Atrato',1,27,NULL),(293,'El Carmen de Bolívar',1,13,NULL),(294,'El Castillo',1,50,NULL),(295,'El Cerrito',1,76,NULL),(296,'El Charco',1,52,NULL),(297,'El Cocuy',1,15,NULL),(298,'El Colegio',1,25,NULL),(299,'El Copey',1,20,NULL),(300,'El Doncello',1,18,NULL),(301,'El Dorado',1,50,NULL),(302,'El Dovio',1,76,NULL),(303,'El Espino',1,15,NULL),(304,'El Guacamayo',1,68,NULL),(305,'El Guamo',1,13,NULL),(306,'El Molino',1,44,NULL),(307,'El Paso',1,20,NULL),(308,'El Paujil',1,18,NULL),(309,'El Peñol',1,52,NULL),(310,'El Peñon',1,13,NULL),(311,'El Peñon',1,68,NULL),(312,'El Peñón',1,25,NULL),(313,'El Piñon',1,47,NULL),(314,'El Playón',1,68,NULL),(315,'El Retorno',1,95,NULL),(316,'El Retén',1,47,NULL),(317,'El Roble',1,70,NULL),(318,'El Rosal',1,25,NULL),(319,'El Rosario',1,52,NULL),(320,'El Tablón de Gómez',1,52,NULL),(321,'El Tambo',1,19,NULL),(322,'El Tambo',1,52,NULL),(323,'El Tarra',1,54,NULL),(324,'El Zulia',1,54,NULL),(325,'El Águila',1,76,NULL),(326,'Elías',1,41,NULL),(327,'Encino',1,68,NULL),(328,'Enciso',1,68,NULL),(329,'Entrerríos',1,5,NULL),(330,'Envigado',1,5,NULL),(331,'Espinal',1,73,NULL),(332,'Facatativá',1,25,NULL),(333,'Falan',1,73,NULL),(334,'Filadelfia',1,17,NULL),(335,'Filandia',1,63,NULL),(336,'Firavitoba',1,15,NULL),(337,'Flandes',1,73,NULL),(338,'Florencia',1,18,NULL),(339,'Florencia',1,19,NULL),(340,'Floresta',1,15,NULL),(341,'Florida',1,76,NULL),(342,'Floridablanca',1,68,NULL),(343,'Florián',1,68,NULL),(344,'Fonseca',1,44,NULL),(345,'Fortúl',1,81,NULL),(346,'Fosca',1,25,NULL),(347,'Francisco Pizarro',1,52,NULL),(348,'Fredonia',1,5,NULL),(349,'Fresno',1,73,NULL),(350,'Frontino',1,5,NULL),(351,'Fuente de Oro',1,50,NULL),(352,'Fundación',1,47,NULL),(353,'Funes',1,52,NULL),(354,'Funza',1,25,NULL),(355,'Fusagasugá',1,25,NULL),(356,'Fómeque',1,25,NULL),(357,'Fúquene',1,25,NULL),(358,'Gachalá',1,25,NULL),(359,'Gachancipá',1,25,NULL),(360,'Gachantivá',1,15,NULL),(361,'Gachetá',1,25,NULL),(362,'Galapa',1,8,NULL),(363,'Galeras (Nueva Granada)',1,70,NULL),(364,'Galán',1,68,NULL),(365,'Gama',1,25,NULL),(366,'Gamarra',1,20,NULL),(367,'Garagoa',1,15,NULL),(368,'Garzón',1,41,NULL),(369,'Gigante',1,41,NULL),(370,'Ginebra',1,76,NULL),(371,'Giraldo',1,5,NULL),(372,'Girardot',1,25,NULL),(373,'Girardota',1,5,NULL),(374,'Girón',1,68,NULL),(375,'Gonzalez',1,20,NULL),(376,'Gramalote',1,54,NULL),(377,'Granada',1,5,NULL),(378,'Granada',1,25,NULL),(379,'Granada',1,50,NULL),(380,'Guaca',1,68,NULL),(381,'Guacamayas',1,15,NULL),(382,'Guacarí',1,76,NULL),(383,'Guachavés',1,52,NULL),(384,'Guachené',1,19,NULL),(385,'Guachetá',1,25,NULL),(386,'Guachucal',1,52,NULL),(387,'Guadalupe',1,5,NULL),(388,'Guadalupe',1,41,NULL),(389,'Guadalupe',1,68,NULL),(390,'Guaduas',1,25,NULL),(391,'Guaitarilla',1,52,NULL),(392,'Gualmatán',1,52,NULL),(393,'Guamal',1,47,NULL),(394,'Guamal',1,50,NULL),(395,'Guamo',1,73,NULL),(396,'Guapota',1,68,NULL),(397,'Guapí',1,19,NULL),(398,'Guaranda',1,70,NULL),(399,'Guarne',1,5,NULL),(400,'Guasca',1,25,NULL),(401,'Guatapé',1,5,NULL),(402,'Guataquí',1,25,NULL),(403,'Guatavita',1,25,NULL),(404,'Guateque',1,15,NULL),(405,'Guavatá',1,68,NULL),(406,'Guayabal de Siquima',1,25,NULL),(407,'Guayabetal',1,25,NULL),(408,'Guayatá',1,15,NULL),(409,'Guepsa',1,68,NULL),(410,'Guicán',1,15,NULL),(411,'Gutiérrez',1,25,NULL),(412,'Guática',1,66,NULL),(413,'Gámbita',1,68,NULL),(414,'Gámeza',1,15,NULL),(415,'Génova',1,63,NULL),(416,'Gómez Plata',1,5,NULL),(417,'Hacarí',1,54,NULL),(418,'Hatillo de Loba',1,13,NULL),(419,'Hato',1,68,NULL),(420,'Hato Corozal',1,85,NULL),(421,'Hatonuevo',1,44,NULL),(422,'Heliconia',1,5,NULL),(423,'Herrán',1,54,NULL),(424,'Herveo',1,73,NULL),(425,'Hispania',1,5,NULL),(426,'Hobo',1,41,NULL),(427,'Honda',1,73,NULL),(428,'Ibagué',1,73,NULL),(429,'Icononzo',1,73,NULL),(430,'Iles',1,52,NULL),(431,'Imúes',1,52,NULL),(432,'Inzá',1,19,NULL),(433,'Inírida',1,94,NULL),(434,'Ipiales',1,52,NULL),(435,'Isnos',1,41,NULL),(436,'Istmina',1,27,NULL),(437,'Itagüí',1,5,NULL),(438,'Ituango',1,5,NULL),(439,'Izá',1,15,NULL),(440,'Jambaló',1,19,NULL),(441,'Jamundí',1,76,NULL),(442,'Jardín',1,5,NULL),(443,'Jenesano',1,15,NULL),(444,'Jericó',1,5,NULL),(445,'Jericó',1,15,NULL),(446,'Jerusalén',1,25,NULL),(447,'Jesús María',1,68,NULL),(448,'Jordán',1,68,NULL),(449,'Juan de Acosta',1,8,NULL),(450,'Junín',1,25,NULL),(451,'Juradó',1,27,NULL),(452,'La Apartada y La Frontera',1,23,NULL),(453,'La Argentina',1,41,NULL),(454,'La Belleza',1,68,NULL),(455,'La Calera',1,25,NULL),(456,'La Capilla',1,15,NULL),(457,'La Ceja',1,5,NULL),(458,'La Celia',1,66,NULL),(459,'La Cruz',1,52,NULL),(460,'La Cumbre',1,76,NULL),(461,'La Dorada',1,17,NULL),(462,'La Esperanza',1,54,NULL),(463,'La Estrella',1,5,NULL),(464,'La Florida',1,52,NULL),(465,'La Gloria',1,20,NULL),(466,'La Jagua de Ibirico',1,20,NULL),(467,'La Jagua del Pilar',1,44,NULL),(468,'La Llanada',1,52,NULL),(469,'La Macarena',1,50,NULL),(470,'La Merced',1,17,NULL),(471,'La Mesa',1,25,NULL),(472,'La Montañita',1,18,NULL),(473,'La Palma',1,25,NULL),(474,'La Paz',1,68,NULL),(475,'La Paz (Robles)',1,20,NULL),(476,'La Peña',1,25,NULL),(477,'La Pintada',1,5,NULL),(478,'La Plata',1,41,NULL),(479,'La Playa',1,54,NULL),(480,'La Primavera',1,99,NULL),(481,'La Salina',1,85,NULL),(482,'La Sierra',1,19,NULL),(483,'La Tebaida',1,63,NULL),(484,'La Tola',1,52,NULL),(485,'La Unión',1,5,NULL),(486,'La Unión',1,52,NULL),(487,'La Unión',1,70,NULL),(488,'La Unión',1,76,NULL),(489,'La Uvita',1,15,NULL),(490,'La Vega',1,19,NULL),(491,'La Vega',1,25,NULL),(492,'La Victoria',1,15,NULL),(493,'La Victoria',1,17,NULL),(494,'La Victoria',1,76,NULL),(495,'La Virginia',1,66,NULL),(496,'Labateca',1,54,NULL),(497,'Labranzagrande',1,15,NULL),(498,'Landázuri',1,68,NULL),(499,'Lebrija',1,68,NULL),(500,'Leiva',1,52,NULL),(501,'Lejanías',1,50,NULL),(502,'Lenguazaque',1,25,NULL),(503,'Leticia',1,91,NULL),(504,'Liborina',1,5,NULL),(505,'Linares',1,52,NULL),(506,'Lloró',1,27,NULL),(507,'Lorica',1,23,NULL),(508,'Los Córdobas',1,23,NULL),(509,'Los Palmitos',1,70,NULL),(510,'Los Patios',1,54,NULL),(511,'Los Santos',1,68,NULL),(512,'Lourdes',1,54,NULL),(513,'Luruaco',1,8,NULL),(514,'Lérida',1,73,NULL),(515,'Líbano',1,73,NULL),(516,'López (Micay)',1,19,NULL),(517,'Macanal',1,15,NULL),(518,'Macaravita',1,68,NULL),(519,'Maceo',1,5,NULL),(520,'Machetá',1,25,NULL),(521,'Madrid',1,25,NULL),(522,'Magangué',1,13,NULL),(523,'Magüi (Payán)',1,52,NULL),(524,'Mahates',1,13,NULL),(525,'Maicao',1,44,NULL),(526,'Majagual',1,70,NULL),(527,'Malambo',1,8,NULL),(528,'Mallama (Piedrancha)',1,52,NULL),(529,'Manatí',1,8,NULL),(530,'Manaure',1,44,NULL),(531,'Manaure Balcón del Cesar',1,20,NULL),(532,'Manizales',1,17,NULL),(533,'Manta',1,25,NULL),(534,'Manzanares',1,17,NULL),(535,'Maní',1,85,NULL),(536,'Mapiripan',1,50,NULL),(537,'Margarita',1,13,NULL),(538,'Marinilla',1,5,NULL),(539,'Maripí',1,15,NULL),(540,'Mariquita',1,73,NULL),(541,'Marmato',1,17,NULL),(542,'Marquetalia',1,17,NULL),(543,'Marsella',1,66,NULL),(544,'Marulanda',1,17,NULL),(545,'María la Baja',1,13,NULL),(546,'Matanza',1,68,NULL),(547,'Medellín',1,5,NULL),(548,'Medina',1,25,NULL),(549,'Medio Atrato',1,27,NULL),(550,'Medio Baudó',1,27,NULL),(551,'Medio San Juan (ANDAGOYA)',1,27,NULL),(552,'Melgar',1,73,NULL),(553,'Mercaderes',1,19,NULL),(554,'Mesetas',1,50,NULL),(555,'Milán',1,18,NULL),(556,'Miraflores',1,15,NULL),(557,'Miraflores',1,95,NULL),(558,'Miranda',1,19,NULL),(559,'Mistrató',1,66,NULL),(560,'Mitú',1,97,NULL),(561,'Mocoa',1,86,NULL),(562,'Mogotes',1,68,NULL),(563,'Molagavita',1,68,NULL),(564,'Momil',1,23,NULL),(565,'Mompós',1,13,NULL),(566,'Mongua',1,15,NULL),(567,'Monguí',1,15,NULL),(568,'Moniquirá',1,15,NULL),(569,'Montebello',1,5,NULL),(570,'Montecristo',1,13,NULL),(571,'Montelíbano',1,23,NULL),(572,'Montenegro',1,63,NULL),(573,'Monteria',1,23,NULL),(574,'Monterrey',1,85,NULL),(575,'Morales',1,13,NULL),(576,'Morales',1,19,NULL),(577,'Morelia',1,18,NULL),(578,'Morroa',1,70,NULL),(579,'Mosquera',1,25,NULL),(580,'Mosquera',1,52,NULL),(581,'Motavita',1,15,NULL),(582,'Moñitos',1,23,NULL),(583,'Murillo',1,73,NULL),(584,'Murindó',1,5,NULL),(585,'Mutatá',1,5,NULL),(586,'Mutiscua',1,54,NULL),(587,'Muzo',1,15,NULL),(588,'Málaga',1,68,NULL),(589,'Nariño',1,5,NULL),(590,'Nariño',1,25,NULL),(591,'Nariño',1,52,NULL),(592,'Natagaima',1,73,NULL),(593,'Nechí',1,5,NULL),(594,'Necoclí',1,5,NULL),(595,'Neira',1,17,NULL),(596,'Neiva',1,41,NULL),(597,'Nemocón',1,25,NULL),(598,'Nilo',1,25,NULL),(599,'Nimaima',1,25,NULL),(600,'Nobsa',1,15,NULL),(601,'Nocaima',1,25,NULL),(602,'Norcasia',1,17,NULL),(603,'Norosí',1,13,NULL),(604,'Novita',1,27,NULL),(605,'Nueva Granada',1,47,NULL),(606,'Nuevo Colón',1,15,NULL),(607,'Nunchía',1,85,NULL),(608,'Nuquí',1,27,NULL),(609,'Nátaga',1,41,NULL),(610,'Obando',1,76,NULL),(611,'Ocamonte',1,68,NULL),(612,'Ocaña',1,54,NULL),(613,'Oiba',1,68,NULL),(614,'Oicatá',1,15,NULL),(615,'Olaya',1,5,NULL),(616,'Olaya Herrera',1,52,NULL),(617,'Onzaga',1,68,NULL),(618,'Oporapa',1,41,NULL),(619,'Orito',1,86,NULL),(620,'Orocué',1,85,NULL),(621,'Ortega',1,73,NULL),(622,'Ospina',1,52,NULL),(623,'Otanche',1,15,NULL),(624,'Ovejas',1,70,NULL),(625,'Pachavita',1,15,NULL),(626,'Pacho',1,25,NULL),(627,'Padilla',1,19,NULL),(628,'Paicol',1,41,NULL),(629,'Pailitas',1,20,NULL),(630,'Paime',1,25,NULL),(631,'Paipa',1,15,NULL),(632,'Pajarito',1,15,NULL),(633,'Palermo',1,41,NULL),(634,'Palestina',1,17,NULL),(635,'Palestina',1,41,NULL),(636,'Palmar',1,68,NULL),(637,'Palmar de Varela',1,8,NULL),(638,'Palmas del Socorro',1,68,NULL),(639,'Palmira',1,76,NULL),(640,'Palmito',1,70,NULL),(641,'Palocabildo',1,73,NULL),(642,'Pamplona',1,54,NULL),(643,'Pamplonita',1,54,NULL),(644,'Pandi',1,25,NULL),(645,'Panqueba',1,15,NULL),(646,'Paratebueno',1,25,NULL),(647,'Pasca',1,25,NULL),(648,'Patía (El Bordo)',1,19,NULL),(649,'Pauna',1,15,NULL),(650,'Paya',1,15,NULL),(651,'Paz de Ariporo',1,85,NULL),(652,'Paz de Río',1,15,NULL),(653,'Pedraza',1,47,NULL),(654,'Pelaya',1,20,NULL),(655,'Pensilvania',1,17,NULL),(656,'Peque',1,5,NULL),(657,'Pereira',1,66,NULL),(658,'Pesca',1,15,NULL),(659,'Peñol',1,5,NULL),(660,'Piamonte',1,19,NULL),(661,'Pie de Cuesta',1,68,NULL),(662,'Piedras',1,73,NULL),(663,'Piendamó',1,19,NULL),(664,'Pijao',1,63,NULL),(665,'Pijiño',1,47,NULL),(666,'Pinchote',1,68,NULL),(667,'Pinillos',1,13,NULL),(668,'Piojo',1,8,NULL),(669,'Pisva',1,15,NULL),(670,'Pital',1,41,NULL),(671,'Pitalito',1,41,1),(672,'Pivijay',1,47,NULL),(673,'Planadas',1,73,NULL),(674,'Planeta Rica',1,23,NULL),(675,'Plato',1,47,NULL),(676,'Policarpa',1,52,NULL),(677,'Polonuevo',1,8,NULL),(678,'Ponedera',1,8,NULL),(679,'Popayán',1,19,NULL),(680,'Pore',1,85,NULL),(681,'Potosí',1,52,NULL),(682,'Pradera',1,76,NULL),(683,'Prado',1,73,NULL),(684,'Providencia',1,52,NULL),(685,'Providencia',1,88,NULL),(686,'Pueblo Bello',1,20,NULL),(687,'Pueblo Nuevo',1,23,NULL),(688,'Pueblo Rico',1,66,NULL),(689,'Pueblorrico',1,5,NULL),(690,'Puebloviejo',1,47,NULL),(691,'Puente Nacional',1,68,NULL),(692,'Puerres',1,52,NULL),(693,'Puerto Asís',1,86,NULL),(694,'Puerto Berrío',1,5,NULL),(695,'Puerto Boyacá',1,15,NULL),(696,'Puerto Caicedo',1,86,NULL),(697,'Puerto Carreño',1,99,NULL),(698,'Puerto Colombia',1,8,NULL),(699,'Puerto Concordia',1,50,NULL),(700,'Puerto Escondido',1,23,NULL),(701,'Puerto Gaitán',1,50,NULL),(702,'Puerto Guzmán',1,86,NULL),(703,'Puerto Leguízamo',1,86,NULL),(704,'Puerto Libertador',1,23,NULL),(705,'Puerto Lleras',1,50,NULL),(706,'Puerto López',1,50,NULL),(707,'Puerto Nare',1,5,NULL),(708,'Puerto Nariño',1,91,NULL),(709,'Puerto Parra',1,68,NULL),(710,'Puerto Rico',1,18,NULL),(711,'Puerto Rico',1,50,NULL),(712,'Puerto Rondón',1,81,NULL),(713,'Puerto Salgar',1,25,NULL),(714,'Puerto Santander',1,54,NULL),(715,'Puerto Tejada',1,19,NULL),(716,'Puerto Triunfo',1,5,NULL),(717,'Puerto Wilches',1,68,NULL),(718,'Pulí',1,25,NULL),(719,'Pupiales',1,52,NULL),(720,'Puracé (Coconuco)',1,19,NULL),(721,'Purificación',1,73,NULL),(722,'Purísima',1,23,NULL),(723,'Pácora',1,17,NULL),(724,'Páez',1,15,NULL),(725,'Páez (Belalcazar)',1,19,NULL),(726,'Páramo',1,68,NULL),(727,'Quebradanegra',1,25,NULL),(728,'Quetame',1,25,NULL),(729,'Quibdó',1,27,NULL),(730,'Quimbaya',1,63,NULL),(731,'Quinchía',1,66,NULL),(732,'Quipama',1,15,NULL),(733,'Quipile',1,25,NULL),(734,'Ragonvalia',1,54,NULL),(735,'Ramiriquí',1,15,NULL),(736,'Recetor',1,85,NULL),(737,'Regidor',1,13,NULL),(738,'Remedios',1,5,NULL),(739,'Remolino',1,47,NULL),(740,'Repelón',1,8,NULL),(741,'Restrepo',1,50,NULL),(742,'Restrepo',1,76,NULL),(743,'Retiro',1,5,NULL),(744,'Ricaurte',1,25,NULL),(745,'Ricaurte',1,52,NULL),(746,'Rio Negro',1,68,NULL),(747,'Rioblanco',1,73,NULL),(748,'Riofrío',1,76,NULL),(749,'Riohacha',1,44,NULL),(750,'Risaralda',1,17,NULL),(751,'Rivera',1,41,NULL),(752,'Roberto Payán (San José)',1,52,NULL),(753,'Roldanillo',1,76,NULL),(754,'Roncesvalles',1,73,NULL),(755,'Rondón',1,15,NULL),(756,'Rosas',1,19,NULL),(757,'Rovira',1,73,NULL),(758,'Ráquira',1,15,NULL),(759,'Río Iró',1,27,NULL),(760,'Río Quito',1,27,NULL),(761,'Río Sucio',1,17,NULL),(762,'Río Viejo',1,13,NULL),(763,'Río de oro',1,20,NULL),(764,'Ríonegro',1,5,NULL),(765,'Ríosucio',1,27,NULL),(766,'Sabana de Torres',1,68,NULL),(767,'Sabanagrande',1,8,NULL),(768,'Sabanalarga',1,5,NULL),(769,'Sabanalarga',1,8,NULL),(770,'Sabanalarga',1,85,NULL),(771,'Sabanas de San Angel (SAN ANGEL)',1,47,NULL),(772,'Sabaneta',1,5,NULL),(773,'Saboyá',1,15,NULL),(774,'Sahagún',1,23,NULL),(775,'Saladoblanco',1,41,NULL),(776,'Salamina',1,17,NULL),(777,'Salamina',1,47,NULL),(778,'Salazar',1,54,NULL),(779,'Saldaña',1,73,NULL),(780,'Salento',1,63,NULL),(781,'Salgar',1,5,NULL),(782,'Samacá',1,15,NULL),(783,'Samaniego',1,52,NULL),(784,'Samaná',1,17,NULL),(785,'Sampués',1,70,NULL),(786,'San Agustín',1,41,NULL),(787,'San Alberto',1,20,NULL),(788,'San Andrés',1,68,NULL),(789,'San Andrés Sotavento',1,23,NULL),(790,'San Andrés de Cuerquía',1,5,NULL),(791,'San Antero',1,23,NULL),(792,'San Antonio',1,73,NULL),(793,'San Antonio de Tequendama',1,25,NULL),(794,'San Benito',1,68,NULL),(795,'San Benito Abad',1,70,NULL),(796,'San Bernardo',1,25,NULL),(797,'San Bernardo',1,52,NULL),(798,'San Bernardo del Viento',1,23,NULL),(799,'San Calixto',1,54,NULL),(800,'San Carlos',1,5,NULL),(801,'San Carlos',1,23,NULL),(802,'San Carlos de Guaroa',1,50,NULL),(803,'San Cayetano',1,25,NULL),(804,'San Cayetano',1,54,NULL),(805,'San Cristobal',1,13,NULL),(806,'San Diego',1,20,NULL),(807,'San Eduardo',1,15,NULL),(808,'San Estanislao',1,13,NULL),(809,'San Fernando',1,13,NULL),(810,'San Francisco',1,5,NULL),(811,'San Francisco',1,25,NULL),(812,'San Francisco',1,86,NULL),(813,'San Gíl',1,68,NULL),(814,'San Jacinto',1,13,NULL),(815,'San Jacinto del Cauca',1,13,NULL),(816,'San Jerónimo',1,5,NULL),(817,'San Joaquín',1,68,NULL),(818,'San José',1,17,NULL),(819,'San José de Miranda',1,68,NULL),(820,'San José de Montaña',1,5,NULL),(821,'San José de Pare',1,15,NULL),(822,'San José de Uré',1,23,NULL),(823,'San José del Fragua',1,18,NULL),(824,'San José del Guaviare',1,95,NULL),(825,'San José del Palmar',1,27,NULL),(826,'San Juan de Arama',1,50,NULL),(827,'San Juan de Betulia',1,70,NULL),(828,'San Juan de Nepomuceno',1,13,NULL),(829,'San Juan de Pasto',1,52,NULL),(830,'San Juan de Río Seco',1,25,NULL),(831,'San Juan de Urabá',1,5,NULL),(832,'San Juan del Cesar',1,44,NULL),(833,'San Juanito',1,50,NULL),(834,'San Lorenzo',1,52,NULL),(835,'San Luis',1,73,NULL),(836,'San Luís',1,5,NULL),(837,'San Luís de Gaceno',1,15,NULL),(838,'San Luís de Palenque',1,85,NULL),(839,'San Marcos',1,70,NULL),(840,'San Martín',1,20,NULL),(841,'San Martín',1,50,NULL),(842,'San Martín de Loba',1,13,NULL),(843,'San Mateo',1,15,NULL),(844,'San Miguel',1,68,NULL),(845,'San Miguel',1,86,NULL),(846,'San Miguel de Sema',1,15,NULL),(847,'San Onofre',1,70,NULL),(848,'San Pablo',1,13,NULL),(849,'San Pablo',1,52,NULL),(850,'San Pablo de Borbur',1,15,NULL),(851,'San Pedro',1,5,NULL),(852,'San Pedro',1,70,NULL),(853,'San Pedro',1,76,NULL),(854,'San Pedro de Cartago',1,52,NULL),(855,'San Pedro de Urabá',1,5,NULL),(856,'San Pelayo',1,23,NULL),(857,'San Rafael',1,5,NULL),(858,'San Roque',1,5,NULL),(859,'San Sebastián',1,19,NULL),(860,'San Sebastián de Buenavista',1,47,NULL),(861,'San Vicente',1,5,NULL),(862,'San Vicente del Caguán',1,18,NULL),(863,'San Vicente del Chucurí',1,68,NULL),(864,'San Zenón',1,47,NULL),(865,'Sandoná',1,52,NULL),(866,'Santa Ana',1,47,NULL),(867,'Santa Bárbara',1,5,NULL),(868,'Santa Bárbara',1,68,NULL),(869,'Santa Bárbara (Iscuandé)',1,52,NULL),(870,'Santa Bárbara de Pinto',1,47,NULL),(871,'Santa Catalina',1,13,NULL),(872,'Santa Fé de Antioquia',1,5,NULL),(873,'Santa Genoveva de Docorodó',1,27,NULL),(874,'Santa Helena del Opón',1,68,NULL),(875,'Santa Isabel',1,73,NULL),(876,'Santa Lucía',1,8,NULL),(877,'Santa Marta',1,47,NULL),(878,'Santa María',1,15,NULL),(879,'Santa María',1,41,NULL),(880,'Santa Rosa',1,13,NULL),(881,'Santa Rosa',1,19,NULL),(882,'Santa Rosa de Cabal',1,66,NULL),(883,'Santa Rosa de Osos',1,5,NULL),(884,'Santa Rosa de Viterbo',1,15,NULL),(885,'Santa Rosa del Sur',1,13,NULL),(886,'Santa Rosalía',1,99,NULL),(887,'Santa Sofía',1,15,NULL),(888,'Santana',1,15,NULL),(889,'Santander de Quilichao',1,19,NULL),(890,'Santiago',1,54,NULL),(891,'Santiago',1,86,NULL),(892,'Santo Domingo',1,5,NULL),(893,'Santo Tomás',1,8,NULL),(894,'Santuario',1,5,NULL),(895,'Santuario',1,66,NULL),(896,'Sapuyes',1,52,NULL),(897,'Saravena',1,81,NULL),(898,'Sardinata',1,54,NULL),(899,'Sasaima',1,25,NULL),(900,'Sativanorte',1,15,NULL),(901,'Sativasur',1,15,NULL),(902,'Segovia',1,5,NULL),(903,'Sesquilé',1,25,NULL),(904,'Sevilla',1,76,NULL),(905,'Siachoque',1,15,NULL),(906,'Sibaté',1,25,NULL),(907,'Sibundoy',1,86,NULL),(908,'Silos',1,54,NULL),(909,'Silvania',1,25,NULL),(910,'Silvia',1,19,NULL),(911,'Simacota',1,68,NULL),(912,'Simijaca',1,25,NULL),(913,'Simití',1,13,NULL),(914,'Sincelejo',1,70,NULL),(915,'Sincé',1,70,NULL),(916,'Sipí',1,27,NULL),(917,'Sitionuevo',1,47,NULL),(918,'Soacha',1,25,NULL),(919,'Soatá',1,15,NULL),(920,'Socha',1,15,NULL),(921,'Socorro',1,68,NULL),(922,'Socotá',1,15,NULL),(923,'Sogamoso',1,15,NULL),(924,'Solano',1,18,NULL),(925,'Soledad',1,8,NULL),(926,'Solita',1,18,NULL),(927,'Somondoco',1,15,NULL),(928,'Sonsón',1,5,NULL),(929,'Sopetrán',1,5,NULL),(930,'Soplaviento',1,13,NULL),(931,'Sopó',1,25,NULL),(932,'Sora',1,15,NULL),(933,'Soracá',1,15,NULL),(934,'Sotaquirá',1,15,NULL),(935,'Sotara (Paispamba)',1,19,NULL),(936,'Sotomayor (Los Andes)',1,52,NULL),(937,'Suaita',1,68,NULL),(938,'Suan',1,8,NULL),(939,'Suaza',1,41,NULL),(940,'Subachoque',1,25,NULL),(941,'Sucre',1,19,NULL),(942,'Sucre',1,68,NULL),(943,'Sucre',1,70,NULL),(944,'Suesca',1,25,NULL),(945,'Supatá',1,25,NULL),(946,'Supía',1,17,NULL),(947,'Suratá',1,68,NULL),(948,'Susa',1,25,NULL),(949,'Susacón',1,15,NULL),(950,'Sutamarchán',1,15,NULL),(951,'Sutatausa',1,25,NULL),(952,'Sutatenza',1,15,NULL),(953,'Suárez',1,19,NULL),(954,'Suárez',1,73,NULL),(955,'Sácama',1,85,NULL),(956,'Sáchica',1,15,NULL),(957,'Tabio',1,25,NULL),(958,'Tadó',1,27,NULL),(959,'Talaigua Nuevo',1,13,NULL),(960,'Tamalameque',1,20,NULL),(961,'Tame',1,81,NULL),(962,'Taminango',1,52,NULL),(963,'Tangua',1,52,NULL),(964,'Taraira',1,97,NULL),(965,'Tarazá',1,5,NULL),(966,'Tarqui',1,41,NULL),(967,'Tarso',1,5,NULL),(968,'Tasco',1,15,NULL),(969,'Tauramena',1,85,NULL),(970,'Tausa',1,25,NULL),(971,'Tello',1,41,NULL),(972,'Tena',1,25,NULL),(973,'Tenerife',1,47,NULL),(974,'Tenjo',1,25,NULL),(975,'Tenza',1,15,NULL),(976,'Teorama',1,54,NULL),(977,'Teruel',1,41,NULL),(978,'Tesalia',1,41,NULL),(979,'Tibacuy',1,25,NULL),(980,'Tibaná',1,15,NULL),(981,'Tibasosa',1,15,NULL),(982,'Tibirita',1,25,NULL),(983,'Tibú',1,54,NULL),(984,'Tierralta',1,23,NULL),(985,'Timaná',1,41,NULL),(986,'Timbiquí',1,19,NULL),(987,'Timbío',1,19,NULL),(988,'Tinjacá',1,15,NULL),(989,'Tipacoque',1,15,NULL),(990,'Tiquisio (Puerto Rico)',1,13,NULL),(991,'Titiribí',1,5,NULL),(992,'Toca',1,15,NULL),(993,'Tocaima',1,25,NULL),(994,'Tocancipá',1,25,NULL),(995,'Toguí',1,15,NULL),(996,'Toledo',1,5,NULL),(997,'Toledo',1,54,NULL),(998,'Tolú',1,70,NULL),(999,'Tolú Viejo',1,70,NULL),(1000,'Tona',1,68,NULL),(1001,'Topagá',1,15,NULL),(1002,'Topaipí',1,25,NULL),(1003,'Toribío',1,19,NULL),(1004,'Toro',1,76,NULL),(1005,'Tota',1,15,NULL),(1006,'Totoró',1,19,NULL),(1007,'Trinidad',1,85,NULL),(1008,'Trujillo',1,76,NULL),(1009,'Tubará',1,8,NULL),(1010,'Tuchín',1,23,NULL),(1011,'Tulúa',1,76,NULL),(1012,'Tumaco',1,52,NULL),(1013,'Tunja',1,15,NULL),(1014,'Tunungua',1,15,NULL),(1015,'Turbaco',1,13,NULL),(1016,'Turbaná',1,13,NULL),(1017,'Turbo',1,5,NULL),(1018,'Turmequé',1,15,NULL),(1019,'Tuta',1,15,NULL),(1020,'Tutasá',1,15,NULL),(1021,'Támara',1,85,NULL),(1022,'Támesis',1,5,NULL),(1023,'Túquerres',1,52,NULL),(1024,'Ubalá',1,25,NULL),(1025,'Ubaque',1,25,NULL),(1026,'Ubaté',1,25,NULL),(1027,'Ulloa',1,76,NULL),(1028,'Une',1,25,NULL),(1029,'Unguía',1,27,NULL),(1030,'Unión Panamericana (ÁNIMAS)',1,27,NULL),(1031,'Uramita',1,5,NULL),(1032,'Uribe',1,50,NULL),(1033,'Uribia',1,44,NULL),(1034,'Urrao',1,5,NULL),(1035,'Urumita',1,44,NULL),(1036,'Usiacuri',1,8,NULL),(1037,'Valdivia',1,5,NULL),(1038,'Valencia',1,23,NULL),(1039,'Valle de San José',1,68,NULL),(1040,'Valle de San Juan',1,73,NULL),(1041,'Valle del Guamuez',1,86,NULL),(1042,'Valledupar',1,20,NULL),(1043,'Valparaiso',1,5,NULL),(1044,'Valparaiso',1,18,NULL),(1045,'Vegachí',1,5,NULL),(1046,'Venadillo',1,73,NULL),(1047,'Venecia',1,5,NULL),(1048,'Venecia (Ospina Pérez)',1,25,NULL),(1049,'Ventaquemada',1,15,NULL),(1050,'Vergara',1,25,NULL),(1051,'Versalles',1,76,NULL),(1052,'Vetas',1,68,NULL),(1053,'Viani',1,25,NULL),(1054,'Vigía del Fuerte',1,5,NULL),(1055,'Vijes',1,76,NULL),(1056,'Villa Caro',1,54,NULL),(1057,'Villa Rica',1,19,NULL),(1058,'Villa de Leiva',1,15,NULL),(1059,'Villa del Rosario',1,54,NULL),(1060,'Villagarzón',1,86,NULL),(1061,'Villagómez',1,25,NULL),(1062,'Villahermosa',1,73,NULL),(1063,'Villamaría',1,17,NULL),(1064,'Villanueva',1,13,NULL),(1065,'Villanueva',1,44,NULL),(1066,'Villanueva',1,68,NULL),(1067,'Villanueva',1,85,NULL),(1068,'Villapinzón',1,25,NULL),(1069,'Villarrica',1,73,NULL),(1070,'Villavicencio',1,50,NULL),(1071,'Villavieja',1,41,NULL),(1072,'Villeta',1,25,NULL),(1073,'Viotá',1,25,NULL),(1074,'Viracachá',1,15,NULL),(1075,'Vista Hermosa',1,50,NULL),(1076,'Viterbo',1,17,NULL),(1077,'Vélez',1,68,NULL),(1078,'Yacopí',1,25,NULL),(1079,'Yacuanquer',1,52,NULL),(1080,'Yaguará',1,41,NULL),(1081,'Yalí',1,5,NULL),(1082,'Yarumal',1,5,NULL),(1083,'Yolombó',1,5,NULL),(1084,'Yondó (Casabe)',1,5,NULL),(1085,'Yopal',1,85,NULL),(1086,'Yotoco',1,76,NULL),(1087,'Yumbo',1,76,NULL),(1088,'Zambrano',1,13,NULL),(1089,'Zapatoca',1,68,NULL),(1090,'Zapayán (PUNTA DE PIEDRAS)',1,47,NULL),(1091,'Zaragoza',1,5,NULL),(1092,'Zarzal',1,76,NULL),(1093,'Zetaquirá',1,15,NULL),(1094,'Zipacón',1,25,NULL),(1095,'Zipaquirá',1,25,NULL),(1096,'Zona Bananera (PRADO - SEVILLA)',1,47,NULL),(1097,'Ábrego',1,54,NULL),(1098,'Íquira',1,41,NULL),(1099,'Úmbita',1,15,NULL),(1100,'Útica',1,25,NULL);
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oracion`
--

DROP TABLE IF EXISTS `oracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oracion` (
  `id_Peticion` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `motivo` varchar(455) DEFAULT NULL,
  `Admin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Peticion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oracion`
--

LOCK TABLES `oracion` WRITE;
/*!40000 ALTER TABLE `oracion` DISABLE KEYS */;
INSERT INTO `oracion` VALUES (1,'tata','Por toda mi familia ,que Dios este siempre con nosotros',NULL),(3,'juan','por mi familia',NULL),(4,'Angela','por mi esposo',NULL),(5,'Alex','muchas bendiciones',NULL);
/*!40000 ALTER TABLE `oracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_p` varchar(45) NOT NULL,
  `identificacion_p` bigint(45) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `rol_per` varchar(45) DEFAULT NULL,
  `disipulado` varchar(45) DEFAULT NULL,
  `bautizado` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_persona`,`identificacion_p`),
  UNIQUE KEY `identificacion_p_UNIQUE` (`identificacion_p`)
) ENGINE=InnoDB AUTO_INCREMENT=1156 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'pedro valle',10655434,'cra 1 #6-87',3165434,'2020-06-07','Visitante','No','No','',41,671),(2,'pablo martinez',655434,'cra 4 #4-9',3141234,'1990-09-12','Visitante','No','No','',44,525),(3,'Sandra perez',434557,'b/quilla',3343546,'1987-03-11','Visitante','No','No','C:fakepathdepositphotos_327115628-stock-illus',NULL,NULL),(4,'Sule parra',789345,'otra',687678,'2021-08-13','Visitante','No','No','C:fakepathimages.jpg',NULL,NULL),(5,'Paola castro',68594,'4 valle',261603,'2021-09-24','Visitante','No','Si','C:fakepathdeliciosa-lasagna-para-tus-eventos-',0,0),(6,'Nohora Orejarena',345623,'b/quilla',2147483647,'1967-07-08','Miembro','Si','Si','C:fakepathcamisa 1.jpg',54,1089),(7,'Natii',12346543,'cra 30#12-87',312543754,'2008-09-16','Miembro','No','No','',13,171),(15,'Jorge Andres',76543,'ef234',2132345678,'1985-06-16','Visitante','No','No','',NULL,NULL),(1064,'Tatiana',3444567,'calle 25',3465432,NULL,'1Aprendiz',NULL,NULL,NULL,NULL,NULL),(1066,'Ivan Orejarena',1065583,'cal 3 #5-65',315662,NULL,'1Aprendiz',NULL,NULL,NULL,NULL,NULL),(1067,'Allison Orejarena',1076543,'calle 7 # 5-76',32121222,NULL,'4Visitante',NULL,NULL,NULL,NULL,NULL),(1068,'Ivan Orejarena',9876555,'quilla',2145555,'1986-09-26','1Aprendiz',NULL,NULL,NULL,NULL,NULL),(1069,'Claudia Moya',55555,'valledupar',8888888,'1982-12-03','Visitante',NULL,NULL,NULL,NULL,NULL),(1070,'Duver uni',88776544,'pitalito',3216789,'2021-03-23','Visitante',NULL,NULL,NULL,NULL,NULL),(1072,'Roberto Orejarena',10000,'cA987',2147483647,'1975-06-12','Visitante',NULL,NULL,NULL,NULL,NULL),(1073,'Oscar',20000,'cA987',55555,'1975-03-31','Visitante',NULL,NULL,NULL,NULL,NULL),(1074,'Alexander',333333,'casa',666666,'1989-06-12','Visitante',NULL,NULL,NULL,NULL,NULL),(1101,'peter',232323,'ca',11111,'2000-09-23','Miembro',NULL,NULL,NULL,NULL,NULL),(1102,'',0,'',0,'0000-00-00','Selecionar...',NULL,NULL,NULL,NULL,NULL),(1103,'juan ',6666,'hghg',77777,'2020-08-12','Visitante',NULL,NULL,NULL,NULL,NULL),(1111,'Maria Oz',99987,'34b',90785,'1987-06-09','Miembro',NULL,NULL,NULL,NULL,NULL),(1112,'Herney Samboni',1087656544,'calle 7 # 5-76',64535,'1990-06-09','Visitante',NULL,NULL,NULL,NULL,NULL),(1113,'Mirian',8765222,'car',99,'1986-11-23','Miembro',NULL,NULL,NULL,NULL,NULL),(1114,'Dora Cabrera',12345678,'clle 2',6543,'1980-08-12','Visitante',NULL,NULL,NULL,NULL,NULL),(1115,'Horacio Acevedo',232344,'valle',88766,'1967-06-05','Visitante',NULL,NULL,NULL,NULL,NULL),(1116,'Ricardo Burgos',1083243,'cali',300123,'1988-06-05','Visitante',NULL,NULL,NULL,NULL,NULL),(1117,'Kevin Parejo',111111,'quilla',77777,'1989-06-05','Visitante',NULL,NULL,NULL,NULL,NULL),(1118,'Natii Orejarena',13222,'huila',444444,'2008-06-10','Miembro',NULL,NULL,NULL,NULL,NULL),(1122,'Mercedes Orejarena Carreño',4723555,'valledupar',2147483647,'1967-09-06','Visitante','Si','No',NULL,NULL,NULL),(1123,'Roberto Orejarena',764444,'vallep',312999000,'1969-06-02','Visitante','Si','Si',NULL,NULL,NULL),(1124,'Alexander Mercado',132344433,'otros',9887840,'1988-09-09','Visitante','No','No','C:fakepathpersona con una bellesa singular.pn',NULL,NULL),(1150,'porsia',4456778,'catyujhg',9854567,'1987-09-11','Visitante','No','No','undefined',8,88),(1151,'Jorge Andres perez',9777554,'bis 45-98',45678765,'1967-03-12','Visitante','No','No','undefined',11,107),(1152,'pedro panza',126543,'cra 4 #4-9',56789,'1999-09-23','Visitante','No','No','undefined',13,171),(1153,'pruebas 55',433366,'cra 5',5678788,'2000-08-23','Visitante','No','No','[object File]',20,8),(1154,'pppppppp',4567987,'cra 4 #4-9',9880000,'1999-12-12','Visitante','No','No','[object File]',5,547),(1155,'iuytrefg',34567,'cra 4 78-9',45678,'2000-09-09','Visitante','No','No','[object HTMLInputElement]',8,88);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `identificacion_per` int(11) NOT NULL,
  `nombre_per` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contraseña` varchar(25) NOT NULL,
  PRIMARY KEY (`identificacion_per`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (888,'juan','juan','222'),(2323,'ivan','111','111'),(3072018,'Isabella','isa03','0307');
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

-- Dump completed on 2021-10-05 18:38:17
