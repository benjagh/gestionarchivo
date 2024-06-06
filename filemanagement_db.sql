-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2023 a las 01:23:55
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `admin_login`
--

INSERT INTO `admin_login` (`id`, `name`, `admin_user`, `admin_password`, `admin_status`, `carrera`, `sede`) VALUES
(17, 'admin', 'admin@mail.com', '$2y$10$c3P5KFObGTMi3vaufDSLtuK3oVJtE0IaA.jvtT7kOTmOcmzsbM2ka', 'Admin', NULL, NULL),
(19, 'Juan', 'juan@mail.com', '$2y$12$0OuuGCCvfnG7AFnit0cD7.26dwTOew6onPbvRERHCHw0p28TvQ5/q', 'Admin', 'Ingeniería Civil Industrial', 'Sede Santiago'),
(20, 'Benjamin', 'benjamin@mail.com', '$2y$12$BH9vkDBEeU4g5SDUbjFYsO6ts2qHrM99FoSi7542JVT996KoweMba', 'Admin', 'Ingeniería Civil Industrial', 'Sede Talca'),
(21, 'Alejandro', 'alejandro@mail.com', '$2y$12$49VAv5Y7lJTbmjLC2or6H.tfKfiblY3Pen/cQo1SaybSuaIREe9GS', 'Admin', 'Ingeniería Civil Industrial', 'Sede Temuco'),
(22, 'Javiera', 'javiera@mail.com', '$2y$12$ayZ6h/zNIX9ggmxk6l32TOH1H2SX0sDfd4/P7hlpP/7OM.TAJXvDK', 'Admin', 'Ingeniería Civil Informática', 'Sede Santiago'),
(23, 'Ramiro', 'ramiro@mail.com', '$2y$12$EInyhmGrJaXphaEphxUfNukxvsq5kiz/P4bxc9n8WuoJNnAUTTRuq', 'Admin', 'Ingeniería Civil Informática', 'Sede Talca'),
(24, 'Patricio', 'patricio@mail.com', '$2y$12$m.u7ia4uFhxQsTpgLDME1.JbUnN6Mu8.kOWr8XtMTTxkgvRTVfnHW', 'Admin', 'Ingeniería Civil Informática', 'Sede Temuco'),
(25, 'Luciano', 'luciano@mail.com', '$2y$12$Qg8ZaKZ01kgSEOK2U090GO5nEVDEWwrty1Ho2s6eWCwuZFmuuTd/u', 'Admin', 'Ingeniería Civil Química', 'Sede Santiago'),
(58, 'Roberto', 'roberto@mail.com', '$2y$12$pDM7H9Vtm8aalZB1WNPAAus27wDjhaHMdmrBXWLcW1ahmJBXFfcAK', 'Decano', NULL, NULL),
(59, 'sofia', 'sofia@mail.com', '$2y$12$tREIG1p9R//T1lSfIWaUZ.5tVxgY5UmHrX4hqZP3WTIoZpHUsAi0W', 'Secretaria', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `history_log`
--

INSERT INTO `history_log` (`log_id`, `id`, `email_address`, `action`, `actions`, `ip`, `host`, `login_time`, `logout_time`) VALUES
(0, 2, 'victor@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-03-2023 07:16 PM', 'Aug-30-2023 08:15 AM'),
(0, 2, 'victor@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-04-2023 03:57 AM', 'Aug-30-2023 08:15 AM'),
(0, 2, 'victor@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-04-2023 03:58 AM', 'Aug-30-2023 08:15 AM'),
(0, 2, 'victor@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-04-2023 04:00 AM', 'Aug-30-2023 08:15 AM'),
(0, 2, 'victor@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-04-2023 05:02 PM', 'Aug-30-2023 08:15 AM'),
(0, 2, 'victor@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-04-2023 05:03 PM', 'Aug-30-2023 08:15 AM'),
(0, 2, 'victor@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Aug-30-2023 08:14 AM', 'Aug-30-2023 08:15 AM'),
(0, 2, 'victor@mail.com', 'Ha iniciado sesión en el sistema a', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-01-2023 01:21 AM', ''),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-08-2023 09:06 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-08-2023 08:30 PM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-10-2023 04:45 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-10-2023 04:53 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-10-2023 05:08 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-10-2023 05:08 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-10-2023 05:11 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-12-2023 09:01 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-12-2023 09:01 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-12-2023 09:02 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-14-2023 03:38 AM', 'Sep-27-2023 06:11 AM'),
(0, 4, 'benjamin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-14-2023 03:51 AM', 'Sep-23-2023 12:19 AM'),
(0, 5, 'ric@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-14-2023 04:04 AM', ''),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 03:27 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 03:43 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 04:02 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 05:01 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 05:09 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 10:55 PM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 10:56 PM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-15-2023 11:20 PM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-15-2023 11:21 PM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-15-2023 11:23 PM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-15-2023 11:25 PM', 'Sep-27-2023 06:11 AM'),
(0, 6, 'asdmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-15-2023 11:36 PM', ''),
(0, 7, 'aasasdmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-17-2023 09:32 AM', 'Sep-22-2023 11:16 AM'),
(0, 7, 'aasasdmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-22-2023 10:41 AM', 'Sep-22-2023 11:16 AM'),
(0, 7, 'aasasdmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-22-2023 10:42 AM', 'Sep-22-2023 11:16 AM'),
(0, 7, 'aasasdmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-22-2023 09:36 PM', ''),
(0, 4, 'benjamin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-23-2023 12:01 AM', 'Sep-23-2023 12:19 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-27-2023 05:27 AM', 'Sep-27-2023 06:11 AM'),
(0, 3, 'gonzalo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-27-2023 06:11 AM', ''),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-28-2023 03:01 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-28-2023 07:10 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-29-2023 04:03 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-29-2023 04:08 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-29-2023 07:11 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-30-2023 12:23 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-30-2023 03:43 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-30-2023 03:50 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-30-2023 04:14 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-30-2023 04:14 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-30-2023 05:15 AM', 'Oct-04-2023 06:22 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 01:18 AM', 'Oct-04-2023 06:22 AM'),
(0, 15, 'benax11400@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 01:56 AM', ''),
(0, 15, 'benax11400@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 02:44 AM', ''),
(0, 17, 'lolo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 02:56 AM', 'Oct-04-2023 07:11 AM'),
(0, 16, 'as@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 03:10 AM', 'Oct-01-2023 03:11 AM'),
(0, 17, 'lolo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 03:11 AM', 'Oct-04-2023 07:11 AM'),
(0, 18, 'lala@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 03:28 AM', 'Oct-01-2023 03:38 AM'),
(0, 8, '123@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 06:21 AM', 'Oct-04-2023 06:22 AM'),
(0, 17, 'lolo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 06:22 AM', 'Oct-04-2023 07:11 AM'),
(0, 19, 'sas@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 06:58 AM', 'Oct-04-2023 07:05 AM'),
(0, 20, 'piriron@m.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 07:05 AM', 'Oct-04-2023 07:10 AM'),
(0, 17, 'lolo@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 07:10 AM', 'Oct-04-2023 07:11 AM'),
(0, 21, 'piriran@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 07:11 AM', 'Oct-04-2023 07:17 AM'),
(0, 23, '0@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 07:17 AM', 'Oct-20-2023 05:23 AM'),
(0, 23, '0@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-17-2023 03:33 AM', 'Oct-20-2023 05:23 AM'),
(0, 23, '0@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-17-2023 03:37 AM', 'Oct-20-2023 05:23 AM'),
(0, 23, '0@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-17-2023 03:44 AM', 'Oct-20-2023 05:23 AM'),
(0, 23, '0@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-17-2023 03:46 AM', 'Oct-20-2023 05:23 AM'),
(0, 23, '0@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-17-2023 03:47 AM', 'Oct-20-2023 05:23 AM'),
(0, 23, '0@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-17-2023 05:32 AM', 'Oct-20-2023 05:23 AM'),
(0, 23, '0@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-20-2023 05:23 AM', 'Oct-20-2023 05:23 AM'),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-20-2023 05:27 AM', '24-Oct-2023 17:57:18'),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-21-2023 05:11 AM', '24-Oct-2023 17:57:18'),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-21-2023 05:28 AM', '24-Oct-2023 17:57:18'),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-24-2023 04:51 AM', '24-Oct-2023 17:57:18'),
(0, 25, 'dmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-24-2023 05:13 AM', '24-Oct-2023 17:57:31'),
(0, 25, 'dmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-24-2023 05:33 AM', '24-Oct-2023 17:57:31'),
(0, 25, 'dmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-24-2023 05:36 AM', '24-Oct-2023 17:57:31'),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-24-2023 05:37 AM', '24-Oct-2023 17:57:18'),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-24-2023 05:38 AM', '24-Oct-2023 17:57:18'),
(0, 25, 'dmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-24-2023 05:38 AM', '24-Oct-2023 17:57:31'),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', '24-Oct-2023 17:57:18'),
(0, 25, 'dmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', '24-Oct-2023 17:57:31'),
(0, 25, 'dmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 25, 'dmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 25, 'dmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 25, 'dmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 25, 'dmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 26, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 27, 'sergio@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', ''),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:25:25', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:39:44', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:41:23', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:41:33', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:42:37', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:45:54', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:46:00', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:46:09', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:53:42', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:54:07', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:58:21', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:58:29', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:58:49', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:59:00', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:59:15', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 19:59:35', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:00:09', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:00:38', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:02:09', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:02:15', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:03:06', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:05:26', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:05:38', '30-Nov-2023 17:01:00'),
(0, 30, 'roberto@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:07:29', '29-Nov-2023 20:07:36'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:08:29', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:13:57', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:27:12', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:28:59', '30-Nov-2023 14:54:50'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 12:31:14', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 12:35:05', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 12:39:59', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 12:53:10', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 12:53:20', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:06:31', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:06:40', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:08:18', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:08:24', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:08:37', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:09:11', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:11:52', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:12:18', '30-Nov-2023 15:08:34'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:18:34', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:18:43', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:22:39', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:25:58', '30-Nov-2023 14:54:50'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:31:42', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:37:54', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:38:05', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:38:13', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:42:31', '30-Nov-2023 15:08:34'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:42:39', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:42:46', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:47:57', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:48:15', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:48:26', '30-Nov-2023 14:54:50'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:48:58', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:54:04', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:54:13', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:58:38', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:59:28', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:59:36', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:00:01', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:00:20', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:00:37', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:01:19', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:02:06', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:02:23', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:11:37', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:13:06', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:21:17', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:27:41', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:27:54', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:28:04', '30-Nov-2023 14:54:50'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:28:12', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:31:40', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:33:16', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:33:27', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:33:50', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:34:28', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:34:34', '30-Nov-2023 17:01:00'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:51:32', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:51:43', '30-Nov-2023 17:01:00'),
(0, 29, 'pedro@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:54:48', '30-Nov-2023 14:54:50'),
(0, 31, 'alexis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:54:57', '30-Nov-2023 15:08:34'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 15:08:39', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 15:39:51', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 15:41:41', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 16:13:32', '30-Nov-2023 17:01:00'),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 17:01:07', ''),
(0, 28, 'luis@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:13:59', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `history_log1`
--

INSERT INTO `history_log1` (`log_id`, `id`, `admin_user`, `action`, `actions`, `ip`, `host`, `login_time`, `logout_time`) VALUES
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-03-2023 07:12 PM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-04-2023 04:04 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-04-2023 03:25 PM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-04-2023 04:13 PM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'support.wondershare.net', 'Jul-04-2023 05:09 PM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Aug-30-2023 08:03 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Aug-30-2023 08:09 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-01-2023 01:28 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Ha iniciado sesión en el sistema', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-06-2023 07:37 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Ha iniciado sesión en el sistema', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-06-2023 08:06 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Ha iniciado sesión en el sistema', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-06-2023 08:12 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-07-2023 06:28 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-08-2023 09:05 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-10-2023 05:06 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-10-2023 05:12 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-14-2023 03:47 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-14-2023 04:04 AM', 'Sep-17-2023 09:36 AM'),
(0, 14, 'xd@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-14-2023 04:06 AM', 'Sep-15-2023 10:53 PM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-14-2023 04:07 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 03:37 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 03:43 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 03:51 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 04:02 AM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 04:59 AM', 'Sep-17-2023 09:36 AM'),
(0, 14, 'xd@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 08:44 PM', 'Sep-15-2023 10:53 PM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 10:53 PM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', 'Sep-15-2023 10:54 PM', 'Sep-17-2023 09:36 AM'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-15-2023 11:26 PM', 'Sep-17-2023 09:36 AM'),
(0, 15, 'aadmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-15-2023 11:36 PM', '02-Nov-2023 20:23:58'),
(0, 13, 'admin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-17-2023 09:33 AM', 'Sep-17-2023 09:36 AM'),
(0, 15, 'aadmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-22-2023 05:40 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-22-2023 11:17 PM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-23-2023 12:00 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-23-2023 12:19 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-28-2023 03:00 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-29-2023 04:07 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-30-2023 03:48 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-30-2023 03:48 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Sep-30-2023 04:17 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 01:20 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 02:50 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 03:26 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-01-2023 03:39 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 06:25 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 07:01 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 07:07 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-04-2023 07:15 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-17-2023 03:36 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-17-2023 03:42 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-17-2023 04:03 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-20-2023 05:25 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-24-2023 05:12 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', 'Oct-24-2023 05:40 AM', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '02-Nov-2023 16:06:30', '02-Nov-2023 20:23:58'),
(0, 15, 'aadmin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '02-Nov-2023 17:33:13', '02-Nov-2023 20:23:58'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '02-Nov-2023 20:24:08', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '05-Nov-2023 17:43:51', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '05-Nov-2023 18:18:59', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '05-Nov-2023 18:25:21', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '10-Nov-2023 17:57:15', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '10-Nov-2023 18:21:10', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '10-Nov-2023 18:31:38', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '10-Nov-2023 18:38:25', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '10-Nov-2023 18:43:35', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '10-Nov-2023 18:52:19', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 10:07:57', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 10:17:36', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 10:25:20', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 10:27:53', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 12:34:37', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 12:58:23', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 13:26:04', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 13:27:06', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 13:28:01', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 13:32:08', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 13:35:57', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 13:39:25', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 13:50:41', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 13:54:18', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 13:57:42', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 13:58:40', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 14:04:01', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 14:17:07', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '18-Nov-2023 14:22:07', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '21-Nov-2023 15:18:43', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '21-Nov-2023 15:42:26', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '21-Nov-2023 15:43:55', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '21-Nov-2023 15:53:25', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '21-Nov-2023 16:03:39', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '21-Nov-2023 16:11:11', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 17:10:01', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 17:10:24', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 17:55:31', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:03:30', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:34:36', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:34:43', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:34:49', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:35:04', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:38:00', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:39:01', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:39:18', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:39:33', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:39:52', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:40:09', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:46:28', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:52:38', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:56:14', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:57:43', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:59:16', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 18:59:46', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 19:01:14', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 19:14:15', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 19:14:30', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 19:15:19', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 19:25:39', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 19:33:55', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 19:34:03', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 19:34:37', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '22-Nov-2023 19:35:11', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 18:46:36', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 18:46:44', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 18:47:57', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 18:49:01', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 18:50:11', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 18:51:36', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 18:53:39', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 18:58:24', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 19:00:16', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 19:00:26', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 19:08:45', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 19:09:07', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 19:09:17', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 19:09:28', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 19:29:29', '30-Nov-2023 19:17:29'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:03:18', '29-Nov-2023 22:24:45'),
(0, 22, 'javiera@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:03:26', '29-Nov-2023 00:17:50'),
(0, 23, 'ramiro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:03:39', '29-Nov-2023 00:46:24'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:03:53', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:04:20', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:04:44', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:04:53', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:06:02', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:10:45', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:10:54', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:11:22', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:11:36', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:12:28', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:14:58', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:15:30', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:16:01', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:16:16', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:16:52', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:16:58', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:17:10', '30-Nov-2023 20:54:13'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:17:57', '29-Nov-2023 22:24:45'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:18:31', '29-Nov-2023 22:24:45'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:20:29', '29-Nov-2023 22:24:45'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:20:44', '29-Nov-2023 22:24:45'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:20:57', '29-Nov-2023 22:24:45'),
(0, 21, 'alejandro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:21:48', '28-Nov-2023 23:27:59'),
(0, 21, 'alejandro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:22:22', '28-Nov-2023 23:27:59'),
(0, 22, 'javiera@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:26:42', '29-Nov-2023 00:17:50'),
(0, 22, 'javiera@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:27:37', '29-Nov-2023 00:17:50'),
(0, 22, 'javiera@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:28:02', '29-Nov-2023 00:17:50'),
(0, 23, 'ramiro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:28:39', '29-Nov-2023 00:46:24'),
(0, 24, 'patricio@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:29:41', '29-Nov-2023 00:48:33'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:30:13', '30-Nov-2023 19:17:29'),
(0, 25, 'luciano@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:30:24', '29-Nov-2023 00:59:00'),
(0, 25, 'luciano@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:30:42', '29-Nov-2023 00:59:00'),
(0, 25, 'luciano@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:31:21', '29-Nov-2023 00:59:00'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 20:59:49', '30-Nov-2023 20:54:13'),
(0, 21, 'alejandro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 21:00:26', '28-Nov-2023 23:27:59'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '23-Nov-2023 21:00:39', '29-Nov-2023 22:24:45'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 17:40:03', '30-Nov-2023 20:54:13'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 17:40:36', '29-Nov-2023 22:24:45'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 17:54:39', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 18:09:15', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 18:09:53', '30-Nov-2023 20:54:13'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 18:11:26', '29-Nov-2023 22:24:45'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 18:11:40', '29-Nov-2023 22:24:45'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 18:12:30', '30-Nov-2023 20:54:13'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:18:53', '29-Nov-2023 22:24:45'),
(0, 21, 'alejandro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:19:25', '28-Nov-2023 23:27:59'),
(0, 22, 'javiera@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:20:20', '29-Nov-2023 00:17:50'),
(0, 23, 'ramiro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:20:47', '29-Nov-2023 00:46:24'),
(0, 24, 'patricio@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:21:20', '29-Nov-2023 00:48:33'),
(0, 25, 'luciano@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:22:04', '29-Nov-2023 00:59:00'),
(0, 25, 'luciano@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:22:22', '29-Nov-2023 00:59:00'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:23:36', '30-Nov-2023 20:54:13'),
(0, 23, 'ramiro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:24:24', '29-Nov-2023 00:46:24'),
(0, 24, 'patricio@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:24:51', '29-Nov-2023 00:48:33'),
(0, 24, 'patricio@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:25:03', '29-Nov-2023 00:48:33'),
(0, 22, 'javiera@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:25:26', '29-Nov-2023 00:17:50'),
(0, 22, 'javiera@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:25:46', '29-Nov-2023 00:17:50'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:26:29', '29-Nov-2023 22:24:45'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '24-Nov-2023 19:46:14', '29-Nov-2023 22:24:45'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '26-Nov-2023 17:01:23', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '26-Nov-2023 17:06:06', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '26-Nov-2023 17:13:50', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '26-Nov-2023 17:16:29', '30-Nov-2023 19:17:29'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '26-Nov-2023 17:16:59', '29-Nov-2023 22:24:45'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '26-Nov-2023 18:45:11', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '26-Nov-2023 18:45:44', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '27-Nov-2023 17:43:49', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '27-Nov-2023 17:47:36', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '27-Nov-2023 18:23:57', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '27-Nov-2023 18:49:13', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '27-Nov-2023 18:52:10', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '27-Nov-2023 20:57:43', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '27-Nov-2023 21:17:54', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '27-Nov-2023 21:19:57', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 17:07:18', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 19:32:17', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 20:04:00', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 20:15:37', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 20:21:22', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 21:47:43', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 21:49:10', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 21:49:53', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 21:54:54', '30-Nov-2023 20:54:13'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 21:56:40', '29-Nov-2023 22:24:45'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 21:57:39', '29-Nov-2023 22:24:45'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 21:57:52', '29-Nov-2023 22:24:45'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 21:58:05', '29-Nov-2023 22:24:45'),
(0, 23, 'ramiro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 22:09:04', '29-Nov-2023 00:46:24'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 22:16:03', '30-Nov-2023 19:17:29'),
(0, 23, 'ramiro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 22:19:32', '29-Nov-2023 00:46:24'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 22:49:33', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 22:50:21', '30-Nov-2023 20:54:13'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 23:14:30', '29-Nov-2023 22:24:45'),
(0, 21, 'alejandro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '28-Nov-2023 23:25:33', '28-Nov-2023 23:27:59'),
(0, 22, 'javiera@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 00:02:37', '29-Nov-2023 00:17:50'),
(0, 23, 'ramiro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 00:26:49', '29-Nov-2023 00:46:24'),
(0, 24, 'patricio@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 00:46:45', '29-Nov-2023 00:48:33'),
(0, 25, 'luciano@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 00:56:54', '29-Nov-2023 00:59:00'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 14:28:08', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 14:39:14', '30-Nov-2023 20:54:13'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 14:39:50', '29-Nov-2023 22:24:45'),
(0, 21, 'alejandro@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 15:18:09', ''),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 15:21:13', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:06:11', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 20:18:17', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:01:10', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:03:18', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:03:40', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:08:44', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:08:51', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:09:12', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:14:55', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:17:19', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:17:45', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:18:27', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:18:35', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:23:25', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:25:28', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:25:42', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:26:13', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:26:20', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:26:42', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:26:48', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:27:52', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:29:03', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:29:10', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:29:43', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 21:37:55', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 22:06:28', '30-Nov-2023 20:54:13'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 22:17:40', '29-Nov-2023 22:24:45'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 22:21:54', '30-Nov-2023 19:17:29'),
(0, 20, 'benjamin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 22:24:34', '29-Nov-2023 22:24:45'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 23:01:57', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '29-Nov-2023 23:02:13', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 12:23:39', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 12:37:15', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 12:39:47', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 13:49:18', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 14:08:10', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 17:03:54', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 17:23:34', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 17:25:45', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 17:29:01', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 17:33:22', '30-Nov-2023 19:17:29'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 17:37:29', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 17:38:00', '30-Nov-2023 20:54:13'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 17:38:30', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 17:39:01', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:01:52', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:02:27', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:02:48', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:03:33', '30-Nov-2023 19:17:29'),
(0, 43, 'raul@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:03:44', '30-Nov-2023 18:16:11'),
(0, 43, 'raul@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:05:09', '30-Nov-2023 18:16:11');
INSERT INTO `history_log1` (`log_id`, `id`, `admin_user`, `action`, `actions`, `ip`, `host`, `login_time`, `logout_time`) VALUES
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:11:48', '30-Nov-2023 19:17:29'),
(0, 43, 'raul@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:12:24', '30-Nov-2023 18:16:11'),
(0, 43, 'raul@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:12:56', '30-Nov-2023 18:16:11'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:13:27', '30-Nov-2023 19:17:29'),
(0, 43, 'raul@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:15:56', '30-Nov-2023 18:16:11'),
(0, 43, 'raul@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:19:26', ''),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:20:15', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:31:46', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:32:12', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:44:06', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:45:08', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:46:38', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:57:17', '30-Nov-2023 19:17:29'),
(0, 46, 'roberto@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 18:58:12', '30-Nov-2023 19:01:29'),
(0, 46, 'roberto@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:01:27', '30-Nov-2023 19:01:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:02:00', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:07:24', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:09:04', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:13:27', '30-Nov-2023 19:17:29'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:18:15', ''),
(0, 53, 'bastian@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:21:42', '30-Nov-2023 19:21:58'),
(0, 53, 'bastian@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:21:57', '30-Nov-2023 19:21:58'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:22:27', ''),
(0, 57, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:24:48', '30-Nov-2023 19:24:52'),
(0, 56, 'robert0@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:25:00', '30-Nov-2023 19:26:35'),
(0, 56, 'robert0@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:25:43', '30-Nov-2023 19:26:35'),
(0, 52, 'roberto@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:37:15', '30-Nov-2023 19:39:25'),
(0, 52, 'roberto@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:38:59', '30-Nov-2023 19:39:25'),
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:39:49', ''),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:43:35', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:47:20', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:48:34', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:49:49', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:58:06', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:59:10', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:59:37', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 19:59:49', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:00:21', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:01:30', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:03:00', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:06:13', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:06:16', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:07:12', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:07:46', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:08:17', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:11:10', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:11:13', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:13:44', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:18:40', '30-Nov-2023 20:52:31'),
(0, 58, 'roberto@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:19:33', ''),
(0, 58, 'roberto@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:19:38', ''),
(0, 58, 'roberto@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:20:21', ''),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:20:34', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:28:19', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:31:08', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:34:30', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:36:16', '30-Nov-2023 20:52:31'),
(0, 58, 'roberto@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:36:56', ''),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:37:33', '30-Nov-2023 20:52:31'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:40:11', '30-Nov-2023 20:52:31'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:40:50', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:43:19', '30-Nov-2023 20:54:13'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:49:28', '30-Nov-2023 20:54:13'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:52:20', '30-Nov-2023 20:52:31'),
(0, 19, 'juan@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:53:10', '30-Nov-2023 20:54:13'),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:54:40', ''),
(0, 59, 'sofia@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'LAPTOP-UEOQ5D9V', '30-Nov-2023 20:54:58', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `login_user`
--

INSERT INTO `login_user` (`id`, `name`, `email_address`, `user_password`, `user_status`, `fecha_de_nacimiento`, `rut`, `carrera`, `sede`, `foto_de_perfil`) VALUES
(28, 'Luis Humberto Jara Salas', 'luis@mail.com', '$2y$12$/aMpeYfUH6D1.nzZXfh38OUMdR9T1Bwsu3Fis2HcZYioPjuBLMlJK', 'Profesor', '1992-01-07', '17.824.469-8', 'Ingeniería Civil Industrial', 'Sede Talca', 0x6a756a757473752d6b616973656e2e6a7067),
(29, 'Pedro', 'pedro@mail.com', '$2y$12$T.XFtbRoUt6RVqvBJkCgPOx1xrGa21orp6yy2FJEOniR2pchqphuy', 'Profesor', '1998-01-31', '17.824.469-8', 'Ingeniería Civil Informática', 'Sede Talca', 0x74756d626c725f30363631386338333536643337343536383234653037316135303736383735665f31666366326561645f313238302e6a7067),
(30, 'Roberto', 'roberto@mail.com', '$2y$12$/thm9MDMUuH0/bHf5grzzOUKd9CexXOVVfJKoCzY1bPj4jxxZ0tda', 'Secretario(a) de Estudios', '1998-01-31', '17.824.469-8', 'Ingeniería Civil Industrial', 'Sede Santiago', 0x6a756a757473752d6b616973656e2e6a7067),
(31, 'Alexis', 'alexis@mail.com', '$2y$12$mdTjYxzztL4T0Mjo2pdDyeRQhrL0J0YLkfFsMwJv.hcojBggN8nF.', 'Secretario(a) de Estudios', '1963-10-16', '8.208.674-9', 'Ingeniería Civil Industrial', 'Sede Talca', 0x74756d626c725f30363631386338333536643337343536383234653037316135303736383735665f31666366326561645f313238302e6a7067);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_files`
--

CREATE TABLE `upload_files` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_ind_sant`
--

CREATE TABLE `upload_ind_sant` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_ind_talca`
--

CREATE TABLE `upload_ind_talca` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `upload_ind_talca`
--

INSERT INTO `upload_ind_talca` (`id`, `NAME`, `SIZE`, `DOWNLOAD`, `TIMERS`, `ADMIN_STATUS`, `EMAIL`, `sede`) VALUES
(1, 'Workbook Exponencial Trading Starting !.docx.pdf', '101599', '0', '28-Nov-2023 22:03:03', 'Ingeniería Civil Industrial', 'Luis Humberto Jara Salas', 'Talca'),
(2, 'Gestión de Capital - #RetoRichTrader Clase 2.xlsx', '160313', '0', '28-Nov-2023 22:03:12', 'Ingeniería Civil Industrial', 'Luis Humberto Jara Salas', 'Talca'),
(3, 'WorkBook-Clase2.pdf', '3693855', '0', '28-Nov-2023 22:03:22', 'Ingeniería Civil Industrial', 'Luis Humberto Jara Salas', 'Talca'),
(4, 'PLANILLA ALUMNOS NOVIEMBRE.xlsx', '127973', '0', '30-Nov-2023 14:58:45', 'Ingeniería Civil Industrial', 'Alexis', 'Talca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_ind_temuco`
--

CREATE TABLE `upload_ind_temuco` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_info_sant`
--

CREATE TABLE `upload_info_sant` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_info_talca`
--

CREATE TABLE `upload_info_talca` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `upload_info_talca`
--

INSERT INTO `upload_info_talca` (`id`, `NAME`, `SIZE`, `DOWNLOAD`, `TIMERS`, `ADMIN_STATUS`, `EMAIL`, `sede`) VALUES
(2, 'WorkBook-Clase2.pdf', '3693855', '0', '28-Nov-2023 22:20:34', 'Ingeniería Civil en Informática', 'Pedro', 'Talca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_info_temuco`
--

CREATE TABLE `upload_info_temuco` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upload_quimi_sant`
--

CREATE TABLE `upload_quimi_sant` (
  `id` int(11) NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL,
  `sede` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `login_user`
--
ALTER TABLE `login_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `upload_files`
--
ALTER TABLE `upload_files`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `upload_ind_sant`
--
ALTER TABLE `upload_ind_sant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `upload_ind_talca`
--
ALTER TABLE `upload_ind_talca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `upload_ind_temuco`
--
ALTER TABLE `upload_ind_temuco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `upload_info_sant`
--
ALTER TABLE `upload_info_sant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `upload_info_talca`
--
ALTER TABLE `upload_info_talca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `upload_info_temuco`
--
ALTER TABLE `upload_info_temuco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `upload_quimi_sant`
--
ALTER TABLE `upload_quimi_sant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
