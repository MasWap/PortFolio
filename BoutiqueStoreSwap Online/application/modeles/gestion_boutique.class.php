<?php

require_once 'modelePDO.class.php';

class GestionBoutiquePPE extends modelePDO {
    
//<editor-fold defaultstate="collapsed" desc="Méthodes statiques">
        

    public static function getLesClients() {
        return self::getLesTuples('Client');
    }
    
        public static function addClient($nomClient, $prenomClient, $emailClient, $loginClient, $mdpClient, $AdRueClient, $telClient, $paysClient ) {
        self::seConnecter();
        self::$requete = "insert into client(NomClient, PrenomClient, emailClient, loginClient, mdpClient, AdRueClient, telClient, paysClient, isRegistered) ";
        self::$requete .= " values( '$nomClient', '$prenomClient', '$emailClient', '$loginClient', '$mdpClient', '$AdRueClient', '$telClient', '$paysClient',1 )";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        
        self::$pdoStResults->execute();
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
    

    
        public static function addAvisClient($nom, $email, $avis) {
        self::seConnecter();
        self::$requete = "insert into avisClient(nom, email, avis) values( '$nom', '$email', '$avis')";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        
        self::$pdoStResults->execute();
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
    
    public static function getProduitById($idProduit) {
        self::seConnecter();
        self::$requete = "SELECT * FROM Produit WHERE (idProduit = :idProduit)";
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->bindValue('idProduit', $idProduit);
        self::$pdoStResults->execute();
        self::$resultat = self::$pdoStResults->fetch(PDO::FETCH_OBJ);
        self::$pdoStResults->closeCursor();
        return self::$resultat;
        
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


