


!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php
$clientes1yclientes2 = mysqli_connect("localhost", "root", "", "clientes1yclientes2") or
die("Problemas con la conexión");

mysqli_query($clientes1yclientes2, "insert into Usuarios(Identificacion,Nombres,Sexo,Direccion,Correo,Fecha_Nac,Movil,Edad) values
          ($_REQUEST[Identificacion],'$_REQUEST[Nombres]','$_REQUEST[Sexo]','$_REQUEST[Direccion]','$_REQUEST[Correo]','$_REQUEST[Fecha_Nac]','$_REQUEST[Movil]',$_REQUEST[Edad])")
or die("Problemas en el select" . mysqli_error($clientes1yclientes2));

mysqli_close($clientes1yclientes2);

echo "Los datos fueron guardados ";
?>
</body>
</html>