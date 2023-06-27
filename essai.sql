/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.33-0ubuntu0.22.04.2 : Database - global_business
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`global_business` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

/*Table structure for table `Clients` */

DROP TABLE IF EXISTS `Clients`;

CREATE TABLE `Clients` (
  `id` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `Clients` */

/*Table structure for table `Commandes` */

DROP TABLE IF EXISTS `Commandes`;

CREATE TABLE `Commandes` (
  `id` int NOT NULL,
  `date_commande` date NOT NULL,
  `client_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite_commandee` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `produit_id` (`produit_id`),
  CONSTRAINT `Commandes_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Clients` (`id`),
  CONSTRAINT `Commandes_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `Produits` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `Commandes` */

/*Table structure for table `Factures` */

DROP TABLE IF EXISTS `Factures`;

CREATE TABLE `Factures` (
  `id` int NOT NULL,
  `date_facture` date NOT NULL,
  `client_id` int NOT NULL,
  `montant_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `Factures_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `Factures` */

/*Table structure for table `Produits` */

DROP TABLE IF EXISTS `Produits`;

CREATE TABLE `Produits` (
  `id` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text,
  `prix` decimal(10,2) NOT NULL,
  `quantite_stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `Produits` */

/*Table structure for table `Utilisateurs` */

DROP TABLE IF EXISTS `Utilisateurs`;

CREATE TABLE `Utilisateurs` (
  `id` int NOT NULL,
  `nom_utilisateur` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` enum('employe','administrateur') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `Utilisateurs` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
