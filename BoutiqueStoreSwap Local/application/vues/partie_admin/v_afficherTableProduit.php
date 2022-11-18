<div class="wrapper">
    <div class="container">
        <div class="row">
            <section class="col-12 col-12-narrower feature">
            <h2>Liste des produits</h2></br>	
                <table class="default">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Id du produit</th>
                            <th><b>Nom</b></th>
                            <th><b>Prix hors taxe</b></th>
                            <th><b>Quantité</b></th>
                            <th><b>Id du fournisseur</b></th>
                            <th><b>Id de la catégorie</b></th>
                            <th><b>Nom du fichier de image</b></th>
                            <th><b>Description de l'image</b></th>
                            <th><b>Produit important ?</b></th>
                            <th><b>Supprimer un produit</b></th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $lesProduits = GestionBoutiquePPE::getLesProduits();
                        ?>
                        
                        <?php
                        foreach ($lesProduits as $unProduit) {
                        ?>
                            <tr>
                                <td><img src="<?php echo Chemins::IMAGES_PRODUITS . $unProduit->cheminImage; ?>" style="width : 50px; height: 80px;" /></td>
                                <td><?php echo $unProduit->idProduit; ?></td>
                                <td><?php echo $unProduit->LibelleProduit; ?></td>
                                <td><?php echo $unProduit->PrixHTProduit; ?></td>
                                <td><?php echo $unProduit->QteStockProduit; ?></td>
                                <td><?php echo $unProduit->idFourn; ?></td>
                                <td><?php echo $unProduit->idCat; ?></td>
                                <td><?php echo $unProduit->cheminImage; ?></td>
                                <td><?php echo $unProduit->descriptionImage; ?></td>
                                <td><?php echo $unProduit->isImportant; ?></td>
                                <td><a href="index.php?controleur=Table&action=supprimerProduit&idProduit=<?php echo $unProduit->idProduit; ?>" class="button button-panier"><i class="fas fa-xs fa-trash"></i></a></td>
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
