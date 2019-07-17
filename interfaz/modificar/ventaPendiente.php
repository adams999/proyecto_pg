<?php 
extract($_GET);

session_start();//aqui se inicia la session con las variables del usuario logueado
if ($_SESSION['id_usuarioA'] and $id) {
    //echo "tu nombre es " .$_SESSION['nombre'];
}else {
    header("Location:../index.php");
}

$estatusPendiente=3;
//-------------------------------------------------------------------------------------------//

        require("../conexionBD/conexionBd.php");


$sql2=("SELECT * FROM ventas_productos where id_venta_producto='$id'");

//la variable  $pg viene de connect_db que lo traigo con el require("conexionBD/conexionBD.php");
$query2=pg_query($conexion,$sql2);

//con este array cargo los datos personales del usuario para despues mostrar la informacion del mismo 

while($arreglo2=pg_fetch_array($query2)){
      $id_apartado=$arreglo2['id_apartado'];
}









          /////////cambiar estatus de detalle de apartado a 0 
          $sql3 = "UPDATE ventas_productos SET estatus='$estatusPendiente' WHERE id_venta_producto='$id'";
         


          //codigo para modificar la cantidad del producto Disponible
             $sql1 = "UPDATE apartado SET estatus='$estatusPendiente' WHERE id_apartado_usuario='$id_apartado'";
             


              ///
              $sql4 = "UPDATE detalle_apartado SET estatus='$estatusPendiente' WHERE id_apartado='$id_apartado'";
             
              date_default_timezone_set('America/Caracas');
              $date_time=date('d/m/Y H:i');

              $sqlLog1 = str_replace("'","",$sql2);
              $sqlLog2 = str_replace("'","",$sql2);
              $sqlLog3 = str_replace("'","",$sql3);
              $sqlLog = $sqlLog1.', '.$sqlLog2.', '.$sqlLog3;
              $sqlPreLog = "INSERT INTO pre_logs (id_usu, ip_usu, sql_exe, date_time, inf_usu, url_sql, mac_usu) 
              VALUES
              ('{$_SESSION['id_usuarioA']}', '{$_SERVER['REMOTE_ADDR']}', '$sqlLog', '$date_time', '{$_SERVER['HTTP_USER_AGENT']}', '{$_SERVER['PHP_SELF']}', '{$_SESSION['mac_usu']}')";

              $queryPreLog = pg_query($conexion,$sqlPreLog);
              
              $result=pg_query($conexion,$sql1);
              $result4=pg_query($conexion,$sql4);
              $result3=pg_query($conexion,$sql3);
              
              

          //--------------------el aviso de que se ejecuto el apartado-----------------------------------//

          if ($result==true and $result3==true and $result4){
             // proceso Apartado

             echo "<script>alert('Administrador {$_SESSION['nombre']} {$_SESSION['apellido']} Has Cambiando El Estatus de la Venta Con el ID:  --$id-- a Pendiente Satifactoriamente!!!');
              window.location='../ventasEnRevisionAdmin.php#ir';exit();</script>";exit();
                }else{
                  echo "no se puedo hacer el Proceso";
                }
      

pg_close($conexion);
 ?>