<?php

//indentation auto du code sous Netbeans : ALT+MAJ+F

session_start();  

ob_start(); // A PLACER pour �viter erreur de cr�ation cookies

require_once 'configs/chemins.class.php';
require_once Chemins::CONFIGS . 'mysql_config.class.php';
require_once Chemins::MODELES . 'gestion_boutique.class.php';
require_once Chemins::CONFIGS . 'variables_globales.class.php';
require_once Chemins::VUES_PERMANENTES . 'v_entete.inc.php';
require_once Chemins::LIBS . 'utilitaire.class.php';
require_once Chemins::LIBS . 'panier.class.php';

GestionPanier::initialiser();

//Rmq : si les mod�les �taient "d�coup�s", ils seraient inclus dans chaque controleur associ� et non dans le controleur principal
//ModeleZikBoutik::seConnecter();


//Affichage des cat�gories (menu de gauche)
//
//require_once(Chemins::CONTROLEURS . "ControleurCategories.class.php");

//ControleurCategories::afficher();//en version classe statique
//$controleurCategorie = new ControleurCategories();
//$controleurCategorie->afficher();

if (!isset($_REQUEST['controleur'])) {
    require_once(Chemins::CONTROLEURS.'ControleurPages.class.php') ;
    $objetControleurPages = new ControleurPages();
    $objetControleurPages->afficherAccueil();
    //Panier::initialiser();
} else {
    $action = $_REQUEST['action'];

    $classeControleur = 'Controleur' . $_REQUEST['controleur']; //ex : ControleurProduits
    $fichierControleur = $classeControleur . ".class.php"; //ex : ControleurProduits.class.php
    require_once(Chemins::CONTROLEURS . $fichierControleur);

    $objetControleur = new $classeControleur(); //ex : $objetControleur = new ControleurProduits();
    $objetControleur->$action(); //ex : $objetControleur->afficher();
    //version avec classe statique
    // $classeStatiqueControleur = 'Controleur' . $_REQUEST['controleur'];
    // $classeStatiqueControleur::$action();
}

//VariablesGlobales::$nbArticles = Panier::nbProduits();

//require_once(Chemins::VUES_PERMANENTES . "v_resumePanier.php");

require_once(Chemins::VUES_PERMANENTES . "v_pied.inc.php");
?>