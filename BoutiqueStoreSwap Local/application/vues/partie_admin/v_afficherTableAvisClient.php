<div class="wrapper">
    <div class="container">
        <div class="row">
            <section class="col-12 col-12-narrower feature">	
                <table class="default">
                    <thead>
                        <tr>
                            <th>Id de l'avis</th>
                            <th><b>Nom du client</b></th>
                            <th><b>Email du client</b></th>
                            <th><b>Avis du client</b></th>
                            <th><b>Supprimer un AvisClient</b></th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $lesAvis = GestionBoutiquePPE::getAvisClient();
                        ?>


                        <h2>Avis des clients</h2></br>
                        


                        <?php
                        foreach ($lesAvis as $unAvis) {
                        ?>
                            <tr>
                                <td><?php echo $unAvis->id; ?></td>
                                <td><?php echo $unAvis->nom; ?></td>
                                <td><?php echo $unAvis->email; ?></td>
                                <td><?php echo $unAvis->avis; ?></td>
                                <td><a href="index.php?controleur=Table&action=supprimerAvisClient&id=<?php echo $unAvis->id; ?>" class="button button-panier"><i class="fas fa-xs fa-trash"></i></a></td>
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
