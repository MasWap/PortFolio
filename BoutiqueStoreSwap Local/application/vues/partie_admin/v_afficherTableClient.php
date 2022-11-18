<div class="wrapper">
    <div class="container">
        <div class="row">
            <section class="col-12 col-12-narrower feature">
            <h2>Liste des clients</h2><br>
                <div style="overflow-x-y: hidden; overflow-y: scroll; border:#000000 1px solid; width: 1200px; height: 500px;">	
                <table class="default">



                    <thead>
                        <tr>
                            <th>Id de la catégorie</th>
                            <th><b>Nom</b></th>
                            <th><b>Prenom</b></th>
                            <th><b>Adresse</b></th>
                            <th><b>Code postal</b></th>
                            <th><b>Ville</b></th>
                            <th><b>Email</b></th>
                            <th><b>Login</b></th>
                            <th><b>Mot de passe</b></th>
                            <th><b>Telephone</b></th>
                            <th><b>Pays</b></th>
                            <th><b>Enregistrée sur notre site</b></th>
                            <th><b>Supprimer un client</b></th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $lesClients = GestionBoutiquePPE::getLesClientsAll();
                        ?>
                        
                        <?php
                        foreach ($lesClients as $unClient) {
                        ?>
                            <tr>
                                <td><?php echo $unClient->idClient; ?></td>
                                <td><?php echo $unClient->NomClient; ?></td>
                                <td><?php echo $unClient->PrenomClient; ?></td>
                                <td><?php echo $unClient->AdRueClient; ?></td>
                                <td><?php echo $unClient->AdCpClient; ?></td>
                                <td><?php echo $unClient->AdVilleClient; ?></td>
                                <td><?php echo $unClient->emailClient; ?></td>
                                <td><?php echo $unClient->loginClient; ?></td>
                                <td><?php echo $unClient->mdpClient; ?></td>
                                <td><?php echo $unClient->telClient; ?></td>
                                <td><?php echo $unClient->paysClient; ?></td>
                                <td><?php echo $unClient->isRegistered; ?></td>
                                <td><a href="index.php?controleur=Table&action=supprimerClient&idClient=<?php echo $unClient->idClient; ?>" class="button button-panier"><i class="fas fa-xs fa-trash"></i></a></td>

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
