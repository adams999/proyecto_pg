<?php

extract($_GET);
json_decode(extract($_POST));

session_start();
if ($_SESSION['id_usuarioA']) { } else {
    header("Location:../index.php");
}
require("../conexionBD/conexionBD.php");

$array = [];
$array = str_replace(["[", "]"], "", $datos);
$array2 = explode(",", $array);

$sql = "UPDATE elementos SET 
cat_acc='$array2[0]', 
cat_car='$array2[1]',
cat_cha='$array2[2]',
cat_ele='$array2[3]',
cat_fre='$array2[4]',
cat_mot='$array2[5]',
cat_sus='$array2[6]',
cat_tra='$array2[7]' ";
if (@isset($array2[9])) {
    $sql .= ", reg_adm='$array2[9]',";
}
if (@isset($array2[10])) {
    $sql .= " mod_int='$array2[10]',";
}
if (@isset($array2[11])) {
    $sql .= " mod_log='$array2[11]'";
}
$sql .= " WHERE id_ele = $id_ele";

$sql2 = "UPDATE usuario SET bandera = ";
if ($array2[8] == 'true') {
    $sql2 .= "10";
} else {
    $sql2 .= "1";
}
$sql2 .= " WHERE id_usuario='$id_usu'";

date_default_timezone_set('America/Caracas');
$date_time = date('d/m/Y H:i');

$sqlLog1 = str_replace("'", "", $sql);
$sqlLog2 = str_replace("'", "", $sql2);
$sqlLog = $sqlLog1 . ' ' . $sqlLog2;
$sqlPreLog = "INSERT INTO pre_logs (id_usu, ip_usu, sql_exe, date_time, inf_usu, url_sql, mac_usu) 
			    VALUES
			('{$_SESSION['id_usuarioA']}', '{$_SERVER['REMOTE_ADDR']}', '$sqlLog', '$date_time', '{$_SERVER['HTTP_USER_AGENT']}', '{$_SERVER['PHP_SELF']}', '{$_SESSION['mac_usu']}')";
// echo $sql.'<br>';
// echo $sql2;
$queryPreLog = pg_query($conexion, $sqlPreLog);

$tot = pg_query($conexion, $sql);
$tot2 = pg_query($conexion, $sql2);

//si se pudieron realizar los cambios saldra este aviso automaticamente
if (isset($tot2)) {
    echo "EXITO";
}

if ($id_usu == $_SESSION['id_usuarioA'] and $array2[8] == 'false') {
    session_destroy();
}
