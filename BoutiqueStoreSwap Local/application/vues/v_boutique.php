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
                        <div class="image-wrapper first image">
                            <img class="image fit" src="images/produits/<?php echo $unProduit->cheminImage; ?>" />
                        </div>
                        <header>
                            <h3><?php echo $unProduit->LibelleProduit;?></h3>
                        </header>
                        <strong><p><i>Prix :</i> <?php echo $unProduit->PrixHTProduit; ?> € | <i>En Stock :</i> <?php echo $unProduit->QteStockProduit; ?></p></strong>
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



