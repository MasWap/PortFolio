<div class="wrapper">
    <div class="container">
        <div class="row">
            <section class="col-6 col-12-narrower feature">
                <?php
                foreach (VariablesGlobales::$lesProduits as $unProduit) {
                ?>
                    <div class="image-wrapper first">
                        <a href="#" class="image featured first"><img src="<?php echo Chemins::IMAGES . "pic01.jpg"; ?>" alt="" /></a>
                    </div>
                    <header>
                        <h2><?php echo $unProduit->LibelleProduit;?><br /></h2>
                    </header>
                    <p>Lorem ipsum dolor sit amet consectetur et sed adipiscing elit. Curabitur vel
                        sem sit dolor neque semper magna. Lorem ipsum dolor sit amet consectetur et sed
                        adipiscing elit. Curabitur vel sem sit.</p>
                    <ul class="actions">
                        <li><a href="left-sidebar.php#produit1" class="button">Acheter Produit 1</a></li>
                    </ul>
                </section>
                <section class="col-6 col-12-narrower feature">
                    <div class="image-wrapper">
                        <a href="#" class="image featured"><img src="<?php echo Chemins::IMAGES . "pic02.jpg"; ?>" alt="" /></a>
                </div>
                <header>
                    <h2>PRODUIT IMPORTANT 2<br /></h2>
                </header>
                <p>Lorem ipsum dolor sit amet consectetur et sed adipiscing elit. Curabitur vel
                    sem sit dolor neque semper magna. Lorem ipsum dolor sit amet consectetur et sed
                    adipiscing elit. Curabitur vel sem sit.</p>
                <ul class="actions">
                    <li><a href="left-sidebar.php#produit1" class="button">Acheter Produit 2</a></li>
                </ul>
            </section>
                <?php
                }
                ?>
        </div>
    </div>
</div>