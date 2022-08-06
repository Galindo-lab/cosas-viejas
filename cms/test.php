<?php
//require "conexion.php";

class conexion
{
    private $user      = "";
    private $password  = "";
    private $server    = "";
    private $data_base = "";

    private $conection;

    function __construct($user,$password,$server,$data_base) {
        $user      = isset($user)     ? $user     : 'root';
        $password  = isset($password) ? $password : '';
        $server    = isset($server)   ? $server   : 'localhost';
        $data_base = isset($data_base)? $data_base: 'undefined'; 
        
        print $user;
    }

    
}

$a = new conexion(null,"hola","server","data");
?>
