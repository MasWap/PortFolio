<?php
class ControleurPanier {

        public function __construct() {
    }
    
    public function afficherPanier() {
        
        if(GestionPanier::isVide()) {
            require Chemins::VUES . 'v_panierVide.php';
        }
        else {
            require Chemins::VUES . 'v_panier.php';
        }
        
    }
    
    public function ajouterPanier() {
        GestionPanier::ajouterProduit($_REQUEST['idProduit'], 1);
        //var_dump($_SESSION['produits']);
        header(Utilitaire::getURLPrecendent());
    }
    
    public function supprimerPanier() {
        GestionPanier::retirerProduit($_REQUEST['idProduit']);
        header(Utilitaire::getURLPrecendent());
    }
    
    public function viderPanier() {
        GestionPanier::vider();
        header(Utilitaire::getURLPrecendent());
    }

    
    
    
    
}
