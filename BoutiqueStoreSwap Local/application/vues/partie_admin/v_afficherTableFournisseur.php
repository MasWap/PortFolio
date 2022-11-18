<div class="wrapper">
    <div class="container">
        <div class="row">
            <section class="col-12 col-12-narrower feature">
            <h2>Liste des fournisseurs</h2></br>	
                <table class="default">
                    <thead>
                        <tr>
                            <th>Id du fournisseur</th>
                            <th><b>Nom</b></th>
                            <th><b>Ville</b></th>
                            <th><b>Code postal</b></th>
                            <th><b>Supprimer un fournisseur</b></th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $lesFournisseurs = GestionBoutiquePPE::getLesFournisseurs();
                        ?>
                        
                        <?php
                        foreach ($lesFournisseurs as $unFournisseur) {
                        ?>
                            <tr>
                                <td><?php echo $unFournisseur->idFournisseur; ?></td>
                                <td><?php echo $unFournisseur->NomFournisseur; ?></td>
                                <td><?php echo $unFournisseur->VilleFournisseur; ?></td>
                                <td><?php echo $unFournisseur->CPFournisseur; ?></td>
                                <td><a href="index.php?controleur=Table&action=supprimerFournisseur&idFournisseur=<?php echo $unFournisseur->idFournisseur; ?>" class="button button-panier"><i class="fas fa-xs fa-trash"></i></a></td>
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
