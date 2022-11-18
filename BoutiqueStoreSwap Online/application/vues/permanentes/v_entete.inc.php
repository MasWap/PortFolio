<!DOCTYPE HTML>
<html>

<head>
    <title>Portfolio Layrac Lilian</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="<?php echo Chemins::STYLES."main.css";?>" />
    <link rel="stylesheet" href="<?php echo Chemins::STYLES."toastr.min.css";?>" />
    <link rel="stylesheet" href="<?php echo Chemins::STYLES."cssPerso.css";?>" />
    <script src="https://kit.fontawesome.com/f0e5037d63.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="<?php echo Chemins::JS."toastr.min.js";?>"></script>
</head>

<body class="no-sidebar is-preload">
    <div id="page-wrapper">
        
        <!-- Header -->
        <div id="header-wrapper">
            <div id="header" class="container">

                <!-- Logo -->
                <h1 id="logo"><a href="index.php">StoreSwap</a></h1>

                <!-- Nav -->
                <nav id="nav">
                    <ul>
                        <li><a href="index.php?controleur=Boutique&action=afficherBoutique">La Boutique</a></li>
                        <li><a href="index.php?controleur=Pages&action=afficherCV">CV</a></li>
                        <li class="break"></li>
                        <li class="break"><a href="index.php?controleur=Pages&action=afficherLDM">Lettre Motivation</a></li>
                        <?php 
                        // Si le client est connecté
                        if(isset($_SESSION['login_client'] )) {
                        ?>
                            <li>
                            <a href="index.php?controleur=Admin&action=seDeconnecterClient">Déconnecter</a>     <!--VERSION CLIENT-->
                            <a href="index.php?controleur=Panier&action=afficherPanier"><i class="fas fa-shopping-basket"></i></a>
                            <a href="index.php?controleur=Admin&action=afficherIndexClient">Mon Espace</a>
                            </li>
                            
                            
                       <?php
                        } else {
                       ?>    
                            <li><a href="index.php?controleur=Admin&action=afficherseConnecter">Se Connecter</a></li>     <!--VERSION CLIENT-->

                        <?php    
                        }
                        ?>
                    </ul>
                </nav>

                        <!-- Hero -->
                <section id="hero" class="container">
                    <header>
                        <h2>Bienvenue sur mon Portfolio
                        </h2>
                    </header>
                    <p>
                    <h3>
                        <br />
                        Boutique, CV, Lettre de motivation et FeedBack utilisateur !
                    </h3>
<!--                        <br />
                        Vous y trouverez ...
                        <br />
                        Une boutique, un CV, une lettre de motivation et une section "FeedBack" !-->
                    </p>
                    <ul class="actions">
                    
                        <li><a class="button" href="#feedback" >Votre <u>FeedBack</u>&nbsp;<i class="fa-solid fa-people"></i></a></li>
                    </ul>
                    <br />
                </section>
            </div>