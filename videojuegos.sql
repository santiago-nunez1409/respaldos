-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2026 a las 17:13:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `videojuegos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre`, `descripcion`) VALUES
(1, 'accion', 'Enfocados en reflejos, puntería y combate frenético'),
(2, 'Acción-Aventura', ' Combina combates de acción con la exploración y resolución de acertijos de las aventuras (ej. Resident Evil, Uncharted).'),
(3, 'Aventura', ' Centrados en la narrativa, la exploración y la resolución de puzles, a menudo denominados \"aventuras gráficas\" (ej. Broken Sword).'),
(4, 'Rol (RPG)', 'Juegos basados en la evolución de personajes, toma de decisiones y ambientaciones fantásticas (ej. The Witcher, Final Fantasy).'),
(5, 'Estrategia', 'Requieren planificación, gestión de recursos y táctica en tiempo real (RTS) o por turnos (ej. StarCraft).');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE `plataforma` (
  `id_plataforma` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `fabricante` varchar(80) NOT NULL,
  `año_lanzamiento` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plataforma`
--

INSERT INTO `plataforma` (`id_plataforma`, `nombre`, `fabricante`, `año_lanzamiento`) VALUES
(1, 'Xbox', 'Microsoft', '2001'),
(2, 'Nintendo Wii ', 'Nintendo', '2006'),
(3, 'PlayStation 3', 'Sony', '2006'),
(4, 'Steam', 'Valve', '2003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego`
--

CREATE TABLE `videojuego` (
  `id_juego` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `desarolladora` varchar(100) NOT NULL,
  `año_lanzamiento` year(4) NOT NULL,
  `precio` decimal(6,0) NOT NULL,
  `id_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `videojuego`
--

INSERT INTO `videojuego` (`id_juego`, `titulo`, `desarolladora`, `año_lanzamiento`, `precio`, `id_genero`) VALUES
(1, 'Leyendas Pokémon ZA', ' Game Freak/Nintendo', '2025', 80, 4),
(2, 'Mario Bros ', 'Nintento', '1985', 50, 3),
(3, 'Red Dead Redemption 2', 'Rockstar Games', '2018', 60, 2),
(4, 'Cyberpunk 2077', 'CD projekt Red', '2020', 60, 1),
(5, 'EA SPORTS FC 26', 'Electronic Arts', '2025', 70, 5),
(6, 'The Witcher 3', 'CD Projekt Red', '2024', 40, 4),
(7, 'Sonic Mania', 'SEGA', '2025', 20, 1),
(8, 'RimWorld', 'Ludeon Studios', '2025', 35, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_plataforma`
--

CREATE TABLE `video_plataforma` (
  `id_juego` int(11) NOT NULL,
  `id_plataforma` int(11) NOT NULL,
  `fecha_disponible` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `video_plataforma`
--

INSERT INTO `video_plataforma` (`id_juego`, `id_plataforma`, `fecha_disponible`) VALUES
(4, 4, '0000-00-00'),
(4, 4, '2026-04-15'),
(8, 1, '2026-04-03'),
(7, 3, '2026-04-03'),
(1, 4, '2026-04-18'),
(2, 2, '2026-04-05'),
(3, 1, '2026-04-01'),
(1, 1, '2026-04-27'),
(6, 4, '2026-04-23'),
(8, 4, '2026-04-01'),
(5, 3, '2026-04-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`id_plataforma`);

--
-- Indices de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD PRIMARY KEY (`id_juego`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indices de la tabla `video_plataforma`
--
ALTER TABLE `video_plataforma`
  ADD KEY `id_juego` (`id_juego`),
  ADD KEY `id_plataforma` (`id_plataforma`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  MODIFY `id_plataforma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD CONSTRAINT `videojuego_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`);

--
-- Filtros para la tabla `video_plataforma`
--
ALTER TABLE `video_plataforma`
  ADD CONSTRAINT `video_plataforma_ibfk_1` FOREIGN KEY (`id_juego`) REFERENCES `videojuego` (`id_juego`),
  ADD CONSTRAINT `video_plataforma_ibfk_2` FOREIGN KEY (`id_plataforma`) REFERENCES `plataforma` (`id_plataforma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
