-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 04, 2025 at 06:58 PM
-- Server version: 5.7.40
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reactapi1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_29_085830_create_permission_tables', 1),
(5, '2025_04_29_103556_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(1, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(1, 'App\\Models\\User', 24),
(3, 'App\\Models\\User', 25),
(1, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 27),
(2, 'App\\Models\\User', 28),
(1, 'App\\Models\\User', 29),
(1, 'App\\Models\\User', 30),
(2, 'App\\Models\\User', 31),
(2, 'App\\Models\\User', 32),
(1, 'App\\Models\\User', 33),
(2, 'App\\Models\\User', 34),
(2, 'App\\Models\\User', 35),
(2, 'App\\Models\\User', 36),
(3, 'App\\Models\\User', 37),
(2, 'App\\Models\\User', 38),
(2, 'App\\Models\\User', 39),
(2, 'App\\Models\\User', 40),
(1, 'App\\Models\\User', 41),
(2, 'App\\Models\\User', 43),
(3, 'App\\Models\\User', 44),
(1, 'App\\Models\\User', 45),
(1, 'App\\Models\\User', 46),
(3, 'App\\Models\\User', 48),
(2, 'App\\Models\\User', 51),
(3, 'App\\Models\\User', 55),
(1, 'App\\Models\\User', 61),
(3, 'App\\Models\\User', 62),
(1, 'App\\Models\\User', 64),
(2, 'App\\Models\\User', 65),
(1, 'App\\Models\\User', 66),
(1, 'App\\Models\\User', 67),
(1, 'App\\Models\\User', 68),
(1, 'App\\Models\\User', 69),
(1, 'App\\Models\\User', 71),
(2, 'App\\Models\\User', 74),
(1, 'App\\Models\\User', 86),
(1, 'App\\Models\\User', 87);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(60, 'App\\Models\\User', 1, 'login_token', '01ed6233c1cf080294138c1625d078e111897b922fce2332b6051ba27262c03a', '[\"*\"]', '2025-05-04 14:54:27', NULL, '2025-05-03 15:42:20', '2025-05-04 14:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2025-04-29 06:46:38', '2025-04-29 06:46:38'),
(2, 'admin', 'web', '2025-04-29 06:46:38', '2025-04-29 06:46:38'),
(3, 'user', 'web', '2025-04-29 06:46:38', '2025-04-29 06:46:38');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AZDjZvYEw6tBFgYD7ARTGi1M49mQc7d5sF8JRcLK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibmJlZEQ3bm9NVlRXaW96dVJwcWhrcXRQVE94eFg1aTI2VUtLajJuVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746269582),
('dYLgv8mFe5ZlWci41s0vB8i0wqjFbdkE9KZoaTlT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUFllY2R2clF0cllvaHhPZlltNnJDc3dlaW9jZE9neGxONkhNb3NMcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746338026),
('HbZKG8RKFFBvHA3MDaVzSsAvqsHbHWMzA5z9vktC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNmRzd0U1NnBObGdQVW5TQTdiM2Q1aWJhd1VmM2VlU1I1SDVDQk8xSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746257461),
('inNnQqlNPs8qnSk3li5b1hb6RAaMKoefDj6spk5L', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTlsZFN0RFE4UTJNWEswd1ZDbjFZZGtqZG1vY0RVQmpVdXRTTHFWaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1746288350),
('O8czRJjDrIBnm4YLxF17adFVygVpEkZKul5MfDek', NULL, '127.0.0.1', 'PostmanRuntime/7.43.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTRxYmlNYXRuTTRTcGRZU1pMUEEzejRFTFNUQWZTbWpMT1pKdUNubCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1745935156),
('OWMYYaGxr8MGXj79VNeqj6AcukcrMORq1fbsFmL7', 1, '127.0.0.1', 'PostmanRuntime/7.43.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG9VR2M4RXVxdjNzQ2xtVEdsalBPOXYxV2RNSmhXdDQ1TG05YkFNZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1745948470),
('qcfcUvAIZC1eUSb37l1eQMSTVKSYDGTeLcfMZ52W', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnN4eGVIZ3VOQ1NrUk5kQmdxYnlIWU5BZVBtZDhadGJ4WUJDeDNkQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1745937436),
('qsgusMlp69LFsFbcMCOrWqDA95ThaYRW5AOsiAGl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTnlXRnJOUVhiQnNabE9VWUplTmhyN2VTU0lSMFpwR0pRNWxVaXloayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746017823),
('rbbdiSGZ80TYOO5gYVu4Vx43ZlTSdJ2HxAr7b2Ou', NULL, '127.0.0.1', 'PostmanRuntime/7.43.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMm1OWDdKVnV6ZFc1VmFYMXRmbTZlbjhyd2Z2RjFMVkNKY1lSZUhVUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9fQ==', 1745941075),
('Rw7CcF5PGJFeKNMwhBoSzkAxFAam45Dc3OB7A3Cn', NULL, '127.0.0.1', 'PostmanRuntime/7.43.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakdMM3VxbElMRjFaMDNESkdmd0dmaWZqbk9ubER1a0hvUThDa2ljUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1745937299),
('vmpTCuq4t3mPfd5cymF6Fsswl9JjXbb4PWdBQp0Y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidFl6V3VEUUp6U2FCblpSRXZpb2ZGR3ExVldCV0N6WFBZOTFkMjVTNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746209125),
('wxHKZKCRieiAzaeKohuEcgG7aA0wjd3klBhNDmBB', NULL, '127.0.0.1', 'PostmanRuntime/7.43.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3VsUms3WUhQQ2xRNm54dFZnU2VMOFlhSHRkcFlWY3cxQVhJR1ltYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1745935994);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `img`, `pdf`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super@super.com', NULL, NULL, NULL, '$2y$12$.KFlRaRO8oYlxSOR1Pf5oO.ARegVTaiMopXk6x5iCXNpqfXFH1yxG', NULL, '2025-04-29 06:46:39', '2025-04-29 06:46:39'),
(5, 'Mrs. Esmeralda Jacobs II', 'wlakin@example.com', NULL, NULL, NULL, '$2y$12$E2F9QsplsF4sfm5ZeO5Z8e1Rb2tyLm2foWySm2WuGjv8zQbMNtW4a', NULL, '2025-05-02 14:18:30', '2025-05-02 14:18:30'),
(6, 'Mrs. Lydia Sanford Sr.', 'ari.daugherty@example.org', NULL, NULL, NULL, '$2y$12$QTYPQuEC2FDo6dcDPYdA9e21mlnjVDvpys1nA0F0sbeXT07wHDBpu', NULL, '2025-05-02 14:18:30', '2025-05-02 14:18:30'),
(9, 'Mr. Everardo Fisher MD', 'jadon.hessel@example.net', NULL, NULL, NULL, '$2y$12$wE.IKNr24alXCSafsXuVAeK.RVaFVCSTZ5K9J2Bygps6djQI1Tfai', NULL, '2025-05-02 14:18:31', '2025-05-02 14:18:31'),
(10, 'Vergie Beatty DDS', 'qhermann@example.org', NULL, NULL, NULL, '$2y$12$V/Sh8I/oemOf1ln/gfAMCO3CCcWKbbvT421Xqjlh8sFBBA/ybk7I2', NULL, '2025-05-02 14:18:31', '2025-05-02 14:18:31'),
(11, 'Jacky Kulas II', 'waufderhar@example.net', NULL, NULL, NULL, '$2y$12$0lcWZwwY4edzlrFmPHBR8.AdbX26tD4yJJJIbZBjU9taXKEGK7Zwy', NULL, '2025-05-02 14:18:31', '2025-05-02 14:18:31'),
(12, 'Jayce Hansen', 'mwalker@example.org', NULL, NULL, NULL, '$2y$12$nIfzrQO8FQfJzK0Om/TWWOHDzoXl8BbmYz8By3aaRlUO3.mzsVaIu', NULL, '2025-05-02 14:18:32', '2025-05-02 14:18:32'),
(13, 'Philip Bins', 'marley.hintz@example.com', NULL, NULL, NULL, '$2y$12$1aUn7X1rTP/xx6LTVve4a.foLZ9cVWY63SowRZUo1Nsn4T69TuCcS', NULL, '2025-05-02 14:18:32', '2025-05-02 14:18:32'),
(14, 'Damien Heller', 'eloy08@example.com', NULL, NULL, NULL, '$2y$12$mJLVUq/l7AmkdClDPOpU3OloxH6Cb2rEZyUJeVcL7rOwyRsHuyknO', NULL, '2025-05-02 14:18:32', '2025-05-02 14:18:32'),
(15, 'Jarrett Spinka', 'melody.metz@example.net', NULL, NULL, NULL, '$2y$12$9HHCUvYvuf3FLBS.r1UlMuQ7GhUe6nnMLWlC1rVyNR/hBWACpPoBm', NULL, '2025-05-02 14:18:32', '2025-05-02 14:18:32'),
(19, 'Mustafa Lowe', 'eluettgen@example.org', NULL, NULL, NULL, '$2y$12$mkusis9CVLzSVDmFRxz9kuzrzK9TrwlH2N53VgpqL9ECSCv04T6ii', NULL, '2025-05-02 14:18:33', '2025-05-02 14:18:33'),
(21, 'Mr. Nickolas Lowe', 'flehner@example.net', NULL, NULL, NULL, '$2y$12$9lnXkclT5VW6NAdW2nyTu.tgD.qH9mJ1eiQNUlwav.o7rHcBg6o7m', NULL, '2025-05-02 14:18:34', '2025-05-02 14:18:34'),
(22, 'Shaina Dickinson', 'madaline25@example.net', NULL, NULL, NULL, '$2y$12$i9MqFBtpmmqKr1JOgOQWmOkVxclgAcYL5MNXZiJLXhwDQ4Xd2mu4C', NULL, '2025-05-02 14:18:34', '2025-05-02 14:18:34'),
(23, 'Ned Weber', 'jadyn15@example.org', NULL, NULL, NULL, '$2y$12$OFYMm7iulXieda0paapvB.ZeoIBGkRJoH2u3lAVUJIb/DPRJbWFRy', NULL, '2025-05-02 14:18:34', '2025-05-02 14:18:34'),
(24, 'Prof. Chelsey Kirlin', 'veda.kilback@example.net', NULL, NULL, NULL, '$2y$12$p6rOv9R3W2fj/aQHUuvO2OP6jo2F.IrIU07tUIyPeSINHXyAdqIHi', NULL, '2025-05-02 14:18:35', '2025-05-02 14:18:35'),
(25, 'Miss Mary Fahey III', 'salvatore.runte@example.net', NULL, NULL, NULL, '$2y$12$YsJoFMaIfBoPe7HAGTjYbex2.wjy7IEt.6mLqwwSDosUQZBzb/aW.', NULL, '2025-05-02 14:18:35', '2025-05-02 14:18:35'),
(26, 'Bo Parker Sr.', 'elna85@example.com', NULL, NULL, NULL, '$2y$12$sC8HHioDSmqDkiBdC3WHnu31RBw7b7qDF2kefbuEhwbB4bL5kvqFe', NULL, '2025-05-02 14:18:35', '2025-05-02 14:18:35'),
(27, 'Cooper Hamill', 'rau.hyman@example.org', NULL, NULL, NULL, '$2y$12$OzEtb5iI0G0ptLPLcSI7K.7bipS0AsyYHezOEPaW2VynaT4NDvDaO', NULL, '2025-05-02 14:18:35', '2025-05-02 14:18:35'),
(28, 'Stella Mitchell', 'maverick96@example.org', NULL, NULL, NULL, '$2y$12$RPcxs1OfGGXPoaiobLsMF.7.ho2VtyhuGwlfszRhod1E1CKbnesP2', NULL, '2025-05-02 14:18:36', '2025-05-02 14:18:36'),
(29, 'Dr. Dejon Rutherford DDS', 'iabshire@example.com', NULL, NULL, NULL, '$2y$12$MXbmVaNQw/cXVa1Kr//pLOctOe1.TV2QmoyNSgriFuoqPx4aKTvJ2', NULL, '2025-05-02 14:18:36', '2025-05-02 14:18:36'),
(30, 'Maynard Bartoletti', 'waters.wilmer@example.org', NULL, NULL, NULL, '$2y$12$W4qtaktTjmAzHQzBumBmM.pMg6K7WPv5loqdLSHPygfSCq09/dZxq', NULL, '2025-05-02 14:18:36', '2025-05-02 14:18:36'),
(31, 'Miss Jacynthe Yost V', 'kilback.steve@example.com', NULL, NULL, NULL, '$2y$12$VbeoEnA3ItJ5BVpIZv2NHO0s1LZlRPhbjV7ipgyykMbGBKHiQku4m', NULL, '2025-05-02 14:18:36', '2025-05-02 14:18:36'),
(32, 'Jalen Batz II', 'qondricka@example.com', NULL, NULL, NULL, '$2y$12$P225zot31E1YWvDqdoKj6.yhPmGZI1hlWUiXnNZ/.ZV0gRvgllxR2', NULL, '2025-05-02 14:18:37', '2025-05-02 14:18:37'),
(33, 'Dr. Fernando Bergnaum', 'johann.mills@example.net', NULL, NULL, NULL, '$2y$12$LIoCc8eQObmj/COdx76dieBzWGWxNavcRkAu9GvzfZY3iOcBxfige', NULL, '2025-05-02 14:18:37', '2025-05-02 14:18:37'),
(34, 'Olaf Schumm', 'nolan.lindsay@example.com', NULL, NULL, NULL, '$2y$12$RR/B/43PdAIaTbF1HHA3UebPEIS0rmkSGDNj99f8018sY0ICa7eYy', NULL, '2025-05-02 14:48:06', '2025-05-02 14:48:06'),
(35, 'Misael Bergnaum', 'dcummerata@example.net', NULL, NULL, NULL, '$2y$12$qYKuNeOT7zp6BPfa5FYVQuqWn3Lj7GrX1XlYstML.SwbJ5pQUK8IG', NULL, '2025-05-02 14:48:07', '2025-05-02 14:48:07'),
(36, 'Mr. Lorenza Rosenbaum', 'van06@example.org', NULL, NULL, NULL, '$2y$12$3.Gu8KJXIatGuSIXlINi2O8Hhp.HVh2zD0Fhs/LjKuqL21cx8YkHu', NULL, '2025-05-02 14:48:07', '2025-05-02 14:48:07'),
(37, 'Nash Rath DVM', 'schuppe.mariano@example.com', NULL, NULL, NULL, '$2y$12$nCirbmuw05xyz2JXypTqqOQnBHbY8HTLt.5xlWKD2vLcOGCpWzur2', NULL, '2025-05-02 14:48:07', '2025-05-02 14:48:07'),
(39, 'Finn Ortiz DVM', 'raheem43@example.org', NULL, NULL, NULL, '$2y$12$sIbobZNPLOs/zTan0oGGY.Vx1gN9mZOathG/stj5qrFAdmncPtray', NULL, '2025-05-02 14:48:08', '2025-05-02 14:48:08'),
(44, 'Cali Bogisich', 'mabernathy@example.net', NULL, NULL, NULL, '$2y$12$a/2g0oSMWXBFwb6.7q1KaORHmRaPWfNXs/Lb28jZTWP2oHe/R2kWC', NULL, '2025-05-02 14:48:09', '2025-05-02 14:48:09'),
(84, 'super2-PtrydWr', 'super2@super.com', NULL, 'users/img/super2-PtrydWr-zExlfk7.jpg', 'users/pdf/super2-PtrydWr-mXy1rcr.pdf', '$2y$12$TM7VBv3iztI67hJjghVtjuP49Xz.cSCs7OzLBkXQWaWKGQGvMTIdq', NULL, '2025-05-04 14:04:01', '2025-05-04 14:04:01'),
(85, 'super3', 'super3@super.com', NULL, 'users/img/super3-nqXiNnO-RMV3Z4F.jpg', 'users/pdf/super3-nqXiNnO-WsGhoNK.jpg', '$2y$12$KX.c9vowryN9v9W/mXxpQeaBGI3xk1vmyePuz/Z0XG47Iqvqws02O', NULL, '2025-05-04 14:26:29', '2025-05-04 14:26:29'),
(86, 'super3', 'super4@super.com', NULL, 'users/img/super3-VgXJPcX-kkgXE8B.jpg', 'users/pdf/super3-VgXJPcX-yQV4VRu.jpg', '$2y$12$PdMFGUArwkgSUCHfABJ/NeVvd2FwwVpqUkmEpfOH3Rim6l51J7AwS', NULL, '2025-05-04 14:27:33', '2025-05-04 14:27:33'),
(87, 'super5', 'super5@super.com', NULL, 'users/img/super5-z6ZGKpQ-PIIlbOk.jpg', 'users/pdf/super5-z6ZGKpQ-IjxwLFA.jpg', '$2y$12$59CXBc2DN0U.StbavDB1E.uhDF3NCx7E8XJZTRjY8HM0MH2T0CA56', NULL, '2025-05-04 14:28:07', '2025-05-04 14:28:07');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
