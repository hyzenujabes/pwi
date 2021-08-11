-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2021 a las 02:47:25
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pwi2021final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `id_producto`, `id_usuario`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 1, NULL, 0, '2021-08-08 17:54:46', '2021-08-08 17:54:46'),
(2, 1, NULL, 0, '2021-08-08 17:54:52', '2021-08-08 17:54:52'),
(3, 1, NULL, 0, '2021-08-08 18:11:59', '2021-08-08 18:11:59'),
(4, 1, 10, 1, '2021-08-08 18:18:44', '2021-08-08 18:31:48'),
(5, 1, NULL, 0, '2021-08-08 18:24:26', '2021-08-08 18:24:26'),
(6, 1, 11, 1, '2021-08-08 18:25:11', '2021-08-08 18:30:15'),
(7, 3, 11, 1, '2021-08-08 18:25:21', '2021-08-08 18:30:15'),
(8, 5, 11, 1, '2021-08-08 18:27:04', '2021-08-08 18:30:15'),
(9, 5, NULL, 0, '2021-08-08 18:33:35', '2021-08-08 18:33:35'),
(10, 3, NULL, 0, '2021-08-08 18:33:40', '2021-08-08 18:33:40'),
(11, 2, 10, 1, '2021-08-08 18:33:53', '2021-08-08 18:33:54'),
(12, 1, NULL, 0, '2021-08-09 15:18:07', '2021-08-09 15:18:07'),
(13, 1, 10, 1, '2021-08-09 15:18:23', '2021-08-09 15:18:30'),
(14, 2, 10, 1, '2021-08-09 15:18:26', '2021-08-09 15:18:30'),
(15, 1, 10, 1, '2021-08-09 16:34:28', '2021-08-09 17:54:35'),
(16, 2, 10, 1, '2021-08-09 16:34:31', '2021-08-09 17:54:35'),
(17, 1, 10, 1, '2021-08-09 17:54:32', '2021-08-09 17:54:35'),
(18, 1, 10, 0, '2021-08-09 17:59:06', '2021-08-09 17:59:06'),
(19, 1, 14, 0, '2021-08-09 18:00:48', '2021-08-09 18:00:48'),
(20, 2, 14, 0, '2021-08-09 18:00:50', '2021-08-09 18:00:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 'Ligero o pálido', 'Coloquialmente se le llama Tostado Canela por el color similar a la especie. Sus características son ácidas y con alto nivel de cafeína.', 0, '2021-07-19 16:00:47', '2021-08-09 15:05:59'),
(2, 'Medio o Americano', 'Se utiliza para el café con infusión de filtro, es el tostado más tradicional por su mejor sabor, aroma y color.', 0, '2021-07-22 20:04:03', '2021-08-09 15:06:07'),
(6, 'Oscuro', 'Abrigos ligeros', 0, '2021-08-09 12:16:32', '2021-08-09 15:06:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `telefono`, `direccion`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 'Bob', 'Esponja', 1111111111, 'Fondo de bikini', 0, '2021-07-27 15:44:11', '2021-07-27 15:44:11'),
(2, 'Bob', 'Esponja', 1111111111, 'Fondo de bikini', 0, '2021-07-27 15:46:12', '2021-07-27 15:46:12'),
(3, 'Bob', 'Esponja', 1111111111, 'Fondo de bikini', 0, '2021-07-27 15:47:03', '2021-07-27 15:47:03'),
(4, 'leo', 'messi', 1111111111, 'barcaaaaa', 0, '2021-07-27 16:32:13', '2021-07-27 16:32:13'),
(5, 'wawa', 'wawawa', 1111111111, 'asdasdsada', 0, '2021-07-27 16:54:12', '2021-07-27 16:54:12'),
(6, 'wachin', 'wachin', 1111111111, 'wwawawa', 0, '2021-07-27 17:04:40', '2021-07-27 17:04:40'),
(7, 'wachin', 'wachin2', 1111111111, 'wwawawa', 0, '2021-07-27 17:05:23', '2021-08-02 19:05:29'),
(8, 'augusto', 'bianchi', 1111111111, 'lasalada', 0, '2021-07-29 16:04:37', '2021-07-29 16:04:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_imagenes`
--

CREATE TABLE `empleados_imagenes` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados_imagenes`
--

INSERT INTO `empleados_imagenes` (`id`, `uid`, `id_empleado`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, '5bc238bf-d5bc-4897-a9bb-9e9ab9f92950.jpeg', 7, 0, '2021-07-27 17:05:23', '2021-07-27 17:05:23'),
(2, '0975db0b-ede3-4ab2-9a3b-06099ed288dc.jpeg', 8, 1, '2021-07-29 16:04:37', '2021-07-29 16:04:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `id_categoria`, `eliminado`, `ts_create`, `ts_update`) VALUES
(1, 'El Cuerdo', 'Café ligeramente tostado, de gusto suave. Especial para tomar solo.', 500, 1000, 1, 0, '2021-07-19 16:02:05', '2021-08-09 15:10:50'),
(2, 'Un poco Loco', 'Café tostado a medias, se caracteriza por el picor que genera en el paladar.', 2000, 100, 2, 0, '2021-07-22 20:09:26', '2021-08-09 15:12:33'),
(3, 'Loquito', 'Tostado más de la media, de sabor fuerte. Especial para mezclas.', 300, 500, 6, 0, '2021-07-22 20:15:56', '2021-08-09 15:13:45'),
(5, 'Desquiciado', 'Al límite de la ceniza, el Desquiciado es un café casi quemado, de sabor muy fuerte. Especial para tragos.', 200, 2000, 1, 0, '2021-07-27 19:58:38', '2021-08-09 15:15:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `confirmacionCorreo` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT 0,
  `habilitado` tinyint(4) NOT NULL DEFAULT 0,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp(),
  `ts_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `pass`, `mail`, `confirmacionCorreo`, `telefono`, `admin`, `habilitado`, `eliminado`, `ts_create`, `ts_update`) VALUES
(10, 'petertest', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'peterzone.11@gmail.com', '7b26de78-ca72-4677-b690-2e63f9716f86', 1111111111, 1, 1, 0, '2021-07-22 12:16:58', '2021-07-28 18:11:04'),
(11, 'valinosh', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'peterzone.11@gmail.com', 'ea868a6d-b17d-44f9-9bbb-f0f0958a45a2', 1111111111, 0, 1, 0, '2021-07-22 12:26:37', '2021-07-22 12:31:44'),
(13, 'cami', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'asdasda@gmail.com', 'de298f53-5ac3-4c9d-9fa6-d1994784ce5b', 1111111111, 0, 0, 0, '2021-08-07 03:13:50', '2021-08-07 03:13:50'),
(14, 'hyzen', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'pedrobogdanovich@gmail.com', 'eb28b9a9-34e5-4de7-b269-42f5baa52d5d', 1111111111, 0, 1, 0, '2021-08-09 15:20:02', '2021-08-09 15:20:42');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `empleados_imagenes`
--
ALTER TABLE `empleados_imagenes`
  ADD CONSTRAINT `empleados_imagenes_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
