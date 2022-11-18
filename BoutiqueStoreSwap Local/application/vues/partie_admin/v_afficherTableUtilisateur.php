<div class="wrapper">
    <div class="container">
        <div class="row">
            <section class="col-12 col-12-narrower feature">
            <h2>Liste des utilisateurs</h2></br>	
                <table class="default">
                    <thead>
                        <tr>
                            <th>Id de l'utilisateur</th>
                            <th><b>Login</b></th>
                            <th><b>Mot de passe</b></th>
                            <th><b>Email</b></th>
                            <th><b>Est-il Admin ?</b></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $lesUtilisateurs = GestionBoutiquePPE::getLesUtilisateurs();
                        ?>
                        
                        <?php
                        foreach ($lesUtilisateurs as $unUtilisateur) {
                        ?>
                            <tr>
                                <td><?php echo $unUtilisateur->id; ?></td>
                                <td><?php echo $unUtilisateur->login; ?></td>
                                <td><?php echo $unUtilisateur->passe; ?></td>
                                <td><?php echo $unUtilisateur->email; ?></td>
                                <td><?php echo $unUtilisateur->isAdmin; ?></td>
                                <td><a href="index.php?controleur=Table&action=supprimerUtilisateur&id=<?php echo $unUtilisateur->id; ?>" class="button button-panier"><i class="fas fa-xs fa-trash"></i></a></td>
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
