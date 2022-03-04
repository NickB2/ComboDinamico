/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.13-MariaDB : Database - ejemplo_1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ejemplo_1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ejemplo_1`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

insert  into `categorias`(`id`,`desc`) values 
(1,'Accesorios'),
(2,'Perifericos'),
(3,'Impresion'),
(4,'Componentes de PC');

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `marcas` */

insert  into `marcas`(`id`,`desc`) values 
(1,'HP'),
(2,'Logitech'),
(3,'MSI'),
(4,'Asus'),
(5,'Intel'),
(6,'AMD'),
(7,'Verbatim'),
(8,'Dell'),
(9,'Genius'),
(10,'Brother'),
(11,'Xerox'),
(12,'Creality'),
(13,'Hellbot'),
(14,'Prusa'),
(15,'Sentey'),
(16,'Thermaltake'),
(17,'EVGA'),
(18,'Corsair'),
(19,'Cooler Master'),
(20,'Gigabyte'),
(21,'Crucial'),
(22,'Kingston'),
(23,'ADATA'),
(24,'BLUE'),
(25,'Fifine');

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(100) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `id_subcategoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_subcategoria` (`id_subcategoria`),
  KEY `id_modelo` (`id_marca`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id`),
  CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `productos` */

insert  into `productos`(`id`,`desc`,`precio`,`id_marca`,`id_subcategoria`) values 
(1,'Steel Nitro Power 550W',5999,15,9),
(2,'MWE Bronze 750W',16821,19,9),
(3,'P650B 650W',13219,20,9),
(4,'GB-P450B 450W',5690,20,9),
(5,'Smart RGB 700W',13235,16,9),
(6,'Ryzen 7 5700G',54899,6,10),
(7,'Core i5-10400F',23899,5,10),
(8,'Core i3-10100F',14725,5,10),
(9,'Ryzen 5 5600G',39112,6,10),
(10,'Ryzen 5 5600X',45999,6,10),
(11,'Celeron G5905',12474,5,10),
(12,'8GB 2666 MHz',6990,21,11),
(13,'8GB 2400 MHz LPX Negro',6298,18,11),
(14,'Value RAM 4GB 2666 MHz',3094,22,11),
(15,'16GB 2666 MHz',15999,21,11),
(16,'S100 TG',8499,16,12),
(17,'V200 TG',8099,16,12),
(18,'H200 TG',7890,16,12),
(19,'X10',4699,15,12),
(20,'S20',5499,15,12),
(21,'Q300I',7995,19,12),
(22,'Q500I',8299,19,12),
(23,'K501I',10999,19,12),
(24,'Ender 3-Pro',49761,12,2),
(25,'Ender 3',35299,12,2),
(26,'Ender 3 V2',54847,12,2),
(27,'H111',1279,2,3),
(28,'H390',4485,2,3),
(29,'H220S',3499,1,3),
(30,'H200',3490,1,3),
(31,'K669',6599,25,4),
(32,'K730',5499,25,4),
(33,'Snowball',7499,24,4),
(34,'Snowball Ice',6990,24,4),
(35,'Yeti Nano',13299,24,4),
(36,'Yeticaster',32190,24,4),
(37,'G203',2749,2,5),
(38,'G305',3990,2,5),
(39,'DX-110',486,9,5),
(40,'NX-7000',700,9,5),
(41,'M55 RGB PRO',4299,18,5),
(42,'K380',3898,2,6),
(43,'K400',2536,2,6),
(44,'Slimstar 126',1239,9,6),
(45,'SK650',27400,19,6),
(46,'MK110',5395,19,6);

/*Table structure for table `subcategorias` */

DROP TABLE IF EXISTS `subcategorias`;

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(80) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `subcategorias` */

insert  into `subcategorias`(`id`,`desc`,`id_categoria`) values 
(1,'Impresoras',3),
(2,'Impresoras 3D',3),
(3,'Auriculares',1),
(4,'Microfonos',1),
(5,'Mouse',2),
(6,'Teclados',2),
(9,'Fuente de alimentacion',4),
(10,'Procesadores',4),
(11,'Memorias RAM',4),
(12,'Gabinetes',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
