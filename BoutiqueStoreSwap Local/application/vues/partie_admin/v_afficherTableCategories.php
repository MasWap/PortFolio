<div class="wrapper">
    <div class="container">
        <div class="row">
            <section class="col-12 col-12-narrower feature">
            <h2>Catégories des produits</h2></br>
                <table class="default">
                    <thead>
                        <tr>
                            <th>Id de la catégorie</th>
                            <th><b>Libelle de la catégorie</b></th>
                            <th><b>Supprimer une categorie</b></th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $lesCategorie = GestionBoutiquePPE::getLesCategorie();
                        ?>

                        
                        
                        <?php
                        foreach ($lesCategorie as $uneCategorie) {
                        ?>
                            <tr>
                                <td><?php echo $uneCategorie->idCategorie; ?></td>
                                <td><?php echo $uneCategorie->LibelleCategorie; ?></td>
                                <td><a href="index.php?controleur=Table&action=supprimerCategorie&idCategorie=<?php echo $uneCategorie->idCategorie; ?>" class="button button-panier"><i class="fas fa-xs fa-trash"></i></a></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
            </section>
            <div class="row aln-center">
            <ul><a href="index.php?controleur=Admin&action=afficherIndexAdmin" class="button">Retour au choix des tables</i></a></ul>
            </div>
        </div>
    </div>
</div>
