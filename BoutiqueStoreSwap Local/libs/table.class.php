<?php

Class GestionTable {
    
    //Obtenir les elements de chaque tables

    #region AvisClient
    public static function getAvisClient() {
        return $_SESSION['avisclient'];
    }

    public static function initialiserAvisClient() {
        if (!isset($_SESSION['avisclient'])) {
            $_SESSION['avisclient'] = array();           
        } 
    }
    #endregion

    #region Categories
    public static function getCategories() {
        return $_SESSION['categories'];
    }

    public static function initialiserCategories() {
        if (!isset($_SESSION['categories'])) {
            $_SESSION['categories'] = array();           
        } 
    }
    #endregion

    #region Client
    public static function getClient() {
        return $_SESSION['client'];
    }

    public static function initialiserClient() {
        if (!isset($_SESSION['client'])) {
            $_SESSION['client'] = array();           
        } 
    }
    #endregion

    #region Commande
    public static function getCommande() {
        return $_SESSION['commande'];
    }

    public static function initialiserCommande() {
        if (!isset($_SESSION['commande'])) {
            $_SESSION['commande'] = array();           
        } 
    }
    #endregion

    #region Fournisseur
    public static function getFournisseur() {
        return $_SESSION['fournisseur'];
    }

    public static function initialiserFournisseur() {
        if (!isset($_SESSION['fournisseur'])) {
            $_SESSION['fournisseur'] = array();           
        } 
    }
    #endregion

    #region LigneDeCommande
    public static function getLigneDeCommande() {
        return $_SESSION['lignedecommande'];
    }

    public static function initialiserLigneDeCommande() {
        if (!isset($_SESSION['lignedecommande'])) {
            $_SESSION['lignedecommande'] = array();           
        } 
    }
    #endregion

    #region Produit
    public static function getProduit() {
        return $_SESSION['produit'];
    }

    public static function initialiserProduit() {
        if (!isset($_SESSION['produit'])) {
            $_SESSION['produit'] = array();           
        } 
    }
    #endregion

    #region Utilisateur
    public static function getUtilisateur() {
        return $_SESSION['utilisateur'];
    }

    public static function initialiserUtilisateur() {
        if (!isset($_SESSION['utilisateur'])) {
            $_SESSION['utilisateur'] = array();           
        } 
    }
    #endregion
  
}




