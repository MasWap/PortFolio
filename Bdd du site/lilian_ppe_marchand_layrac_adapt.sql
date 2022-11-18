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


-- Listage de la structure de la base pour lilian_ppe_marchand_layrac_adapt
CREATE DATABASE IF NOT EXISTS `lilian_ppe_marchand_layrac_adapt` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lilian_ppe_marchand_layrac_adapt`;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac_adapt. !DeleteProduit
DELIMITER //
CREATE PROCEDURE `!DeleteProduit`(
	IN `ParamIdProduit` INT
)
BEGIN

	DELETE FROM Produit WHERE (idProduit = ParamIdProduit);

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac_adapt. !GetAllCommande
DELIMITER //
CREATE PROCEDURE `!GetAllCommande`()
BEGIN

	SELECT * FROM commande;

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac_adapt. !GetCAbyProduit(NumProd int)
DELIMITER //
CREATE PROCEDURE `!GetCAbyProduit(NumProd int)`()
BEGIN

	SELECT idProduit AS Numéro_Produit, (QteStockProduit * PrixHTProduit) AS CA_Produit
	FROM produit
	ORDER BY CA_Produit DESC;

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac_adapt. !GetCommandeById
DELIMITER //
CREATE PROCEDURE `!GetCommandeById`(
	IN `ParamIdCommande` INT
)
BEGIN

SELECT	*
FROM commande
WHERE idCommande = ParamIdCommande;

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac_adapt. !GetCommandesByClient(NumCli int)
DELIMITER //
CREATE PROCEDURE `!GetCommandesByClient(NumCli int)`(
	IN `numClient` INT
)
BEGIN

	SELECT idCommande AS Numéro_Commande, idClient AS Numéro_Client
	FROM commande, client
	WHERE commande.idCli = client.idClient;
	
END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac_adapt. !GetCommandesByPeriode Entrez jour désiré
DELIMITER //
CREATE PROCEDURE `!GetCommandesByPeriode Entrez jour désiré`(
	IN `DateDeclare` CHAR(10)
)
BEGIN

SELECT idCommande, DateCommande
FROM commande
WHERE DateCommande LIKE CONCAT(DateDeclare, '/', '01/2020');

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac_adapt. !GetInfoProduit
DELIMITER //
CREATE PROCEDURE `!GetInfoProduit`()
    COMMENT 'Consulter les produits'
BEGIN

	SELECT * FROM produit;

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac_adapt. !GetProduitsByCommande
DELIMITER //
CREATE PROCEDURE `!GetProduitsByCommande`()
BEGIN

SELECT LibelleProduit, QteStockProduit, LibelleCategorie  
                                      FROM Produit, Fournisseur, Categorie, lignedecommande
                                      WHERE Categorie.idCategorie = produit.idCat 
                                      AND Fournisseur.idFournisseur = Produit.idFourn
                                      AND LignedeCommande.idCommande = Produit.idProduit
                                      AND LignedeCommande.idCommande =" & idcom & """ ;

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac_adapt. !InsertClient
DELIMITER //
CREATE PROCEDURE `!InsertClient`(
	IN `ParamIdClient` INT,
	IN `ParamNomClient` CHAR(50),
	IN `ParamPrenomClient` CHAR(50),
	IN `ParamAdRueClient` CHAR(50),
	IN `ParamAdCpClient` INT,
	IN `ParamAdVilleClient` CHAR(50)
)
BEGIN

INSERT INTO client(idClient, NomClient, PrenomClient, AdRueClient, AdCpClient, AdVilleClient)  VALUES(ParamIdclient, ParamNomClient, ParamPrenomClient, ParamAdRueClient, ParamAdCpClient, ParamAdVilleClient);

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac_adapt. !RechercheClient
DELIMITER //
CREATE PROCEDURE `!RechercheClient`(
	IN `Critere1` CHAR(20),
	IN `Critere2` CHAR(20)
)
BEGIN

	SELECT idClient, nomClient, prenomClient
	FROM Client
	WHERE nomClient LIKE CONCAT('%',Critere1,'%')
	OR prenomClient LIKE CONCAT('%',critere2,'%');

END//
DELIMITER ;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. avisclient
CREATE TABLE IF NOT EXISTS `avisclient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` char(50) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `avis` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.avisclient : 16 rows
/*!40000 ALTER TABLE `avisclient` DISABLE KEYS */;
INSERT INTO `avisclient` (`id`, `nom`, `email`, `avis`) VALUES
	(1, 'Lilian', 'lilian.layrac@gmail.com', 'dsfsdfdsff'),
	(7, 'Frank', 'frank@gmail.com', 'Bonjour, ce site est cool'),
	(21, 'dfsdf', 'sdfsdf', 'sdfsf'),
	(20, 'qsdqsd', 'qsdqsd', 'qsdqsd'),
	(19, 'qsdqsd', 'qsdqsd', 'qsdqsd'),
	(18, 'sdfsdfsdf', 'sdfsdf', 'sdfsdfsdf'),
	(22, 'dfsdf', 'sdfsdf', 'sdfsf'),
	(23, '', '', ''),
	(24, '', '', ''),
	(25, '', '', ''),
	(26, '', '', ''),
	(27, '', '', ''),
	(28, '', '', ''),
	(29, '', '', ''),
	(30, 'sqd', 'qsd', 'qsd'),
	(31, 'Jaque', 'jaque.test@gmail.com', 'Salut ton site est cool');
/*!40000 ALTER TABLE `avisclient` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(11) NOT NULL,
  `LibelleCategorie` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.categorie : ~6 rows (environ)
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` (`idCategorie`, `LibelleCategorie`) VALUES
	(1, 'Materiel'),
	(2, 'Logiciel'),
	(3, 'Service'),
	(4, 'Documentation'),
	(5, 'Hardware'),
	(6, 'Hacking');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. client
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `NomClient` varchar(100) DEFAULT '0',
  `PrenomClient` varchar(45) DEFAULT '0',
  `AdRueClient` varchar(150) DEFAULT '0',
  `AdCpClient` int(11) DEFAULT NULL,
  `AdVilleClient` varchar(100) DEFAULT NULL,
  `emailClient` varchar(30) DEFAULT '0',
  `loginClient` varchar(50) DEFAULT NULL,
  `mdpClient` varchar(50) DEFAULT '0',
  `telClient` varchar(15) DEFAULT '0',
  `paysClient` varchar(15) DEFAULT NULL,
  `isRegistered` int(11) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.client : ~4 rows (environ)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`idClient`, `NomClient`, `PrenomClient`, `AdRueClient`, `AdCpClient`, `AdVilleClient`, `emailClient`, `loginClient`, `mdpClient`, `telClient`, `paysClient`, `isRegistered`) VALUES
	(4, 'NOMTest', 'PRENOMTest', '25 rue du test', NULL, NULL, 'email.test@gmail.com', 'loginTest', 'passeTest', '0454875412', 'BO', 1),
	(12, 'Jack', 'Jack', 'kjskjsdkj', NULL, NULL, 'jack@gmail.com', 'login', 'password', '0645875412', 'FR', 1),
	(13, 'fqdsfdsff', 'sdfsdfdsf', 'sdfsdf', NULL, NULL, 'sdfsdfdsf', 'sdfsdf', 'sdfsdf', '0645872365', 'NP', 1),
	(19, 'Admin', 'admin', 'admin adress', NULL, NULL, 'Admin@gmail.com', 'admin', 'admin', '0606060606', 'ES', 1),
	(41, 'lkj', 'lkj', 'lkj', NULL, NULL, 'jkjdsdf@gmail.com', 'lkj', 'lkj', 'lkj', 'AF', 1),
	(42, 'Latable', 'Basse', 'la table 24 basse', NULL, NULL, 'la.tablebasse@gmail.com', 'TableBasse', '123', '0606060606', 'AR', 1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. commande
CREATE TABLE IF NOT EXISTS `commande` (
  `idCommande` int(11) NOT NULL,
  `DateCommande` date DEFAULT NULL,
  `idCli` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCommande`),
  KEY `FKCli` (`idCli`),
  CONSTRAINT `FKCli` FOREIGN KEY (`idCli`) REFERENCES `client` (`idClient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.commande : ~8 rows (environ)
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` (`idCommande`, `DateCommande`, `idCli`) VALUES
	(1, '2021-11-26', 41),
	(2, '2022-11-26', 13),
	(3, '2021-11-26', 4),
	(4, '2022-11-26', 12),
	(5, '2024-11-26', 19),
	(6, '2021-11-26', 12),
	(7, '0000-00-00', 13),
	(8, '0000-00-00', 12),
	(9, '0000-00-00', 13),
	(10, '0000-00-00', 12);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. fournisseur
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `idFournisseur` int(11) NOT NULL,
  `NomFournisseur` varchar(100) DEFAULT NULL,
  `VilleFournisseur` varchar(100) DEFAULT NULL,
  `CPFournisseur` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.fournisseur : ~3 rows (environ)
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` (`idFournisseur`, `NomFournisseur`, `VilleFournisseur`, `CPFournisseur`) VALUES
	(1, 'DELL Computers', 'Montpellier', 34000),
	(2, 'IBM', 'Montpellier', 34000),
	(3, 'RC Consulting', 'Sérignan', 34500);
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. lignedecommande
CREATE TABLE IF NOT EXISTS `lignedecommande` (
  `idCommande` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `QuantiteCom` int(11) NOT NULL,
  PRIMARY KEY (`idCommande`,`idProduit`),
  KEY `FKCom` (`idCommande`),
  KEY `FKProd` (`idProduit`),
  CONSTRAINT `FKCom` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKProd` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.lignedecommande : ~2 rows (environ)
/*!40000 ALTER TABLE `lignedecommande` DISABLE KEYS */;
INSERT INTO `lignedecommande` (`idCommande`, `idProduit`, `QuantiteCom`) VALUES
	(1, 8, 2),
	(2, 5, 5);
/*!40000 ALTER TABLE `lignedecommande` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. produit
CREATE TABLE IF NOT EXISTS `produit` (
  `idProduit` int(11) NOT NULL,
  `LibelleProduit` varchar(100) DEFAULT NULL,
  `PrixHTProduit` float(6,2) DEFAULT NULL,
  `QteStockProduit` int(11) DEFAULT NULL,
  `idFourn` int(11) DEFAULT NULL,
  `idCat` int(11) DEFAULT NULL,
  `cheminImage` char(50) DEFAULT 'interrogation.jpg',
  `descriptionImage` varchar(500) DEFAULT 'Déscription non assignée',
  `isImportant` int(11) DEFAULT 0,
  PRIMARY KEY (`idProduit`),
  KEY `FKFourn` (`idFourn`),
  KEY `FKCat` (`idCat`),
  CONSTRAINT `FKCat` FOREIGN KEY (`idCat`) REFERENCES `categorie` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKFourn` FOREIGN KEY (`idFourn`) REFERENCES `fournisseur` (`idFournisseur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.produit : ~8 rows (environ)
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` (`idProduit`, `LibelleProduit`, `PrixHTProduit`, `QteStockProduit`, `idFourn`, `idCat`, `cheminImage`, `descriptionImage`, `isImportant`) VALUES
	(1, 'Optiplex 3010', 350.00, 12, 1, 1, 'optiplex_3000.jpg', NULL, 0),
	(2, 'Nas Server', 890.00, 6, 2, 1, 'server_nas.jpg', NULL, 0),
	(3, 'Logiciel GestCom', 550.00, 10, 3, 2, 'GestCom.jpg', NULL, 0),
	(4, 'Support Utilisateur', 150.00, 10, 3, 4, 'interrogation.jpg', NULL, 0),
	(5, 'Logiciel Administratif', 500.00, 5, 1, 2, 'interrogation.jpg', NULL, 0),
	(6, 'Ordinateur', 4500.00, 10, 1, 1, 'ordigamer_1.jpg', 'Ordinateur Gaming pour jouer aux derniers jeux du marché. Composé d\'une carte graphique RTX 3080, un processeur Ryzen 5 5700x, une carte mère B550 Asus, un SSD de 1 To ainsi qu\'un disque dure de 3 To. Tout cela allimenté par une allimentation de 800W.', 1),
	(7, 'Espion', 500.00, 50, 1, 6, 'espion_2.jpg', 'Avec ce logiciel Espion, vous pourrez garder un oeil sur qui que ce soit. Un pannel avec toutes les données de l\'individy espionné est fournis dans ce logiciel. Géolocalisation, accès à la caméra du téléphone, ainsi que les appels envoyé.', 1),
	(8, 'Editeur de text', 150.99, 500, 2, 2, 'texteditor.jpg', NULL, 0);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` char(50) DEFAULT NULL,
  `passe` char(255) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.utilisateur : 3 rows
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` (`id`, `login`, `passe`, `email`, `isAdmin`) VALUES
	(1, 'grandChef', 'a227047a05306bce6fa7dc6d8f6dea6e9b01c9b0', 'grandchef@sio.net', 1),
	(2, 'petitChef', '131c65314283e6861b67188b183fa6dd7363b4c5', 'petitchef@sio.net', 0),
	(3, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin@gmail.com', 1);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;

-- Listage de la structure de déclencheur lilian_ppe_marchand_layrac_adapt. DateComNonValideInsert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `DateComNonValideInsert` BEFORE INSERT ON `commande` FOR EACH ROW BEGIN

DECLARE msg VARCHAR(50);
DECLARE dateAbove DATE;
DECLARE actualDate DATE;
SET actualDate = (SELECT NOW());
SET dateAbove = NEW.DateCommande;
if (dateAbove > actualDate) THEN
SET msg = 'La commande n a pas une DATE valide';
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
end if;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur lilian_ppe_marchand_layrac_adapt. DateComNonValideUpdate
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `DateComNonValideUpdate` BEFORE UPDATE ON `commande` FOR EACH ROW BEGIN

DECLARE msg VARCHAR(50);
DECLARE dateAbove DATE;
DECLARE actualDate DATE;
SET actualDate = (SELECT NOW());
SET dateAbove = NEW.DateCommande;
if (dateAbove > actualDate) THEN
SET msg = 'La commande n a pas une DATE valide';
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
end if;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur lilian_ppe_marchand_layrac_adapt. VerifStock
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `VerifStock` BEFORE INSERT ON `lignedecommande` FOR EACH ROW BEGIN
DECLARE msg varchar(50);
DECLARE idProduitI INTEGER;
DECLARE qteP INTEGER;
DECLARE qteI INTEGER;
set idProduitI = NEW.idProduit;
set qteI = NEW.QuantiteCom;
set qteP = (select QteStockProduit from produit where idProduit = NEW.idProduit);
if (qteP - qteI < 0) THEN
Set msg = 'Qte commandé sup au stock dispo';
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
end if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
