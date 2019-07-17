<?php
extract($_GET);//qui extraigo el id de la pagina listaProveedores segun el Proveedor q quiera eliminar logicamente

session_start();
if ($_SESSION['id_usuarioA'] and $id) {//si esta loguado como administrador me dejara hacer este proceso si no no realizara este proceso

}else {
    header("Location:../index.php");
}


require("../conexionBD/conexionBD.php");


$estatusDesactivado=0;//el estatus 0 significa eliminado



//aqui cambiare de estatus solo el proveedor que reciba por la variable $id
$sql2 = "UPDATE usuario SET estatus='$estatusDesactivado' where id_usuario='$id'";

date_default_timezone_set('America/Caracas');
$date_time=date('d/m/Y H:i');

$sqlLog = str_replace("'","",$sql2);
$sqlPreLog = "INSERT INTO pre_logs (id_usu, ip_usu, sql_exe, date_time, inf_usu, url_sql, mac_usu) 
VALUES
('{$_SESSION['id_usuarioA']}', '{$_SERVER['REMOTE_ADDR']}', '$sqlLog', '$date_time', '{$_SERVER['HTTP_USER_AGENT']}', '{$_SERVER['PHP_SELF']}', '{$_SESSION['mac_usu']}')";

 $queryPreLog = pg_query($conexion,$sqlPreLog);


   $result=pg_query($conexion,$sql2);


//aqui saldra este aviso y saldra que el proveedor esta eliminado "logicamente"
   if ($result ==true) {
   	echo "<script>alert('Has Desactivado el Usuario Con el ID:  --$id--  Satifactoriamente!!!');
   	window.location='../listaUsuSesionEstatus.php#ir';exit();</script>";
   }


?>