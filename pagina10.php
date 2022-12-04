<html
<head>
<title> problema<title>
</head>
<link rel="stylesheet" href="instrumentssound.css">
<style>
    body{
        background-color: #6A5ACD
       }
</style>   
<body>
<?php
$instruments_sound = mysqli_connect ("localhost",
"root", "", “instruments_sound") or die("Problemas con la conexión");

mysqli_query ($instruments_sound, "update usuarios
set
correo='$_REQUEST[correonuevo]'
where
correo='$_REQUEST[correoviejo]'") or
die("Problemas en el
select:". mysqli_error ($instruments_sound));

echo "El correo fue modificado con
exito";
?>
</body>
</html>