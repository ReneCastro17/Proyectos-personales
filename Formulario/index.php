<?php
include "conexion.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST' )
{
$Nombre = $_POST['nombre'];
$Apellido = $_POST['apellido'];
$Telefono = $_POST['numero'];
$Correo = $_POST['correo'];
$Mensaje= $_POST['mensaje'];

$queary_insert = $conection->prepare('INSERT INTO id (Nombre,Apellido,Telefono,Correo,Mensaje) Values (?,?,?,?,?)');
$queary_insert ->execute([$Nombre,$Apellido,$Telefono,$Correo,$Mensaje]);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta  name="viewport" content="IE=edge">
  <title>Formulario de Datos Básicos</title>
  <link rel="Stylesheet" href="CSS/main.css">
</head>
<body>
    <form action="" class="form" method="post">
        <h1 class="form_title"><b>Porfavor llena los campos siguientes</b></h1>
        <div class="form_container">
            <div class="form_group">
                <input type="text" name="nombre" id="nombre" class="form_input" placeholder=" "/>
                <label for="nombre" class="form_label">Nombre:</label>
                <span class="form_line"></span>
            </div>
            <div class="form_group">
                <input type="text" name="apellido" id="apellido" class="form_input" placeholder=" "/>
                <label for="apellido" class="form_label">Apellido:</label>
                <span class="form_line"></span>
            </div>
            <div class="form_group">
               <input type="tel" name="numero"  id="numero" class="form_input" placeholder=" "/>
                <label for="numero" class="form_label">Numero:</label>
                <span class="form_line"></span>
            </div>
            <div class="form_group">
                <input type="email" name="correo" id="correo" class="form_input" placeholder=" "/>
                <label for="correo" class="form_label">Correo:</label>
                <span class="form_line"></span>
            </div>
            <div class="form_group">
                <input type="text" name="mensaje" id="mensaje" class="form_input" placeholder=" "/>
                <label for="mensaje" class="form_label">Mensaje:</label>
                <span class="form_line"></span>
            </div>
            <button type="submit" class="form_submit">Enviar</button>
        </div>
    </form>
</body>
</html>
