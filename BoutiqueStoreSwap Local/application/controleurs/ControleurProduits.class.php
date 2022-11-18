<?php
class ControleurProduits {
    public function __construct() {
        // si on séparait les modèles, le constructeur donnerait son chemin
        // require_once Chemins::MODELES.'gestion_Categorie.class.php';
    }
    public function afficher() {
        //VariablesGlobales::$libelleCategorie = $libelleCategorie;
        VariablesGlobales::$lesProduits = GestionBoutiquePPE::getLesProduits();
        if(VariablesGlobales::$lesProduits == NULL) {
            require Chemins::VUES . 'v_404.php';
        }
        else {
            require Chemins::VUES . 'v_boutique.php';
        }
    }
    
        public function afficherProduitsImportants() {
        //VariablesGlobales::$libelleCategorie = $libelleCategorie;
        VariablesGlobales::$lesProduits = GestionBoutiquePPE::getLesProduitsImportants();
        if(VariablesGlobales::$lesProduits == NULL) {
            require Chemins::VUES . 'v_404.php';
        }
        else {
            require Chemins::VUES . 'v_accueil.php';
        }
    }
}
?>
