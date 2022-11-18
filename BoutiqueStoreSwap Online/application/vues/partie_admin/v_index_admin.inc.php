<!-- Main -->
<div class="wrapper">
    <div class="container" id="main">
        <div id="footer" class="container">
            <div class="row.aln-center">
                <section>
                    <div class="titre">
                        Administration du site (Accès réservé)</br>
                        - Bonjour <?php echo $_SESSION['login_admin']; ?> -
                    </div> 
                    <a href="index.php?controleur=Boutique&action=afficherBoutique">Accès à la boutique</a></br>
                    <p>
                        <a href="index.php?controleur=Admin&action=seDeconnecter">Déconnexion (<?php echo $_SESSION['login_admin'] ?>)</a>
                    </p>
                </section>
            </div>
        </div>
    </div>
</div>