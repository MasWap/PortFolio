<?php

class ControleurPages{
    
    public function __construct() {
    }
    
    public function afficherAccueil() {
            require_once(Chemins::CONTROLEURS.'ControleurProduits.class.php') ;
            $controleurProduits = new ControleurProduits();
            $controleurProduits->afficherProduitsImportants();
    }
    
    public function afficherLDM() {
            require Chemins::VUES . 'v_LDM.php';
    }
    
//    public function afficherBoutique() {
//            require Chemins::VUES . 'v_boutique.php';
//            $controleurProduits = new ControleurProduits();
//            $controleurProduits->afficher();
//    }
    
    public function afficherCV() {
            require Chemins::VUES . 'v_cv.php';
    }


    
}
?>