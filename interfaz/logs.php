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
    <script src="../lib/jquery/jquery-3.1.1.min.js"></script>
    <script src="../lib/amcharts_4.5.8/amcharts4/core.js"></script>
    <script src="../lib/amcharts_4.5.8/amcharts4/charts.js"></script>
    <script src="../lib/amcharts_4.5.8/amcharts4/themes/animated.js"></script>
    <script>
        function fechaIni() {
            $('#fFinal').attr('min', $('#fInicio').val());
        }

        function fechaFinal() {
            if ($('#fFinal').val() < $('#fInicio').val()) {
                $('#fInicio').attr('value', '')
            }
        }

        function buscar() {
            console.log('buscar');
            if ($('#tabla').val() == false || $('#accion').val() == false || $('#fInicio').val() == false || $('#fFinal').val() == false) {
                alert('Ingresa Todos los datos para proceder a la busqueda');
            }
        }

        function recargaPag() {
            window.location.href = window.location.href.split("?")[0];
        }
    </script>
</head>

<body>
    <section class="container-fluid">

        <?php include('include/menuAdministrador.php'); ?>

        <article class="row">


            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
                <p class="titulo1">
                    <a name="ir"></a>
                    Movimientos &nbsp; <i class="glyphicon glyphicon-globe"></i>
                </p>
            </div>

            <form class="form form-group" method="GET">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

                    <label>
                        Seleccionar Filtrado
                    </label>
                    <select name="tabla" id="tabla" class="form-control has-success" require>
                        <option <?php if (isset($_GET['tabla'])) {
                                    echo 'value="' . $_GET['tabla'] . '"';
                                } ?>>
                            <?php if (isset($_GET['tabla'])) {
                                if ($_GET['tabla'] == 'catalogo_venta') {
                                    echo  'productos';
                                } elseif ($_GET['tabla'] == 'ventas_productos') {
                                    echo 'ventas';
                                } else {
                                    echo  $_GET['tabla'];
                                }
                            } ?></option>
                        <option value="apartado">apartado</option>
                        <option value="bancos_empresa">bancos_empresa</option>
                        <option value="bancos_usuario">bancos_usuario</option>
                        <option value="detalle_apartado">detalle_apartado</option>
                        <option value="elementos">elementos</option>
                        <option value="empresa">empresa</option>
                        <option value="ganancia_iva">ganancia_iva</option>
                        <option value="catalogo_venta">productos</option>
                        <option value="opiniones">opiniones</option>
                        <option value="pedidos">pedidos</option>
                        <option value="proveedores">proveedores</option>
                        <option value="usuario">usuario</option>
                        <option value="ventas_productos">ventas</option>
                    </select>

                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <label>
                        Acción
                    </label>
                    <select name="accion" id="accion" class="form-control has-success" require <?php  ?>>
                        <option <?php if (isset($_GET['accion'])) {
                                    echo 'value="' . $_GET['accion'] . '"';
                                } ?>>
                            <?php if (isset($_GET['accion'])) {
                                if ($_GET['accion'] == " IN ('INSERT')") {
                                    echo  'Registro';
                                }
                                if ($_GET['accion'] == " IN ('UPDATE')") {
                                    echo 'Modificaciones';
                                }
                                if ($_GET['accion'] == " IN ('UPDATE','INSERT')") {
                                    echo 'Registros y Modificaciones';
                                }
                            } ?>
                        </option>
                        <option value=" IN ('INSERT')">Registro</option>
                        <option value=" IN ('UPDATE')">Modificaciones</option>
                        <option value=" IN ('UPDATE','INSERT')">Registros y Modificaciones</option>
                    </select>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <label>
                        Fecha Inicio
                    </label>
                    <input <?php if (isset($_GET['fInicio'])) {
                                echo 'value="' . $_GET['fInicio'] . '"';
                            } ?> require class="form-control has-success" onchange="fechaIni()" type="date" name="fInicio" id="fInicio" max="<?php date_default_timezone_set('America/Caracas');
                                                                                                                                                if (isset($_GET['fFinal'])) {
                                                                                                                                                    echo $_GET['fFinal'];
                                                                                                                                                } else {
                                                                                                                                                    echo date('Y-m-d');
                                                                                                                                                } ?>">
                </div>

                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <label>
                        Fecha Final
                    </label>
                    <input <?php if (isset($_GET['fFinal'])) {
                                echo 'value="' . $_GET['fFinal'] . '"';
                            } ?> require class="form-control has-success" onchange="fechaFinal()" type="date" name="fFinal" id="fFinal" <?php if (isset($_GET['fInicio'])) {
                                                                                                                                            echo 'min="' . $_GET['fInicio'] . '"';
                                                                                                                                        } ?> max="<?php date_default_timezone_set('America/Caracas');
                                                                                                                                                    echo date('Y-m-d'); ?>"><br>
                </div>

                <div align="center" class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                    <button class="btn btn-primary glyphicon glyphicon-search" onClick="buscar()"> Buscar</button>
                </div>
            </form>
            <div align="center" class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                <button class="btn btn-danger glyphicon glyphicon-repeat" onClick="recargaPag()" href="logs.php"> Limpiar</button>
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
            WHERE ";

            if (isset($_GET['tabla'])) {
                $sql .= "tab_log = '" . $_GET['tabla'] . "'";
            }
            if (isset($_GET['accion'])) {
                $sql .= " AND acc_log " . $_GET['accion'];
            }
            if (isset($_GET['fInicio']) and isset($_GET['fFinal'])) {
                $sql .= " AND DATE(date_log) BETWEEN '" . $_GET['fInicio'] . "' AND '" . $_GET['fFinal'] . "'";
            } else {
                $sql .= "
                tab_log = 'apartado'
                OR tab_log = 'bancos_empresa'
                OR tab_log = 'bancos_usuario'
                OR tab_log = 'catalogo_venta'
                OR tab_log = 'opiniones'
                OR tab_log = 'pedidos'
                OR tab_log = 'proveedores'
                OR tab_log = 'usuario'
                OR tab_log = 'ventas_productos'
                OR tab_log = 'elementos'
                OR tab_log = 'detalle_apartado'
                OR tab_log = 'empresa'
                OR tab_log = 'ganancia_iva'
                OR tab_log = 'pedidos'";
            }
            $sql .= " ORDER BY
            id_log DESC";
            //var_dump($sql.'ASDASDASD');

            /* codigos de paginacion */
            @$registros = pg_query($conexion, $sql);
            @$num = pg_num_rows($registros);
            $pag = ceil($num / 20);

            @$prodIni = $_GET['ini'];
            @$prodFin = $_GET['fin'];

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
                INNER JOIN usuario ON logs.id_usu = usuario.id_usuario";

                if (isset($_GET['tabla'])) {
                    $sql .= " WHERE tab_log = '" . $_GET['tabla'] . "'";
                }
                if (isset($_GET['accion'])) {
                    $sql .= " AND acc_log " . $_GET['accion'];
                }
                if (isset($_GET['fInicio']) and isset($_GET['fFinal'])) {
                    $sql .= " AND DATE(date_log) BETWEEN '" . $_GET['fInicio'] . "' AND '" . $_GET['fFinal'] . "'";
                }
                $sql .= " ORDER BY
                    id_log DESC
                    LIMIT 20 offset $ini";
                //var_dump($sql);
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
                WHERE ";

                if (isset($_GET['tabla'])) {
                    $sql .= "tab_log = '" . $_GET['tabla'] . "'";
                }
                if (isset($_GET['accion'])) {
                    $sql .= " AND acc_log " . $_GET['accion'];
                }
                if (isset($_GET['fInicio']) and isset($_GET['fFinal'])) {
                    $sql .= " AND DATE(date_log) BETWEEN '" . $_GET['fInicio'] . "' AND '" . $_GET['fFinal'] . "'";
                } else {
                    $sql .= "
                    tab_log = 'apartado'
                    OR tab_log = 'bancos_empresa'
                    OR tab_log = 'bancos_usuario'
                    OR tab_log = 'catalogo_venta'
                    OR tab_log = 'opiniones'
                    OR tab_log = 'pedidos'
                    OR tab_log = 'proveedores'
                    OR tab_log = 'usuario'
                    OR tab_log = 'ventas_productos'
                    OR tab_log = 'elementos'
                    OR tab_log = 'detalle_apartado'
                    OR tab_log = 'empresa'
                    OR tab_log = 'ganancia_iva'
                    OR tab_log = 'pedidos'";
                }
                $sql .= " ORDER BY
                id_log DESC
                LIMIT 20 offset 0";
            }

            @$query = pg_query($conexion, $sql);

            $sqlGrafica = "SELECT
                count(tab_log) AS cuenta,
                tab_log
            FROM
                logs
            GROUP BY logs.tab_log
            ORDER BY
                tab_log ASC";

            $query2 = pg_query($conexion, $sqlGrafica);

            while ($arreglo2 = pg_fetch_array($query2)) {
                $response[] = [
                    'tabla' => $arreglo2['tab_log'],
                    'cantidad' => $arreglo2['cuenta']
                ];
            }
            //var_dump($sql);
            //var_dump($query2);


            if (isset($_GET['tabla']) and isset($_GET['fInicio']) and isset($_GET['fFinal'])) {
                $sqlGraf2 = "SELECT
                    COUNT (acc_log) AS cantidad,
                    acc_log AS accion
                FROM
                    logs
                WHERE
                    tab_log = '" . $_GET['tabla'] . "'
                    ";
                $sqlGraf2 .= "AND DATE (date_log) BETWEEN '" . $_GET['fInicio'] . "'
                AND '" . $_GET['fFinal'] . "'
                GROUP BY
                    logs.acc_log
                ORDER BY
                    acc_log ASC";

                @$query3 = pg_query($conexion, $sqlGraf2);

                while (@$arreglo3 = pg_fetch_array($query3)) {
                    $response3[] = [
                        'tabla' => $arreglo3['accion'],
                        'cantidad' => $arreglo3['cantidad']
                    ];
                }
            }
            //var_dump($sql);
            //echo '<br><br>';
            //var_dump($sqlGrafica);
            //echo '<br><br>';
            //var_dump(@$sqlGraf2);

            //echo "<pre>" . json_encode($response, JSON_PRETTY_PRINT) . "</pre>";
            ?>
            <input id="dataGrafica" type="hidden" <?php if (@isset($response)) {
                                                        echo "value='" . json_encode($response)  . "'";
                                                    }   ?>>

            <input id="dataGrafica2" class="container col-xs-12 col-sm-12 col-md-12 col-lg-12" type="hidden" <?php if (@isset($response3)) {
                                                                                                                    echo "value='" . json_encode($response3)  . "'";
                                                                                                                }   ?>>

            <?php
            echo '<div  class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" id="graficaBarras" style="width: 100%; height: 300px;"></div>';

            if (@isset($response3)) {
                echo '<div id="graficaTorta" class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="width: 100%; height: 500px;"></div>';
            }



            echo "<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12' align='right' style='font-size:80%; color:green;'>
            $num Movimientos. En $pag Páginas. ";

            if (isset($prodIni) and isset($prodFin)) {
                echo "&nbsp;&nbsp;&nbsp;Movimiento: $prodIni - $prodFin";
                echo "</div>";
            }
            echo '</div><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <table class="table table-bordered" align="center">
                    <tr class=" btn-primary trTitulo" align="center">
                        <td class="titulo" width="30%">Usuario</td>
                        <td class="titulo" width="30%">Información</td>
                        <td class="titulo" width="30%">Fecha</td>
                        <td class="titulo" width="10%">Datos/SQL</td>
                    </tr>
                </table>
            </div>';

            if (@pg_fetch_array($query) == false) {
                echo '<div align="center" style= "color:blue">
                    No hay Resultados!
                </div>';
            }
            ?>

            <?php

            while (@$arreglo = pg_fetch_array($query)) { //este arreglo ordena la informacion del array correspondiente a los Pedidos para despues llamar la informacion que se necesite

                //$arreglo['log_sql'] = str_replace(['"', "'"], " ", $arreglo['log_sql']);
                //$arreglo['val_mod_log'] = str_replace(['"', "'"], " ", $arreglo['val_mod_log']);

                //aqui muestro el tr con los PEDIDOS correspondientes 
                ?>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <table class="table table-hover table-bordered table-condensed" align="center">
                        <tr class="parrafo info" align="center">
                            <td class="titulo" width="30%"><br><b>CI: </b> <?php echo $arreglo['cedula_usuario']; ?>. <br><b>Nombre: </b> <?php echo $arreglo['nombre_usuario']; ?> <br><b>Apellido: </b><?php echo $arreglo['apellido_usuario']; ?><br><b>Email: </b><?php echo $arreglo['correo_usuario']; ?></td>
                            <td class="titulo" width="30%"><b>IP: </b><?php echo $arreglo['ip_usu']; ?><br><b>Navegadores</b><?php echo $arreglo['inf_usu']; ?> <br><b>Url: </b> <?php echo $arreglo['url_sql']; ?><br><b>MAC: </b><?php echo $arreglo['mac_usu']; ?></td>
                            <td class="titulo text-center" width="30%"><br><br><br><?php echo $arreglo['date_log']; ?></td>
                            <td class="titulo" width="10%"><br><br>
                                <a href="#" data-toggle="modal" data-target="#InfoSql" onClick="Mostrar('<?php echo base64_encode(str_replace(['"', "'"], " ", $arreglo['log_sql'])); ?>','<?php echo base64_encode(str_replace(["DATA NUEVA:", "DATA ANTIGUA:"], ['<hr><b>DATA NUEVA:</b> ', "<hr><b>DATA ANTIGUA:</b> "], (str_replace(['"', "'", ","], "<br>", $arreglo['val_mod_log'])))); ?>')">
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
                $ini = $c * 20 - 20;
                $fin = $ini + 19;
                echo ' <a href="logs.php?';
                if (isset($_GET['tabla'])) {
                    echo 'tabla=' . $_GET['tabla'] . '&';
                }
                if (isset($_GET['accion'])) {
                    echo 'accion=' . $_GET['accion'] . '&';
                }
                if (isset($_GET['fInicio'])) {
                    echo 'fInicio=' . $_GET['fInicio'] . '&';
                }
                if (isset($_GET['fFinal'])) {
                    echo 'fFinal=' . $_GET['fFinal'] . '&';
                }
                echo 'ini=' . $ini . '&fin=' . $fin . '#ir">' . $c . '</a>&nbsp;&nbsp;';
            }
            echo '</div>';

            ?>
            <div class="modal fade" id="InfoSql" tabindex="-1" role="dialog" aria-labelledby="InfoSqlLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 align="center" class="modal-title" id="InfoSqlLabel" style="color:darkcyan">Informaciòn del Movimiento</h2>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body row" id="modalLogs">
                            <script>
                                function Mostrar(a, b) {

                                    document.getElementById('modalLogs').innerHTML = '<div style="margin-left:10%; margin-right:10%"><b>SQL: </b>' + atob(a) + '<br><br>' + '<p align="center"><b>MOVIMIENTO: </b></p>' + atob(b) + '</div>';
                                }
                            </script>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

        </article>

        <?php
        require("include/piePagina.php");
        ?>
    </section>
    <script src="../lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/amcharts.js"></script>
</body>

</html>