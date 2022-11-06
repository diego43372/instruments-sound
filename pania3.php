html>
<head>
<title>Problema</title>
</head>
<body>
<?php
$clientes1yclientes2 = mysqli_connect("localhost", "root", "",
"clientes1yclientes2") or
die("Problemas con la conexión");
$registros = mysqli_query($clientes1yclientes2, "select
Identificacion,Nombres,Sexo,Direccion,Correo,Fecha_Nac,Movil,Edad
from Usuarios") or
die("Problemas en el select:" . mysqli_error($clientes1yclientes2));
while ($reg = mysqli_fetch_array($registros)) {
echo "Identificacion:" . $reg['Identificacion'] . "<br>";
echo "Nombres:" . $reg['Nombres'] . "<br>";
echo "Sexo:" . $reg['Sexo'] . "<br>";
echo "Direccion:" . $reg['Direccion'] . "<br>";
echo "Correo:" . $reg['Correo'] . "<br>";
echo "Fecha_Nac:" . $reg['Fecha_Nac'] . "<br>";
echo "Movil:" . $reg['Movil'] . "<br>";
echo "Edad:" . $reg['Edad'] . "<br>";
echo "<br>";
echo "<hr>";
}
mysqli_close($clientes1yclientes2);
?>
</body>
</html>