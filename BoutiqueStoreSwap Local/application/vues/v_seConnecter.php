
<!-- Main -->
<div class="wrapper">
    <div class="container" id="main">

        <div id="footer" class="container">
            <header class="major">
                <h2>Formulaire de connexion</h2>
                <p><i>Via ce formulaire, vous pourrez vous connecter à votre compte client.</i></p>
            </header>
            <div class="row.aln-center">
                <section class="col-6 col-12-narrower">
                    <form method="post" action="index.php?controleur=Admin&action=verifierConnexionClient">
                        <div class="row gtr-50">
                            <div class="col-6 col-12-mobile">
                                <input name="loginClient" placeholder="Login" type="text" required="required" />
                            </div>
                            <div class="col-6 col-12-mobile">
                                <input name="mdpClient" placeholder="Mot De Passe" type="password" required="required" />
                            </div>
                            <div class="col-12">
                                <ul class="actions">
                                    
                                    <input type="checkbox" name="connexion_auto" id="connexion_auto" />
                                    <label for="connexion_auto" class="enligne"> Connexion automatique </label><br/>
                                    
                                    <li><input type="submit" value="Se connecter" /></li>
                                    <li><input type="reset" value="Vider le formulaire" /></li>
                                    <li><a href="index.php?controleur=Admin&action=afficherInscription"><input type="button" value="Inscrivez-vous !" /></a></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
</div>
