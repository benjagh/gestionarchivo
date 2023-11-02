-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20230928.962ff02b72
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2023 a las 00:24:35
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.5

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
  `admin_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin_login`
--

INSERT INTO `admin_login` (`id`, `name`, `admin_user`, `admin_password`, `admin_status`) VALUES
(17, 'admin', 'admin@mail.com', '$2y$12$zCeMXIPf29rfgy5LkArnp.EJ1t0g9WZCl8kHpQBr/DrAsBwH6MGf.', 'Admin');

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
(0, 24, 'felix@mail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '', '');

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
(0, 17, 'admin@mail.com', 'Ha iniciado sesión en el sistema a las', 'Has LoggedOut the system at', '::1', 'DESKTOP-2EQASFA', '02-Nov-2023 20:24:08', '');

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `login_user`
--
ALTER TABLE `login_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `upload_files`
--
ALTER TABLE `upload_files`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
