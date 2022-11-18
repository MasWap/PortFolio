<?php

class ControleurCategorie {
    
    public function __construct() {
    }
    
    public function afficher() {
        VariablesGlobales::$lesCategorie = GestionBoutique::getLesCategorie();
        require Chemins::VUES_PERMANENTES.'v_menu_Categorie.inc.php';
    }
}
?>