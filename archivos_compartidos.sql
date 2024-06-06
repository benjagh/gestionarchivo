-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-02-2024 a las 22:54:54
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `filemanagement_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos_compartidos`
--

CREATE TABLE `archivos_compartidos` (
  `id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `fecha_compartido` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_compartido` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `archivos_compartidos`
--

INSERT INTO `archivos_compartidos` (`id`, `file_id`, `hash`, `fecha_compartido`, `usuario_compartido`) VALUES
(1, 30, '1708909535997_7q33t1q4x6', '2024-02-25 22:05:36', ''),
(2, 30, '1708909629034_dyujk4amgfd', '2024-02-25 22:07:09', ''),
(3, 30, '1708909665416_y2lvi0hqu4n', '2024-02-25 22:07:45', ''),
(4, 32, '1708909669506_94uof9gavu', '2024-02-25 22:07:49', ''),
(5, 30, '1708974495854_4ewbknqd2t3', '2024-02-26 16:08:15', ''),
(6, 32, '1708974526671_vlmty8qjdv8', '2024-02-26 16:08:46', ''),
(7, 30, '1708976317083_d046lxozixp', '2024-02-26 16:38:37', ''),
(8, 30, '1708982671130_dy8j3se8fzs', '2024-02-26 18:24:31', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos_compartidos`
--
ALTER TABLE `archivos_compartidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_id_idx` (`file_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos_compartidos`
--
ALTER TABLE `archivos_compartidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos_compartidos`
--
ALTER TABLE `archivos_compartidos`
  ADD CONSTRAINT `file_id` FOREIGN KEY (`file_id`) REFERENCES `upload_info_talca` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
