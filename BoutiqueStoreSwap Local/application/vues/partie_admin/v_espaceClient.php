<!-- Main -->
<div class="wrapper">
    <div class="container" id="main">
        <div id="footer" class="container">
            <div class="row.aln-center">
                <section>
                    <p align="center">
                    <h1>Bienvenue <?php echo $_SESSION['login_client']; ?> sur votre espace client, retrouvez toutes vos informations personnelles :</h1>
                    </br ></br >


                    <?php
                    $leclient = GestionBoutiquePPE::getClientByLogin($_SESSION['login_client']);
                    ?>
                    Votre prenom :
                    <?php
                    echo $leclient->PrenomClient;
                    ?>
                    <br>

                    Votre nom :
                    <?php
                    echo $leclient->NomClient;
                    ?>
                    <br>

                    Votre email :
                    <?php
                    echo $leclient->emailClient;
                    ?>
                    <br>

                    Votre login :
                    <?php
                    echo $leclient->loginClient;
                    ?>
                    <br>

                    Votre mot de passe :
                    <?php
                    echo $leclient->mdpClient;
                    ?>
                    <br>

                    Votre adresse :
                    <?php
                    echo $leclient->AdRueClient;
                    ?>
                    <br>

                    Votre numéro de telephone :
                    <?php
                    echo $leclient->telClient;
                    ?>
                    <br>

                    Votre pays :
                    <?php
                    echo $leclient->paysClient;
                    ?>
                    <br><br><br>
                    <a href="index.php?controleur=Admin&action=seDeconnecterClient">Déconnexion de votre compte client (<?php echo $_SESSION['login_client'] ?>)</a>
                    </br></br>
                    <a href="index.php?controleur=Admin&action=SupprimerClient">Supprimer mon compte (Attention, ça mord !) (<?php echo $_SESSION['login_client'] ?>)</a>
                    
                    </p>
                </section>
            </div>
        </div>
    </div>
</div>