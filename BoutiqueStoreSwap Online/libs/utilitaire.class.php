<?php

Class Utilitaire {
    
    public static function getURLPrecendent() {
        $URL = "Location: " . $_SERVER['HTTP_REFERER'];
        return $URL;
    }
    
}




