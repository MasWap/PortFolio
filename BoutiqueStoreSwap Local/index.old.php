<?php
session_start();
ob_start();
require_once 'configs/chemins.class.php';
require_once Chemins::CONFIGS . 'mysql_config.class.php';
require_once Chemins::MODELES . 'gestion_boutique.class.php';
require_once Chemins::CONFIGS . 'variables_globales.class.php';
require_once Chemins::VUES_PERMANENTES . 'v_entete.inc.php';
require_once Chemins::CONTROLEURS . 'controleur_produits.class.php';
//var_dump(GestionBoutiquePPE::isClientOK("Pac","pac34"));
?>

<?php
//GestionBoutiquePPE::addClient('Jack', 'Jack', 'jack@gmail.com', 'login', 'password', 'kjskjsdkj', '0645875412', 'FR');
//Affectation d'une variable $cas en fonction du paramètre d'URL
if (!isset($_REQUEST['cas'])) {
    $cas = 'afficherAccueil';
} else {
    $cas = $_REQUEST['cas'];
}
if (isset($_REQUEST['categorie'])) {
    $categorie = $_REQUEST['categorie'];
}
if (isset($_COOKIE['login_admin'])) {
    $_SESSION['login_admin'] = $_COOKIE['login_admin'];
}
if (isset($_COOKIE['login_client'])) {
    $_SESSION['login_client'] = $_COOKIE['login_client'];
}

//Aiguillage vers le bon corps de page
switch ($cas) {
    case 'afficherAccueil': {
            $controleurProduits = new ControleurProduits();
            $controleurProduits->afficherProduitsImportants();
            break;
        }
    case 'afficherBoutique': {
            
            $controleurProduits = new ControleurProduits();
            $controleurProduits->afficher();
            break;
        }
    case 'afficherCV': {
            require Chemins::VUES . 'v_cv.php';
            break;
        }
    case 'afficherLDM': {
            require Chemins::VUES . 'v_ldm.php';
            break;
        }
    case 'afficherSeConnecter': {
            require Chemins::VUES . 'v_seConnecter.php';
            break;
        }
    case 'afficherInscription': {
            require Chemins::VUES . 'v_inscription.php';
            break;
        }
    case 'validerInscription': {
            //var_dump($_POST);
            GestionBoutiquePPE::addClient($_POST['name'], $_POST['lastname'], $_POST['email'], $_POST['login'], $_POST['password'], $_POST['adresse'], $_POST['phoneNumber'], $_POST['pays']);
            require Chemins::VUES . 'v_seConnecter.php';
            break;
        }
        
    case 'avisClient': {
            GestionBoutiquePPE::addAvisClient($_POST['nom'], $_POST['email'], $_POST['avis']);
            break;
        }

    case 'afficherIndexAdmin': {
            if (isset($_SESSION['login_admin']))
                require Chemins::VUES_ADMIN . 'v_index_admin.inc.php';
            else
                require Chemins::VUES_ADMIN . 'v_connexion.inc.php';

            break;
        }

    case 'afficherIndexClient': {
            if (isset($_SESSION['login_client']))
                require Chemins::VUES_ADMIN . 'v_clientinscrit.php';
            else
                require Chemins::VUES . 'v_seConnecter.php';

            break;
        }

    case 'verifierConnexion': {
            if (GestionBoutiquePPE::isAdminOK($_POST['login'], $_POST['passe'])) {
                $_SESSION['login_admin'] = $_POST['login'];

                if (isset($_POST['connexion_auto']))
                    setcookie('login_admin', $_POST['login'], time() + 7 * 24 * 3600, null, null, false, true);
                // Le cookie sera valable dans ce cas 1 semaine (7 jours)

                require Chemins::VUES_ADMIN . 'v_index_admin.inc.php';
            } else
                require Chemins::VUES_ADMIN . 'v_acces_interdit.inc.php';

            break;
        }

    case 'verifierConnexionClient': {
            if (GestionBoutiquePPE::isClientOK($_POST['loginClient'], $_POST['mdpClient'])) {
                $_SESSION['login_client'] = $_POST['loginClient'];

                if (isset($_POST['connexion_auto']))
                    setcookie('login_client', $_POST['loginClient'], time() + 7 * 24 * 3600, null, null, false, true);
                // Le cookie sera valable dans ce cas 1 semaine (7 jours)

                require Chemins::VUES_ADMIN . 'v_espaceClient.php';
            } else
                require Chemins::VUES_ADMIN . 'v_noninscrit.php';

            break;
        }




    case 'seDeconnecter': {
            // Suppression des variables de session et de la session
            $_SESSION = array();
            session_destroy();
            setcookie('login_admin', ''); //suppression du cookie en vidant simplement la chaîne
            break;
        }

    case 'seDeconnecterClient': {
            // Suppression des variables de session et de la session tt
            $_SESSION = array();
            session_destroy();
            setcookie('login_client', ''); //suppression du cookie en vidant simplement la chaîne
            break;
        }

    default:
        require Chemins::VUES . 'v_404.php';
}
?>


<!-- Pied de page -->
<?php
require Chemins::VUES_PERMANENTES . 'v_pied.inc.php';
?>