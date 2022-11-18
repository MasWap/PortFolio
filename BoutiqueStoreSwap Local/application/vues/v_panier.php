<div class="wrapper">
    <div class="container">
        <div class="row">
            <section class="col-12 col-12-narrower feature">	
                <table class="default">
                    <thead>
                        <tr>
                            <th></th>
                            <th><b>Produit</b></th>
                            <th><b>Disponibilité</b></th>
                            <th><b>Quantité</b></th>
                            <th><b>Prix</b></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $lesIdProduits = array_keys($_SESSION['produits']); // Récupère les ID des produits
                        $sousTotal = 0;
                        foreach($lesIdProduits as $key=>$value) {
                            $leProduit = GestionBoutiquePPE::getProduitById($value);
                            $sousTotal += ($leProduit->PrixHTProduit * GestionPanier::getQteByProduit($value));
                        ?>
                        <tr>
                            <td><img src="<?php echo Chemins::IMAGES_PRODUITS . $leProduit->cheminImage; ?>" style="width : 50px; height: 50px;" /></td>
                            <td><?php echo $leProduit->LibelleProduit; ?></td>
                            <td>En stock</td>
                            <td><i class="fas fa-minus"> <?php echo GestionPanier::getQteByProduit($value); ?>  <i class="fas fa-plus"></i></td>
                            <td><?php echo $leProduit->PrixHTProduit * GestionPanier::getQteByProduit($value); ?> €</td>
                            <td><a href="index.php?controleur=Panier&action=supprimerPanier&idProduit=<?php echo $leProduit->idProduit; ?>" class="button button-panier"><i class="fas fa-xs fa-trash"></i></a></td>
                        </tr>
                        <?php
                        }
                        ?>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Sous-total</td>
                            <td class="text-right"><?php echo $sousTotal; ?> €</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Livraison</td>
                            <td class="text-right">5 €</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>Total</b></td>
                            <td class="text-right"><b><?php echo $sousTotal + 5; ?> €</b></td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </div>
        <a href="index.php?controleur=Panier&action=viderPanier" class="button button-panier">Vider le panier <i class="fas fa-xs fa-trash" style="margin-top: 16px;"></i></a>
        <a href="#" class="button button-panier">Acheter le panier<i class="fas fa-xs fa-trash" style="margin-top: 16px;"></i></a>
        <a href="index.php?controleur=Boutique&action=afficherBoutique" class="button button-panier">Retour à la boutique<i class="fas fa-xs fa-trash" style="margin-top: 16px;"></i></a>
    </div>
</div>