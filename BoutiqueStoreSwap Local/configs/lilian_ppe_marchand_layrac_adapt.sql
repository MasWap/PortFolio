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


-- Listage de la structure de la base pour lilian_ppe_marchand_layrac
CREATE DATABASE IF NOT EXISTS `lilian_ppe_marchand_layrac` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lilian_ppe_marchand_layrac`;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac. !DeleteProduit
DELIMITER //
CREATE PROCEDURE `!DeleteProduit`(
	IN `ParamIdProduit` INT
)
BEGIN

	DELETE FROM Produit WHERE (idProduit = ParamIdProduit);

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac. !GetAllCommande
DELIMITER //
CREATE PROCEDURE `!GetAllCommande`()
BEGIN

	SELECT * FROM commande;

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac. !GetCAbyProduit(NumProd int)
DELIMITER //
CREATE PROCEDURE `!GetCAbyProduit(NumProd int)`()
BEGIN

	SELECT idProduit AS Numéro_Produit, (QteStockProduit * PrixHTProduit) AS CA_Produit
	FROM produit
	ORDER BY CA_Produit DESC;

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac. !GetCommandeById
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

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac. !GetCommandesByClient(NumCli int)
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

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac. !GetCommandesByPeriode Entrez jour désiré
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

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac. !GetInfoProduit
DELIMITER //
CREATE PROCEDURE `!GetInfoProduit`()
    COMMENT 'Consulter les produits'
BEGIN

	SELECT * FROM produit;

END//
DELIMITER ;

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac. !GetProduitsByCommande
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

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac. !InsertClient
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

-- Listage de la structure de la procédure lilian_ppe_marchand_layrac. !RechercheClient
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

-- Listage de la structure de la table lilian_ppe_marchand_layrac. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(11) NOT NULL,
  `LibelleCategorie` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac.categorie : ~6 rows (environ)
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` (`idCategorie`, `LibelleCategorie`) VALUES
	(1, 'Materiel'),
	(2, 'Logiciel'),
	(3, 'Service'),
	(4, 'Documentation'),
	(5, 'Hardware'),
	(6, 'Hacking');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac. client
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL,
  `NomClient` varchar(100) DEFAULT NULL,
  `PrenomClient` varchar(45) DEFAULT NULL,
  `AdRueClient` varchar(150) DEFAULT NULL,
  `AdCpClient` int(11) DEFAULT NULL,
  `AdVilleClient` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac.client : ~3 rows (environ)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`idClient`, `NomClient`, `PrenomClient`, `AdRueClient`, `AdCpClient`, `AdVilleClient`) VALUES
	(1, 'Dupont', 'Roger', '12 rue du patus', 34500, 'Beziers'),
	(2, 'Durand', 'Yves', '17 rue des greses', 34500, 'Beziers'),
	(3, 'Layrac', 'Lilian', '34 rue du test', 34410, 'Serignan');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac. commande
CREATE TABLE IF NOT EXISTS `commande` (
  `idCommande` int(11) NOT NULL,
  `DateCommande` varchar(10) DEFAULT NULL,
  `idCli` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCommande`),
  KEY `FKCli` (`idCli`),
  CONSTRAINT `FKCli` FOREIGN KEY (`idCli`) REFERENCES `client` (`idClient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac.commande : ~4 rows (environ)
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` (`idCommande`, `DateCommande`, `idCli`) VALUES
	(1, '22/01/2020', 1),
	(2, '21/01/2020', 1),
	(3, '21/01/2020', 2),
	(4, '22/01/2020', 2);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac. fournisseur
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `idFournisseur` int(11) NOT NULL,
  `NomFournisseur` varchar(100) DEFAULT NULL,
  `VilleFournisseur` varchar(100) DEFAULT NULL,
  `CPFournisseur` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac.fournisseur : ~3 rows (environ)
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` (`idFournisseur`, `NomFournisseur`, `VilleFournisseur`, `CPFournisseur`) VALUES
	(1, 'DELL Computers', 'Montpellier', 34000),
	(2, 'IBM', 'Montpellier', 34000),
	(3, 'RC Consulting', 'Sérignan', 34500);
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac. lignedecommande
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

-- Listage des données de la table lilian_ppe_marchand_layrac.lignedecommande : ~8 rows (environ)
/*!40000 ALTER TABLE `lignedecommande` DISABLE KEYS */;
INSERT INTO `lignedecommande` (`idCommande`, `idProduit`, `QuantiteCom`) VALUES
	(1, 1, 1),
	(1, 2, 2),
	(1, 3, 1),
	(2, 2, 1),
	(2, 3, 1),
	(2, 4, 2),
	(3, 4, 1),
	(4, 4, 1);
/*!40000 ALTER TABLE `lignedecommande` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac. produit
CREATE TABLE IF NOT EXISTS `produit` (
  `idProduit` int(11) NOT NULL,
  `LibelleProduit` varchar(100) DEFAULT NULL,
  `PrixHTProduit` float(6,2) DEFAULT NULL,
  `QteStockProduit` int(11) DEFAULT NULL,
  `idFourn` int(11) DEFAULT NULL,
  `idCat` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduit`),
  KEY `FKFourn` (`idFourn`),
  KEY `FKCat` (`idCat`),
  CONSTRAINT `FKCat` FOREIGN KEY (`idCat`) REFERENCES `categorie` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKFourn` FOREIGN KEY (`idFourn`) REFERENCES `fournisseur` (`idFournisseur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac.produit : ~5 rows (environ)
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` (`idProduit`, `LibelleProduit`, `PrixHTProduit`, `QteStockProduit`, `idFourn`, `idCat`) VALUES
	(1, 'Optiplex 3010', 350.00, 12, 1, 1),
	(2, 'Nas Server', 890.00, 6, 2, 1),
	(3, 'Logiciel GestCom', 550.00, 10, 3, 2),
	(4, 'Formation GestCom', 100.00, 10, 3, 3),
	(5, 'Support Utilisateur', 150.00, 10, 3, 4);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
