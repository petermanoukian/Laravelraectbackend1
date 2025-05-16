-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 16, 2025 at 01:10 PM
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
-- Table structure for table `cats`
--

DROP TABLE IF EXISTS `cats`;
CREATE TABLE IF NOT EXISTS `cats` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'category1', '2025-05-06 14:50:35', '2025-05-06 14:50:35'),
(2, 'category2', '2025-05-06 14:51:37', '2025-05-06 14:51:37'),
(6, 'cat6', '2025-05-07 02:54:27', '2025-05-07 02:54:27'),
(12, 'categor5', '2025-05-08 10:18:03', '2025-05-08 10:18:03'),
(13, 'cat55', '2025-05-08 13:16:09', '2025-05-08 13:16:09'),
(14, 'cat67', '2025-05-08 13:16:15', '2025-05-08 13:16:15'),
(15, 'cat8', '2025-05-08 13:16:21', '2025-05-08 13:16:21'),
(16, 'cat9', '2025-05-08 13:16:28', '2025-05-08 13:16:28'),
(17, 'cat10', '2025-05-08 13:16:35', '2025-05-08 13:16:35'),
(18, 'cat11', '2025-05-08 13:16:43', '2025-05-08 13:16:43'),
(19, 'cat12', '2025-05-08 13:17:38', '2025-05-08 13:17:38'),
(20, 'cat13', '2025-05-08 13:17:48', '2025-05-08 13:17:48'),
(21, 'cat 14', '2025-05-08 13:17:55', '2025-05-11 09:10:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_29_085830_create_permission_tables', 1),
(5, '2025_04_29_103556_create_personal_access_tokens_table', 1),
(6, '2025_05_05_183148_create_cats_table', 2),
(7, '2025_05_07_125842_create_subcats_table', 3),
(8, '2025_05_09_111318_create_prods_table', 4),
(9, '2025_05_13_071602_create_taggs_table', 5),
(11, '2025_05_13_130634_create_prodtaggs_table', 6);

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
(1, 'App\\Models\\User', 87),
(3, 'App\\Models\\User', 88),
(2, 'App\\Models\\User', 89),
(1, 'App\\Models\\User', 90),
(1, 'App\\Models\\User', 91),
(1, 'App\\Models\\User', 92),
(1, 'App\\Models\\User', 93),
(1, 'App\\Models\\User', 95),
(1, 'App\\Models\\User', 98),
(1, 'App\\Models\\User', 99);

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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(74, 'App\\Models\\User', 1, 'login_token', 'a3290264b0d9528423c73a11898bf38aa7476943f6d81996eac25a61d09a9aa8', '[\"*\"]', '2025-05-16 06:38:57', NULL, '2025-05-15 12:21:09', '2025-05-16 06:38:57'),
(75, 'App\\Models\\User', 1, 'login_token', '39c6c27a1112e454c3e3ae674f4165ff493448a29ab55ad17beff54614ba3854', '[\"*\"]', '2025-05-16 08:26:11', NULL, '2025-05-16 07:01:58', '2025-05-16 08:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `prods`
--

DROP TABLE IF EXISTS `prods`;
CREATE TABLE IF NOT EXISTS `prods` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` bigint(20) UNSIGNED NOT NULL,
  `subid` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `des` text COLLATE utf8mb4_unicode_ci,
  `dess` text COLLATE utf8mb4_unicode_ci,
  `prix` double DEFAULT NULL,
  `quan` int(11) DEFAULT '1',
  `img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vis` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ordd` int(11) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prods_name_subid_catid_unique` (`name`,`subid`,`catid`),
  KEY `prods_name_index` (`name`),
  KEY `prods_name_catid_subid_index` (`name`,`catid`,`subid`),
  KEY `prods_catid_foreign` (`catid`),
  KEY `prods_subid_foreign` (`subid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prods`
--

INSERT INTO `prods` (`id`, `catid`, `subid`, `name`, `des`, `dess`, `prix`, `quan`, `img`, `pdf`, `vis`, `ordd`, `created_at`, `updated_at`) VALUES
(1, 21, 31, 'prod111', 'shprt', '<p>tytyt</p>\r\n<p>yty</p>\r\n<p><img src=\"https://platform.cstatic-images.com/medium/in/v2/stock_photos/0b86a23a-a3e2-476d-b459-4fa8ac478fa1/72670da9-7623-457c-8be7-e7c0254487d9.png\" alt=\"\" width=\"375\" height=\"248\" /></p>\r\n<p>ytyyr</p>\r\n<p>yttyt</p>\r\n<p>yttyyt</p>', 4, 18, 'prod/img/prod111-cat-14-sub-cat-56-Mkd-DTs.jpg', 'prod/pdf/prod111-cat-14-sub-cat-56-Mkd-BXX.docx', '1', 15, '2025-05-12 03:05:22', '2025-05-12 03:05:22'),
(2, 21, 20, 'ttryt', 'ytyty', '<p>ytytyt</p>\r\n<p><a href=\"https://www.socialist-armenia.org/\">https://www.socialist-armenia.org/</a></p>\r\n<p><img src=\"https://platform.cstatic-images.com/medium/in/v2/stock_photos/bc5d4734-5bf0-4fda-acf3-265023f70310/a417d9ea-b2bf-40b1-80cc-24c0e84ea083.png\" alt=\"\" width=\"375\" height=\"248\" /></p>', 2, 12, 'prod/img/ttryt-cat-14-sub-1-JXs-RE9.jpg', 'prod/pdf/ttryt-cat-14-sub-1-JXs-n3V.docx', '1', 14, '2025-05-12 03:12:31', '2025-05-12 03:12:31'),
(3, 19, 42, 'retr', 'ttr', '<p>rtr</p>', 3, 6, 'prod/img/retr-cat12-Anothger_subv-cat-Aag-sYP.jpg', 'prod/pdf/retr-cat12-Anothger_subv-cat-Aag-1rs.jpg', '1', 9, '2025-05-12 03:16:37', '2025-05-12 03:16:37'),
(4, 17, 41, '435456', '65654', '<p>6565</p>', 4, 6, 'prod/img/435456-cat10-Another-subcatgeort-9s3-WMX.jpg', 'prod/pdf/435456-cat10-Another-subcatgeort-9s3-7OS.jpg', '1', 9, '2025-05-12 03:18:16', '2025-05-12 03:18:16'),
(5, 19, 42, 'trtr', 'rtrtr', '<p>ttrt</p>', 1, 3, NULL, 'prod/pdf/trtr-cat12-Anothger_subv-cat-Hyy-4L1.txt', '1', 5, '2025-05-12 04:36:57', '2025-05-12 04:36:57'),
(6, 17, 26, 'rrtre', 'frtrtt', '<p>trtt</p>', 2, 5, NULL, 'prod/pdf/rrtre-cat10-sub5-ko6-msm.pdf', '1', 7, '2025-05-12 04:37:37', '2025-05-12 04:37:37'),
(7, 20, 33, 'anptehrrrr', 'ffgfgffg', '<p>ggfggfg</p>', 12, 21, 'prod/img/anptehrrrr-cat13-upatinggg-0r4-3FS.jpg', NULL, '1', 36, '2025-05-12 04:53:07', '2025-05-12 04:53:07'),
(8, 21, 31, 'largge JPEG', 'ffdf', '<p>fdffds</p>', 10, 12, 'prod/img/largge-JPEG-cat-14-sub-cat-56-HuU-C3l.jpg', 'prod/pdf/largge-JPEG-cat-14-sub-cat-56-HuU-pUr.jpg', '1', 12, '2025-05-12 04:57:22', '2025-05-12 04:57:22'),
(9, 21, 31, 'prod-1', 'ghgh', '<p>hhgh</p>', 1, 1, 'prod/img/prod-1-cat-14-sub-cat-56-GQA-eD0.jpg', 'prod/pdf/prod-1-cat-14-sub-cat-56-GQA-dyx.jpg', '1', 1, '2025-05-12 05:00:36', '2025-05-12 05:00:36'),
(10, 21, 21, 'prod-1', 'ghthyu', '<p>uyuyuy</p>', 1, 1, 'prod/img/prod-1-cat-14-sub11-yKK-22W.jpg', 'prod/pdf/prod-1-cat-14-sub11-yKK-LAL.docx', '1', 1, '2025-05-12 05:01:58', '2025-05-12 05:01:58'),
(11, 18, 30, 'prod-1', 'bvbvb', '<p>bbbcv</p>', 1, 1, 'prod/img/prod-1-cat11-sub-caddff-FOl-fHS.jpg', 'prod/pdf/prod-1-cat11-sub-caddff-FOl-Xh4.pdf', '1', 1, '2025-05-12 05:02:54', '2025-05-12 05:02:54'),
(12, 17, 32, 'prddd', 'fdff', '<p>fddfd</p>', 1, 1, 'prod/img/prddd-cat10-ggfgfd-I4n-NbY.jpg', NULL, '1', 1, '2025-05-12 05:30:09', '2025-05-12 05:30:09'),
(13, 20, 33, 'ttrrt', 'trtt', '<p>ttrtr</p>', 1, 1, 'prod/img/ttrrt-cat13-upatinggg-ZX6-UOe.jpg', 'prod/pdf/ttrrt-cat13-upatinggg-ZX6-1RF.pdf', '1', 1, '2025-05-12 06:04:50', '2025-05-12 06:04:50'),
(14, 21, 31, 'rwetrt', 'trtr', '<p>ttrt</p>', 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:05:15', '2025-05-12 06:05:15'),
(15, 21, 31, 'trtrtr', 'ttrtr', NULL, 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:05:27', '2025-05-12 06:05:27'),
(16, 21, 31, '5trtre', 'trtrt', '<p>ttrert</p>', 11, 12, 'prod/img/5trtre-cat-14-sub-cat-56-nDh-Hwh.jpg', 'prod/pdf/5trtre-cat-14-sub-cat-56-nDh-gRo.pdf', '1', 13, '2025-05-12 06:06:35', '2025-05-12 06:06:35'),
(17, 19, 42, 'rerewr', 'rrere', '<p>rrewre</p>', 1, 1, 'prod/img/rerewr-cat12-Anothger_subv-cat-F4Y-hVG.jpg', NULL, '1', 1, '2025-05-12 06:07:08', '2025-05-12 06:07:08'),
(18, 19, 42, 'retrt', 'ttr', '<p>rttr</p>', 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:07:27', '2025-05-12 06:07:27'),
(19, 19, 42, 'rtrtrt', 'rtrt', 'null', 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:07:41', '2025-05-16 07:50:12'),
(20, 19, 42, 'trtrtr', 'trtr', '<p>ttrrtr</p>', 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:07:52', '2025-05-12 06:07:52'),
(21, 21, 29, 'gfgfgfd', NULL, NULL, 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:08:41', '2025-05-12 06:08:41'),
(22, 21, 31, 'hgfhghg', NULL, NULL, 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:08:51', '2025-05-12 06:08:51'),
(23, 21, 31, 'ghyttrrt', 'null', 'null', 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:09:01', '2025-05-16 07:46:30'),
(24, 21, 20, 'rtrtrtr', NULL, NULL, 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:09:19', '2025-05-12 06:09:19'),
(25, 18, 30, 'trtret', NULL, NULL, 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:09:29', '2025-05-12 06:09:29'),
(26, 21, 20, 'yytryt', NULL, NULL, 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:09:39', '2025-05-12 06:09:39'),
(27, 21, 20, 'hrtuyttyu', NULL, NULL, 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:09:51', '2025-05-12 06:09:51'),
(28, 21, 21, 'Fly3', 'null', 'null', 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:10:01', '2025-05-15 06:29:20'),
(29, 17, 32, 'Fly2', 'null', 'null', 1, 1, NULL, NULL, '1', 1, '2025-05-12 06:10:26', '2025-05-15 06:29:08'),
(32, 21, 31, 'Fly1', 'gfgfgf', '<p>gfgfgf</p>', 1, 1, 'prod/img/prod-cat14-sub1-56-cat-14-sub-cat-56-Tzr-xSH.jpg', NULL, '1', 1, '2025-05-12 07:31:22', '2025-05-15 06:28:58'),
(35, 17, 22, 'UPDATEDDD', 'gffgff shortd escxription', '<p><strong>gfggf</strong></p>\r\n<p><strong>gfdfg</strong></p>\r\n<p><strong><img src=\"https://i5.walmartimages.com/seo/Fresh-Navel-Orange-Each_a134f2a1-2bb0-4e5c-a594-f84b63ab5928.22241f295458186b2ba0e4ed7d460d52.jpeg\" alt=\"\" width=\"300\" height=\"300\" /></strong></p>\r\n<p><strong>gffdfg</strong></p>\r\n<p><strong>gffgfg</strong></p>\r\n<p> </p>', 11, 12, 'prod/img/UPDATEDDD-IY-SQp61.jpg', 'prod/pdf/UPDATEDDD-IY-WINeL.pdf', '0', 13, '2025-05-12 13:55:08', '2025-05-12 15:02:03'),
(36, 19, 42, 'new wit tagsss', 'aiurplane1,casr,german cars', '<p>hghgh</p>', 1, 1, 'prod/img/new-wit-tagsss-cat12-Anothger_subv-cat-bSo-pOn.jpg', 'prod/pdf/new-wit-tagsss-cat12-Anothger_subv-cat-bSo-UC3.pdf', '1', 1, '2025-05-15 13:55:21', '2025-05-15 13:55:21'),
(37, 17, 41, 'many many tagsss', 'trtrt', '<p>rtrt</p>', 1, 1, 'prod/img/many-many-tagsss-cat10-Another-subcatgeort-j2G-g6f.jpg', 'prod/pdf/many-many-tagsss-cat10-Another-subcatgeort-j2G-Xm5.pdf', '1', 1, '2025-05-15 15:39:34', '2025-05-15 15:39:34'),
(38, 21, 20, 'kkooi', 'ioioi', '<p>ooi</p>', 1, 1, 'prod/img/kkooi-cat-14-sub-1-Ti7-6v7.jpg', 'prod/pdf/kkooi-cat-14-sub-1-Ti7-eab.pdf', '1', 1, '2025-05-16 03:02:24', '2025-05-16 03:02:24'),
(39, 17, 32, 'charbel555', 'uiuiu', '<p>iiu</p>', 1, 1, 'prod/img/charbel555-cat10-ggfgfd-uka-ucE.jpg', 'prod/pdf/charbel555-cat10-ggfgfd-uka-bHF.pdf', '1', 1, '2025-05-16 03:03:24', '2025-05-16 03:03:24'),
(40, 21, 31, 'prodfggh', 'ytyytr', '<p>ytyyt</p>', 1, 12, 'prod/img/prodfggh-cat-14-sub-cat-56-eWs-ZaF.jpg', 'prod/pdf/prodfggh-cat-14-sub-cat-56-eWs-8C0.pdf', '1', 12, '2025-05-16 03:45:51', '2025-05-16 03:45:51'),
(41, 21, 31, 'taagovslyu', 'hghghg', '<p>hhggh</p>', 1, 1, 'prod/img/taagovslyu-cat-14-sub-cat-56-bwy-B68.jpg', NULL, '1', 1, '2025-05-16 07:41:28', '2025-05-16 07:41:28');

-- --------------------------------------------------------

--
-- Table structure for table `prodtaggs`
--

DROP TABLE IF EXISTS `prodtaggs`;
CREATE TABLE IF NOT EXISTS `prodtaggs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prodid` bigint(20) UNSIGNED NOT NULL,
  `taggid` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prodid` (`prodid`,`taggid`),
  KEY `prodtaggs_taggid_foreign` (`taggid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodtaggs`
--

INSERT INTO `prodtaggs` (`id`, `prodid`, `taggid`, `created_at`, `updated_at`) VALUES
(1, 40, 15, '2025-05-16 07:40:33', '2025-05-16 07:40:33'),
(2, 40, 7, '2025-05-16 07:40:33', '2025-05-16 07:40:33'),
(3, 40, 9, '2025-05-16 07:40:33', '2025-05-16 07:40:33'),
(4, 39, 15, '2025-05-16 07:40:45', '2025-05-16 07:40:45'),
(5, 39, 17, '2025-05-16 07:40:45', '2025-05-16 07:40:45'),
(6, 39, 11, '2025-05-16 07:40:45', '2025-05-16 07:40:45'),
(7, 41, 15, '2025-05-16 07:41:28', '2025-05-16 07:41:28'),
(8, 41, 17, '2025-05-16 07:41:28', '2025-05-16 07:41:28'),
(9, 41, 6, '2025-05-16 07:41:28', '2025-05-16 07:41:28'),
(10, 41, 7, '2025-05-16 07:41:28', '2025-05-16 07:41:28'),
(11, 41, 12, '2025-05-16 07:41:28', '2025-05-16 07:41:28'),
(12, 41, 13, '2025-05-16 07:41:28', '2025-05-16 07:41:28'),
(13, 41, 14, '2025-05-16 07:41:28', '2025-05-16 07:41:28'),
(14, 38, 16, '2025-05-16 07:41:44', '2025-05-16 07:41:44'),
(15, 38, 6, '2025-05-16 07:41:44', '2025-05-16 07:41:44'),
(16, 38, 9, '2025-05-16 07:41:44', '2025-05-16 07:41:44'),
(17, 38, 14, '2025-05-16 07:41:44', '2025-05-16 07:41:44'),
(18, 38, 13, '2025-05-16 07:41:44', '2025-05-16 07:41:44'),
(19, 36, 16, '2025-05-16 07:45:13', '2025-05-16 07:45:13'),
(20, 36, 7, '2025-05-16 07:45:13', '2025-05-16 07:45:13'),
(21, 36, 11, '2025-05-16 07:45:13', '2025-05-16 07:45:13'),
(22, 36, 12, '2025-05-16 07:45:13', '2025-05-16 07:45:13'),
(23, 36, 14, '2025-05-16 07:45:13', '2025-05-16 07:45:13'),
(24, 36, 8, '2025-05-16 07:45:13', '2025-05-16 07:45:13'),
(25, 35, 16, '2025-05-16 07:45:38', '2025-05-16 07:45:38'),
(26, 35, 17, '2025-05-16 07:45:38', '2025-05-16 07:45:38'),
(27, 35, 11, '2025-05-16 07:45:38', '2025-05-16 07:45:38'),
(28, 35, 12, '2025-05-16 07:45:38', '2025-05-16 07:45:38'),
(29, 35, 8, '2025-05-16 07:45:38', '2025-05-16 07:45:38'),
(30, 35, 10, '2025-05-16 07:45:38', '2025-05-16 07:45:38'),
(31, 35, 1, '2025-05-16 07:45:38', '2025-05-16 07:45:38'),
(32, 32, 15, '2025-05-16 07:46:00', '2025-05-16 07:46:00'),
(33, 32, 7, '2025-05-16 07:46:00', '2025-05-16 07:46:00'),
(34, 32, 11, '2025-05-16 07:46:00', '2025-05-16 07:46:00'),
(35, 32, 12, '2025-05-16 07:46:00', '2025-05-16 07:46:00'),
(36, 32, 14, '2025-05-16 07:46:00', '2025-05-16 07:46:00'),
(37, 32, 8, '2025-05-16 07:46:00', '2025-05-16 07:46:00'),
(38, 23, 15, '2025-05-16 07:46:30', '2025-05-16 07:46:30'),
(39, 23, 6, '2025-05-16 07:46:30', '2025-05-16 07:46:30'),
(40, 23, 9, '2025-05-16 07:46:30', '2025-05-16 07:46:30'),
(41, 23, 14, '2025-05-16 07:46:30', '2025-05-16 07:46:30'),
(42, 23, 8, '2025-05-16 07:46:30', '2025-05-16 07:46:30'),
(43, 23, 1, '2025-05-16 07:46:30', '2025-05-16 07:46:30'),
(44, 23, 4, '2025-05-16 07:46:30', '2025-05-16 07:46:30'),
(45, 23, 5, '2025-05-16 07:46:30', '2025-05-16 07:46:30'),
(46, 17, 15, '2025-05-16 07:47:02', '2025-05-16 07:47:02'),
(47, 17, 16, '2025-05-16 07:47:02', '2025-05-16 07:47:02'),
(48, 17, 6, '2025-05-16 07:47:02', '2025-05-16 07:47:02'),
(49, 17, 9, '2025-05-16 07:47:02', '2025-05-16 07:47:02'),
(50, 17, 13, '2025-05-16 07:47:02', '2025-05-16 07:47:02'),
(51, 17, 8, '2025-05-16 07:47:02', '2025-05-16 07:47:02'),
(52, 17, 10, '2025-05-16 07:47:02', '2025-05-16 07:47:02'),
(53, 17, 1, '2025-05-16 07:47:02', '2025-05-16 07:47:02'),
(54, 17, 11, '2025-05-16 07:47:02', '2025-05-16 07:47:02'),
(55, 13, 15, '2025-05-16 07:48:23', '2025-05-16 07:48:23'),
(56, 8, 5, '2025-05-16 07:48:37', '2025-05-16 07:48:37'),
(57, 8, 17, '2025-05-16 07:48:47', '2025-05-16 07:48:47'),
(58, 9, 18, '2025-05-16 07:49:40', '2025-05-16 07:49:40'),
(59, 13, 19, '2025-05-16 07:49:55', '2025-05-16 07:49:55'),
(60, 19, 19, '2025-05-16 07:50:12', '2025-05-16 07:50:12');

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
('4jtTCZ9mesE61zMmpuErgzivdvctfvUhzwzE8Lwb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYnJYUEdlcXhJTlZENnNFSTIzUTlVRDZndk1WdVEwb3lacXFMUERwTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747032982),
('ATdDzRdYt7ZSneIQQXLchp6GZt8SxG4vp3gzG8Lx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHVuZGxqRFpCMXE5Tjk3TmZrdWVuVFhXb2lDdmZNZTE1ODJRcVhTeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747144052),
('AZDjZvYEw6tBFgYD7ARTGi1M49mQc7d5sF8JRcLK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibmJlZEQ3bm9NVlRXaW96dVJwcWhrcXRQVE94eFg1aTI2VUtLajJuVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746269582),
('Cni8blBOxnwZX6BxAKgnjxUpERUuquAvc2uBR6V0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWlvTWl3bEhGNG81dW1vNldsbW82b3pGQjNacE44MjVxU2k2aVI5NSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1747326097),
('dYLgv8mFe5ZlWci41s0vB8i0wqjFbdkE9KZoaTlT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUFllY2R2clF0cllvaHhPZlltNnJDc3dlaW9jZE9neGxONkhNb3NMcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746338026),
('Gh1LsLRYPGhra7j9s9VyuBeYEgNse0DYk5ea7mJx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieWF0R0RiNDd3VEVFU3hJclpMTXR4WG5xVGJoc3k4ZTFnNzlOT3dqNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747205335),
('HbZKG8RKFFBvHA3MDaVzSsAvqsHbHWMzA5z9vktC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNmRzd0U1NnBObGdQVW5TQTdiM2Q1aWJhd1VmM2VlU1I1SDVDQk8xSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746257461),
('inNnQqlNPs8qnSk3li5b1hb6RAaMKoefDj6spk5L', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTlsZFN0RFE4UTJNWEswd1ZDbjFZZGtqZG1vY0RVQmpVdXRTTHFWaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1746288350),
('KNGaA5IWYMrkx67JCzztXOVI7nhDfSoRJ6tXCam5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1Z1cGJWMEdDemp5UUt4VHFybnVOako0VjZka3c5RWlLYlFrS1JqViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747337876),
('O8czRJjDrIBnm4YLxF17adFVygVpEkZKul5MfDek', NULL, '127.0.0.1', 'PostmanRuntime/7.43.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTRxYmlNYXRuTTRTcGRZU1pMUEEzejRFTFNUQWZTbWpMT1pKdUNubCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1745935156),
('OWMYYaGxr8MGXj79VNeqj6AcukcrMORq1fbsFmL7', 1, '127.0.0.1', 'PostmanRuntime/7.43.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG9VR2M4RXVxdjNzQ2xtVEdsalBPOXYxV2RNSmhXdDQ1TG05YkFNZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1745948470),
('ozIQahOEoDfltz78FinE4IfAEjQ7VdxEvzGbiBA1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0duQWQxWk95d0IxWG5JNTF6UDRjUUJudFZhUTRwSnFSWXlIbU85diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747084616),
('pMwAFIt1z64ZAtEjT5osczCYWC7eLHgC3HOQmO1X', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWHZMcWZYTTR5MjZHR1dCTmlEd2FCWTZRbTNJTTRkRFh0TjlBRTJUUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747110254),
('prGYvu5jW9jdbzIdoj0OTd7HcrOfxERMQBYEnMxO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTl0dWVPUjVXTjR0bkRkSmlFNTZzSGRid21JMERaSHVTZzRwaHBWZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1746973220),
('qcfcUvAIZC1eUSb37l1eQMSTVKSYDGTeLcfMZ52W', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnN4eGVIZ3VOQ1NrUk5kQmdxYnlIWU5BZVBtZDhadGJ4WUJDeDNkQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1745937436),
('QrUzFCGJHQfjdT0P54vKHLFgpFl631sVZu47L3ji', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjh5U2thczJoWlBVZ2w5YkJjb01NbDFMYVlpbEVGb21JSFJwdkhIUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747393309),
('qsgusMlp69LFsFbcMCOrWqDA95ThaYRW5AOsiAGl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTnlXRnJOUVhiQnNabE9VWUplTmhyN2VTU0lSMFpwR0pRNWxVaXloayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746017823),
('rbbdiSGZ80TYOO5gYVu4Vx43ZlTSdJ2HxAr7b2Ou', NULL, '127.0.0.1', 'PostmanRuntime/7.43.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMm1OWDdKVnV6ZFc1VmFYMXRmbTZlbjhyd2Z2RjFMVkNKY1lSZUhVUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9fQ==', 1745941075),
('Rw7CcF5PGJFeKNMwhBoSzkAxFAam45Dc3OB7A3Cn', NULL, '127.0.0.1', 'PostmanRuntime/7.43.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakdMM3VxbElMRjFaMDNESkdmd0dmaWZqbk9ubER1a0hvUThDa2ljUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1745937299),
('vmpTCuq4t3mPfd5cymF6Fsswl9JjXbb4PWdBQp0Y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidFl6V3VEUUp6U2FCblpSRXZpb2ZGR3ExVldCV0N6WFBZOTFkMjVTNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1746209125),
('wxHKZKCRieiAzaeKohuEcgG7aA0wjd3klBhNDmBB', NULL, '127.0.0.1', 'PostmanRuntime/7.43.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3VsUms3WUhQQ2xRNm54dFZnU2VMOFlhSHRkcFlWY3cxQVhJR1ltYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1745935994),
('YSc7ZhyGl4dsvJ3SG03jmyZrr6KGV0F92Nc7Oa6D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjllUmNzdENUMFFtRmdmd1JBdTNRb2tKUktGSEM4d0wyS3RnMENXUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747218494),
('zgN5SPFMTRefSN44Jc0honsSXY12snffs9nTknqn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXJiZ0hZd2c5R1BKMGNMbXZXUTREODFYcmxObDJvU0hucnJtUm5SZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1746903042);

-- --------------------------------------------------------

--
-- Table structure for table `subcats`
--

DROP TABLE IF EXISTS `subcats`;
CREATE TABLE IF NOT EXISTS `subcats` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcats_name_catid_unique` (`name`,`catid`),
  KEY `subcats_catid_foreign` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcats`
--

INSERT INTO `subcats` (`id`, `catid`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'subcat1', '2025-05-08 10:09:30', '2025-05-08 10:09:30'),
(2, 12, 'subcategory5', '2025-05-08 10:18:22', '2025-05-08 10:18:22'),
(3, 12, 'subcategory51', '2025-05-08 10:19:47', '2025-05-08 10:19:47'),
(4, 6, 'subcat6-1', '2025-05-08 11:56:01', '2025-05-08 11:56:01'),
(5, 6, 'category5-6-5', '2025-05-08 12:09:57', '2025-05-08 12:09:57'),
(6, 12, 'category5-6-5', '2025-05-08 12:10:06', '2025-05-08 12:10:06'),
(7, 1, 'ssub-cat1-2', '2025-05-08 13:07:01', '2025-05-08 13:07:01'),
(8, 2, 'sub-fffghhjj', '2025-05-08 13:07:12', '2025-05-08 13:07:12'),
(9, 6, 'submotherfckergotveren', '2025-05-08 13:07:47', '2025-05-12 13:42:26'),
(10, 12, 'cat51-sssuybcat', '2025-05-08 13:07:55', '2025-05-08 13:07:55'),
(11, 12, 'cat5-2-subcategporyA-', '2025-05-08 13:08:09', '2025-05-08 13:08:09'),
(12, 6, 'subcategporyA-cat6-3', '2025-05-08 13:13:52', '2025-05-08 13:13:52'),
(13, 2, 'subcategporyA-cat2-1', '2025-05-08 13:14:02', '2025-05-08 13:14:02'),
(14, 6, 'SUB---cat6-1', '2025-05-08 13:14:17', '2025-05-10 09:31:30'),
(15, 6, 'subcat-cat6-2', '2025-05-08 13:14:31', '2025-05-10 09:31:08'),
(16, 6, 'SUBcat-6-1', '2025-05-08 13:14:44', '2025-05-10 09:30:51'),
(17, 12, 'SUBcat-5', '2025-05-08 13:14:56', '2025-05-10 09:30:38'),
(18, 12, 'SUBcat5-1', '2025-05-08 13:15:10', '2025-05-10 09:30:25'),
(19, 12, 'SUBcat5-3', '2025-05-08 13:15:31', '2025-05-10 09:29:21'),
(20, 21, 'sub-1', '2025-05-08 13:43:18', '2025-05-08 13:43:18'),
(21, 21, 'sub11', '2025-05-08 13:43:34', '2025-05-08 13:43:34'),
(22, 17, 'subcat1', '2025-05-08 13:43:47', '2025-05-08 13:43:47'),
(23, 17, 'subcat2', '2025-05-08 13:43:57', '2025-05-08 13:43:57'),
(24, 17, 'subcat3', '2025-05-08 13:44:06', '2025-05-08 13:44:06'),
(25, 17, 'subcat4', '2025-05-08 13:44:19', '2025-05-08 13:44:19'),
(26, 17, 'sub5', '2025-05-08 13:44:52', '2025-05-08 13:44:52'),
(27, 18, 'sub1', '2025-05-08 13:45:04', '2025-05-08 13:45:04'),
(28, 21, 'subbbggg', '2025-05-08 13:45:17', '2025-05-08 13:45:17'),
(29, 21, 'SUBddfdfds', '2025-05-08 13:45:25', '2025-05-10 09:28:59'),
(30, 18, 'sub-caddff', '2025-05-08 13:45:35', '2025-05-10 09:28:43'),
(31, 21, 'sub cat 56', '2025-05-08 13:46:07', '2025-05-11 09:11:12'),
(32, 17, 'ggfgfd', '2025-05-08 13:46:14', '2025-05-08 13:46:14'),
(33, 20, 'upatinggg', '2025-05-08 13:46:25', '2025-05-10 09:24:51'),
(35, 13, 'Take to 55', '2025-05-09 04:37:30', '2025-05-12 08:18:12'),
(41, 17, 'Another-subcatgeort', '2025-05-10 09:34:17', '2025-05-10 09:34:17'),
(42, 19, 'Anothger_subv-cat', '2025-05-10 09:34:29', '2025-05-10 09:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `taggs`
--

DROP TABLE IF EXISTS `taggs`;
CREATE TABLE IF NOT EXISTS `taggs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggs_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taggs`
--

INSERT INTO `taggs` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tag1', '2025-05-13 07:46:13', '2025-05-13 07:46:13'),
(2, 'Tag2', '2025-05-13 07:47:01', '2025-05-13 07:47:01'),
(3, 'Tag3', '2025-05-13 07:48:40', '2025-05-13 07:48:40'),
(4, 'Tag4', '2025-05-13 07:48:52', '2025-05-13 07:48:52'),
(5, 'Tag55', '2025-05-13 08:33:51', '2025-05-13 08:33:51'),
(6, 'Cars', '2025-05-13 08:34:09', '2025-05-13 08:34:09'),
(7, 'Car', '2025-05-13 08:34:16', '2025-05-13 08:34:16'),
(8, 'Sport upd', '2025-05-13 08:34:27', '2025-05-13 08:50:42'),
(9, 'MotorCycles', '2025-05-13 08:34:37', '2025-05-13 08:51:15'),
(10, 'Sports', '2025-05-13 08:51:24', '2025-05-13 08:51:24'),
(11, 'German Cars', '2025-05-13 08:51:48', '2025-05-13 08:51:48'),
(12, 'Plane1', '2025-05-15 06:27:56', '2025-05-15 06:27:56'),
(13, 'Plane2', '2025-05-15 06:28:02', '2025-05-15 06:28:02'),
(14, 'Plane3', '2025-05-15 06:28:09', '2025-05-15 06:28:09'),
(15, 'Airplane1', '2025-05-15 06:28:20', '2025-05-15 06:28:20'),
(16, 'Airplane2', '2025-05-15 06:28:28', '2025-05-15 06:28:28'),
(17, 'Airplane3', '2025-05-15 06:28:35', '2025-05-15 06:28:35'),
(18, 'Newtag11', '2025-05-16 07:49:08', '2025-05-16 07:49:08'),
(19, 'newtag222', '2025-05-16 07:49:17', '2025-05-16 07:49:17'),
(20, 'newtag3333', '2025-05-16 07:49:24', '2025-05-16 07:49:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `img`, `pdf`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super@super.com', NULL, 'users/img/Super Admin-87bZVGE-qKflzNc.jpg', 'users/pdf/Super Admin-87bZVGE-hA8IZf6.jpg', '$2y$12$.KFlRaRO8oYlxSOR1Pf5oO.ARegVTaiMopXk6x5iCXNpqfXFH1yxG', NULL, '2025-04-29 06:46:39', '2025-05-05 12:57:56'),
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
(85, 'super3', 'super3@super.com', NULL, 'users/img/super3-nqXiNnO-RMV3Z4F.jpg', 'users/pdf/super3-nqXiNnO-WsGhoNK.jpg', '$2y$12$KX.c9vowryN9v9W/mXxpQeaBGI3xk1vmyePuz/Z0XG47Iqvqws02O', NULL, '2025-05-04 14:26:29', '2025-05-04 14:26:29'),
(87, 'super5', 'super5@super.com', NULL, 'users/img/super5-z6ZGKpQ-PIIlbOk.jpg', 'users/pdf/super5-z6ZGKpQ-IjxwLFA.jpg', '$2y$12$59CXBc2DN0U.StbavDB1E.uhDF3NCx7E8XJZTRjY8HM0MH2T0CA56', NULL, '2025-05-04 14:28:07', '2025-05-04 14:28:07'),
(88, 'user3', 'user3@user.com', NULL, 'users/img/user3-H63cWJb-b0P0nWQ.jpg', 'users/pdf/user3-H63cWJb-TCARiTA.docx', '$2y$12$TKa/qt7U7u1Ns/t6HTKiI.k95RUzxsjwX10D/KQSaft8ZBplFDpL.', NULL, '2025-05-05 03:44:52', '2025-05-05 03:44:52'),
(89, 'hghg', 'hghg@wer.ll', NULL, NULL, NULL, '$2y$12$EWx57x84LogkZfhhlEQaPOcw.CFoQAWFQ9CnSlsc0RZA00c7/fwNe', NULL, '2025-05-05 03:46:10', '2025-05-05 03:46:10'),
(90, 'super6', 'super6@super.com', NULL, 'users/img/super6-o5r490x-wrwIR11.jpg', 'users/pdf/super6-o5r490x-HEud84V.docx', '$2y$12$c3EKTc5J4/1meCSmFwM.V.jrkWwGSpFtzHQLUM/Fs6ZCw4r3FdJpG', NULL, '2025-05-05 04:11:58', '2025-05-05 04:11:58'),
(92, 'full', 'fulladmin@admin.com', NULL, 'users/img/full-lNlu2h4-2tc8Tow.jpg', 'users/pdf/full-lNlu2h4-23fAGHV.pdf', '$2y$12$3/rZk4dxl/Naa4vzXtkHTed0A1ajDfVR5kDCkaCQpow65SVY91D2W', NULL, '2025-05-05 08:58:05', '2025-05-05 08:58:05'),
(98, '7676', '767756@wer.ll', NULL, 'users/img/7676-z7B1YYF-Ix6Ziy2.jpg', NULL, '$2y$12$JOkczEJePbT9GV1/eYIQH.voOGrWtr2ch8gQC.F4fNC2q6jAJB29.', NULL, '2025-05-06 06:24:52', '2025-05-06 06:24:52'),
(99, 'newsuperup', 'supe4@super.com', NULL, 'users/img/newsuper-4eOmtps-BIMb2ib.jpg', 'users/pdf/newsuper-4eOmtps-XbXMCSr.pdf', '$2y$12$RPEA2QhEyCNXuSkIz2HbyeR3Li7MYBm.HeXmKkb.ZWAIcmv0YE7wS', NULL, '2025-05-06 14:44:22', '2025-05-06 14:44:34');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
