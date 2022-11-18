-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.31 - MySQL Community Server (GPL)
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.avisclient : 3 rows
/*!40000 ALTER TABLE `avisclient` DISABLE KEYS */;
INSERT INTO `avisclient` (`id`, `nom`, `email`, `avis`) VALUES
	(1, 'Lilian', 'lilian.layrac@gmail.com', 'dsfsdfdsff'),
	(2, 'MasWap', 'maswap@gmail.com', 'Très beau site'),
	(3, 'MasWap', 'maswap@gmail.com', 'Très beau site');
/*!40000 ALTER TABLE `avisclient` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(11) NOT NULL,
  `LibelleCategorie` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.categorie : ~4 rows (environ)
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` (`idCategorie`, `LibelleCategorie`) VALUES
	(1, 'Basique'),
	(2, 'Piquant'),
	(3, 'Spéciaux');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. client
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `NomClient` varchar(100) DEFAULT '0',
  `PrenomClient` varchar(45) DEFAULT '0',
  `AdRueClient` varchar(150) DEFAULT '0',
  `AdCpClient` int(11) DEFAULT '0',
  `AdVilleClient` varchar(100) DEFAULT 'Non Renseigne',
  `emailClient` varchar(100) DEFAULT 'Non Renseigne',
  `loginClient` varchar(50) DEFAULT 'Non Renseigne',
  `mdpClient` varchar(50) DEFAULT 'Non Renseigne',
  `telClient` varchar(15) DEFAULT '0606060606',
  `paysClient` varchar(15) DEFAULT 'Non Renseigne',
  `isRegistered` int(11) DEFAULT '1',
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.client : ~100 rows (environ)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`idClient`, `NomClient`, `PrenomClient`, `AdRueClient`, `AdCpClient`, `AdVilleClient`, `emailClient`, `loginClient`, `mdpClient`, `telClient`, `paysClient`, `isRegistered`) VALUES
	(1, 'Adrian', 'Tyler', 'Ap #257-4830 Accumsan St.', 55137, 'Poitiers', 'feugiat.placerat@outlook.com', 'tempor', 'leo.', '07 78 32 49 23', 'HR', 0),
	(2, 'Reese', 'Kirby', 'P.O. Box 137, 4864 Condimentum. St.', 10357, 'Tournefeuille', 'turpis@outlook.com', 'adipiscing', 'parturient', '03 91 34 31 40', 'TF', 0),
	(3, 'Clark', 'Ainsley', '959-5721 Accumsan Rd.', 68833, 'La Roche-sur-Yon', 'massa.non.ante@yahoo.com', 'eget,', 'ipsum', '04 61 44 45 71', 'US', 0),
	(4, 'Samantha', 'Alana', 'Ap #113-7132 Tincidunt Rd.', 79986, 'Douai', 'amet@outlook.org', 'nunc', 'Phasellus', '05 60 24 31 28', 'TD', 1),
	(5, 'Evan', 'Zachery', 'Ap #633-3996 Eu Rd.', 68378, 'Angoulême', 'eu.euismod@protonmail.com', 'a,', 'semper.', '06 55 12 42 37', 'IR', 0),
	(6, 'Nathaniel', 'Channing', 'Ap #437-532 Penatibus Rd.', 89910, 'Beauvais', 'aliquam.eros.turpis@icloud.com', 'elementum,', 'ipsum', '05 65 95 60 78', 'HU', 1),
	(7, 'Risa', 'Lars', '791-277 Sem St.', 83333, 'Saint-Dizier', 'urna@protonmail.org', 'tempor', 'nec', '03 70 55 04 78', 'TF', 1),
	(8, 'Cole', 'Rudyard', '345-3960 Sed Ave', 77815, 'Saint-Dizier', 'interdum.sed@yahoo.com', 'Sed', 'quis,', '06 18 22 86 83', 'TJ', 0),
	(9, 'Hanna', 'Macaulay', '7597 Lobortis Road', 85829, 'Alès', 'nulla.ante@protonmail.com', 'Vestibulum', 'mauris', '08 14 79 26 74', 'MH', 1),
	(10, 'Cyrus', 'Reed', 'Ap #294-3245 Mauris Ave', 1601, 'Colomiers', 'nulla@yahoo.com', 'leo.', 'volutpat.', '06 54 29 38 35', 'TZ', 1),
	(11, 'Willa', 'Donna', 'Ap #823-2167 Pede Street', 79321, 'Nîmes', 'mauris.integer.sem@hotmail.org', 'ante.', 'a', '01 49 73 68 77', 'NA', 0),
	(12, 'Wallace', 'Tucker', '892-2263 Et Av.', 64979, 'Dijon', 'amet.lorem.semper@google.com', 'egestas.', 'Nunc', '04 87 43 27 57', 'TM', 0),
	(13, 'Shad', 'Shad', '138-6227 Neque Rd.', 42094, 'Le Havre', 'ipsum.primis@outlook.com', 'nibh.', 'nascetur', '04 86 31 72 55', 'IS', 1),
	(14, 'Cynthia', 'Shelley', '394-3303 Sit St.', 84110, 'Roubaix', 'lorem.vehicula.et@protonmail.com', 'libero.', 'quis', '04 28 46 87 41', 'NR', 0),
	(15, 'Cade', 'Sonya', '6413 Enim. Rd.', 24175, 'Pessac', 'quisque.imperdiet@hotmail.org', 'et', 'vel', '07 34 44 29 20', 'KG', 0),
	(16, 'Nevada', 'Kimberly', 'Ap #529-8469 Ac Av.', 19632, 'Vitry-sur-Seine', 'convallis.ligula.donec@protonmail.org', 'non', 'magna.', '06 88 75 42 41', 'CN', 1),
	(17, 'Pascale', 'Kennan', '7543 Felis Rd.', 55373, 'Brive-la-Gaillarde', 'ornare.fusce@yahoo.com', 'euismod', 'felis', '05 11 13 73 26', 'CU', 1),
	(18, 'Bruce', 'Amena', 'Ap #926-2478 Ac St.', 61827, 'Tarbes', 'gravida.aliquam@aol.org', 'Aenean', 'Aenean', '03 23 11 44 39', 'IO', 1),
	(19, 'Burke', 'Darrel', 'Ap #944-510 Nunc Rd.', 20030, 'Rodez', 'orci.quis@protonmail.com', 'sed', 'Donec', '05 80 14 64 78', 'CU', 1),
	(20, 'Lael', 'Regan', '852-3823 Scelerisque Ave', 84246, 'Lens', 'suspendisse.ac@hotmail.com', 'nisl', 'fringilla,', '08 92 35 74 98', 'MS', 0),
	(21, 'Alfonso', 'Kermit', 'Ap #812-2208 Aenean St.', 18183, 'Boulogne-Billancourt', 'nulla@yahoo.com', 'tortor', 'fermentum', '08 73 19 28 34', 'RO', 0),
	(22, 'Emily', 'Aimee', '339-8062 Tincidunt Av.', 77709, 'Reims', 'odio.semper.cursus@aol.com', 'aliquet.', 'Fusce', '02 16 44 41 22', 'NP', 0),
	(23, 'Addison', 'Ocean', 'P.O. Box 241, 5089 Sed Road', 61721, 'Niort', 'netus.et@yahoo.org', 'sit', 'eu', '04 52 78 73 29', 'NI', 1),
	(24, 'Halla', 'Alden', 'Ap #827-9095 Dolor Rd.', 76473, 'Reims', 'odio.sagittis@protonmail.com', 'iaculis', 'mus.', '04 47 79 80 67', 'NP', 0),
	(25, 'Emerson', 'Christen', 'Ap #651-5273 Mauris Road', 82817, 'Le Puy-en-Velay', 'orci.luctus@protonmail.com', 'lectus', 'sit', '05 71 36 21 55', 'GN', 0),
	(26, 'Zane', 'Zena', 'P.O. Box 648, 1160 Malesuada St.', 72618, 'Aurillac', 'erat.vivamus.nisi@hotmail.com', 'In', 'ut', '03 36 95 16 13', 'TF', 1),
	(27, 'Kelsey', 'Naida', '505-3119 Curae Rd.', 28278, 'Avignon', 'lacus@hotmail.com', 'mus.', 'scelerisque', '02 71 39 12 56', 'NE', 1),
	(28, 'Tanner', 'Addison', 'Ap #144-2691 Vulputate, Avenue', 58156, 'Joué-lès-Tours', 'augue@protonmail.org', 'commodo', 'nunc', '04 59 03 79 71', 'CO', 1),
	(29, 'Brenden', 'Wyatt', 'P.O. Box 561, 3353 Morbi Rd.', 42935, 'Nantes', 'vulputate.lacus@protonmail.org', 'Praesent', 'libero.', '01 06 00 18 19', 'NC', 1),
	(30, 'Eaton', 'Serina', '309-2222 Interdum. Rd.', 57441, 'Illkirch-Graffenstaden', 'dignissim.lacus@yahoo.org', 'nisi', 'Sed', '02 59 71 72 04', 'EG', 0),
	(31, 'Madonna', 'Cedric', '5621 Duis Ave', 74161, 'Bastia', 'dui@hotmail.com', 'fringilla', 'quis', '08 53 38 61 63', 'CY', 1),
	(32, 'Price', 'Lawrence', 'P.O. Box 545, 7797 Nulla St.', 68154, 'Périgueux', 'luctus.curabitur.egestas@icloud.com', 'tortor.', 'euismod', '01 93 02 55 76', 'GB', 1),
	(33, 'Lana', 'Beau', 'Ap #373-4513 Lorem Av.', 8448, 'Castres', 'metus.vivamus.euismod@google.com', 'enim', 'orci', '03 74 16 13 36', 'AG', 1),
	(34, 'Jessica', 'Levi', '485-9650 Id Av.', 11624, 'Créteil', 'suspendisse.tristique@outlook.org', 'hendrerit', 'ipsum', '09 73 73 52 84', 'UA', 1),
	(35, 'Moses', 'Ivor', 'Ap #591-5218 Orci. Road', 65361, 'Champigny-sur-Marne', 'nullam@icloud.org', 'dapibus', 'Integer', '08 05 29 91 18', 'GQ', 0),
	(36, 'Wang', 'Burton', 'Ap #343-7924 Morbi St.', 25310, 'Brive-la-Gaillarde', 'luctus@protonmail.org', 'mauris', 'Proin', '03 83 61 46 45', 'DE', 1),
	(37, 'Stella', 'Stephen', '9898 Eget, Road', 57710, 'Mâcon', 'mollis.non@protonmail.org', 'neque', 'adipiscing', '08 82 29 81 57', 'FO', 1),
	(38, 'Geoffrey', 'Kirestin', 'P.O. Box 517, 1635 Purus, Street', 62704, 'Castres', 'ut.molestie@google.org', 'et', 'diam.', '03 62 10 22 63', 'NC', 1),
	(39, 'Lee', 'Kaye', 'Ap #223-8396 Nisl. Avenue', 26167, 'Compiègne', 'nisl@icloud.com', 'scelerisque', 'nec', '02 81 65 46 58', 'CC', 0),
	(40, 'Xenos', 'Olympia', '3821 Id Rd.', 79614, 'Hérouville-Saint-Clair', 'sed.turpis@protonmail.com', 'eu,', 'Nullam', '01 81 32 38 04', 'FO', 1),
	(41, 'Vanna', 'Keane', '1122 Placerat. Ave', 37486, 'Mulhouse', 'lorem@hotmail.com', 'in', 'vel', '07 17 58 28 58', 'AQ', 1),
	(42, 'Victor', 'Donna', '498-7294 Nullam Rd.', 34561, 'Vandoeuvre-lès-Nancy', 'dolor.nulla@google.org', 'turpis', 'Fusce', '02 46 33 06 83', 'GI', 1),
	(43, 'Erich', 'Brenna', '187-4902 Mollis. Street', 12953, 'Amiens', 'fusce.feugiat@protonmail.org', 'dictum', 'vestibulum,', '04 78 74 21 43', 'MT', 0),
	(44, 'Dorian', 'Ali', 'P.O. Box 294, 6983 Adipiscing, Street', 52861, 'Brest', 'diam.pellentesque@google.com', 'arcu.', 'enim.', '08 04 67 61 33', 'KW', 1),
	(45, 'Edan', 'Nicholas', '278-2626 Neque. Rd.', 42186, 'Ajaccio', 'cras.convallis@google.org', 'quam,', 'quam', '07 74 48 18 46', 'SD', 1),
	(46, 'Shellie', 'Jason', '354-4097 Nibh Street', 57886, 'Versailles', 'a@aol.org', 'Quisque', 'elementum,', '06 32 45 42 89', 'FI', 1),
	(47, 'Amethyst', 'Jesse', 'Ap #764-7750 Blandit Avenue', 81328, 'Chalon-sur-Saône', 'scelerisque@yahoo.com', 'dolor.', 'vel', '02 51 10 23 43', 'EE', 1),
	(48, 'Harriet', 'Xenos', 'Ap #818-7930 Aliquam Av.', 60712, 'Ajaccio', 'tortor.at@yahoo.com', 'sit', 'eleifend', '09 44 73 45 38', 'CU', 0),
	(49, 'Conan', 'Honorato', '904-563 Neque. Avenue', 18187, 'Le Grand-Quevilly', 'semper.pretium@outlook.org', 'mauris', 'sem', '09 13 16 22 64', 'KP', 1),
	(50, 'Cairo', 'Shelly', '472-2778 Nunc Rd.', 76068, 'La Roche-sur-Yon', 'porttitor@icloud.org', 'aliquam', 'in', '06 28 57 82 52', 'CX', 1),
	(51, 'Uriel', 'Amethyst', '177-6604 Non Street', 50139, 'Argenteuil', 'quis.pede.praesent@yahoo.com', 'Donec', 'id', '01 31 37 69 79', 'ID', 0),
	(52, 'Stewart', 'Camille', '392-4988 Odio. Rd.', 99860, 'Rueil-Malmaison', 'accumsan.laoreet@hotmail.org', 'amet', 'eget,', '06 72 44 89 99', 'CM', 0),
	(53, 'Adrian', 'Gisela', 'Ap #899-1816 Adipiscing Rd.', 62723, 'Vernon', 'diam.vel@google.com', 'nec', 'ornare,', '02 10 58 29 84', 'KI', 1),
	(54, 'Jonah', 'Ezekiel', 'Ap #574-5797 Neque St.', 92543, 'Nîmes', 'commodo@protonmail.com', 'augue.', 'mus.', '03 71 20 62 58', 'NI', 1),
	(55, 'Diana', 'Bruce', 'Ap #123-8632 Aenean Avenue', 48466, 'Dijon', 'nulla@google.com', 'elit,', 'Aliquam', '08 76 51 81 85', 'AS', 0),
	(56, 'Mollie', 'TaShya', '4020 Sit Road', 39384, 'Reims', 'diam.vel.arcu@google.org', 'Fusce', 'magna.', '02 95 50 36 01', 'AI', 0),
	(57, 'Jelani', 'Suki', '4833 Id, Rd.', 24610, 'Quimper', 'sem.molestie@aol.com', 'neque', 'metus.', '06 39 11 18 37', 'MX', 1),
	(58, 'Zephania', 'Brenden', '372-8551 Enim. Ave', 52203, 'Charleville-Mézières', 'faucibus.ut@aol.org', 'et,', 'mauris', '01 25 81 43 38', 'LB', 1),
	(59, 'Francis', 'Kevyn', '220-2058 Suspendisse St.', 51264, 'Saint-Herblain', 'ligula.elit@icloud.com', 'metus.', 'sapien,', '08 34 41 32 45', 'IQ', 0),
	(60, 'Patience', 'Lacota', '126-6641 Congue. Ave', 27164, 'Nevers', 'ornare.sagittis.felis@google.org', 'posuere', 'posuere', '02 91 47 75 76', 'AS', 0),
	(61, 'Chelsea', 'Britanney', '586-6536 Nec St.', 65622, 'Rouen', 'lectus.sit@yahoo.org', 'ornare', 'neque.', '06 66 54 73 35', 'GS', 1),
	(62, 'Erin', 'Scott', 'Ap #964-8615 Proin Avenue', 21334, 'Rouen', 'non.magna@outlook.com', 'non', 'et', '01 71 32 23 06', 'DZ', 1),
	(63, 'Rooney', 'Scarlet', 'P.O. Box 904, 7252 Nisl. St.', 7231, 'Brive-la-Gaillarde', 'purus.maecenas.libero@hotmail.org', 'odio.', 'tempor', '04 81 35 86 34', 'GB', 0),
	(64, 'Elliott', 'Virginia', 'P.O. Box 893, 2197 Sed Av.', 57336, 'Saint-Lô', 'velit.dui@outlook.com', 'lectus', 'amet', '07 82 12 82 28', 'NL', 0),
	(65, 'Alika', 'Odysseus', 'P.O. Box 192, 1112 Mi. Rd.', 73586, 'La Rochelle', 'arcu@aol.com', 'lectus', 'rutrum.', '05 83 35 34 12', 'FJ', 0),
	(66, 'Anjolie', 'Christine', '584-297 Sed St.', 27666, 'Moulins', 'ultricies.ligula.nullam@yahoo.org', 'facilisis,', 'Ut', '01 53 61 23 24', 'IT', 1),
	(67, 'Margaret', 'Rae', 'Ap #169-657 Auctor Rd.', 46885, 'Dijon', 'adipiscing.lacus@aol.com', 'ut', 'tincidunt,', '08 04 07 68 58', 'GP', 1),
	(68, 'Dorothy', 'Erich', 'Ap #467-1451 Leo, St.', 34483, 'Nevers', 'eget.magna@icloud.org', 'ligula', 'dictum', '07 83 14 68 59', 'AZ', 1),
	(69, 'Kay', 'Jolene', 'P.O. Box 106, 8209 Duis St.', 54438, 'Laval', 'duis.volutpat.nunc@icloud.org', 'malesuada', 'Cras', '08 82 58 41 13', 'VC', 1),
	(70, 'Lana', 'Jaden', 'Ap #129-273 Nec Rd.', 93961, 'Vernon', 'eu.nulla@aol.org', 'dui,', 'ipsum.', '09 25 37 84 41', 'AS', 1),
	(71, 'Hermione', 'Dominique', '957-4714 Dapibus St.', 42190, 'Rennes', 'dui.lectus@icloud.com', 'ante', 'Nunc', '05 65 49 77 85', 'NC', 0),
	(72, 'Lee', 'Jemima', '230-7944 Libero. Street', 45867, 'Bourges', 'vulputate@outlook.org', 'ullamcorper', 'Praesent', '04 68 25 87 28', 'DE', 0),
	(73, 'Candace', 'Sonia', '887-9548 Quis Av.', 34700, 'Tarbes', 'et@protonmail.com', 'tempor', 'habitant', '05 47 57 01 94', 'BI', 1),
	(74, 'Yael', 'Kylynn', '178-9191 Eu, Avenue', 10537, 'Besançon', 'nibh.quisque.nonummy@protonmail.com', 'fermentum', 'posuere', '04 67 25 11 45', 'SG', 1),
	(75, 'Marshall', 'Amery', 'Ap #988-7889 Sed St.', 15536, 'Montreuil', 'aliquam.eros.turpis@aol.org', 'ante', 'Sed', '06 27 81 38 18', 'BT', 1),
	(76, 'Solomon', 'Kyle', '859-8262 Orci Road', 43292, 'La Seyne-sur-Mer', 'sodales.elit@hotmail.com', 'turpis.', 'nulla.', '06 76 12 87 63', 'GW', 0),
	(77, 'Maxwell', 'Gareth', 'P.O. Box 969, 8640 Mauris Road', 55456, 'Tours', 'aliquet.magna.a@google.org', 'et,', 'consequat,', '05 28 66 02 18', 'MY', 0),
	(78, 'Price', 'Piper', 'P.O. Box 374, 5017 Tincidunt, Ave', 26571, 'Nevers', 'vel.arcu@google.com', 'ac,', 'condimentum.', '05 19 67 62 92', 'GM', 0),
	(79, 'Quentin', 'Malachi', 'Ap #723-8792 Vel St.', 63638, 'Bastia', 'suspendisse.commodo.tincidunt@yahoo.com', 'Fusce', 'Nunc', '04 68 15 28 55', 'BJ', 1),
	(80, 'Charity', 'Alea', '334-7779 Sit Road', 21734, 'Béthune', 'sed.dictum@aol.org', 'pellentesque.', 'Nullam', '06 39 43 55 44', 'PW', 1),
	(81, 'Kylynn', 'Tatum', 'P.O. Box 438, 9575 In Rd.', 65675, 'Troyes', 'fermentum.metus@hotmail.org', 'malesuada', 'vehicula', '04 33 35 27 80', 'JM', 0),
	(82, 'Castor', 'Nicole', 'Ap #451-4334 Adipiscing St.', 36573, 'Vichy', 'tellus.suspendisse@google.org', 'posuere', 'varius.', '02 17 88 85 32', 'SV', 0),
	(83, 'Avram', 'Honorato', '827-7671 Consectetuer Rd.', 33244, 'Schiltigheim', 'urna.suscipit.nonummy@yahoo.com', 'lorem', 'nibh', '05 47 75 16 43', 'BN', 0),
	(84, 'Addison', 'Ramona', '696-7667 Metus. Av.', 42257, 'Angoulême', 'suspendisse@aol.org', 'dolor', 'purus.', '06 64 61 45 06', 'CV', 0),
	(85, 'Caldwell', 'Regan', '251-9687 Nisi. St.', 32421, 'Ajaccio', 'nec.diam@outlook.com', 'Quisque', 'dolor', '04 21 88 77 81', 'PE', 1),
	(86, 'Maggie', 'Ralph', '7106 Et Av.', 54487, 'Le Grand-Quevilly', 'ridiculus.mus@protonmail.com', 'dolor,', 'Cum', '02 38 59 71 83', 'AE', 0),
	(87, 'Kirby', 'Zelda', '289-1706 Blandit Avenue', 73391, 'Nancy', 'consequat@hotmail.com', 'Proin', 'urna.', '06 73 82 85 78', 'PN', 1),
	(88, 'Jesse', 'Levi', '483-9979 Fermentum St.', 72708, 'Bastia', 'duis.sit.amet@google.org', 'mollis', 'natoque', '05 27 68 55 23', 'KY', 0),
	(89, 'Brianna', 'Alexandra', 'P.O. Box 144, 7314 Dapibus Av.', 43115, 'Colombes', 'duis.gravida.praesent@yahoo.org', 'velit', 'velit.', '05 55 01 34 16', 'VI', 0),
	(90, 'Pamela', 'Zenia', '743-3618 Interdum Rd.', 38363, 'Bayonne', 'metus.sit@outlook.com', 'nec,', 'at', '02 35 47 54 58', 'ZA', 1),
	(91, 'Griffith', 'Jana', 'Ap #589-7454 Risus. Road', 73654, 'Alençon', 'justo.proin@icloud.org', 'Ut', 'congue', '04 57 10 83 13', 'TR', 1),
	(92, 'Lane', 'Kitra', '537-7374 Lobortis Avenue', 45226, 'Lorient', 'elit.erat@outlook.com', 'Fusce', 'Nunc', '02 19 05 33 85', 'ET', 1),
	(93, 'McKenzie', 'Cara', '671-1993 Integer Rd.', 42816, 'Cherbourg-Octeville', 'et.magnis.dis@aol.org', 'cursus', 'ultrices.', '07 48 67 25 80', 'PK', 1),
	(94, 'Chelsea', 'Caleb', '9514 Blandit St.', 75837, 'Talence', 'non.massa.non@yahoo.com', 'ut,', 'sociis', '08 20 59 13 63', 'LB', 1),
	(95, 'Joelle', 'Gareth', '656-5184 Integer Road', 50381, 'Saintes', 'aliquam.nisl.nulla@google.org', 'orci', 'natoque', '08 26 17 13 76', 'MH', 1),
	(96, 'Rowan', 'Natalie', 'P.O. Box 204, 2766 Malesuada Street', 52332, 'Moulins', 'sit.amet@outlook.org', 'enim', 'Aliquam', '06 25 14 87 77', 'CG', 1),
	(97, 'Amelia', 'Thane', 'Ap #609-3422 Eu Rd.', 43201, 'Hénin-Beaumont', 'dictum.proin@outlook.com', 'Phasellus', 'egestas.', '04 54 34 27 38', 'NF', 0),
	(98, 'Cameron', 'Karen', 'P.O. Box 287, 9667 Consectetuer Road', 52849, 'Toulouse', 'ullamcorper.magna@yahoo.org', 'dui.', 'Nulla', '03 41 46 45 27', 'BF', 1),
	(99, 'Jolie', 'Avye', 'Ap #919-1278 Vitae, Road', 15323, 'Amiens', 'feugiat.tellus@yahoo.com', 'penatibus', 'Quisque', '02 56 07 15 77', 'SK', 0),
	(100, 'Tasha', 'Aidan', '465-5583 Odio St.', 41042, 'Périgueux', 'in.faucibus@outlook.com', 'diam', 'non', '09 42 24 86 14', 'MW', 1),
	(101, 'Layrac', 'Lilian', '23 Avenue Valery Giscard d Estaing', 0, 'Non Renseigne', 'lilian.layrac@gmail.com', 'admin', 'admin', '0767914331', 'FR', 1);
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

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.commande : ~0 rows (environ)
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
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
	(1, 'Abiroh', 'Montpellier', 34000),
	(2, 'Bonbon&co', 'Montpellier', 34000),
	(3, 'LyrcCorp', 'Sérignan', 34500);
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

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.lignedecommande : ~0 rows (environ)
/*!40000 ALTER TABLE `lignedecommande` DISABLE KEYS */;
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
  `isImportant` int(11) DEFAULT '0',
  PRIMARY KEY (`idProduit`),
  KEY `FKFourn` (`idFourn`),
  KEY `FKCat` (`idCat`),
  CONSTRAINT `FKCat` FOREIGN KEY (`idCat`) REFERENCES `categorie` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKFourn` FOREIGN KEY (`idFourn`) REFERENCES `fournisseur` (`idFournisseur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table lilian_ppe_marchand_layrac_adapt.produit : ~6 rows (environ)
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` (`idProduit`, `LibelleProduit`, `PrixHTProduit`, `QteStockProduit`, `idFourn`, `idCat`, `cheminImage`, `descriptionImage`, `isImportant`) VALUES
	(1, 'Crocodile Bleu (5 pièces)', 1.99, 245, 1, 1, 'croco_bleu.png', 'Excellent crocodile vert goût mystère (Lot de 5)', 0),
	(2, 'Crocodile Violet (5 pièces)', 1.99, 235, 2, 1, 'croco_violet.png', 'Excellent crocodile vert goût mirtille (Lot de 5)', 0),
	(3, 'Crocodile Gris (5 pièces)', 1.99, 568, 3, 2, 'croco_gris.png', 'Excellent crocodile vert goût cola (Lot de 5)', 0),
	(4, 'Boîte de Crocodiles', 19.99, 58, 1, 1, 'croco_groupe.png', 'Excellent assortiement de crocodiles (Lot de 40)', 1),
	(5, 'Crocodile Rose (5 pièces)', 1.99, 457, 1, 2, 'croco_rose.png', 'Excellent crocodile vert goût framboise (Lot de 5)', 0),
	(6, 'Crocodile Vert (5 pièces)', 1.99, 154, 1, 1, 'croco_vert.png', 'Excellent crocodile vert goût pomme (Lot de 5)', 1);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;

-- Listage de la structure de la table lilian_ppe_marchand_layrac_adapt. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` char(50) DEFAULT NULL,
  `passe` char(255) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT '0',
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
