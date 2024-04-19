-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-04-2021 a las 03:33:14
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `misalumnos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datospersonales`
--

CREATE TABLE `datospersonales` (
  `matricula` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `ap_pat` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `ap_mat` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `edad` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `datospersonales`
--

INSERT INTO `datospersonales` (`matricula`, `ap_pat`, `ap_mat`, `nombre`, `edad`) VALUES
('111111111', 'Juárez', 'López', 'Alfredo', 25),
('222222222', 'Ramírez', 'Pérez', 'José Luís', 23),
('333333333', 'Mendoza', 'Contreras', 'Abigail', 20),
('444444444', 'Páez', 'De La Rosa', 'Nancy', 20),
('555555555', 'Guzmán', 'López', 'José Luís', 22),
('666666666', 'Porras', 'Rodríguez', 'Arturo', 22),
('7777777', 'De Gante', 'Alonso', 'Ernesto', 21);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  ADD PRIMARY KEY (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
