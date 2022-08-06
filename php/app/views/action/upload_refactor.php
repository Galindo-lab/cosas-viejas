<?php

define("SUPPORTED_FORMATS",array(1=>"mp3",2=>"ogg",3=>"wav",4=>"acc",5=>"opus",6=>"flac"));
define("DIR","../../uploads/");

function extension($file) { return strtolower(pathinfo($file,PATHINFO_EXTENSION)); }
function console_log($text) { echo "<script> console.log(\"$text\");  </script>" ; }


include("../../classes/Test.php");

$cacacaaca = new Tests(
    array(

        "formato valido" => function() {
            return array_search(extension($_FILES["fileToUpload"]["name"]),SUPPORTED_FORMATS);
        },

        "el archivo no existe" => function() {
            return !(file_exists(DIR.$_FILES["fileToUpload"]["name"]));
        },

    ), function(){
        move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], DIR.$_FILES["fileToUpload"]["name"]);
    }
);

