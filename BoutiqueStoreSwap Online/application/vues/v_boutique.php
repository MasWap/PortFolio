<div class="wrapper">
    <div class="container" id="main">
        <div class="row gtr-150">
            <div class="row features">

            <nav>
                    
            </nav>

                <?php
                if (!isset($_SESSION['login_client'])) {
                
                    require_once 'v_seConnecter.php';

                
                }
                else
                {
//                var_dump(VariablesGlobales::$lesProduits);
                foreach (VariablesGlobales::$lesProduits as $unProduit) {
                
                ?>
                    <section class="col-4 col-12-narrower feature">
                        <div class="image-wrapper first">
                            <a href="#" class="image featured"><img src="images/produits/<?php echo $unProduit->cheminImage; ?>" /></a>
                        </div>
                        <header>
                            <h3><?php echo $unProduit->LibelleProduit;?></h3>
                        </header>
                        <p>Prix : <?php echo $unProduit->PrixHTProduit; ?> €</p>
                        <ul class="actions">
                            <li><a href="index.php?controleur=Panier&action=ajouterPanier&idProduit=<?php echo $unProduit->idProduit ?>" class="button">Ajouter au panier</a></li>
                        </ul>
                    </section>
                <?php
                }
            }
                ?>
            </div>
        </div>
    </div>
</div>



