<?php
require_once 'configs/chemins.class.php';
require_once Chemins::CONFIGS . 'mysql_config.class.php';
require_once Chemins::MODELES . 'gestion_boutique.class.php';
require_once Chemins::CONFIGS . 'variables_globales.class.php';
//var_dump(GestionBoutiquePPE::isClientOK("Pac","pac34"));
//echo sha1("passePetitChef");

GestionBoutiquePPE::addClient('Jack', 'Jack', 'jack@gmail.com', 'login', 'password', 'kjskjsdkj', 0645875412, 'FR');

?>


      <script> 
         function validateForm()                                 
         { 
             var name = document.forms["myForm"]["name"];         
             if (name.value == ""){ 
                 document.getElementById('errorname').innerHTML="Veuillez entrez un nom valide";  
                 name.focus(); 
                 return false; 
             }else{
                 document.getElementById('errorname').innerHTML="";  
             }
         }
      </script>
      
      <style>
         .error{
            color: #D8000C;
            background-color: #FFBABA;
         }
      </style>
      
      <form name="myForm" onsubmit="return validateForm()">
         <p>Votre nom: <input type="text" name="name" class="field-long"/>  <span class="error" id="errorname"></span></p>
         <p><input type="submit" value="Envoyer"></p>
      </form>