<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">

</head>

<body>

    <header class="row">

        <?php
        require('conexionBD/conexionBD.php');

        $sql = "SELECT
            *
        FROM
            usuario
        INNER JOIN elementos ON elementos.id_usu = usuario.id_usuario
        WHERE
            id_usuario = {$_SESSION['id_usuarioA']}
        AND bandera = '10'
        AND usuario.estatus = 1";
        $query = pg_query($conexion, $sql);
        if (pg_num_rows($query) == 0) {
            session_destroy();
            header('location:../interfaz/index.php');
            exit();
        }



        while (@$arreglo = pg_fetch_array($query)) {
            ?>

        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
            <ul class="nav nav-tabs">
                <li class=" active menuPrinc">
                    <a href="indexAdmin.php" class="menuPrinc">
                        <img src="img/logoG.jpg" style="padding: -30px; margin: -10px; width: 50px">&nbsp;&nbsp; Inicio
                    </a>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle menuPrinc" data-toggle="dropdown">
                        <img src="icon/catalogoDeRepuestos.png" class="menuPrincImg">&nbsp; Catalogo de Repuestos
                        <i class="caret menuOption"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <?php
                            if ($arreglo['cat_acc'] == 't') {
                                echo '<li class="menu1 ACC">
                            <a href="catalogoVentasACCADMIN.php#ir" class="menu2 ">
                                <div class=" col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <img class="menu3" src="icon/accesorios.png">
                                </div>
                                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 row-fluid">
                                    <p>
                                        <i class="menu4">
                                            Accesorios para
                                            <br> Motociclistas
                                        </i>
                                    </p>
                                </div>
                            </a>
                        </li>';
                            }
                            if ($arreglo['cat_car'] == 't') {
                                echo '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <li class="divider"></li>
                            </div>
    
                            <li class="menu1 CAR">
                                <a href="catalogoVentasCARADMIN.php#ir" class="menu2 ">
                                    <img class="menu3" src="icon/carenaje.png">
                                    <i class="menu4 ">
                                        &nbsp; Carenaje
                                    </i>
                                </a>
                            </li>';
                            }
                            if ($arreglo['cat_cha'] == 't') {
                                echo '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <li class="divider"></li>
                            </div>
    
                            <li class="menu1 CHA">
                                <a href="catalogoVentasCHAADMIN.php#ir" class="menu2 ">
                                    <img class="menu3" src="icon/chasis.png">
                                    <i class="menu4">
                                        &nbsp; Chasis
                                    </i>
                                </a>
                            </li>';
                            }
                            if ($arreglo['cat_ele'] == 't') {
                                echo '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <li class="divider"></li>
                            </div>
    
                            <li class="menu1 ELE">
                                <a href="catalogoVentasELEADMIN.php#ir" class="menu2 ">
                                    <img class="menu3" src="icon/electrico.png">
                                    <i class="menu4">
                                        &nbsp; Eléctrico
                                    </i>
                                </a>
                            </li>';
                            }
                            if ($arreglo['cat_fre'] == 't') {
                                echo '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <li class="divider"></li>
                            </div>
    
                            <li class="menu1 FRE">
                                <a href="catalogoVentasFREADMIN.php#ir" class="menu2 ">
                                    <img class="menu3" src="icon/frenos.png">
                                    <i class="menu4">
                                        &nbsp; Frenos
                                    </i>
                                </a>
                            </li>';
                            }
                            if ($arreglo['cat_mot'] == 't') {
                                echo '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <li class="divider"></li>
                            </div>
    
                            <li class="menu1 MOT">
                                <a href="catalogoVentasMOTADMIN.php#ir" class="menu2 ">
                                    <img class="menu3" src="icon/motor.png">
                                    <i class="menu4">
                                        &nbsp; Motor
                                    </i>
                                </a>
                            </li>';
                            }
                            if ($arreglo['cat_sus'] == 't') {
                                echo '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <li class="divider"></li>
                            </div>
    
                            <li class="menu1 SUS">
                                <a href="catalogoVentasSUSADMIN.php#ir" class="menu2 ">
                                    <img class="menu3" src="icon/suspension.png">
                                    <i class="menu4">
                                        &nbsp; Suspensión
                                    </i>
                                </a>
                            </li>';
                            }
                            if ($arreglo['cat_tra'] == 't') {
                                echo '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <li class="divider"></li>
                            </div>
    
                            <li class="menu1 TRA">
                                <a href="catalogoVentasTRAADMIN.php#ir" class="menu2 ">
                                    <img class="menu3" src="icon/traccion.png">
                                    <i class="menu4">
                                        &nbsp; Tracción
                                    </i>
                                </a>
                            </li>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <li class="divider"></li>
                            </div>';
                            }

                            ?>

                    </ul>
                </li>

                <li>
                    <a href="#" class="drowpdown-toggle menuPrinc" data-toggle="dropdown">
                        <img src="icon/miCuenta.png" class="menuPrincImg">&nbsp;ADMIN&nbsp; <?php echo $_SESSION['nombre']; ?> <i class="caret menuOption"></i>
                    </a>
                    <ul class="dropdown-menu">

                        <li class="divider"></li>

                        <li class="menu1">
                            <a href="configUsuarioADMIN.php" class="menu2">
                                <img class="menu3" src="icon/configCuenta.png">
                                <i class="menu4">
                                    &nbsp; Configuración de Cuenta
                                </i>
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li class="menu1">
                            <a href="session/desconectar.php" class="menu2">
                                <img class="menu3" src="icon/salida.png">
                                <i class="menu4">
                                    &nbsp; Salir
                                </i>
                            </a>
                        </li>

                        <li class="divider"></li>
                    </ul>
                </li>
                <li class="pull-right ">
                    <ul>
                        <form method="POST" action="catalogoVentasADMIN.php">
                            <p style="margin-top: 2px; position: relative; color: #C50000">
                                <strong style="font-family: verdana">Busqueda! </strong>

                                <input style="font-family: arial; color: green" type="text" name="buscar" size="20" required="required" placeholder="Repuestos Aqui!!">


                                <button class="btn btn-success" type="submit">
                                    Buscar <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </p>
                        </form>
                        <ul>

                </li>
            </ul>
        </div>

        <?php

        }

        ?>

    </header>
</body>

</html>