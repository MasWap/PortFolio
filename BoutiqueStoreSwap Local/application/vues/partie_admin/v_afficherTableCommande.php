<div class="wrapper">
    <div class="container">
        <div class="row">
            <section class="col-12 col-12-narrower feature">
            <h2>Liste des commandes</h2></br>
            <div style="overflow-x-y: hidden; overflow-y: scroll; border:#000000 1px solid; width: 1200px; height: 500px;">		
                <table class="default">
                    <thead>
                        <tr>
                            <th>Id de la commande</th>
                            <th><b>Date de la commande</b></th>
                            <th><b>Id du client</b></th>
                            <th><b>Supprimer une commande</b></th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $lesCommandes = GestionBoutiquePPE::getLesCommandes();
                        ?>

                        <?php
                        foreach ($lesCommandes as $uneCommande) {
                        ?>
                            <tr>
                                <td><?php echo $uneCommande->idCommande; ?></td>
                                <td><?php echo $uneCommande->DateCommande; ?></td>
                                <td><?php echo $uneCommande->idCli; ?></td>
                                <td><a href="index.php?controleur=Table&action=supprimerCommande&idCommande=<?php echo $uneCommande->idCommande; ?>" class="button button-panier"><i class="fas fa-xs fa-trash"></i></a></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
                </div>
            </section>
            <div class="row aln-center">
            <ul><a href="index.php?controleur=Admin&action=afficherIndexAdmin" class="button">Retour au choix des tables</i></a></ul>
            </div>
        </div>
    </div>
</div>
