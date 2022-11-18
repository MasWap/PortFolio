<?php

// require Chemins::CONFIGS.'mysql_config.class.php';

class GestionBoutiquePPE {
    
//<editor-fold defaultstate="collapsed" desc="Champs statiques">
        protected static $serveur = MySqlConfig::SERVEUR;
        protected static $base = MySqlConfig::BASE;
        protected static $utilisateur = MySqlConfig::UTILISATEUR;
        protected static $passe = MySqlConfig::MOT_DE_PASSE;
    
        private static $pdoCnxBase = null;
        private static $pdoStResults = null;
        private static $requete = "";//texte de la requête
        private static $resultat = null;//résultat de la requête

//</editor-fold> 
    
//<editor-fold defaultstate="collapsed" desc="Méthodes statiques">
        
/**
* Permet de se connecter à la base de données
*/
         
    public static function seConnecter() {
     if (!isset(self::$pdoCnxBase)) { //S'il n'y a pas encore eu de connexion
     try {
     self::$pdoCnxBase = new PDO('mysql:host=' . MysqlConfig::SERVEUR . ';dbname=' .
    MysqlConfig::BASE, MysqlConfig::UTILISATEUR, MysqlConfig::MOT_DE_PASSE);
     self::$pdoCnxBase->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
     self::$pdoCnxBase->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_OBJ);
     self::$pdoCnxBase->query("SET CHARACTER SET utf8");
     } catch (Exception $e) {
     // l’objet pdoCnxBase a généré automatiquement un objet de type Exception
     echo 'Erreur : ' . $e->getMessage() . '<br />'; // méthode de la classe Exception
     echo 'Code : ' . $e->getCode(); // méthode de la classe Exception
     }
     }
    }
    
    public static function seDeconnecter() {
        self::$pdoCnsBase = null;
    }
    
    public static function getLesClients() {
        self::seConnecter();
        self::$requete = "SELECT * FROM Client";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->execute();
        self::$resultat = self::$pdoStResults->fetchAll();
        self::$pdoStResults->closeCursor();
        return self::$resultat;
    }

        public static function getClientById($idClient) {
        self::seConnecter();
        self::$requete = "SELECT * FROM Client where idClient = :idClient";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->bindValue('idClient', $idClient);
        self::$pdoStResults->execute();
        self::$resultat = self::$pdoStResults->fetch();
        self::$pdoStResults->closeCursor();
        return self::$resultat;
    }
    
        public static function getClientByLogin($loginClient) {
        self::seConnecter();
        self::$requete = "SELECT * FROM Client where loginClient = :loginClient";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->bindValue('loginClient', $loginClient);
        self::$pdoStResults->execute();
        self::$resultat = self::$pdoStResults->fetch();
        self::$pdoStResults->closeCursor();
        return self::$resultat;
    }
   
        public static function getNbClient() {
        self::seConnecter();
        self::$requete = "SELECT Count(*) AS nbClient FROM Client";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->execute();
        self::$resultat = self::$pdoStResults->fetch();
        self::$pdoStResults->closeCursor();
        return self::$resultat->nbClient;
    }

        public static function addClient($nomClient, $prenomClient, $emailClient, $loginClient, $mdpClient, $AdRueClient, $telClient, $paysClient ) {
        self::seConnecter();
        self::$requete = "insert into client(NomClient, PrenomClient, emailClient, loginClient, mdpClient, AdRueClient, telClient, paysClient, isRegistered) ";
        self::$requete .= " values( '$nomClient', '$prenomClient', '$emailClient', '$loginClient', '$mdpClient', '$AdRueClient', '$telClient', '$paysClient',1 )";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        
        self::$pdoStResults->execute();
    }

    public static function setmdpClient($idClient,$mdpClient) {
        self::seConnecter();
        self::$requete = "UPDATE Client SET mdpClient = :mdpClient WHERE (idClient = :idClient)";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->bindValue('idClient', $idClient);
        self::$pdoStResults->bindValue('mdpClient', $mdpClient);
        self::$pdoStResults->execute();
        
        
    }
    
    public static function supprimerClient($idClient) {
        self::seConnecter();
        self::$requete = "DELETE FROM client WHERE idClient = $idClient";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->execute();
        
    }
    
        public static function getLesCategorie() {
        self::seConnecter();
        
        self::$requete = "SELECT * FROM categorie";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->execute();
        self::$resultat = self::$pdoStResults->fetchAll();
        
        self::$pdoStResults->closeCursor();
        
        return self::$resultat;
    }
    
        public static function getLesProduitsByCategorie($libelleCategorie) {
        self::seConnecter();
        self::$requete = "SELECT * FROM Produit A,categorie C WHERE A.idCat = C.idCategorie AND libelleCategorie = :libcat";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->bindValue('libcat', $libelleCategorie);
        self::$pdoStResults->execute();
        self::$resultat = self::$pdoStResults->fetchAll();
        self::$pdoStResults->closeCursor();
        return self::$resultat;
    }
    
        public static function getLesProduits() {
        self::seConnecter();
        self::$requete = "SELECT * FROM Produit";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->execute();
        self::$resultat = self::$pdoStResults->fetchAll();
        self::$pdoStResults->closeCursor();
        return self::$resultat;
    }
    
    
    
    public static function getLesProduitsImportants() {
        self::seConnecter();
        self::$requete = "SELECT * FROM Produit WHERE isImportant = 1";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->execute();
        self::$resultat = self::$pdoStResults->fetchAll();
        self::$pdoStResults->closeCursor();
        return self::$resultat;
    }
    
        public static function addAvisClient($nom, $email, $avis) {
        self::seConnecter();
        self::$requete = "insert into avisClient(nom, email, avis) values( '$nom', '$email', '$avis')";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        
        self::$pdoStResults->execute();
    }
    
            /**
     * Vérifie si l'utilisateur est un administrateur présent dans la base
     * @param type $login Login de l'utilisateur
     * @param type $passe Passe de l'utilisateur
     * @return type Booléen
     */
     public static function isAdminOK($login,$passe) {
     self::seConnecter();
     self::$requete = "SELECT * FROM Utilisateur where login=:login and passe=:passe";
     self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
     self::$pdoStResults->bindValue('login', $login);
     self::$pdoStResults->bindValue('passe', sha1($passe));
     self::$pdoStResults->execute();
     self::$resultat = self::$pdoStResults->fetch();
     self::$pdoStResults->closeCursor();
     if ((self::$resultat!=null) and (self::$resultat->isAdmin==1))
     return true;
     else 
     return false;
     }
     
     public static function isClientOK($login,$passe) {
     self::seConnecter();
     self::$requete = "SELECT * FROM Client where loginClient=:loginClient and mdpClient=:mdpClient";
     self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
     self::$pdoStResults->bindValue('loginClient', $login);
     self::$pdoStResults->bindValue('mdpClient', $passe);
     self::$pdoStResults->execute();
     self::$resultat = self::$pdoStResults->fetch();
     self::$pdoStResults->closeCursor();
     if ((self::$resultat!=null) and (self::$resultat->isRegistered==1))
     return true;
     else 
     return false;
     }
    
//</editor-fold> 
    

}
?>


