<?php
session_start();
if ($_SESSION['id_usuario']) { //si esta loguado como administrador me dejara hacer este proceso si no no realizara este proceso

} else {
   header("Location:../index.php");
}


require("../conexionBD/conexionBD.php");
extract($_GET); //qui extraigo el id de la pagina listado de proveedores eliminados de administrador segun el proveedor q quiera restaurar logicamente


$estatusActivado = 1; //el estatus 0 significa eliminado y 1 activado


//aqui cambiare de estatus solo el proveedor que reciba por la variable $id
$sql2 = "UPDATE bancos_usuario SET estatus='$estatusActivado' where id_banco_usuario='$id'";

date_default_timezone_set('America/Caracas');
$date_time = date('d/m/Y H:i');

$sqlLog = str_replace("'", "", $sql2);
$sqlPreLog = "INSERT INTO pre_logs (id_usu, ip_usu, sql_exe, date_time, inf_usu, url_sql, mac_usu) 
            VALUES
            ('{$_SESSION['id_usuario']}', '{$_SERVER['REMOTE_ADDR']}', '$sqlLog', '$date_time', '{$_SERVER['HTTP_USER_AGENT']}', '{$_SERVER['PHP_SELF']}', '{$_SESSION['mac_usu']}')";

$queryPreLog = pg_query($conexion, $sqlPreLog);


$result = pg_query($conexion, $sql2);


//aqui saldra este aviso y saldra que el proveedor esta eliminado "logicamente"
if ($result == true) {
   echo "<script>alert('Has Restaurado El Banco Con el ID:  --$id--  Satifactoriamente!!!');
   	window.location='../cuentasBancariasUsuario.php#ir';exit();</script>";
}

pg_close($conexion);
