-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2024 a las 22:46:59
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
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `matricula` int(100) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido_paterno` varchar(150) NOT NULL,
  `apellido_materno` varchar(150) NOT NULL,
  `id_programaedu` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`matricula`, `nombre`, `apellido_paterno`, `apellido_materno`, `id_programaedu`) VALUES
(202035891, 'Evelyn', 'Flores', 'Lechuga', 1),
(202045342, 'Itzel', 'Martinez', 'Carrera', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesorias`
--

CREATE TABLE `asesorias` (
  `id_asesoria` int(100) NOT NULL,
  `matricula` int(100) NOT NULL,
  `id_profesor` int(100) NOT NULL,
  `id_materia` int(100) NOT NULL,
  `comentarios` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscritos`
--

CREATE TABLE `inscritos` (
  `id_inscripcion` int(100) NOT NULL,
  `matricula` int(100) NOT NULL,
  `id_materia` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inscritos`
--

INSERT INTO `inscritos` (`id_inscripcion`, `matricula`, `id_materia`) VALUES
(3, 202045342, 4),
(4, 202045342, 1),
(5, 202035891, 6),
(6, 202035891, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_programaedu` int(100) NOT NULL,
  `id_profesor` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `nombre`, `id_programaedu`, `id_profesor`) VALUES
(1, 'Modelos de Desarrollo Web', 1, 123456),
(2, 'Modelos de Desarrollo Web', 1, 171819),
(3, 'Modelos de Desarrollo Web', 1, 101010),
(4, 'Arquitectura de Software', 1, 192021),
(5, 'Arquitectura de Software', 1, 242526),
(6, 'Interfaz de Usuario', 1, 282930),
(7, 'Inteligencia de Negocios', 1, 282930);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesor` int(100) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido_paterno` varchar(150) NOT NULL,
  `apellido_materno` varchar(150) NOT NULL,
  `id_programaedu` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id_profesor`, `nombre`, `apellido_paterno`, `apellido_materno`, `id_programaedu`) VALUES
(101010, 'Carlos Armando', 'Rios', 'Acevedo', 1),
(123456, 'Mario\r\n', 'Rossainz\r\n', 'Lopez', 1),
(171819, 'Luis Yael', 'Mendez', 'Sanchez', 1),
(192021, 'Steffanie', 'Jimenez ', 'Flores ', 1),
(242526, 'Margarita Carmina', 'Garcia', 'Lopez ', 1),
(282930, 'Gilberto', 'Lopez', 'Poblano ', 1),
(789101, 'Jose Luis', 'Hernandez', 'Ameca', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_educativo`
--

CREATE TABLE `programa_educativo` (
  `id_programaedu` int(100) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programa_educativo`
--

INSERT INTO `programa_educativo` (`id_programaedu`, `nombre`) VALUES
(1, 'ITI'),
(2, 'LCC'),
(3, 'ICC');

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
(12, '2024-05-06', '05:00:00', 'Ninguno', 'Pendiente', 282930, 202045342),
(13, '2024-05-22', '07:00:00', 'Ninguno', 'Pendiente', 282930, 202045342),
(14, '2024-05-06', '05:05:00', 'Ninguno', 'Pendiente', 123456, 202035891);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `id_programaedu` (`id_programaedu`) USING BTREE;

--
-- Indices de la tabla `asesorias`
--
ALTER TABLE `asesorias`
  ADD PRIMARY KEY (`id_asesoria`),
  ADD KEY `id_materia` (`id_materia`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `matricula` (`matricula`);

--
-- Indices de la tabla `inscritos`
--
ALTER TABLE `inscritos`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `matricula` (`matricula`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `id_programaedu` (`id_programaedu`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `id_programaedu` (`id_programaedu`) USING BTREE;

--
-- Indices de la tabla `programa_educativo`
--
ALTER TABLE `programa_educativo`
  ADD PRIMARY KEY (`id_programaedu`);

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
-- AUTO_INCREMENT de la tabla `asesorias`
--
ALTER TABLE `asesorias`
  MODIFY `id_asesoria` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscritos`
--
ALTER TABLE `inscritos`
  MODIFY `id_inscripcion` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `programa_educativo`
--
ALTER TABLE `programa_educativo`
  MODIFY `id_programaedu` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id_solicitud` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`id_programaedu`) REFERENCES `programa_educativo` (`id_programaedu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `asesorias`
--
ALTER TABLE `asesorias`
  ADD CONSTRAINT `asesorias_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asesorias_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asesorias_ibfk_3` FOREIGN KEY (`matricula`) REFERENCES `alumnos` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscritos`
--
ALTER TABLE `inscritos`
  ADD CONSTRAINT `inscritos_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `alumnos` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscritos_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_programaedu`) REFERENCES `programa_educativo` (`id_programaedu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materias_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`id_programaedu`) REFERENCES `programa_educativo` (`id_programaedu`) ON DELETE CASCADE ON UPDATE CASCADE;

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
