-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-12-2022 a las 01:26:54
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdspring`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EditarEmpleados` (IN `NOMBRE` VARCHAR(255), IN `APELLIDOS` VARCHAR(255), IN `EMAIL` VARCHAR(255), IN `TELEFONO` VARCHAR(255), IN `PUESTO` VARCHAR(255), IN `EMPRESA` VARCHAR(255), IN `IDEMPLEADO` INT(11))  MODIFIES SQL DATA
UPDATE empleados
SET nombre=NOMBRE, apellido=APELLIDOS,
    email=EMAIL, telefono=TELEFONO,
    puesto=PUESTO, empresa=EMPRESA
    WHERE id = IDEMPLEADO$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EliminarEmpleado` (IN `idEmpleado` INT(11))  READS SQL DATA
DELETE FROM empleados WHERE id = idEmpleado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_InsertarEmpleados` (IN `NOMBRE` VARCHAR(255), IN `APELLIDOS` VARCHAR(255), IN `EMAIL` VARCHAR(100), IN `TELEFONO` VARCHAR(20), IN `PUESTO` VARCHAR(255), IN `EMPRESA` VARCHAR(255))  MODIFIES SQL DATA
INSERT INTO empleados (nombre,apellido,email,telefono,puesto,empresa)
VALUES
(NOMBRE,APELLIDOS,EMAIL,TELEFONO,PUESTO,EMPRESA)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ListaEmpleado` ()  READS SQL DATA
SELECT*FROM empleados$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MostrarEmpleado` (IN `idEntrada` INT(11))  READS SQL DATA
SELECT*FROM empleados WHERE id=idEntrada$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `puesto` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `apellidos`, `celular`, `email`, `empresa`, `fecha_ingreso`, `fecha_nacimiento`, `nombre`, `puesto`) VALUES
(3, 'Hernandez Gonzalez ', '811-011-12121 ', 'victor@gmail.com', 'Coppel ', '2022-12-16', '2022-12-14', 'Victor Edgardo ', 'Programador '),
(5, 'Rivera de la Cruz', '789-101-2112', 'luz@gmail.com', 'Coppel', '2022-12-14', '1997-01-15', 'Luz America', 'Help Desk'),
(7, 'Castillo Hernandez', '789-121-8999', 'amanda@gmail.com', 'BanCoppel', '2022-12-05', '2017-01-10', 'Amanda Liztbeth', 'Tester'),
(8, 'Chavez Escobar', '811-555-1010', 'luis@gmail.com', 'Coppel', '2022-12-19', '2019-01-14', 'Luis Miguel', 'Programador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `puesto` varchar(255) NOT NULL,
  `telefono` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `apellido`, `email`, `empresa`, `nombre`, `puesto`, `telefono`) VALUES
(1, 'Rivera', 'lupe1@gmail.com', 'Coppel', 'Guadaluoe', 'Tester', '811-100-2221'),
(12, 'de la Cruz', 'fabian@gmail.com', 'Coppel', 'Fabian', 'Tester', '7898911211'),
(11, 'Rivera de la Cruz', 'meri@gmail.com', 'Coppel', 'Luz America', 'Proyect Manager', '7891012321'),
(6, 'Gonzalez', 'edgar@gmail.com', 'Coppel', 'Edgar', 'Programador', '7891012122'),
(7, 'Rivera de la Cruz', 'luz@gmail.com', 'Coppel', 'Luz America', 'Proyect Manager', '7891012321'),
(13, 'De Leon', 'astrid@gmail.com', 'Coppel', 'Astrid', 'Desarrollador Jr', '811-119-9122'),
(14, 'De Leon', 'juana@gmail.com', 'Coppel', 'Juana', 'Desarrollador Sr', '811-119-9122'),
(16, 'Hernandez', 'almeria@gmail.com', 'Coppel', 'Almeria', 'Desarrollador Sr', '811-119-9122'),
(17, 'Lopez', 'luis@gmail.com', 'Copppel', 'Luis', 'Programador', '7891012321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `puesto` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `apellido`, `email`, `nombre`, `puesto`) VALUES
(1, 'Hernandez', 'victor@gmail.com', 'Victor', 'Programador Jr'),
(2, 'Gonzalez', 'edgar@gmail.com', 'Edgardo', 'Programador'),
(3, 'Lopez', 'pepe@gmail.com', 'Pepe ', 'Tester'),
(5, 'Castanon', 'cristina@gmail.com', 'Cristina', 'Reclutador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`) VALUES
(1, 'John', 'john@mail.com'),
(2, 'Chris', 'chris@mail.com'),
(3, 'Kate', 'kate@mail.com'),
(4, 'Denis', 'denis@mail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6fdpo2x5rmegfbngre7xb3yoh` (`email`) USING HASH;

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_oh92xf9x46jab6en3kxionb4k` (`email`) USING HASH;

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
