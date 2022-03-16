-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2022 a las 20:06:07
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_admin`
--
create	database `db_admin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `device1`
--
use `db_admin`;

CREATE TABLE `device1` (
  `temperatura` varchar(10) DEFAULT NULL,
  `humedad` varchar(10) DEFAULT NULL,
  `link` varchar(10) DEFAULT NULL,
  `cur_time` varchar(250) DEFAULT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `device1`
--

INSERT INTO `device1` (`temperatura`, `humedad`, `link`, `cur_time`, `id`) VALUES
('327.83', '250.01', '82', '2021-11-15 14:17:09', 27),
('317.83', '247.5', '82', '2021-11-15 14:19:05', 28),
('307.83', '231.4', '82', '2021-11-15 14:19:48', 29),
('327.83', '237.6', '82', '2021-11-15 14:19:58', 30),
('327.83', '1.00', '82', '2021-11-15 14:20:08', 31),
('327.83', '1.00', '82', '2021-11-15 14:20:18', 32),
('327.83', '1.00', '82', '2021-11-15 14:20:28', 33),
('327.83', '1.00', '82', '2021-11-15 14:20:38', 34),
('327.83', '1.00', '82', '2021-11-15 14:20:48', 35),
('327.83', '1.00', '82', '2021-11-15 14:21:06', 36),
('327.83', '1.00', '82', '2021-11-15 14:21:16', 37),
('327.83', '1.00', '82', '2021-11-15 14:21:26', 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_device`
--

CREATE TABLE `tbl_device` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `readings` text NOT NULL,
  `APIkey` varchar(200) NOT NULL,
  `units` varchar(200) NOT NULL,
  `max` varchar(200) NOT NULL,
  `min` varchar(200) NOT NULL,
  `deviceid` int(10) NOT NULL,
  `ocba` varchar(250) NOT NULL,
  `Protocol` varchar(30) NOT NULL,
  `IoTAgent` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_device`
--

INSERT INTO `tbl_device` (`id`, `name`, `readings`, `APIkey`, `units`, `max`, `min`, `deviceid`, `ocba`, `Protocol`, `IoTAgent`) VALUES
(82, 'device1', 'temperatura,humedad', 'b70856-6b1310-06c40c-c55fea-e7e39b', 'celcius', '100', '0', 22, '192.168.0.12', 'MQTT', 'IoTAgent-UL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `id` int(11) NOT NULL COMMENT 'role_id',
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_roles`
--

INSERT INTO `tbl_roles` (`id`, `role`) VALUES
(1, 'superAdmin'),
(2, 'Admin'),
(3, 'User');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roleid` tinyint(4) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `email`, `password`, `roleid`, `isActive`, `created_at`, `updated_at`) VALUES
(12, 'Rayhan', 'rayhankabir@gmail.com', '188000e1f0fb4075ae1c659697b96296f982cdc4', 2, 0, '2020-03-13 00:20:24', '2020-03-13 00:20:24'),
(22, 'yue', 'jottasedanof@gmail.com', 'a6068fbcefaa14f223f58eacf3f96b9f8f6eb0fd', 1, 0, '2021-03-03 06:25:07', '2021-03-03 06:25:07'),
(23, 'manuel', 'manuel@gmail.com', 'a6068fbcefaa14f223f58eacf3f96b9f8f6eb0fd', NULL, 0, '2022-02-17 18:55:22', '2022-02-17 18:55:22'),
(24, 'manuela', 'manuela@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, '2022-02-17 19:09:16', '2022-02-17 19:09:16');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `device1`
--
ALTER TABLE `device1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_device`
--
ALTER TABLE `tbl_device`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `device1`
--
ALTER TABLE `device1`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `tbl_device`
--
ALTER TABLE `tbl_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'role_id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;