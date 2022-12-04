<html>
<head>
<title>Borrado</title>
<link rel="stylesheet" href="instrumentssound.css">
</head>
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
$registros = mysqli_query($instruments_sound, "select identificacion
from usuarios
where identificacion=$_REQUEST[identificacion]") or
die("Problemas en el select:" .
mysqli_error($instruments_sound));
if ($reg = mysqli_fetch_array($registros)) {
mysqli_query($instruments_sound, "update from usuarios
where identificacion=$_REQUEST[identificacion]") or
die("Problemas en el select:" .
mysqli_error($instruments_sound));
echo "Se efectuó la actualizacion del Usuario con el
numero de identificacion digitado.";
} else {
echo "No existe un Usuario con ese numero de identificacion lo
siento intente con otro.";
}
mysqli_close($instruments_sound);
?>
</body>
</html>