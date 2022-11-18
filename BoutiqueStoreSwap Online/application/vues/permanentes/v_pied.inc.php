<!-- Footer -->

<a id="feedback"></a>
<div id="footer-wrapper">
    <div id="footer" class="container">
        <header class="major">
            <h2>Formulaire d'avis client</h2>
            <p><i>Via ce formulaire, veuillez nous transmetre votre "feedback", ainsi que des idées pour
                    améliorer la boutique.</i></p>
        </header>
        <div class="row.aln-center">
            <section class="col-6 col-12-narrower">
                <form name="form" method="post" action="index.php?controleur=Admin&action=avisClient" required="requiered" >
                    <div class="row gtr-50">
                        <div class="col-6 col-12-mobile">
                            <input name="nom" placeholder="Prénom/Nom/Pseudo" type="text" required="requiered" />
                        </div>
                        <div class="col-6 col-12-mobile">
                            <input name="email" placeholder="Email" type="email" required="requiered" />
                        </div>
                        <div class="col-12">
                            <textarea name="avis" placeholder="Avis/Message" required="requiered" ></textarea>
                        </div>
                        <div class="col-12">
                            <ul class="actions">
                                <li><input type="submit" value="Envoyer"/></li>
                                <li><input type="reset" value="Vider le formulaire"/></li>
                            </ul>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
    <div id="copyright" class="container">
        <ul class="menu couleur custom">
            <li>&copy; StoreSwap. Tout droit reservé.</li>
            <li>Design: <a href="http://html5up.net" target="_blank">HTML5 UP</a></li>
            <li><a href=index.php?controleur=Admin&action=afficherIndexAdmin>Admin Pannel</a></li>
        </ul>
    </div>
</div>

</div>

<!-- Scripts -->
<script src="<?php echo Chemins::JS . "jquery.min.js"; ?>"></script>
<script src="<?php echo Chemins::JS . "jquery.dropotron.min.js"; ?>"></script>
<script src="<?php echo Chemins::JS . "browser.min.js"; ?>"></script>
<script src="<?php echo Chemins::JS . "breakpoints.min.js"; ?>"></script>
<script src="<?php echo Chemins::JS . "util.js"; ?>"></script>
<script src="<?php echo Chemins::JS . "main.js"; ?>"></script>

</body>

</html>