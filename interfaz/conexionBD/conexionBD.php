<?php
echo '<script src="../lib/sweetalert-master/docs/assets/sweetalert/sweetalert.min.js"></script>';

//conexion base de datos yural
$user = "postgres";
$password = "24819181";
$dbname = "yural";
$port = "5432";
$host = "localhost";

$cadenaConexion = "host=$host port=$port dbname=$dbname user=$user password=$password";

$conexion = pg_connect($cadenaConexion) or die("Error en la Conexión: ".pg_last_error());
