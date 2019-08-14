<?php

// conexion al servidor y seleccion de base de datos
require("../conexionBD/conexionBD.php");

// leer las variables del formulario
$nombre_usuario = $_POST["nombre_usuario"];
$correo_usuario = $_POST["correo_usuario"];
$estado = $_POST["conti"];
$direccion = $_POST["direccion"];
$cod_telef_pers = $_POST["cod_telef_pers"];
$telef_personal = $_POST["telef_personal"];
$apellido_usuario = $_POST["apellido_usuario"];
$contra_usuario = $_POST["contra_usuario"];
$ciudad = $_POST["pais"];
$cedula_usuario = $_POST["cedula_usuario"];
$prefijoCedula = $_POST["prefijoCedula"];
$cedula_usuario = $prefijoCedula . $cedula_usuario;
$cod_telef_hog = $_POST["cod_telef_hog"];
$telef_hog = $_POST["telef_hog"];
$pregunta_seg = $_POST["pregunta_seguridad"];
$respuesta_seg = $_POST["respuesta"];
$estatus = 1;

//validacion por parte de php para que las variables esten todas llenas y se pueda procesar el registro del usuario
if ($nombre_usuario == null or $correo_usuario == null or $estado == null or $estado == 'Elige Tu Estado...' or $ciudad == 'Elige Tu Ciudad...' or $ciudad == 'Selecciona Primero Tu Estado...' or $direccion == null or $telef_personal == null or $apellido_usuario == null or $contra_usuario == null or $ciudad == null or $cedula_usuario == null or $telef_hog == null) {
  echo "<script>
        alert('Porfavor Completa todos los Campos para Generar tu Registro');window.location='../registroUsuario.php';exit();
    </script>exit()";
  exit();
}

$valida1 = "SELECT * FROM usuario WHERE correo_usuario = '$correo_usuario'"; //codigo para evitar que se registran ci y correo 2 veces en BD.
$valida2 = "SELECT * FROM usuario WHERE cedula_usuario = '$cedula_usuario'";

$tot1 = pg_query($conexion, $valida1);
$tot2 = pg_query($conexion, $valida2);

$resul1 = pg_num_rows($tot1);
$resul2 = pg_num_rows($tot2);

if ($resul1 >= 1) {
  echo "<script>alert('ATENCIÓN: El Correo --$correo_usuario-- Ya Se Encuentra Registrado, Por Favor Verifica tu Correo!');window.location='../registroUsuario.php';exit();</script>";
  exit();
} elseif ($resul2 >= 1) {
  echo "<script>alert('ATENCIÓN: La Cedula --$cedula_usuario-- Ya Se Encuentra Registrada, Por Favor Ingrese Datos Válidos!');window.location='../registroUsuario.php';exit();</script>";
  exit();
} elseif ($resul1 <= 0 and $resul2 <= 0 and $estado != 'Elige Tu Estado...' and $ciudad != 'Elige Tu Ciudad...' and $ciudad != 'Selecciona Primero Tu Estado...') {           //SI NO HAY 1 O MAS DATOS REGISTRADOS IGALES SE PROSIGUE CON EL REGISTRO EN BASE DE DATOS Y TABLA CORRESPONDIENTE
  // sentencia sql
  $insertar = "INSERT INTO usuario (cedula_usuario, nombre_usuario, apellido_usuario, correo_usuario, contra_usuario, estado, ciudad, direccion, cod_telef_pers, telef_personal, cod_telef_hog, telef_hog, bandera, estatus, pregunta_seguridad, respuesta_seguridad)

	 		VALUES

    ('$cedula_usuario', '$nombre_usuario', '$apellido_usuario', '$correo_usuario', '$contra_usuario', '$estado', '$ciudad', '$direccion','$cod_telef_pers', '$telef_personal', '$cod_telef_hog', '$telef_hog', '1', '$estatus', '$pregunta_seg', '$respuesta_seg')";
}

date_default_timezone_set('America/Caracas');
$date_time = date('d/m/Y H:i');
function GetMAC()
{
  ob_start();
  system('getmac');
  $Content = ob_get_contents();
  ob_clean();
  return substr($Content, strpos($Content, '\\') - 20, 17);
}
$mac = GetMAC();
$sqlLog = str_replace("'", "", $insertar);
$sqlPreLog = "INSERT INTO pre_logs (id_usu, ip_usu, sql_exe, date_time, inf_usu, url_sql, mac_usu) 
				   VALUES
				   ('9999', '{$_SERVER['REMOTE_ADDR']}', '$sqlLog', '$date_time', '{$_SERVER['HTTP_USER_AGENT']}', '{$_SERVER['PHP_SELF']}', '$mac')";

$queryPreLog = pg_query($conexion, $sqlPreLog);

//verificar consulta
$resultado = pg_query($conexion, $insertar);

if ($resultado) {
  $Select = "SELECT id_usuario from usuario ORDER BY id_usuario DESC limit 1";
  $resultUsuario = pg_query($conexion, $Select);

  while ($arreglo = pg_fetch_array($resultUsuario)) { //este arreglo ordena la informacion del array correspondiente a los apartados para despues llamar la informacion que se necesite
    $idUsuario = $arreglo['id_usuario'];
  };

  $insertElem = "INSERT INTO elementos (id_usu, cat_acc, cat_car, cat_cha, cat_ele, cat_fre, cat_mot, cat_sus, cat_tra, estatus, reg_adm, mod_int, mod_log)

  VALUES

  ('$idUsuario', 't', 't', 't', 't', 't', 't', 't','t', '1', 't', 't', 't')";
  pg_query($conexion, $insertElem);

  echo "<script>alert(' -$nombre_usuario $apellido_usuario- Enhorabuena Te has Registrado en Yural C.A Satisfactoriamente!!!');
				window.location='../loginUsuario.php';
				</script>";
} else {
  echo "error en archivo php";
}

//cerrar la conexion
pg_close($conexion);
