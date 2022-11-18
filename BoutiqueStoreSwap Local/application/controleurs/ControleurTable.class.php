<?php

class ControleurTable{
    
    public function __construct() {
    }

    
    public function afficherTableAvisClient() {
        
        require Chemins::VUES_ADMIN . 'v_afficherTableAvisClient.php';
        
    }

    public function supprimerAvisClient() {
        GestionBoutiquePPE::supprimerAvisClient($_GET['id']);
        header(Utilitaire::getURLPrecendent());
    }

    public function afficherTableCategories() {
        
        require Chemins::VUES_ADMIN . 'v_afficherTableCategories.php';
        
    }

    public function supprimerCategorie() {
        GestionBoutiquePPE::supprimerCategorie($_GET['idCategorie']);
        header(Utilitaire::getURLPrecendent());
    }

    public function afficherTableClient() {
        
        require Chemins::VUES_ADMIN . 'v_afficherTableClient.php';
        
    }

    public function supprimerClient() {
        GestionBoutiquePPE::supprimerClient($_GET['idClient']);
        header(Utilitaire::getURLPrecendent());
    }

    public function afficherTableCommande() {
        
        require Chemins::VUES_ADMIN . 'v_afficherTableCommande.php';
        
    }

    public function supprimerCommande() {
        GestionBoutiquePPE::supprimerCommande($_GET['idCommande']);
        header(Utilitaire::getURLPrecendent());
    }

    public function afficherTableFournisseur() {
        
        require Chemins::VUES_ADMIN . 'v_afficherTableFournisseur.php';
        
    }

    public function supprimerFournisseur() {
        GestionBoutiquePPE::supprimerFournisseur($_GET['idFournisseur']);
        header(Utilitaire::getURLPrecendent());
    }

    public function afficherTableProduit() {
        
        require Chemins::VUES_ADMIN . 'v_afficherTableProduit.php';
        
    }

    public function supprimerProduit() {
        GestionBoutiquePPE::supprimerProduit($_GET['idProduit']);
        header(Utilitaire::getURLPrecendent());
    }

    public function afficherTableUtilisateur() {
        
        require Chemins::VUES_ADMIN . 'v_afficherTableUtilisateur.php';
        
    }

    public function supprimerUtilisateur() {
        GestionBoutiquePPE::supprimerUtilisateur($_GET['id']);
        header(Utilitaire::getURLPrecendent());
    }


    
}
?>