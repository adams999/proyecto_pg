-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2017 a las 05:30:22
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `yural`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `correo_usuario` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `clave` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`correo_usuario`, `nombre`, `clave`) VALUES
('adams@yural.com', 'Adams Contreras', 'yuraladams');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartado`
--

CREATE TABLE `apartado` (
  `numero_apartado` int(20) NOT NULL,
  `cedula_usuario` varchar(12) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `codigo_productoV` varchar(50) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `cantidad_apartada` varchar(10) NOT NULL,
  `precio_prod_total` varchar(100) NOT NULL,
  `fecha_hora_apartado` varchar(50) NOT NULL,
  `estatus` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `apartado`
--

INSERT INTO `apartado` (`numero_apartado`, `cedula_usuario`, `nombre_usuario`, `codigo_productoV`, `imagen`, `nombre_producto`, `cantidad_apartada`, `precio_prod_total`, `fecha_hora_apartado`, `estatus`) VALUES
(54, '248191811', 'Adams Contreras', 'ACC1872', '1463851894542 - copia - copia.jpg', 'Casco EK Semi - Integral', '1', '109.760,00', '2017/03/13 22:51', 0),
(53, '248191811', 'Adams Contreras', 'ACC1872', '1463851894542 - copia - copia.jpg', 'Casco EK Semi - Integral', '1', '109.760,00', '2017/03/13 22:50', 2),
(52, '248191811', 'Adams Contreras', 'ACC202818', '../imagenesRepuestos/1463852193072 - copia - copia.jpg', 'Casco Federal', '1', '86.240,00', '2017/03/13 21:15', 0),
(51, '248191811', 'Adams Contreras', 'ACC971', '../imagenesRepuestos/IMG_20160514_111441 - copia.jpg', 'Chalecos Verdes / Naranjas', '1', '7.056,00', '2017/03/13 20:53', 0),
(50, '248191811', 'Adams Contreras', 'ACC18976', '1463853141448 - copia - copia.jpg', 'Casco Bera Semi- Integral', '1', '70.560,00', '2017/03/13 20:34', 0),
(49, '248191811', 'Adams Contreras', 'ACC18976', '1463853141448 - copia - copia.jpg', 'Casco Bera Semi- Integral', '1', '70.560,00', '2017/03/13 01:19', 0),
(48, '248191811', 'Adams Contreras', 'ACC202818', '../imagenesRepuestos/1463852193072 - copia - copia.jpg', 'Casco Federal', '1', '78.400,00', '2017/03/12 21:09', 0),
(47, '248191811', 'Adams Contreras', 'CAR0', '../imagenesRepuestos/1470087531105.jpg', 'Carcasa Tacometro Arsen2', '1', '31.360,00', '2017/03/12 15:24', 0),
(46, '248191811', 'Adams Contreras', 'ACC18976', '1463853141448 - copia - copia.jpg', 'Casco Bera Semi- Integral', '1', '101.920,00', '2017/03/11 19:07', 0),
(45, '248191811', 'Adams Contreras', 'ACC202818', '../imagenesRepuestos/1463852193072 - copia - copia.jpg', 'Casco Federal', '1', '78.400,00', '2017/03/11 18:43', 2),
(44, '248191811', 'Adams Contreras', 'ACC202818', '../imagenesRepuestos/1463852193072 - copia - copia.jpg', 'Casco Federal', '4', '313.600,00', '2017/03/11 12:29', 0),
(43, '248191811', 'Adams Contreras', 'ACC18976', '1463853141448 - copia - copia.jpg', 'Casco Bera Semi- Integral', '1', '101.920,00', '2017/03/11 10:17', 2),
(42, '24782651', 'leidy reyes', 'ACC971', '../imagenesRepuestos/IMG_20160514_111441 - copia.jpg', 'Chalecos Verdes / Naranjas', '1', '7.056,00', '2017/03/11 10:14', 2),
(41, '248191811', 'Adams Contreras', 'ACC1872', '1463851894542 - copia - copia.jpg', 'Casco EK Semi - Integral', '1', '109.760,00', '2017/03/10 20:24', 0),
(40, '248191811', 'Adams Contreras', 'ACC1872', '1463851894542 - copia - copia.jpg', 'Casco EK Semi - Integral', '1', '109.760,00', '2017/03/10 15:40', 2),
(39, '248191811', 'Adams Contreras', 'ACC971', '../imagenesRepuestos/IMG_20160514_111441 - copia.jpg', 'Chalecos Verdes / Naranjas', '1', '7.056,00', '2017/03/10 14:22', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_venta`
--

CREATE TABLE `catalogo_venta` (
  `codigo_productoV` varchar(50) NOT NULL,
  `nombre_productoV` varchar(255) NOT NULL,
  `id_usuarioA` varchar(50) NOT NULL,
  `categoria` varchar(35) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `tipo_unidad` varchar(10) NOT NULL,
  `productos_vendidos` varchar(10) NOT NULL,
  `productos_disponibles` varchar(10) NOT NULL,
  `precio_base` varchar(20) NOT NULL,
  `iva_producto` varchar(20) NOT NULL,
  `pvp` varchar(30) NOT NULL,
  `numero_pedido` varchar(10) NOT NULL,
  `estatus` int(11) NOT NULL,
  `num_comentario` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `catalogo_venta`
--

INSERT INTO `catalogo_venta` (`codigo_productoV`, `nombre_productoV`, `id_usuarioA`, `categoria`, `marca`, `descripcion`, `imagen`, `tipo_unidad`, `productos_vendidos`, `productos_disponibles`, `precio_base`, `iva_producto`, `pvp`, `numero_pedido`, `estatus`, `num_comentario`) VALUES
('ACC18976', 'Casco Bera Semi- Integral', 'Adams Contreras', 'Accesorios para Motociclistas', 'Bera', 'Casco Bera Colores Blanco Gris Vinotinto Talla L y Talla M. Unsex Semi-Integral..', '1463853141448 - copia - copia.jpg', 'Unico', '1', '6', '63.000,00', '7.560,00', '70.560,00', '1', 1, 'ACC18976'),
('ACC1872', 'Casco EK Semi - Integral', 'Adams Contreras', 'Accesorios para Motociclistas', 'Empire Keeway', '                           Casco Empire Keeway Colores Blanco y Gris Talla L y Talla m. Unsex Semi-Integral          ', '1463851894542 - copia - copia.jpg', 'Unico', '1', '5', '98.000,00', '11.760,00', '109.760,00', '1', 1, 'ACC1872'),
('CAR10556', 'Careta de Bera R1', 'Adams Contreras', 'Carenaje', 'Bera', 'Careta de Bera R1 Original Color Blanca Modelo 2012', '../imagenesRepuestos/1463851775847 - copia - copia.jpg', 'Unico', '0', '1', '42.000,00', '5.040,00', '47.040,00', '2', 1, ''),
('SUS21336', 'Amortiguadores De Jog', 'Adams Contreras', 'SuspensiÃ³n', 'Kajama', 'Amortiguadores de Moto Jog 2000PSI', '../imagenesRepuestos/IMG_20160514_114402.jpg', 'Unico', '0', '2', '14.000,00', '1.680,00', '15.680,00', '1', 1, ''),
('MOT1638', 'Valvulas de Motor 150', 'Adams Contreras', 'Motor', 'AKT Suiza', 'VÃ¡lvulas de admisiÃ³n y compresiÃ³n para motores 150 como Horse-Owen-Socialista', '../imagenesRepuestos/14445171_1110586472323255_7783270682751739217_o.jpg', 'Par', '0', '2', '16.800,00', '2.016,00', '18.816,00', '3', 1, ''),
('ELE108', 'Ramal ElÃ©ctrico Tx 200', 'Adams Contreras', 'ElÃ©ctrico', 'FRTN', 'Ramal de Tx 200 2013 Marca FRTN nUEVO', '../imagenesRepuestos/IMG_20160601_164304.jpg', 'Unico', '0', '1', '35.000,00', '4.200,00', '39.200,00', '1', 1, ''),
('ACC971', 'Chalecos Verdes / Naranjas', 'Adams Contreras', 'Accesorios para Motociclistas', 'Generico', 'Chaleco de Motorizados Verde Y Naranja para Caballeros Y para damas,', '../imagenesRepuestos/IMG_20160514_111441 - copia.jpg', 'Unico', '1', '7', '6.300,00', '756,00', '7.056,00', '1', 0, 'ACC971'),
('TRA11328', 'Caucho 130-70-12 Benda', 'Adams Contreras', 'TracciÃ³n', 'Benda', 'Caucho para motos automaticas rin 12', '../imagenesRepuestos/IMG_20160514_114129.jpg', 'Unico', '0', '2', '119.000,00', '14.280,00', '133.280,00', '1', 1, ''),
('ELE3822', 'Ramald Electrico Tx 200', 'Adams Contreras', 'ElÃ©ctrico', 'FRTN', 'Ramal ElÃ©ctrico para moto Tx 200 Marca FRNT', '../imagenesRepuestos/IMG_20160601_164304.jpg', 'Unico', '0', '0', '42.000,00', '5.040,00', '47.040,00', '1', 1, ''),
('ACC202818', 'Casco Federal', 'Adams Contreras', 'Accesorios para Motociclistas', 'Federal', 'Casco Federal Talla S Unisex', '../imagenesRepuestos/1463852193072 - copia - copia.jpg', 'Unico', '1', '3', '77.000,00', '9.240,00', '86.240,00', '1', 1, ''),
('CAR0', 'Carcasa Tacometro Arsen2', 'Adams Contreras', 'Carenaje', 'Generico', 'Carcasa para Arsen2 Keeway Completa', '../imagenesRepuestos/1470087531105.jpg', 'Par', '0', '2', '28.000,00', '3.360,00', '31.360,00', '1', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `num_comentario` varchar(50) NOT NULL,
  `cedula_usuario` varchar(12) NOT NULL,
  `nombre_usuario` varchar(200) NOT NULL,
  `apellido_usuario` varchar(200) NOT NULL,
  `correo_usuario` varchar(100) NOT NULL,
  `comentario` varchar(255) NOT NULL,
  `fecha_hora_comentario` varchar(50) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `num_comentario`, `cedula_usuario`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`, `comentario`, `fecha_hora_comentario`, `estatus`) VALUES
(36, 'ACC18976', '248191811', 'Adams', 'Contreras', 'adamspurry@gmail.com', 'Excelente Casco Lo recomiendo demasiado mill gracias ', '11/03/2017 19:48', 1),
(32, 'ACC971', '248191811', 'Adams', 'Contreras', 'adamspurry@gmail.com', 'excelente', '10/03/2017 14:35', 0),
(33, 'ACC1872', '248191811', 'Adams', 'Contreras', 'adamspurry@gmail.com', 'excelente cascos Los recomiendo demasiado', '11/03/2017 10:10', 1),
(34, 'ACC971', '24782651', 'leidy', 'reyes', 'leidy@hotmail.cm', 'excelentes chalecos muy buenos', '11/03/2017 10:14', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `rif_empresa` varchar(50) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `direccion_empresa` varchar(200) NOT NULL,
  `telefono_empresa` varchar(20) NOT NULL,
  `correo_empresa` varchar(100) NOT NULL,
  `cuenta_1` text NOT NULL,
  `cuenta_2` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`rif_empresa`, `nombre_empresa`, `direccion_empresa`, `telefono_empresa`, `correo_empresa`, `cuenta_1`, `cuenta_2`) VALUES
('J-40740403-2', 'Repuestos Yural C.A.', 'Venezuela Estado TÃ¡chira San CristÃ³bal Sector la Concordia Av. Lucio Oquendo Calle 3 Qta. Aleluya.', '0276-3489493', 'yuralrepuestos@gmail.com', 'Titular: Yurley Contreras\r\nCI: 19.777.877 Banco: BANESCO \r\nCta: Corriente.\r\nNÂ°: 0134-0261-2126-11024688.', 'Titular: Yurley Contreras\r\nCI: 19.777.877 Banco: VENEZUELA\r\nCta: Corriente.\r\nNÂ°: 0102-0219-1300-00253378.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `numero_pedido` varchar(20) NOT NULL,
  `id_usuarioA` varchar(50) NOT NULL,
  `id_proveedor` varchar(30) NOT NULL,
  `codigo_producto` varchar(20) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `cantidad_producto` varchar(10) NOT NULL,
  `precio_costo` varchar(20) NOT NULL,
  `fecha_pedido` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `numero_pedido`, `id_usuarioA`, `id_proveedor`, `codigo_producto`, `nombre_producto`, `cantidad_producto`, `precio_costo`, `fecha_pedido`) VALUES
(1, '2', 'Adams Contreras', '2', '28-38hjdw', 'Careta de Bera R1', '1', '30.000,00', '2017-02-25'),
(19, '1', 'Adams Contreras', '1', '231KJ23', 'Casco Federal', '4', '50.000,00', '2017-03-11'),
(13, '1', 'Adams Contreras', '1', '28U2HJS-2', 'Amortiguadores De Jog', '3', '10.000,00', '2017-02-26'),
(8, '1', 'Adams Contreras', '1', '32gjtw', 'Casco Bera', '5', '50.000,00', '2015-02-20'),
(9, '1', 'Adams Contreras', '1', '3gjtw', 'Casco EK Semi - Integral', '5', '80.000,00', '2015-02-20'),
(14, '3', 'Adams Contreras', '3', '3L-DS87', 'Valvulas Motor 150', '2', '12.000,00', '2017-02-26'),
(15, '1', 'Adams Contreras', '1', '18IJAU', 'Ramal ElÃ©ctrico Tx 200', '1', '25.000,00', '2017-02-26'),
(16, '1', 'Adams Contreras', '1', '1CHA-KS2', 'Chalecos Verdes / Naranjas', '20', '4.500,00', '2017-02-26'),
(17, '1', 'Adams Contreras', '1', '12jhs2', 'Caucho 130-70-12 Benda', '1', '85.000,00', '2017-02-26'),
(18, '1', 'Adams Contreras', '1', '273j2u2', 'Ramald Electrico Tx 200', '1', '30.000,00', '2017-03-05'),
(24, '1', 'Adams Contreras', '1', '0', 'Carcasa Tacometro Arsen2', '2', '20.000,00', '2017-03-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` varchar(30) NOT NULL,
  `id_usuarioA` varchar(50) NOT NULL,
  `nombre_proveedor` varchar(50) NOT NULL,
  `razon_social_proveedor` varchar(100) NOT NULL,
  `direccion_proveedor` varchar(255) NOT NULL,
  `telef_proveedor` varchar(15) NOT NULL,
  `tipo_producto` varchar(100) NOT NULL,
  `correo_proveedor` varchar(50) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `id_usuarioA`, `nombre_proveedor`, `razon_social_proveedor`, `direccion_proveedor`, `telef_proveedor`, `tipo_producto`, `correo_proveedor`, `estatus`) VALUES
('2', 'Adams Contreras', 'Distribuidora Adams', 'j-2303234-3', 'Centro de la Ciudad Tachira', '3343434', 'Repuestos', 'ramirez@gmail.com', 0),
('3', 'Adams Contreras', 'Juliany', 'V-24819181', 'Centro Estado Vargas', '23123123', 'Cauchos', 'adams_rawmirez@gmail.com', 1),
('4', 'Adams Contreras', 'juhantonny', 'j-2304932-3', 'Centro Caracas', '3343434', 'Accesorios', 'juhantonny@gmail.com', 1),
('1', 'adams', 'Distribuidora Contreras', 'J-3239842-4', 'Centro de La Ciudad San Cristobal', '04160456892', 'Repuestos', 'contreras@correo.com', 1),
('5', 'Adams Contreras', 'Julian Contreras', 'J-2938729-2', 'centro san cristobal', '021212', 'Accesorios', 'julianjuaregui@gmail.com', 1),
('6', 'Adams Contreras', 'Aviecer', 'J-239123-1', 'asdasdasdasd', '0232222222222', 'Accesorios', 'adams_ramirez@gmail.com', 1),
('7', 'Adams Contreras', 'Maria Cardenas', 'J-2121238-2', 'Barinas Barinitas', '092831231', 'Cauchos', 'maria@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cedula_usuario` varchar(12) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellido_usuario` varchar(50) NOT NULL,
  `correo_usuario` varchar(50) NOT NULL,
  `contra_usuario` varchar(50) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telef_personal` varchar(15) NOT NULL,
  `telef_hog` varchar(15) NOT NULL,
  `pregunta_seguridad` varchar(100) NOT NULL,
  `respuesta_seguridad` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cedula_usuario`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`, `contra_usuario`, `estado`, `ciudad`, `direccion`, `telef_personal`, `telef_hog`, `pregunta_seguridad`, `respuesta_seguridad`) VALUES
('248191811', 'Adams', 'Contreras', 'adamspurry@gmail.com', '24819181', 'Monagas', 'CaÃ±o Colorado', 'centro', '1', '1', 'Donde Nacistes?', 'San cristobal'),
('10874894', 'Omaira', 'Contreras', 'oma_cont72@hotmail.com', 'juhantonny', 'Barinas', 'Ciudad Bolivia', 'centro san crisotobal', '04161710767', '02763414294', 'Donde Nacistes?', 'Barinas'),
('25633831', 'gabriel', 'montilva', 'montilvav@gmail.com', '1234', 'TÃ¡chira', 'San Josecito', 'el palmar nuevo calle 13 casa 11', '04169746849', '02763486331', 'Donde Nacistes?', 'seguro'),
('24782651', 'leidy', 'reyes', 'leidy@hotmail.cm', '123456', 'TÃ¡chira', 'San CristÃ³bal', 'urbanizacion tachira', '04269784157', '0276534652', '', ''),
('12345', 'juhantonny', 'contreras', 'juhantonny@gmail.com', 'gabriel', 'Aragua', '12 de Febrero', 'centro', '0275213421', '231231231', 'Donde Nacistes?', 'san cristobal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`correo_usuario`) KEY_BLOCK_SIZE=2048;

--
-- Indices de la tabla `apartado`
--
ALTER TABLE `apartado`
  ADD PRIMARY KEY (`numero_apartado`) KEY_BLOCK_SIZE=1024;

--
-- Indices de la tabla `catalogo_venta`
--
ALTER TABLE `catalogo_venta`
  ADD PRIMARY KEY (`codigo_productoV`) KEY_BLOCK_SIZE=1024;

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`) KEY_BLOCK_SIZE=1024;

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`rif_empresa`) KEY_BLOCK_SIZE=1024;

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`) KEY_BLOCK_SIZE=1024;

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cedula_usuario`) KEY_BLOCK_SIZE=1024;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apartado`
--
ALTER TABLE `apartado`
  MODIFY `numero_apartado` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
