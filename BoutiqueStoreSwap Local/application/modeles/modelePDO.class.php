<?php

class ModelePDO {

    // <editor-fold defaultstate="collapsed" desc="Champs Statiques">
    //Attributs utiles pour la connexion
    protected static $serveur = MySqlConfig::SERVEUR;
    protected static $base = MySqlConfig::BASE;
    protected static $utilisateur = MySqlConfig::UTILISATEUR;
    protected static $passe = MySqlConfig::MOT_DE_PASSE;
    //Attributs utiles pour la manipulation PDO de la BD
    protected static $pdoCnxBase = null;
    protected static $pdoStResults = null;
    protected static $requete = "";
    protected static $resultat = null;

    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="Méthodes Statique">

    public static function seConnecter() {
        if (!isset(self::$pdoCnxBase)) { //S'il n'y a pas encore eu de connexion
            try {
                self::$pdoCnxBase = new PDO('mysql:host=' . MysqlConfig::SERVEUR . ';dbname=' .
                        MysqlConfig::BASE, MysqlConfig::UTILISATEUR, MysqlConfig::MOT_DE_PASSE);
                self::$pdoCnxBase->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                self::$pdoCnxBase->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
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
    
    

    protected static function getLesTuples($table) {
        self::seConnecter();
        self::$requete = "SELECT * FROM " . $table;
        self::$pdoStResults = self::$pdoCnxBase->prepare(self::$requete);
        self::$pdoStResults->execute();
        self::$resultat = self::$pdoStResults->fetchAll(PDO::FETCH_OBJ);
        self::$pdoStResults->closeCursor();
        return self::$resultat;
    }
    

    // </editor-fold>
}

?>