-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2024 a las 09:12:48
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asesorias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id_solicitud` int(100) NOT NULL,
  `fecha_asesoria` date NOT NULL,
  `hora_asesoria` time NOT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `estado` varchar(100) NOT NULL,
  `id_profesor` int(100) NOT NULL,
  `matricula` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id_solicitud`, `fecha_asesoria`, `hora_asesoria`, `asunto`, `estado`, `id_profesor`, `matricula`) VALUES
(1, '2024-05-02', '11:30:00', 'Explicacion del tema Grafos', 'Pendiente', 101010, 202045342),
(2, '2024-05-07', '10:50:00', 'Correcion de interfaces de balsamiq', 'Pendiente', 171819, 202035891),
(3, '2024-05-06', '08:30:00', 'Correciones de la documentacion', 'Pendiente', 242526, 202035891),
(4, '2024-05-06', '07:30:00', 'Observaciones diagrama de actividades', 'Pendiente', 242526, 202045342),
(5, '2024-05-14', '01:30:00', 'Revision de consultas SQL.', 'Pendiente', 282930, 202045342),
(6, '2024-05-07', '08:20:00', 'Revision trabajos', 'Pendiente', 282930, 202035891),
(7, '2024-05-06', '10:30:00', 'Asesoria para el tema Casos de Uso', 'Pendiente', 192021, 202045342),
(9, '2024-05-15', '05:05:00', 'Ninguno', 'Pendiente', 171819, 202045342),
(10, '2024-05-06', '09:30:00', 'Paleta de colores', 'Pendiente', 282930, 202045342),
(11, '2024-05-14', '08:30:00', 'Ninguno', 'Pendiente', 282930, 202045342),
(12, '2024-05-06', '05:00:00', 'Ninguno', 'Pendiente', 282930, 202045342);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `matricula` (`matricula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id_solicitud` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`matricula`) REFERENCES `alumnos` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
