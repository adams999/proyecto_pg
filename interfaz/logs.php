<!DOCTYPE html>
<?php //esta es la validacion para el Administrador!!!!
session_start();
if ($_SESSION['id_usuarioA']) {
    //echo "tu nombre es " .$_SESSION['nombre'];
} else {
    header("Location:index.php");
}
?>

<html lang="es">

<head>
    <meta charset="utf-8">
    <title>Registros de Movimientos</title>
    <link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/styleCatalogo.css">
    <link rel="icon" href="img/icono1.ico">
</head>

<body>
    <section class="container-fluid">

        <?php include('include/menuAdministrador.php'); ?>

        <article class="row">


            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
                <p class="titulo1">
                    <a name="ir"></a>
                    Movimientos &nbsp; <i class="glyphicon glyphicon-globe"></i></p>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <form action="#" class="form form-group">
                    <label>
                        Seleccionar Filtrado
                    </label>
                    <select name="tabla" id="tabla" class="form-control has-success">
                        <option value="usuarios">Usuarios</option>
                        <option value="catalogo_venta">Productos</option>
                        <option value="Ventas">Ventas</option>
                    </select>
                </form>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <form action="#" class="form form-group">
                    <label>
                        Acción
                    </label>
                    <select name="tabla" id="tabla" class="form-control has-success">
                        <option value="INSERT">Registro</option>
                        <option value="UPDATE">Modificaciones</option>
                    </select>
                </form>

            </div>

            <?php

            require("conexionBD/conexionBD.php");

            $sql = "SELECT
                logs.id_log,
                logs.id_usu,
                usuario.cedula_usuario,
                usuario.nombre_usuario,
                usuario.apellido_usuario,
                usuario.correo_usuario,
                logs.ip_usu,
                logs.id_pre_log,
                logs.tab_log,
                logs.acc_log,
                logs.log_sql,
                logs.date_log,
                logs.inf_usu,
                logs.url_sql,
                logs.val_mod_log,
                logs.mac_usu
            FROM
                logs
            INNER JOIN usuario ON logs.id_usu = usuario.id_usuario
            WHERE
                tab_log = 'ventas_productos'
            AND acc_log = 'UPDATE'
            AND date_log BETWEEN '15-07-2019'
            AND now() ";
            /* codigos de paginacion */
            $registros = pg_query($conexion, $sql);
            $num = pg_num_rows($registros);
            $pag = ceil($num / 10);

            @$prodIni = $_GET['ini'];
            @$prodFin = $_GET['fin'];

            echo "<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12' align='right' style='font-size:80%; color:green;'>
            $num Pedidos. En $pag Páginas. ";

            if (isset($prodIni) and isset($prodFin)) {
                echo "&nbsp;&nbsp;&nbsp;Pedido: $prodIni - $prodFin";
            }
            echo "<br></div>";

            if (isset($_GET['ini'])) {
                $ini = $_GET['ini'];
                $fin = $_GET['fin'];
                $sql = "SELECT
                    logs.id_log,
                    logs.id_usu,
                    usuario.cedula_usuario,
                    usuario.nombre_usuario,
                    usuario.apellido_usuario,
                    usuario.correo_usuario,
                    logs.ip_usu,
                    logs.id_pre_log,
                    logs.tab_log,
                    logs.acc_log,
                    logs.log_sql,
                    logs.date_log,
                    logs.inf_usu,
                    logs.url_sql,
                    logs.val_mod_log,
                    logs.mac_usu
                FROM
                    logs
                INNER JOIN usuario ON logs.id_usu = usuario.id_usuario
                WHERE
                    tab_log = 'ventas_productos'
                AND acc_log = 'UPDATE'
                AND date_log BETWEEN '15-07-2019'
                AND now()  LIMIT 10 offset $ini";
            } else {
                $sql = "SELECT
                    logs.id_log,
                    logs.id_usu,
                    usuario.cedula_usuario,
                    usuario.nombre_usuario,
                    usuario.apellido_usuario,
                    usuario.correo_usuario,
                    logs.ip_usu,
                    logs.id_pre_log,
                    logs.tab_log,
                    logs.acc_log,
                    logs.log_sql,
                    logs.date_log,
                    logs.inf_usu,
                    logs.url_sql,
                    logs.val_mod_log,
                    logs.mac_usu
                FROM
                    logs
                INNER JOIN usuario ON logs.id_usu = usuario.id_usuario
                WHERE
                    tab_log = 'ventas_productos'
                AND acc_log = 'UPDATE'
                AND date_log BETWEEN '15-07-2019'
                AND now()  LIMIT 10 offset 0";
            }

            $query = pg_query($conexion, $sql);




            echo '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <table class="table table-bordered" align="center">
            <tr class=" btn-primary trTitulo" align="center">
                <td class="titulo" width="30%">Usuario</td>
                <td class="titulo" width="30%">Información</td>
                <td class="titulo" width="30%">Fecha</td>
                <td class="titulo" width="10%">Datos/SQL</td>
            </tr>
        </table>
    </div>';



            while ($arreglo = pg_fetch_array($query)) { //este arreglo ordena la informacion del array correspondiente a los Pedidos para despues llamar la informacion que se necesite
               
                $arreglo['log_sql']=str_replace(['"',"'"], "", $arreglo['log_sql']);
                $arreglo['val_mod_log'] = str_replace(['"',"'"], "", $arreglo['val_mod_log']);

                //aqui muestro el tr con los PEDIDOS correspondientes 
                ?>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">   
                    <table class="table table-hover table-bordered table-condensed" align="center">
                        <tr class="parrafo info" align="center">
                            <td class="titulo" width="30%"><b>CI: </b> <?php echo $arreglo['cedula_usuario'];?>. <br><b>Nombre: </b> <?php echo $arreglo['nombre_usuario']; ?> <br><b>Apellido: </b><?php echo $arreglo['apellido_usuario'];?><br><b>Email: </b><?php  $arreglo['correo_usuario']; ?></td>
                            <td class="titulo" width="30%"><b>IP: </b><?php $arreglo['ip_usu']; ?><br><b>Navegadores</b><?php echo $arreglo['inf_usu'];?> <br><b>Url: </b> <?php $arreglo['url_sql']; ?><br><b>MAC: </b><?php echo $arreglo['mac_usu'];?></td>
                            <td class="titulo" width="30%"><?php $arreglo['date_log'];?></td>
                            <td class="titulo" width="10%"><br><br>
                            <a href="#" data-toggle="modal" data-target="#InfoSql" onClick="Mostrar('<?php echo $arreglo["val_mod_log"];?>','<?php echo $arreglo["log_sql"];?>')">
                            <b>Info</b><br><i class="glyphicon glyphicon-eye-open"></i>
                                </a> 
                            </td>
                        </tr> 

                    </table>
                </div>
            <?php 
            }

            echo '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center" style="color:green"><hr width="75%">Pag.';
            for ($c = 1; $c <= $pag; $c++) {
                $ini = $c * 10 - 10;
                $fin = $ini + 9;
                echo ' <a href="logs.php?ini=' . $ini . '&fin=' . $fin . '#ir">' . $c . '</a>&nbsp;&nbsp;';
            }
            echo '</div>';

            ?>
            <div class="modal fade" id="InfoSql" tabindex="-1" role="dialog" aria-labelledby="InfoSqlLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="InfoSqlLabel">Informacion del Movimiento</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" id="modalLogs">
                            <script>
                                function Mostrar(a, b) {
                                    document.getElementById('modalLogs').innerHTML = a + b ;
                                }
                            </script>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>

        </article>

        <?php
        require("include/piePagina.php");
        ?>
    </section>


    <script src="../lib/jquery/jquery-3.1.1.min.js"></script>
    <script src="../lib/bootstrap/js/bootstrap.min.js"></script>

</body>

</html>