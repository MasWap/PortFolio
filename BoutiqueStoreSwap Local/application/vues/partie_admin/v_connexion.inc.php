<!-- Main -->
<div class="wrapper">
    <div class="container" id="main">
        <div id="footer" class="container">
            <div class="row.aln-center">
                <section>
                    <div class="titre">
                        Administration du site (Accès réservé)
                    </div> 
                    <form method="post" action="index.php?controleur=Admin&action=verifierConnexion">
                        <fieldset>
                            <legend>Identification</legend> 
                            <label for="login">Votre login :</label> <input type="text" name="login" id="login" required="required" /> <br/>
                            <label for="passe">Votre mot de passe :</label><input type="password" name="passe" id="passe" required="required" />
                            <br/>
                            <input type="checkbox" name="connexion_auto" value="on" id="connexion_auto" />
                            
                            <label for="connexion_auto" class="enligne"> Connexion automatique </label><br/>
                            
                            <input type="submit" value="Connexion" /> 
                            
                        </fieldset> 
                    </form>
                </section>
            </div>
        </div>
    </div>
</div>