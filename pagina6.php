<html>
<head>
<title>Problema</title>
</head>
<body>
<?php
$clientes1yclientes2 = mysqli_connect("localhost", "root", "",
"clientes1yclientes2") or
die("Problemas con la conexión");
$registros = mysqli_query($clientes1yclientes2, "select Identificacion
from Usuarios
where Identificacion=$_REQUEST[Identificacion]") or
die("Problemas en el select:" .
mysqli_error($clientes1yclientes2));
if ($reg = mysqli_fetch_array($registros)) {
mysqli_query($clientes1yclientes2, "delete from Usuarios
where Identificacion=$_REQUEST[Identificacion]") or
die("Problemas en el select:" .
mysqli_error($clientes1yclientes2));
echo "Se efectuó el borrado del Usuario con el
numero de identificacion digitado.";
} else {
echo "No existe un Usuario con ese numero de identificacion lo
siento intente con otro.";
}
mysqli_close($clientes1yclientes2);
?>
</body>
</html>