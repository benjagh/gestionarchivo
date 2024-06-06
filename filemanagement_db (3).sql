-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2024 a las 23:54:12
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
-- Estructura de tabla para la tabla `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `admin_user` text NOT NULL,
  `admin_password` text NOT NULL,
  `admin_status` varchar(50) NOT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `sede` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin_login`
--

INSERT INTO `admin_login` (`id`, `name`, `admin_user`, `admin_password`, `admin_status`, `carrera`, `sede`) VALUES
(17, 'admin', 'admin@mail.com', '$2y$12$YBQnozUe6rUG3FEB2VUScexfEj/YNPL6uoj.kcMwnHsECSxU2gfwS', 'Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos_compartidos`
--

CREATE TABLE `archivos_compartidos` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL,
  `ramo_id` int(11) DEFAULT NULL,
  `shared_with_email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history_log`
--

CREATE TABLE `history_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `email_address` text NOT NULL,
  `action` varchar(100) NOT NULL,
  `actions` varchar(200) NOT NULL DEFAULT 'Has LoggedOut the system at',
  `ip` text NOT NULL,
  `host` text NOT NULL,
  `login_time` varchar(200) NOT NULL,
  `logout_time` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history_log1`
--

CREATE TABLE `history_log1` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `admin_user` text NOT NULL,
  `action` varchar(100) NOT NULL,
  `actions` varchar(200) NOT NULL DEFAULT 'Has LoggedOut the system at',
  `ip` text NOT NULL,
  `host` text NOT NULL,
  `login_time` varchar(200) NOT NULL,
  `logout_time` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `history_log1`
--

INSERT INTO `history_log1` (`log_id`, `id`, `admin_user`, `action`, `actions`, `ip`, `host`, `login_time`, `logout_time`) VALUES
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-H2P0SDF', '06-Jun-2024 17:13:03', '06-Jun-2024 17:14:23'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-H2P0SDF', '06-Jun-2024 17:13:43', '06-Jun-2024 17:14:23'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-H2P0SDF', '06-Jun-2024 17:14:43', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_user`
--

CREATE TABLE `login_user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email_address` text NOT NULL,
  `user_password` text NOT NULL,
  `user_status` varchar(50) NOT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `rut` varchar(15) DEFAULT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `sede` varchar(100) DEFAULT NULL,
  `foto_de_perfil` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ramos`
--

CREATE TABLE `ramos` (
  `id` int(11) NOT NULL,
  `codigo_ramo` varchar(50) NOT NULL,
  `nombre_ramo` varchar(100) NOT NULL,
  `periodo` enum('Otoño','Primavera') NOT NULL,
  `año` int(11) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `sede` varchar(255) NOT NULL,
  `carrera` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ramos`
--

INSERT INTO `ramos` (`id`, `codigo_ramo`, `nombre_ramo`, `periodo`, `año`, `nivel`, `sede`, `carrera`) VALUES
(18, '-----------', '-----------', 'Otoño', 2001, 5, '----------', '--------------');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_files`
--

CREATE TABLE `upload_files` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_ind_sant`
--

CREATE TABLE `upload_ind_sant` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL,
  `ramo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_ind_talca`
--

CREATE TABLE `upload_ind_talca` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL,
  `ramo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_ind_temuco`
--

CREATE TABLE `upload_ind_temuco` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL,
  `ramo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_info_sant`
--

CREATE TABLE `upload_info_sant` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL,
  `ramo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_info_talca`
--

CREATE TABLE `upload_info_talca` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL,
  `ramo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_info_temuco`
--

CREATE TABLE `upload_info_temuco` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL,
  `ramo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_quimi_sant`
--

CREATE TABLE `upload_quimi_sant` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL,
  `ramo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_ramos`
--

CREATE TABLE `usuarios_ramos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ramo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_user`
--
ALTER TABLE `login_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ramos`
--
ALTER TABLE `ramos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_ramo_unico` (`nombre_ramo`);

--
-- Indices de la tabla `upload_files`
--
ALTER TABLE `upload_files`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `upload_ind_sant`
--
ALTER TABLE `upload_ind_sant`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `upload_ind_talca`
--
ALTER TABLE `upload_ind_talca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `upload_ind_temuco`
--
ALTER TABLE `upload_ind_temuco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `upload_info_sant`
--
ALTER TABLE `upload_info_sant`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `upload_info_talca`
--
ALTER TABLE `upload_info_talca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `upload_info_temuco`
--
ALTER TABLE `upload_info_temuco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `upload_quimi_sant`
--
ALTER TABLE `upload_quimi_sant`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios_ramos`
--
ALTER TABLE `usuarios_ramos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_ramo_id` (`ramo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `login_user`
--
ALTER TABLE `login_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `ramos`
--
ALTER TABLE `ramos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `upload_files`
--
ALTER TABLE `upload_files`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `upload_ind_sant`
--
ALTER TABLE `upload_ind_sant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `upload_ind_talca`
--
ALTER TABLE `upload_ind_talca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `upload_ind_temuco`
--
ALTER TABLE `upload_ind_temuco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `upload_info_sant`
--
ALTER TABLE `upload_info_sant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `upload_info_talca`
--
ALTER TABLE `upload_info_talca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `upload_info_temuco`
--
ALTER TABLE `upload_info_temuco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `upload_quimi_sant`
--
ALTER TABLE `upload_quimi_sant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios_ramos`
--
ALTER TABLE `usuarios_ramos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios_ramos`
--
ALTER TABLE `usuarios_ramos`
  ADD CONSTRAINT `fk_ramo_id` FOREIGN KEY (`ramo_id`) REFERENCES `ramos` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
