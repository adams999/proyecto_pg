<?php
extract($_GET);

session_start(); //aqui se inicia la session con las variables del usuario logueado
if ($_SESSION['id_usuarioA'] and $id) {
  //echo "tu nombre es " .$_SESSION['nombre'];
} else {
  header("Location:../index.php");
}

$estatusCancelado = 0;
//-------------------------------------------------------------------------------------------//

require("../conexionBD/conexionBd.php");



$sq = ("SELECT * FROM detalle_apartado where id_apartado='$id' and estatus=1 order by id_detalle_apartado desc");

//la variable  $pg viene de connect_db que lo traigo con el require("conexionBD/conexionBD.php");
$que = pg_query($conexion, $sq);

//con este array cargo los datos personales del usuario para despues mostrar la informacion del mismo 

while ($arreglo = pg_fetch_array($que)) {
  $cantidad_apartada = $arreglo['cantidad_apartada'];
  $id_producto_venta = $arreglo['id_producto_venta'];

  $sq = ("SELECT * FROM catalogo_venta where id_producto_venta='$id_producto_venta'");

  //la variable  $pg viene de connect_db que lo traigo con el require("conexionBD/conexionBD.php");
  $que1 = pg_query($conexion, $sq);

  //con este array cargo los datos personales del usuario para despues mostrar la informacion del mismo 

  while ($arreglo1 = pg_fetch_array($que1)) {
    $productos_vendidos = $arreglo1['productos_vendidos'];
    $productos_disponibles = $arreglo1['productos_disponibles'];


    $tot_prod_dis = $productos_disponibles + $cantidad_apartada;
    $tot_prod_vent = $productos_vendidos - $cantidad_apartada;

    $sqlP = "UPDATE catalogo_venta SET productos_disponibles='$tot_prod_dis' WHERE id_producto_venta='$id_producto_venta'";
  }
}
























//codigo para modificar la cantidad del producto Disponible
$sql1 = "UPDATE apartado SET estatus='$estatusCancelado' WHERE id_apartado_usuario='$id'";

date_default_timezone_set('America/Caracas');
$date_time = date('d/m/Y H:i');

$sqlLog2 = str_replace("'", "", $sqlP);
$sqlLog3 = str_replace("'", "", $sql1);
$sqlLog1 = str_replace("'", "", $sql4);
$sqlLog = $sqlLog1 . ', ' . $sqlLog2 . ', ' . $sqlLog3;
$sqlPreLog = "INSERT INTO pre_logs (id_usu, ip_usu, sql_exe, date_time, inf_usu, url_sql, mac_usu) 
             VALUES
             ('{$_SESSION['id_usuarioA']}', '{$_SERVER['REMOTE_ADDR']}', '$sqlLog', '$date_time', '{$_SERVER['HTTP_USER_AGENT']}', '{$_SERVER['PHP_SELF']}', '{$_SESSION['mac_usu']}')";

$queryPreLog = pg_query($conexion, $sqlPreLog);

///
$sql4 = "UPDATE detalle_apartado SET estatus='$estatusCancelado' WHERE id_apartado='$id'";
$result4 = pg_query($conexion, $sql4);
$result = pg_query($conexion, $sql1);
$result5 = pg_query($conexion, $sqlP);
//--------------------el aviso de que se ejecuto el apartado-----------------------------------//

if ($result == true and $result4 == true and $result5 == true) {
  // proceso Apartado



  echo "<script>alert('Administrador {$_SESSION['nombre']} {$_SESSION['apellido']} Has Cancelado/Eliminado el Apartado Con el ID:  --$id--  Satifactoriamente!. Todos los Productos Se Restablecieron Correctamente y estan Diponibles');
              window.location='../listaProductosDeUsuarios.php#ir';exit();</script>";
  exit();
} else {
  echo "no se puedo hacer el Proceso";
}


pg_close($conexion);
