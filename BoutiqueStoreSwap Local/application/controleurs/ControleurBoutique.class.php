<?php

class ControleurBoutique{
    
    public function __construct() {
    }

    
    public function afficherBoutique() {
            
        VariablesGlobales::$lesProduits = GestionBoutiquePPE::getLesProduits();
        if(VariablesGlobales::$lesProduits == NULL) {
            require Chemins::VUES . 'v_404.php';
        }
        else {
            require Chemins::VUES . 'v_boutique.php';
        }
    }

    
}
?>