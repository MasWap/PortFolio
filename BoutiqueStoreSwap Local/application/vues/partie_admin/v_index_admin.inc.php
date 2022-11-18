<!-- Main -->
<div class="wrapper">
    <div class="container" id="main">
        <div id="footer" class="container">
            <div class="row.aln-center">
                <section>
                    <div class="title">
                        <h2>Administration du site (Accès réservé)</h2></br>
                        <h3>- Bonjour <?php echo $_SESSION['login_admin']; ?> -</h3>
                    </div> 


                    <a href="index.php?controleur=Boutique&action=afficherBoutique">Accès à la boutique</a></br>
                    <p>
                        <a href="index.php?controleur=Admin&action=seDeconnecter">Déconnexion (<?php echo $_SESSION['login_admin'] ?>)</a>
                    </p>

                    <div class="title">

                        <h2>Naviguer sur les tables de la base de donnée</h2>

                    </div>
                </section>
                <div class="row aln-center">

                        <ul><a href="index.php?controleur=Table&action=afficherTableAvisClient" class="button">Avis Client</i></a></ul>
                        <ul><a href="index.php?controleur=Table&action=afficherTableCategories" class="button">Catégories</i></a></ul>
                        <ul><a href="index.php?controleur=Table&action=afficherTableClient" class="button">Client</i></a></ul>
                        <ul><a href="index.php?controleur=Table&action=afficherTableCommande" class="button">Commande</i></a></ul>
                        <ul><a href="index.php?controleur=Table&action=afficherTableFournisseur" class="button">Fournisseur</i></a></ul>
                        <ul><a href="index.php?controleur=Table&action=afficherTableProduit" class="button">Produit</i></a></ul>
                        <ul><a href="index.php?controleur=Table&action=afficherTableUtilisateur" class="button">Utilisateur</i></a></ul>

                </div>
            </div>
        </div>
    </div>
</div>