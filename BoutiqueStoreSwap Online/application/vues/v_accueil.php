		<div class="wrapper">
			<div class="container">
				<div class="row">
                                        <?php
                                        //var_dump(VariablesGlobales::$lesProduits);
                                        foreach (VariablesGlobales::$lesProduits as $unProduit) {
                                        ?>
					<section class="col-6 col-12-narrower feature">
						<div class="image-wrapper first">
							<a href="#" class="image featured first"><img src="images/produits/<?php echo $unProduit->cheminImage; ?>" /></a>
						</div>
						<header>
							<h2><?php echo $unProduit->LibelleProduit;?><br /></h2>
						</header>
						
                                                <p><?php echo $unProduit->descriptionImage;?></p>
                                                
						<ul class="actions">
							<li><a href="index.php?controleur=Boutique&action=afficherBoutique" class="button">Visiter la boutique</a></li>
						</ul>
					</section>
                                        <?php
                                        }
                                        ?>
				</div>
			</div>
		</div>

		<div id="promo-wrapper">
			<section id="promo">
				<h2>Newsletter & exclusivité</h2>
				<a href="index.php?controleur=Admin&action=afficherInscription" class="button">Inscrivez-vous !</a>
			</section>
		</div>

		<a id="apropos"></a>
		<div class="wrapper">
			<section class="container">
				<header class="major">
					<h2>Voici quelques informations sur la boutique StoreSwap</h2>
					<p><i>Les produits présenté sur ces produit peuvent être momentanément indisponible à la vente,
						 veuillez nous excuser...</i></p>
				</header>
				<div class="row features">
					<section class="col-4 col-12-narrower feature">
						<div class="image-wrapper first">
							<a href="#" class="image featured"><img src="<?php echo Chemins::IMAGES_NOUS."ecoute.jpg";?>" alt="" /></a>
						</div>
						<p>Nos convictions. Une équipe à l'écoute de ses clients.</p>
					</section>
					<section class="col-4 col-12-narrower feature">
						<div class="image-wrapper">
							<a href="#" class="image featured"><img src="<?php echo Chemins::IMAGES_NOUS."avis_client.jpg";?>" alt="" /></a>
						</div>
						<p>Quelques avis clients, pour forger votre opinion !</p>
					</section>
					<section class="col-4 col-12-narrower feature">
						<div class="image-wrapper">
							<a href="#" class="image featured"><img src="<?php echo Chemins::IMAGES_NOUS."pourquoi_storeswap.jpg";?>" alt="" /></a>
						</div>
						<p>Pourquoi StoreSwap ? Tout savoir sur notre team.</p>
					</section>
				</div>
				<ul class="actions major">
					<li><a href="#feedback" class="button">Votre Feedback</a></li>
				</ul>
			</section>
		</div>