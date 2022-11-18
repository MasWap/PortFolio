-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.4.10-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour bdd_ppe_refonte
CREATE DATABASE IF NOT EXISTS `bdd_ppe_refonte` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bdd_ppe_refonte`;

-- Listage de la structure de la table bdd_ppe_refonte. articles
CREATE TABLE IF NOT EXISTS `articles` (
  `idArticle` int(11) NOT NULL DEFAULT 0,
  `libelleArticle` char(50) DEFAULT NULL,
  `catArticle` int(11) DEFAULT NULL,
  `cheminImage` char(50) DEFAULT NULL,
  `prixArticle` float DEFAULT NULL,
  PRIMARY KEY (`idArticle`),
  KEY `catArticle` (`catArticle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table bdd_ppe_refonte.articles : 3 rows
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`idArticle`, `libelleArticle`, `catArticle`, `cheminImage`, `prixArticle`) VALUES
	(1, 'Ordinateur', 1, 'ordigamer_1.jpg', 4598),
	(2, 'Espion', 3, 'espion_2.jpg', 500),
	(3, 'Editeur de Text', 2, 'texteditor.jpg', 150.99);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- Listage de la structure de la table bdd_ppe_refonte. categories
CREATE TABLE IF NOT EXISTS `categories` (
  `idCategorie` int(11) NOT NULL,
  `libelleCategorie` char(50) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table bdd_ppe_refonte.categories : 3 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`idCategorie`, `libelleCategorie`) VALUES
	(1, 'Hardware'),
	(2, 'Logiciels'),
	(3, 'Hacking');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Listage de la structure de la table bdd_ppe_refonte. client
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `prenomClient` char(15) NOT NULL DEFAULT '0',
  `nomClient` char(15) NOT NULL DEFAULT '',
  `emailClient` char(30) NOT NULL DEFAULT '0',
  `loginClient` char(50) DEFAULT NULL,
  `mdpClient` char(50) NOT NULL DEFAULT '0',
  `adresseClient` char(30) NOT NULL DEFAULT '0',
  `telClient` char(15) NOT NULL DEFAULT '0',
  `paysClient` char(15) DEFAULT NULL,
  `isRegistered` int(11) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Listage des données de la table bdd_ppe_refonte.client : 3 rows
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`idClient`, `prenomClient`, `nomClient`, `emailClient`, `loginClient`, `mdpClient`, `adresseClient`, `telClient`, `paysClient`, `isRegistered`) VALUES
	(1, 'Lilian', 'Layrac', 'lilian.layrac@gmail.com', 'loginLilian', 'NOUVEAU PASSE DE TEST', '23 AVValery Giscard d\'Estaing', '0767914331', 'France', 1),
	(2, 'Hugo', 'Robin', 'hugo.robin@gmail.com', 'loginHugo', 'mdpHugo', '28 Rue Du Père Pierre', '0606060606', 'France', 1),
	(9, 'Paco', 'Castillo', 'paco.castillo@baylifemail.com', 'Pac', 'pac34', 'Barcelone', '0458745215', 'MX', 1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Listage de la structure de la table bdd_ppe_refonte. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` char(50) DEFAULT NULL,
  `passe` char(255) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Listage des données de la table bdd_ppe_refonte.utilisateur : 2 rows
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` (`id`, `login`, `passe`, `email`, `isAdmin`) VALUES
	(1, 'grandChef', 'passeGrandChef', 'grandchef@sio.net', 1),
	(2, 'petitChef', 'passePetitChef', 'petitchef@sio.net', 0);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
