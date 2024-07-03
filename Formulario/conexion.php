<?php

$servername = "localhost";

$username = "root";

$password = "";





$conection = new PDO(

        "mysql:host=$servername;dbname=formulario",

        $username,

        $password

    );
?>