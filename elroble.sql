-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
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
  `direccion` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `facebook` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instagram` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.contacto: ~0 rows (aproximadamente)

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
  PRIMARY KEY (`id`),
  KEY `producto_id` (`id_producto`),
  CONSTRAINT `producto_id` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.imagenes: ~0 rows (aproximadamente)

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.logos: ~0 rows (aproximadamente)

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.productos: ~0 rows (aproximadamente)

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
	('v4jdSqbBmP3QWHmzTzbUW1SUUzjfzg4HItczwYXw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWF6TWFiQjRVaXlGaDZMQkF4QVpCTEVjVjZhVHNwYmR3STdWaUFNZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1715188261);

-- Volcando estructura para tabla elroble.slider
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` varchar(50) DEFAULT NULL,
  `texto` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `link` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `textoboton` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `imagen` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mostrarproducto` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla elroble.slider: ~0 rows (aproximadamente)

-- Volcando estructura para tabla elroble.subproductos
CREATE TABLE IF NOT EXISTS `subproductos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `codigo` int(10) DEFAULT NULL,
  `tamaño` varchar(80) DEFAULT NULL,
  `codigobarra` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_subproducto_id` (`producto_id`),
  CONSTRAINT `producto_subproducto_id` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
