<html>
<head>
<title>Listado</title>
</head>
<link rel="stylesheet" href="instrumentsound.css">
<style>
    body{
        background-color: #6A5ACD
       
            }
          



 </style>   
<body>
<?php
$instruments_sound = mysqli_connect("localhost", "root", "",
"instruments_sound") or
die("Problemas con la conexión");
$registros = mysqli_query($instruments_sound, "select
identificacion,correo,nombre,apellidos,contraseña,estado,rol
from usuarios") or
die("Problemas en el select:" . mysqli_error($instruments_sound));
while ($reg = mysqli_fetch_array($registros)) {
echo "identificacion:" . $reg['identificacion'] . "<br>";
echo "correo:" . $reg['correo'] . "<br>";
echo "nombre:" . $reg['nombre'] . "<br>";
echo "apellidos:" . $reg['apellidos'] . "<br>";
echo "contraseña:" . $reg['contraseña'] . "<br>";
echo "estado:" . $reg['estado'] . "<br>";
echo "rol:" . $reg['rol'] . "<br>";
echo "<br>";
echo "<hr>";
}
mysqli_close($instruments_sound);
?>
</body>
</html>