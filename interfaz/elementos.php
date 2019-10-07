<!DOCTYPE html>
<?php //esta es la validacion para el Administrador!!!!
session_start();
if ($_SESSION['id_usuarioA']) {
    //echo "tu nombre es " .$_SESSION['nombre'];
} else {
    header("Location:index.php");
}

@$busqueda = $_GET['busqueda'];
?>

<html lang="es">

<head>
    <meta charset="utf-8">
    <title>Elementos de Usuarios</title>
    <link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/styleCatalogo.css">
    <link rel="icon" href="img/icono1.ico">
    <script src="../lib/jquery/jquery-3.1.1.min.js"></script>
</head>

<body>
    <section class="container-fluid">

        <?php include('include/menuAdministrador.php'); ?>

        <article class="row">


            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <p class="titulo1">
                        <a name="ir"></a>
                        Elementos por Usuario &nbsp; <i class="glyphicon glyphicon-option-vertical"></i>
                    </p>
                </div>

                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <form action="elementos.php" method="get">
                        <br>
                        <input require type="search" name="busqueda" id="busqueda" placeholder="Cedula/Nombre" <?php
                                                                                                                if (isset($busqueda)) {
                                                                                                                    echo 'value="' . $busqueda . '"';
                                                                                                                }
                                                                                                                ?>>
                        <button class="btn btn-primary" type="submit">Buscar Usuario</button>
                    </form>
                </div>

            </div>

            <?php

            require("conexionBD/conexionBD.php");
            $sql = "SELECT
            *
            FROM
                usuario
            LEFT JOIN elementos ON elementos.id_usu = usuario.id_usuario
            WHERE
                usuario.estatus = 1 ";
            if (@isset($_GET['busqueda'])) {
                $sql .= " AND nombre_usuario LIKE '%" . $busqueda . "%'
                        OR cedula_usuario LIKE '%" . $busqueda . "%'
                        OR apellido_usuario LIKE '%" . $busqueda . "%'";
            };
            /* codigos de paginacion */
            $registros = pg_query($conexion, $sql);
            $num = pg_num_rows($registros);
            $pag = ceil($num / 10);

            @$prodIni = $_GET['ini'];
            @$prodFin = $_GET['fin'];

            echo "<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12' align='center' style='font-size:80%; color:green;'>
        $num    Usuarios Activos. En $pag Páginas. ";

            if (isset($prodIni) and isset($prodFin)) {
                echo "&nbsp;&nbsp;&nbsp;Registros: $prodIni - $prodFin";
            }
            echo "<br></div>";

            if (isset($_GET['ini'])) {
                $ini = $_GET['ini'];
                $fin = $_GET['fin'];
                $sql = "SELECT
                *
                FROM
                    usuario
                LEFT JOIN elementos ON elementos.id_usu = usuario.id_usuario
                WHERE
                    usuario.estatus = 1 ";
                if (@isset($_GET['busqueda'])) {
                    $sql .= " AND nombre_usuario LIKE '%" . $busqueda . "%'
                            OR cedula_usuario LIKE '%" . $busqueda . "%'
                            OR apellido_usuario LIKE '%" . $busqueda . "%'";
                }
                $sql .= " ORDER BY
                    id_usuario DESC limit 10 offset $ini";
            } else {
                $sql = "SELECT
                *
                FROM
                    usuario
                LEFT JOIN elementos ON elementos.id_usu = usuario.id_usuario
                WHERE
                    usuario.estatus = 1 ";
                if (@isset($_GET['busqueda'])) {
                    $sql .= " AND nombre_usuario LIKE '%" . $busqueda . "%'
                        OR cedula_usuario LIKE '%" . $busqueda . "%'
                        OR apellido_usuario LIKE '%" . $busqueda . "%'";
                }
                $sql .= " ORDER BY
                    id_usuario DESC limit 10 offset 0";
            }

            //svar_dump($sql);

            $query = pg_query($conexion, $sql);

            echo '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <table class="table table-bordered" align="center">
        <tr class=" btn-primary trTitulo" align="center">
            <td class="titulo" width="5%">ID </td>
            <td class="titulo" width="10%">CI</td>
            <td class="titulo" width="15%">Nombre Apellido</td>
            <td class="titulo" width="20%">Correo</td>
            <td class="titulo" width="30%">Dirección</td>
            <td class="titulo" width="10%">Telefono</td>
            <td class="titulo" width="10%">Elementos</td>
        </tr>
    </table>
</div>';


            if ($num == 0) {
                echo "<div align='center'>No Hay Registros!!!</div>";
            }

            while ($arreglo = pg_fetch_array($query)) { //este arreglo ordena la informacion del array correspondiente a los apartados para despues llamar la informacion que se necesite

                echo '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">   
                <table class="table table-bordered table-hover table-striped" align="center">
                    <tr class="parrafo " align="center">
                        <td class="titulo" width="5%"><br>' . $arreglo['id_usuario'] . '</td>
                        <td class="titulo" width="10%">';
                echo
                    "<br>{$arreglo['cedula_usuario']}";

                echo '</td>

                        <td class="titulo" width="15%">' . $arreglo['nombre_usuario'] . ' <br>' . $arreglo['apellido_usuario'] . '';
                if ($arreglo['bandera'] == 10) {
                    echo "<br><b>(Administrador)</b>";
                }
                echo '</td>

                        <td class="titulo" width="20%"><br>' . $arreglo['correo_usuario'] . '</td>
                        <td class="titulo" width="30%">' . $arreglo['estado'] . ' <br>' . $arreglo['ciudad'] . ' <br>' . $arreglo['direccion'] . '</td>
                        <td class="titulo" width="10%"><b>' . $arreglo['cod_telef_hog'] . '</b>-' . $arreglo['telef_hog'] . ' <br><br> <b>' . $arreglo['cod_telef_pers'] . '</b>-' . $arreglo['telef_hog'] . '</td>
                        <td class="titulo" width="10%">';
                ?>
                <a href="#" data-toggle="modal" data-target="#InfoSql" onClick="Mostrar('<?php echo $arreglo['cat_acc'] . ','
                                                                                                    . $arreglo['cat_car'] . ','
                                                                                                    . $arreglo['cat_cha'] . ','
                                                                                                    . $arreglo['cat_ele'] . ','
                                                                                                    . $arreglo['cat_fre'] . ','
                                                                                                    . $arreglo['cat_mot'] . ','
                                                                                                    . $arreglo['cat_sus'] . ','
                                                                                                    . $arreglo['cat_tra'] . ','
                                                                                                    . $arreglo[16] . ','
                                                                                                    . $arreglo['reg_adm'] . ','
                                                                                                    . $arreglo['mod_int'] . ','
                                                                                                    . $arreglo['mod_log'] . ','
                                                                                                    . $arreglo['nombre_usuario'] . ','
                                                                                                    . $arreglo['apellido_usuario'] . ','
                                                                                                    . $arreglo['cedula_usuario'] . ','
                                                                                                    . $arreglo['bandera'] . ','
                                                                                                    . $arreglo['id_usuario'] . ','
                                                                                                    . $arreglo['id_ele'] . ','
                                                                                                    . $arreglo['mod_apa']; ?>')" value="<?php echo json_encode($arreglo['bandera'])  ?>">
                    <br><i class="glyphicon glyphicon-option-vertical"></i>
                </a>
            <?php
                echo '</td>
                    </tr> 
                </table>
            </div>';
            }


            echo '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center" style="color:green"><hr width="75%">Pag.';
            for ($c = 1; $c <= $pag; $c++) {
                $ini = $c * 10 - 10;
                $fin = $ini + 9;
                if (@isset($busqueda)) {
                    echo ' <a href="elementos.php?ini=' . $ini . '&fin=' . $fin . '&busqueda=' . $busqueda .  '#ir">' . $c . '</a>&nbsp;&nbsp;';
                } else {
                    echo ' <a href="elementos.php?ini=' . $ini . '&fin=' . $fin . '#ir">' . $c . '</a>&nbsp;&nbsp;';
                }
            }
            echo '</div>';


            ?>
            <div class="modal fade" id="InfoSql" tabindex="-1" role="dialog" aria-labelledby="InfoSqlLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 align="center" class="modal-title" id="InfoSqlLabel" style="color:darkcyan">Informaciòn de Elementos</h2>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body row" id="modalLogs">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" onclick="preguntar(2)">Modificar</button>
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
    <script src="js/elementoJs.js"></script>
</body>

</html>