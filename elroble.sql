-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla elroble.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elroble.cache: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elroble.cache_locks: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `telefono_secundario` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instagram` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.contacto: ~0 rows (aproximadamente)
INSERT INTO `contacto` (`id`, `direccion`, `telefono`, `email`, `telefono_secundario`, `instagram`, `updated_at`) VALUES
	(1, 'Chaco 2580, B1825FSB Valentín Alsina, Provincia de', '011 4208-8500', 'pedidoselroblesrl@hotmail.com', '(+54 11) 4208-8500', 'https://www.instagram.com/elroblesrl/?hl=es', '2024-05-09 13:02:23');

-- Volcando estructura para tabla elroble.descargas
CREATE TABLE IF NOT EXISTS `descargas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` longtext NOT NULL,
  `texto` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `file` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Volcando datos para la tabla elroble.descargas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elroble.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.imagenes
CREATE TABLE IF NOT EXISTS `imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `path` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `orden` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`id_producto`),
  CONSTRAINT `producto_id` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.imagenes: ~4 rows (aproximadamente)
INSERT INTO `imagenes` (`id`, `id_producto`, `path`, `updated_at`, `created_at`, `orden`) VALUES
	(11, 25, 'fotos/TdUJ6msUtfnezLwdJkasSy0hYsb24iDHJ0ldMonO.jpg', '2024-05-11 03:26:31', '2024-05-11 03:26:31', 'aa'),
	(12, 27, 'fotos/TlPz88FFXrLUIEGy3s3VX26Yeoxs1yZOY8e26pcI.png', '2024-05-11 03:26:55', '2024-05-11 03:26:55', 'aa'),
	(13, 28, 'fotos/voLvdOs4zYv1nduc8E3CAmPzmGyl8i4BDXeMtnH0.png', '2024-05-11 03:27:16', '2024-05-11 03:27:16', 'aa'),
	(14, 29, 'fotos/KuejfxH5wRAejDTwW9FhdbwGQj8amzjFSwYhTrK7.png', '2024-05-11 03:27:35', '2024-05-11 03:27:35', 'aa');

-- Volcando estructura para tabla elroble.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elroble.jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elroble.job_batches: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.logos
CREATE TABLE IF NOT EXISTS `logos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `navbar` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `footer` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.logos: ~0 rows (aproximadamente)
INSERT INTO `logos` (`id`, `navbar`, `footer`, `updated_at`) VALUES
	(1, 'fotos/JFq9CZJJ5ENZriQOfnw2MUAlu6N4rsiYk0OHqAdd.png', 'fotos/ggyzjVxRh5gGteAIhVx2teYL3MfIi2tiVxmyMhCc.png', '2024-05-09 13:46:19');

-- Volcando estructura para tabla elroble.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elroble.migrations: ~3 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1);

-- Volcando estructura para tabla elroble.novedades
CREATE TABLE IF NOT EXISTS `novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` varchar(50) NOT NULL DEFAULT '',
  `titulo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `epigrafe` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `etiqueta` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `texto` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `destacado` int(11) NOT NULL,
  `imagen` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.novedades: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elroble.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `texto` varchar(150) DEFAULT NULL,
  `destacado` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.productos: ~4 rows (aproximadamente)
INSERT INTO `productos` (`id`, `orden`, `nombre`, `texto`, `destacado`, `updated_at`, `created_at`) VALUES
	(25, 'aa', 'Espatula curva para balde', NULL, 1, '2024-05-11 03:24:21', '2024-05-11 03:24:21'),
	(27, 'bb', 'Espatula para pintor', NULL, 0, '2024-05-11 03:26:45', '2024-05-11 03:26:45'),
	(28, 'cc', 'Llana dentada', NULL, 1, '2024-05-11 03:27:08', '2024-05-11 03:27:08'),
	(29, 'aa', 'Mangos', NULL, 1, '2024-05-11 03:27:28', '2024-05-11 03:27:28');

-- Volcando estructura para tabla elroble.seccionempresa
CREATE TABLE IF NOT EXISTS `seccionempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `titulo` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `texto` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.seccionempresa: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.seccionhome
CREATE TABLE IF NOT EXISTS `seccionhome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `texto` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `imagen` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `link` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `textoboton` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.seccionhome: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `texto` longtext NOT NULL,
  `imagen` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Volcando datos para la tabla elroble.servicios: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elroble.sessions: ~1 rows (aproximadamente)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('hMmdhPqMWngjKbUankYHQ26veWoEn7DBGwM5cfAi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2VaeU1JY0I3SWRxeVdVdTE0UENtZ0dJWmlRS3dqdDdONXA2a1FlSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ2V0SW1hZ2UvS3VlamZ4SDV3UkFlakRUd1c5RmhkYndHUWo4YW16akZTd1loVHJLNy5wbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1715465321),
	('keWff5hn1cblLthcK5yPJS714Fw4GPmL6abDvttS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUlTV2xuaWs3ZXpKT3NITTVzWlFBbzNwMUUxMHpLTVN6MVlJUjVnRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ2V0SW1hZ2UvSkZxOUNaSko1RU5acmlRT2ZudzJNVUFsdTZONHJzaVlrME9IcUFkZC5wbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1715465320),
	('rgqxVcMMZN5Jtd7aXkWxQmTM1EKBdauMIfO7uAsf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFpyaEZDMGd4aUk4QUk3cWpaQ0tHcG1xTkRDdkdWZVY1YnBUQ1hlcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ2V0SW1hZ2UvaWI4SXhqRnI2VmF4OFpzZzd3ZlNwQVREMFUxbTdqMkFvZmFrZFNYMy5wbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1715465321),
	('vw0fvNRLBnoKpjdmI6i1fNUVgvJZdPIpsjLCP5Hh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFpia2tNM3JFZ2pMSndDVmRmdVlXSWc2Z0QxRHhjejVXRDFDSjhlMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZ2V0SW1hZ2UvS3VlamZ4SDV3UkFlakRUd1c5RmhkYndHUWo4YW16akZTd1loVHJLNy5wbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1715399136),
	('xwb4qpIqz5Q5DXL7q3Rbogxfu6WtxpDf4LpYhICy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkM3Q09UenZZcUY0MUsxSmhiSEN4dXNqVWN1UmVJdlQ0eUdYOXo2cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb2J0ZW5lckxvZ29zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1715465320);

-- Volcando estructura para tabla elroble.slider
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` varchar(50) DEFAULT NULL,
  `texto` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `textoboton` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `imagen` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `linkboton` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.slider: ~8 rows (aproximadamente)
INSERT INTO `slider` (`id`, `orden`, `texto`, `textoboton`, `imagen`, `linkboton`, `updated_at`, `created_at`) VALUES
	(5, 'cc', '<p>esto es una prueba 2</p>', 'Ver productos', 'fotos/ib8IxjFr6Vax8Zsg7wfSpATD0U1m7j2AofakdSX3.png', NULL, '2024-05-10 13:31:43', '2024-05-10 13:16:37');

-- Volcando estructura para tabla elroble.subproductos
CREATE TABLE IF NOT EXISTS `subproductos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `tamaño` varchar(100) DEFAULT NULL,
  `pack` varchar(100) DEFAULT NULL,
  `codigobarra` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_subproducto_id` (`producto_id`),
  CONSTRAINT `producto_subproducto_id` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.subproductos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.upload
CREATE TABLE IF NOT EXISTS `upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` varchar(50) NOT NULL,
  `numeropedido` varchar(100) DEFAULT NULL,
  `formato` varchar(100) DEFAULT NULL,
  `peso` varchar(100) DEFAULT NULL,
  `file` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.upload: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla elroble.users: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `admin` int(11) DEFAULT NULL,
  `zonaprivada` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.usuarios: ~1 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `usuario`, `email`, `password`, `admin`, `zonaprivada`, `updated_at`, `created_at`) VALUES
	(1, 'pablo', 'pablo@email.com', '$2y$12$buq/MdORAJgBFnlP1HgBEubPT/SOvi9pNPJkwNukdoA/iKBiCu8q6', 1, 0, '2024-05-08 14:57:47', '2024-05-08 14:57:47');

-- Volcando estructura para tabla elroble.valores
CREATE TABLE IF NOT EXISTS `valores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` varchar(50) DEFAULT NULL,
  `imagen` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `titulo` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `texto` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.valores: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.videos
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Volcando datos para la tabla elroble.videos: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
