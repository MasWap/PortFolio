<?php

class ControleurAdmin{
    
   
    public function __construct() {
    }

    
    public function afficherSeConnecter() {
            require Chemins::VUES . 'v_seConnecter.php';
    }
    
    public function afficherInscription() {
            require Chemins::VUES . 'v_inscription.php';
    }
    
    public function validerInscription() {
            GestionBoutiquePPE::addClient($_POST['name'], $_POST['lastname'], $_POST['email'], $_POST['login'], $_POST['password'], $_POST['adresse'], $_POST['phoneNumber'], $_POST['pays']);
            require Chemins::VUES . 'v_seConnecter.php';
    }
    
    public function verifierConnexion() {
    
            if (GestionBoutiquePPE::isAdminOK($_POST['login'], $_POST['passe'])) {
                $_SESSION['login_admin'] = $_POST['login'];

                if (isset($_POST['connexion_auto']))
                    setcookie('login_admin', $_POST['login'], time() + 7 * 24 * 3600, null, null, false, true);
                // Le cookie sera valable dans ce cas 1 semaine (7 jours)

                require Chemins::VUES_ADMIN . 'v_index_admin.inc.php';
            } else
                require Chemins::VUES_ADMIN . 'v_acces_interdit.inc.php';
    }
    
    public function afficherIndexAdmin() {
            if (isset($_SESSION['login_admin']))
                require Chemins::VUES_ADMIN . 'v_index_admin.inc.php';
            else
                require Chemins::VUES_ADMIN . 'v_connexion.inc.php';
    }
        
    public function verifierConnexionClient() {
        if (isset($_SESSION['login_client']))
             require Chemins::VUES_ADMIN . 'v_espaceClient.php';
         else {
             
         {
            
            if (GestionBoutiquePPE::isClientOK($_POST['loginClient'], $_POST['mdpClient'])) {
                $_SESSION['login_client'] = $_POST['loginClient'];

                if (isset($_POST['connexion_auto']))
                    setcookie('login_client', $_POST['loginClient'], time() + 7 * 24 * 3600, null, null, false, true);
                // Le cookie sera valable dans ce cas 1 semaine (7 jours)
                require Chemins::VUES_ADMIN . 'v_espaceClient.php';
                
                header("Refresh:0");
                
            } else
                require Chemins::VUES_ADMIN . 'v_noninscrit.php';
         }
    }
    }
    
    public function afficherIndexClient() {
            if (isset($_SESSION['login_client']))
                require Chemins::VUES_ADMIN . 'v_espaceClient.php';
            else
                require Chemins::VUES . 'v_seConnecter.php';
    }

    public function seDeconnecter() {
            // Suppression des variables de session et de la session
            $_SESSION = array();
            session_destroy();
            setcookie('login_admin', ''); //suppression du cookie en vidant simplement la chaîne
            require Chemins::VUES_ADMIN . 'v_connexion.inc.php';
    }
    
    public function seDeconnecterClient() {
            // Suppression des variables de session et de la session tt
            $_SESSION = array();
            session_destroy();
            setcookie('login_client', ''); //suppression du cookie en vidant simplement la chaîne
            require Chemins::VUES . 'v_seConnecter.php';
           
            
//            header("Refresh:0");
               
            
    }

    public function avisClient() {
            GestionBoutiquePPE::addAvisClient($_POST['nom'], $_POST['email'], $_POST['avis']);
            require Chemins::VUES . 'v_avisEnvoye.php';
    }
    
    public function SupprimerClient() {
            require Chemins::VUES . 'v_compteSupprime.php';
    }
    
}
?>