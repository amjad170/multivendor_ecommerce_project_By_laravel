-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2023 at 06:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multiv_ecom14`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_slug` varchar(255) NOT NULL,
  `brand_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_slug`, `brand_image`, `created_at`, `updated_at`) VALUES
(1, 'Lenovo', 'lenovo', '651c70240523b.jpg', '2023-10-03 13:48:52', '2023-10-03 13:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_image`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'electronics', '651c70463457e.jpg', NULL, NULL),
(2, 'Car', 'car', '651c7063b3a8f.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2014_10_12_000000_create_users_table', 1),
(17, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(18, '2019_08_19_000000_create_failed_jobs_table', 1),
(19, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(20, '2023_07_21_083751_create_brands_table', 1),
(21, '2023_10_02_215047_create_categories_table', 1),
(22, '2023_10_03_141131_create_sub_categories_table', 1),
(23, '2023_10_06_152413_create_products_table', 2),
(25, '2023_10_06_154725_create_multi__imgs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `multi__imgs`
--

CREATE TABLE `multi__imgs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_slug` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_tags` varchar(255) NOT NULL,
  `product_color` varchar(255) DEFAULT NULL,
  `product_size` varchar(255) DEFAULT NULL,
  `product_price` double NOT NULL,
  `discoutn_price` double DEFAULT NULL,
  `short_descp` varchar(255) DEFAULT NULL,
  `long_descp` text DEFAULT NULL,
  `product_thumbnail` varchar(255) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `hot_deals` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `special_offer` varchar(255) DEFAULT NULL,
  `special_deals` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `subcategory_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `subcategory_name`, `subcategory_slug`, `created_at`, `updated_at`) VALUES
(1, '2', 'scorola', 'scorola', '2023-10-03 13:50:15', '2023-10-03 14:55:49'),
(2, '1', 'laptop', 'laptop', '2023-10-03 13:52:08', '2023-10-04 02:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','vendor','user') NOT NULL DEFAULT 'user',
  `vendor_join` varchar(255) DEFAULT NULL,
  `vendor_short_info` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `photo`, `phone`, `address`, `email_verified_at`, `password`, `role`, `vendor_join`, `vendor_short_info`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$.TV01ZapECRivQJXyXIzwu7sZzjaB6kZ4O3heaREgUJXqHYjdIk5a', 'admin', NULL, NULL, 'active', NULL, NULL, NULL),
(2, 'Vendor', 'vendor', 'vendor@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$Wl1WCAHwGewj.pAcA1U.g.yd4q33n0pp5sMjqUqpD/QsVaKarO7/G', 'vendor', NULL, NULL, 'active', NULL, NULL, NULL),
(3, 'User', 'user', 'user@gmail.com', '651d3d6d9c33b.jpg', '0177959505', 'banasree', NULL, '$2y$10$NleKEp/qYPskvGelV.IyhO8IBETD5sWWKS6pJ1E5L48qbrFucDxPG', 'user', NULL, NULL, 'active', NULL, NULL, '2023-10-04 04:24:45'),
(4, 'Kevin Hagenes', 'edwina.dooley', 'smith.kali@example.net', 'https://via.placeholder.com/70x70.png/005588?text=aut', '+1 (928) 965-6514', '372 Rosenbaum Path\nNorth Leonard, MO 58730-9881', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'd0SzJyIs1y', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(5, 'Birdie Brekke', 'joany47', 'mcglynn.ethel@example.net', 'https://via.placeholder.com/70x70.png/004422?text=similique', '+1-909-695-0627', '29835 Constance Corner\nWest Amirton, MA 35795', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'xtkhYWT0rU', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(6, 'Chet Hodkiewicz', 'dare.ressie', 'yvonne36@example.org', 'https://via.placeholder.com/70x70.png/00ddcc?text=libero', '+1.410.209.0842', '69532 Deonte Valleys\nNew Gwendolyn, KY 14485', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'qDxC315Erm', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(7, 'Prof. Lance Bartell', 'amitchell', 'zkub@example.com', 'https://via.placeholder.com/70x70.png/00aa00?text=non', '+1.267.989.9413', '4195 Sigurd Dale\nLawsonview, SC 98244', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'mRezF3tUTh', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(8, 'Izabella Morissette', 'predovic.jean', 'fwolf@example.org', 'https://via.placeholder.com/70x70.png/007755?text=voluptatem', '847-291-4273', '78210 Larson Station\nFelicitaton, WI 43528', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', '6rsXv3MaHV', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(9, 'Jayda Dare', 'oreilly.marian', 'wiegand.macy@example.net', 'https://via.placeholder.com/70x70.png/0066bb?text=enim', '+1-605-654-7186', '359 Rogers Shoal\nGutmannbury, AR 18810-5066', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'LwuC8iUjCl', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(10, 'Conor Yost', 'everardo.morissette', 'lwitting@example.com', 'https://via.placeholder.com/70x70.png/002255?text=ut', '+19047799255', '295 Denesik Haven Apt. 808\nPagacport, CA 73907-3762', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'CSXH0eWugf', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(11, 'Pearline O\'Keefe', 'gislason.blanche', 'labadie.berenice@example.org', 'https://via.placeholder.com/70x70.png/004466?text=ipsa', '(813) 519-4144', '6715 Parker Locks Apt. 811\nEast Sterlingberg, IA 60450', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'ViDnpK7YEV', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(12, 'Kristina Howe', 'buford.jacobs', 'einar71@example.net', 'https://via.placeholder.com/70x70.png/00bbbb?text=eveniet', '(279) 540-1502', '5893 Schimmel Road Apt. 573\nEast Jarenmouth, NC 66041-7774', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'E0Ic1lPxJh', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(13, 'Miss Katharina Ledner', 'morissette.tremaine', 'jnader@example.com', 'https://via.placeholder.com/70x70.png/0077dd?text=dignissimos', '1-510-367-8331', '3360 Winnifred Fall\nHilpertland, LA 86234-0300', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'mdJ9iou6IN', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(14, 'Ms. Leora Cole', 'zella.blanda', 'pwillms@example.com', 'https://via.placeholder.com/70x70.png/0022ff?text=qui', '+17405256089', '638 Jewel Harbor\nSatterfieldberg, KS 26502-1719', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'gZVNrpzZr8', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(15, 'Destiney Jast', 'abby49', 'nathaniel.kertzmann@example.com', 'https://via.placeholder.com/70x70.png/0066ff?text=voluptatibus', '+1.864.406.7410', '33069 Christ Key Apt. 243\nNorth Annetta, MN 27670-3190', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'ElvycjpQcJ', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(18, 'Dexter Pacocha', 'christophe24', 'alvina.kling@example.org', 'https://via.placeholder.com/70x70.png/00aa22?text=et', '+1-414-454-2216', '100 Cooper Circles\nTyresetown, LA 89919-1038', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'xvS2FOSIub', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(20, 'Prof. Everett Krajcik', 'schroeder.carlee', 'murazik.reyes@example.net', 'https://via.placeholder.com/70x70.png/00eebb?text=aperiam', '+1-603-318-9738', '26149 Andreanne Corners Apt. 574\nEast Nyasia, NH 13512', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'dZjMV6lkF1', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(21, 'Craig Dare', 'schultz.ward', 'funk.delfina@example.net', 'https://via.placeholder.com/70x70.png/001188?text=vel', '1-321-628-3917', '7418 Hilpert Island\nNorth Gunnar, AZ 39468', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'Ge8w9fhnW5', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(22, 'Lyric Strosin', 'bschmeler', 'wreinger@example.com', 'https://via.placeholder.com/70x70.png/003344?text=quas', '313.822.7211', '9677 Spinka Springs\nWest Porter, AR 56398', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'U7AlOtWH37', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(23, 'Gretchen Tremblay', 'pansy21', 'grant.minnie@example.com', 'https://via.placeholder.com/70x70.png/0044aa?text=non', '458-891-1816', '25832 Geraldine Via\nWinstonbury, ND 00138-3906', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'iY6TarFa4v', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(24, 'Paige Gislason PhD', 'liliane38', 'kkub@example.com', 'https://via.placeholder.com/70x70.png/000044?text=id', '+1.469.806.2795', '154 Johnston Valleys Suite 138\nSouth Nicolette, CO 87830', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', '3PrWqNEVYM', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(25, 'Carlotta Maggio', 'cummerata.erika', 'rachael.bechtelar@example.org', 'https://via.placeholder.com/70x70.png/00aa66?text=nulla', '678.623.1751', '8150 Schneider Mall Suite 728\nGibsonchester, GA 80529', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'thAHw1t79l', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(26, 'Althea Feil I', 'michele48', 'herman.gwen@example.com', 'https://via.placeholder.com/70x70.png/005599?text=provident', '(463) 871-3716', '7069 Melba Well\nNew Zanderhaven, IN 37948-8537', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'iTZ0g7NPge', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(27, 'Ignatius Schumm', 'hegmann.dora', 'zbreitenberg@example.org', 'https://via.placeholder.com/70x70.png/0099aa?text=quia', '1-907-766-1405', '45928 O\'Keefe Mills Suite 489\nPort Skyla, MT 15486', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'LiteNAFnSr', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(29, 'Prof. Ali Kirlin DDS', 'fswift', 'fspinka@example.net', 'https://via.placeholder.com/70x70.png/00ff44?text=quia', '971.352.4367', '77476 Daniel Freeway Apt. 555\nNorth Napoleon, SC 75726-6304', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'LZBTBkYOfe', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(30, 'Korbin Nitzsche', 'briana46', 'kyle48@example.com', 'https://via.placeholder.com/70x70.png/006622?text=officia', '820-905-7585', '33291 Keebler Union Suite 815\nNew Niahaven, IN 55776', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', '15cWqe4OXh', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(31, 'Jerald Lubowitz', 'hadley47', 'lockman.eliza@example.net', 'https://via.placeholder.com/70x70.png/0055ee?text=necessitatibus', '(539) 944-1492', '4962 Walter Bypass Apt. 130\nKerlukebury, KY 11090-0393', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'eerHoB3s2r', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(33, 'Georgianna Moore', 'haag.beaulah', 'fgulgowski@example.net', 'https://via.placeholder.com/70x70.png/00aa99?text=fugiat', '+1-551-389-4945', '86200 Eloise Mills\nWest Shyanne, AK 40534-9633', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', '1Gy1yrJzwU', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(34, 'Natalia Ledner', 'nbalistreri', 'hettie61@example.org', 'https://via.placeholder.com/70x70.png/0044cc?text=debitis', '+1-267-222-3171', '70205 Kohler Light\nNorth Juliana, NV 91524', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'cnktTxtdmv', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(36, 'Ocie Feil Jr.', 'marley.bahringer', 'napoleon.mosciski@example.com', 'https://via.placeholder.com/70x70.png/007733?text=et', '470.267.7352', '750 Mireille Island\nNew Madisyn, RI 96815-6650', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'vdIS7KVomt', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(37, 'Mrs. Margarette Tromp V', 'nyah.fadel', 'price.cleora@example.org', 'https://via.placeholder.com/70x70.png/0066bb?text=aut', '(662) 260-8891', '83463 Pfeffer Orchard Suite 080\nWeimannton, MN 61318', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'JfjPI8hJOl', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(38, 'Meredith Senger', 'fay.thora', 'smitchell@example.net', 'https://via.placeholder.com/70x70.png/0022ff?text=molestiae', '901-917-5865', '7477 Block Harbors Apt. 970\nAlanisland, HI 51880-8922', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'n99p3TS1Nv', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(39, 'Katelynn Funk', 'buckridge.emie', 'gwendolyn99@example.com', 'https://via.placeholder.com/70x70.png/0044ff?text=modi', '(248) 884-0888', '99385 Elza Ford\nBrooketon, CT 31027-5544', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'LomJtsiRCy', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(41, 'Dr. Margaret King I', 'jweissnat', 'reginald81@example.org', 'https://via.placeholder.com/70x70.png/000044?text=magnam', '1-947-389-6944', '28406 Leilani Throughway Suite 041\nNew Angie, MD 98482-7725', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'CG1HMQJZ4r', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(42, 'Dr. Sherman Yundt', 'streich.donald', 'diana.smitham@example.org', 'https://via.placeholder.com/70x70.png/00bb11?text=tempore', '812.822.4233', '612 Kassulke Hill\nLancechester, CO 99071-9856', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'DC1PqsH2Pp', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(43, 'Camden Kris', 'garrett30', 'skilback@example.com', 'https://via.placeholder.com/70x70.png/006622?text=et', '828-971-4652', '5433 Kub Glens\nNew Dino, CT 52310', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'aNlE0kkWhX', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(45, 'Dr. Stanford Treutel', 'frances92', 'goyette.laura@example.org', 'https://via.placeholder.com/70x70.png/00dd66?text=minus', '916.261.6831', '49190 Rempel Rest\nShieldsberg, MI 30308-4676', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'rLS7DbVa6W', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(46, 'Arielle Schiller MD', 'slubowitz', 'beatty.wilford@example.org', 'https://via.placeholder.com/70x70.png/009933?text=sed', '(269) 518-1875', '1650 Monty Prairie\nKozeyside, GA 96716-2421', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'gDZvynxPnf', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(47, 'Miss Annetta Heaney Sr.', 'lesch.lawson', 'amparo.blick@example.com', 'https://via.placeholder.com/70x70.png/0099ff?text=quae', '435.487.5440', '81873 Kaia Street Suite 259\nDuanefort, DE 17215', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'hhtG2G3SIQ', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(48, 'Adam Hahn', 'treutel.shannon', 'pyost@example.net', 'https://via.placeholder.com/70x70.png/009922?text=iste', '831.950.9236', '88426 Maxie Parks\nNew Baby, GA 48309', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'x37Ci8DsgB', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(49, 'Coy Medhurst', 'maeve23', 'pamela38@example.net', 'https://via.placeholder.com/70x70.png/00ff88?text=ut', '+1-940-551-8159', '109 Adams Oval\nWuckertborough, AZ 30633-5468', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'p2pQUvaWZM', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(50, 'Rogelio Flatley', 'hferry', 'kuvalis.thea@example.net', 'https://via.placeholder.com/70x70.png/0077bb?text=laudantium', '1-562-557-6374', '9062 Abshire Forges\nBorerburgh, IA 19693', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'jmBOsDxm0o', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(51, 'Nola Auer', 'jarod.champlin', 'xschmeler@example.com', 'https://via.placeholder.com/70x70.png/008822?text=est', '843-652-3746', '992 Stamm Drive\nPort Jeffreyborough, MA 60787', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', '8jfBozMkRV', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(52, 'Mrs. Lorna Goyette', 'owen.christiansen', 'lakin.anita@example.com', 'https://via.placeholder.com/70x70.png/005599?text=maiores', '1-562-201-4799', '4314 Mueller Freeway Apt. 821\nNorth Tomasa, DE 07662', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'HSTm0PvtWt', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(53, 'Jayme Gusikowski', 'doyle43', 'zswaniawski@example.org', 'https://via.placeholder.com/70x70.png/004444?text=consequuntur', '+1-210-304-0424', '745 Larson Park Suite 494\nJaylanport, TX 62229', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'TrpId82Snd', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(54, 'Mr. Agustin Greenholt MD', 'nwunsch', 'florence81@example.net', 'https://via.placeholder.com/70x70.png/00cc22?text=laudantium', '1-845-655-5770', '50493 Daron Path Suite 132\nLillianastad, AR 79325-5500', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'DaenYV16fX', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(55, 'Dillan Pacocha', 'nschmeler', 'mbalistreri@example.org', 'https://via.placeholder.com/70x70.png/0000cc?text=rerum', '+1-662-891-4579', '8588 Gerhold Trail\nCaylatown, VA 07830', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'd0xuka4qnR', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(57, 'Vicenta Wolff', 'marcelino48', 'coy.ritchie@example.net', 'https://via.placeholder.com/70x70.png/006622?text=laudantium', '907.677.4286', '4298 German Haven Apt. 143\nDevantefort, NM 15153', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'G4CAAgMWiS', '2023-10-03 13:23:44', '2023-10-03 13:23:44'),
(59, 'Reid Green', 'edna.kutch', 'leannon.maegan@example.com', 'https://via.placeholder.com/70x70.png/00ccee?text=et', '(313) 231-2975', '198 Borer Skyway\nLake Jeromyfurt, IL 64546', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'i4BTu5EL0L', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(60, 'Miss Kaya Fritsch', 'kerluke.nia', 'caroline.mitchell@example.org', 'https://via.placeholder.com/70x70.png/004400?text=amet', '+1-347-915-2733', '786 Taurean Junction\nSageport, CO 36974-5329', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'WTbTmSwhv8', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(62, 'Mr. Elmer Frami I', 'michaela.feest', 'aufderhar.danny@example.com', 'https://via.placeholder.com/70x70.png/002288?text=libero', '331-476-5485', '6095 Orrin Union Apt. 903\nEast Cleo, WV 20470-4077', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'p78xUVKvqB', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(63, 'Erwin Kub', 'madisyn89', 'gibson.dakota@example.org', 'https://via.placeholder.com/70x70.png/00aa33?text=qui', '443.514.2886', '5098 Brooke Ways\nFayborough, AR 38341', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'tH000YEXo7', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(64, 'Carroll Wilkinson', 'suzanne.yost', 'ehuels@example.com', 'https://via.placeholder.com/70x70.png/0099bb?text=odit', '+16099175195', '7627 Reece Forks\nCreminbury, AZ 21758-9149', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'IdZvLtCx3l', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(65, 'Carlie Shields DDS', 'kiehn.godfrey', 'justina60@example.com', 'https://via.placeholder.com/70x70.png/00ccbb?text=maiores', '814-531-6062', '42682 Gail Lights\nScarlettstad, FL 64059-3236', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'f6VXBixJaB', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(66, 'Prof. Melba Davis DDS', 'eharvey', 'ulices10@example.net', 'https://via.placeholder.com/70x70.png/0011cc?text=harum', '413.228.8260', '1467 Stehr Radial Apt. 725\nEast Leora, VT 57135-5002', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'l8CRRIc2xl', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(67, 'Dr. Elenor Heidenreich', 'jordan.witting', 'hamill.amaya@example.net', 'https://via.placeholder.com/70x70.png/005544?text=nihil', '1-360-647-5919', '949 Hansen Light Apt. 569\nWest Lazaro, HI 68162', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'GDCmFxzROR', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(68, 'Ulises Christiansen', 'talia.ruecker', 'cwill@example.org', 'https://via.placeholder.com/70x70.png/003377?text=et', '+1-272-794-1853', '68345 Katlyn Square\nKuvalisborough, MS 79604', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'q5lYDG6UvD', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(69, 'Ruben Feil I', 'wilkinson.gretchen', 'uschmeler@example.net', 'https://via.placeholder.com/70x70.png/0000cc?text=at', '1-361-870-5286', '5345 Luettgen Plain Apt. 815\nSabrynabury, OK 56221-0833', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'BIMS3iMs7P', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(70, 'Bettye White', 'aaufderhar', 'kendrick.ruecker@example.com', 'https://via.placeholder.com/70x70.png/0066dd?text=voluptatem', '260-721-1707', '2955 John Ways\nWest Viviantown, DE 89295-8426', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', '1KRjB8OPUu', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(72, 'Kara Upton', 'carmel.hamill', 'bryce.shanahan@example.com', 'https://via.placeholder.com/70x70.png/0044cc?text=voluptatem', '+1.989.594.8991', '353 Jenkins Drive Suite 307\nJaquelinefurt, VT 87052', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'f9eLFX1yoL', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(74, 'Dr. Simone Kihn DDS', 'ari88', 'katherine75@example.org', 'https://via.placeholder.com/70x70.png/001133?text=rerum', '972-767-5780', '775 Kathryne Lodge\nMercedesmouth, SD 39056-5349', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'OFmmOhVcrj', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(75, 'Elliott Rosenbaum', 'hmraz', 'dhettinger@example.org', 'https://via.placeholder.com/70x70.png/000011?text=voluptatibus', '1-240-304-1402', '294 Boyer Forges\nNorth Leonel, MD 65487', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'cviGimQ660', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(76, 'Prof. Cielo Gleason', 'lang.freddie', 'kris.evert@example.com', 'https://via.placeholder.com/70x70.png/00aa22?text=vel', '516.374.6281', '2760 Schinner Highway Suite 309\nEast Barbaratown, MT 17437-4654', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'Nwl3oXyW1W', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(77, 'Karl Windler', 'jayne.stiedemann', 'haag.pablo@example.com', 'https://via.placeholder.com/70x70.png/0033ee?text=aliquam', '+15207893987', '97411 Javon Ways Apt. 997\nNew Lavonfurt, PA 62324-2568', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'TGiPv3dIEL', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(79, 'Zachary Zemlak III', 'hermann.vivien', 'aufderhar.wilford@example.org', 'https://via.placeholder.com/70x70.png/0033ee?text=voluptas', '1-917-573-5240', '7411 Delphine Heights\nLeuschkehaven, AR 79530-1330', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'A7d60sdGc0', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(80, 'Prof. Matt Hirthe', 'norbert.sauer', 'pschaefer@example.org', 'https://via.placeholder.com/70x70.png/0000aa?text=dolor', '650.359.2147', '1006 Emard Plaza Apt. 792\nPort Marianostad, NC 94839', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'g9gwXMdkxS', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(81, 'Mrs. Naomi Mertz DVM', 'flindgren', 'asia.lakin@example.org', 'https://via.placeholder.com/70x70.png/00ffaa?text=ex', '223-391-9335', '637 Bogisich Parks Apt. 855\nNew Scottymouth, WV 08298-1576', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'PuvLnFfPRx', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(82, 'Norma Buckridge', 'orrin.schiller', 'pouros.clotilde@example.net', 'https://via.placeholder.com/70x70.png/006655?text=architecto', '+1.469.628.2732', '2742 Walker Cliffs Apt. 470\nCassandretown, NJ 79059', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'g6HSTmZV09', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(84, 'Osborne Trantow', 'stark.donnell', 'gjacobi@example.org', 'https://via.placeholder.com/70x70.png/004433?text=nostrum', '+1-812-906-4476', '74072 Crist Trace Suite 759\nChanceberg, TN 56039', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'xyXqgfBJsl', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(85, 'Prof. Ottis Kassulke', 'devin70', 'vmacejkovic@example.org', 'https://via.placeholder.com/70x70.png/00ff88?text=rem', '+14152071713', '56384 Dickinson Crossing Suite 029\nDestanytown, MS 07599', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', '78VVk4fxh0', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(86, 'Dr. Warren Sauer IV', 'zechariah28', 'natalie13@example.net', 'https://via.placeholder.com/70x70.png/00cc11?text=in', '(754) 552-2420', '15135 Cruickshank Ranch Apt. 366\nWest Emiliebury, ID 37136', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'B4TjdWWYpe', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(88, 'Mr. Dorthy Cartwright', 'bernie.wyman', 'jaiden.senger@example.net', 'https://via.placeholder.com/70x70.png/008833?text=eligendi', '(934) 886-4982', '2083 Franecki Throughway\nLake Roxane, CA 91445-7158', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'eJ3zCiBpOZ', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(89, 'Mr. Deangelo Grant PhD', 'leonard82', 'miles60@example.com', 'https://via.placeholder.com/70x70.png/001188?text=odio', '+1.520.532.7271', '804 Timothy View\nNew Emmetbury, NH 44132', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'DUOHdbfLy2', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(90, 'Jose Lueilwitz Jr.', 'salvatore13', 'toy.nels@example.org', 'https://via.placeholder.com/70x70.png/00aa66?text=tempora', '757-347-8393', '258 Jadon Mews Suite 203\nRuperthaven, NE 87795', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'R0tTt1jF4y', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(91, 'Coty Smitham', 'ablick', 'johnson.assunta@example.net', 'https://via.placeholder.com/70x70.png/0044ee?text=aliquid', '1-971-820-2163', '3163 Ryan Loop\nLake Beth, MD 13448-1218', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', '5E20Cm5DTy', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(92, 'Clyde Ward', 'kiel95', 'vhartmann@example.org', 'https://via.placeholder.com/70x70.png/008844?text=vel', '+1.520.242.6687', '224 Pouros Flat\nKreigerborough, AL 17166', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'tCXOPVOtKS', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(93, 'Liam Hyatt', 'rowe.myrtie', 'jast.cristal@example.org', 'https://via.placeholder.com/70x70.png/000055?text=molestiae', '+1 (332) 848-9473', '297 Lindsay Mountain Suite 789\nBarrettville, AR 66412', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'TEju5lqq4S', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(94, 'Prof. Gaston Thompson', 'sandy29', 'cleveland.friesen@example.net', 'https://via.placeholder.com/70x70.png/00dd44?text=esse', '(984) 831-6496', '4704 Toy Road Apt. 549\nSpinkaberg, KS 38393-3920', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'gTh2HgIgkW', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(95, 'Mr. Devon Bartoletti', 'johnathon77', 'mante.brielle@example.com', 'https://via.placeholder.com/70x70.png/0066cc?text=voluptatibus', '906-338-0318', '7558 Waelchi Estates\nNorth Raegantown, TN 16369', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'XWp82Cc6Gp', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(96, 'Kari Brekke', 'hjacobs', 'slubowitz@example.net', 'https://via.placeholder.com/70x70.png/0077cc?text=quo', '458-664-2356', '9366 Mayert Light Apt. 896\nSouth Maymietown, FL 45341-2451', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'hB52jtzEEH', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(98, 'Gerhard Terry', 'sauer.alysha', 'hand.dolores@example.org', 'https://via.placeholder.com/70x70.png/0055cc?text=laudantium', '(254) 570-6283', '9532 Breitenberg Track Suite 542\nCamillaside, NH 84463-3473', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'fV9KIpxVhs', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(99, 'Francesco Rolfson', 'flabadie', 'ujenkins@example.org', 'https://via.placeholder.com/70x70.png/005577?text=omnis', '1-931-612-7207', '277 Mireya Island\nSouth Rubychester, ID 67865-0797', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'xxxthUIpCZ', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(100, 'Keyon Littel MD', 'leatha63', 'nikolaus.micheal@example.org', 'https://via.placeholder.com/70x70.png/0088cc?text=corrupti', '914.836.1980', '2526 Abel Forest\nJalonview, UT 01531', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'BH3F1KKp4k', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(101, 'Freeda Kunde', 'jbreitenberg', 'madison.beahan@example.org', 'https://via.placeholder.com/70x70.png/008833?text=recusandae', '1-732-893-1105', '52409 Schroeder Stravenue Apt. 790\nPort Garnetview, ND 99032', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'QCJuulpwQF', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(102, 'Donald Lindgren', 'alia.hane', 'rafaela.swift@example.org', 'https://via.placeholder.com/70x70.png/007711?text=vel', '(435) 247-6046', '7150 Crooks Isle\nMaggioport, LA 80092', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'cyDHczfXRI', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(103, 'Laury Gulgowski', 'welch.shanny', 'frohan@example.org', 'https://via.placeholder.com/70x70.png/0066aa?text=sunt', '984-774-2182', '57305 Kailee Station\nSouth Nella, MS 68750', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'xAmCufQciL', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(104, 'Jaren Bruen III', 'ymertz', 'ramiro.hayes@example.com', 'https://via.placeholder.com/70x70.png/0044ff?text=inventore', '1-858-985-3732', '5215 Toy Fields Apt. 727\nWest Elenora, AR 64914', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'WzScgazCCB', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(105, 'Prof. Autumn Johns', 'cameron68', 'xmiller@example.org', 'https://via.placeholder.com/70x70.png/006688?text=ex', '1-765-618-8800', '1768 Schimmel Track\nVonRuedenland, FL 62573', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'ghJxqDUzJf', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(107, 'Tiffany Larkin', 'rempel.viva', 'hlebsack@example.net', 'https://via.placeholder.com/70x70.png/00ffbb?text=molestias', '+14408834069', '256 Wolff Trace Apt. 163\nTorphyshire, WA 67382', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'Jx7efnJ9e9', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(108, 'Dr. Montana Murray', 'clehner', 'qleffler@example.org', 'https://via.placeholder.com/70x70.png/009900?text=ipsam', '847-253-8385', '68440 Cronin Crossroad Suite 082\nMarianneland, AR 15456-6281', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'ly9ryNLDIf', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(109, 'Prof. Jaren Stokes II', 'urban61', 'raven.turner@example.org', 'https://via.placeholder.com/70x70.png/006666?text=sint', '520-342-7871', '2995 Zander Terrace\nNorth Mertiehaven, NY 08869-0376', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'MTbQrOXVQ9', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(110, 'Mr. Greg Towne IV', 'boyer.lily', 'buckridge.sharon@example.org', 'https://via.placeholder.com/70x70.png/005566?text=doloremque', '1-609-336-3892', '683 Americo Manors Apt. 999\nLake Veda, HI 90837-6940', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'RdogMLodm6', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(111, 'Prof. Chasity Kohler', 'leannon.rogelio', 'schmeler.ahmad@example.com', 'https://via.placeholder.com/70x70.png/00aa66?text=et', '1-479-610-2458', '80640 Maggio Passage Suite 355\nLake Leonorafurt, MA 88647', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'GGGHZVCV8x', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(112, 'Eveline Gibson DVM', 'spadberg', 'otto.lebsack@example.com', 'https://via.placeholder.com/70x70.png/0033cc?text=sunt', '260.968.4703', '42499 Mayer Vista\nDouglasmouth, ND 95237-6747', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', '8PD02uzHKL', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(113, 'Prof. Daphne King DVM', 'iledner', 'vtrantow@example.org', 'https://via.placeholder.com/70x70.png/00aa22?text=et', '1-270-292-6118', '8118 Hamill Burgs\nBrakusmouth, SD 00970-5544', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'NOIw6jpobe', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(114, 'Breanne Bode', 'brodriguez', 'mante.otha@example.com', 'https://via.placeholder.com/70x70.png/0011cc?text=alias', '+1-386-908-6043', '126 Kennedy Forge Suite 999\nLake Jackelinemouth, PA 96011-1684', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'qWDwDcITuR', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(116, 'Mr. Garth Will DVM', 'cassandre79', 'cristobal.gleason@example.org', 'https://via.placeholder.com/70x70.png/00aaaa?text=est', '915.705.4122', '82697 Watsica Ridge Apt. 421\nDibbertberg, IA 90049', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'glAtRYUZDk', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(117, 'Dr. Spencer Conn I', 'erika.herzog', 'emclaughlin@example.com', 'https://via.placeholder.com/70x70.png/00aa99?text=exercitationem', '(480) 366-8842', '474 Dora Spring\nNew Claudie, SD 65569', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'pvElNSc0da', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(118, 'Prof. John Greenfelder DVM', 'ithiel', 'bledner@example.net', 'https://via.placeholder.com/70x70.png/007722?text=eveniet', '(217) 905-7277', '667 Francis Station\nSkilesside, IN 11007-5183', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'aUpf278XUH', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(119, 'Raphaelle Funk', 'mmcdermott', 'abdul.boyle@example.net', 'https://via.placeholder.com/70x70.png/0077ee?text=assumenda', '+1.564.620.2353', '855 Beier Row Suite 416\nLake Lysanneview, GA 54952', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'H9dHOOi0Be', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(120, 'Sanford Ebert Sr.', 'mann.roslyn', 'durgan.abdul@example.org', 'https://via.placeholder.com/70x70.png/006644?text=odio', '(234) 696-8268', '8859 Krystel Gardens\nBernierberg, WV 35799', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'IAg4XyCImm', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(121, 'Dawson Price', 'carter.baylee', 'loy80@example.net', 'https://via.placeholder.com/70x70.png/002266?text=distinctio', '801-827-8035', '28188 Velda Tunnel Apt. 360\nNorth Demetris, VA 37804-2799', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'NHVo2UDiRt', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(122, 'Keira Pollich', 'jackie66', 'keon.barton@example.com', 'https://via.placeholder.com/70x70.png/009966?text=assumenda', '+1-972-900-4393', '2176 Schowalter Unions Apt. 746\nMitchellfort, MD 94854-5011', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', '8KPRvefeV9', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(124, 'Tillman Orn', 'kwaelchi', 'senger.giovanni@example.net', 'https://via.placeholder.com/70x70.png/000055?text=odio', '+1-440-376-6257', '180 Carter Cape Suite 457\nWest Monserrat, AK 14823', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'PphLqvkROv', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(125, 'Dr. Brayan Gulgowski', 'lance34', 'shauck@example.net', 'https://via.placeholder.com/70x70.png/00ff66?text=id', '(719) 792-4759', '13022 Bartoletti Lodge\nCreminport, KS 68799-7153', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'KIOTTyR6Bs', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(126, 'Mariah Lubowitz', 'andreanne44', 'jschuster@example.net', 'https://via.placeholder.com/70x70.png/006699?text=et', '+1 (531) 230-4202', '6994 Schaefer Road Apt. 052\nNicolasburgh, IA 27064', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'kC2TCZJBon', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(127, 'Matilda DuBuque', 'patience.mills', 'ward.delpha@example.org', 'https://via.placeholder.com/70x70.png/0011bb?text=veniam', '520.529.8176', '427 Mills Via Apt. 334\nEstellchester, MI 72068-2521', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'CqThVxTfuh', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(128, 'Orrin Glover', 'remington49', 'satterfield.martina@example.com', 'https://via.placeholder.com/70x70.png/0066bb?text=numquam', '(407) 866-8714', '39116 Sawayn Parkways\nSummershire, WI 56926', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'k7mtY3jCcZ', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(129, 'Spencer Osinski', 'poconnell', 'isabelle.rice@example.net', 'https://via.placeholder.com/70x70.png/003322?text=quae', '1-220-970-6553', '1868 Dakota Branch\nLake Monty, ID 93441', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'PzxLyMjkSq', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(131, 'Vernon Mohr', 'mittie55', 'cristal13@example.org', 'https://via.placeholder.com/70x70.png/006688?text=qui', '703-888-9222', '77424 Kenyatta Squares Apt. 878\nPort Chyna, CT 36718-5676', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'qdbyCLMUJB', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(132, 'Ms. River Wilkinson', 'mozell.schulist', 'klehner@example.net', 'https://via.placeholder.com/70x70.png/005511?text=aliquam', '+1 (575) 226-0251', '21556 Dusty Alley\nAidenmouth, HI 89562-4696', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'gf9Hhp5beP', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(133, 'Elias Fay', 'maeve.collier', 'morris.senger@example.net', 'https://via.placeholder.com/70x70.png/00ff00?text=aspernatur', '779.505.1289', '96734 Upton Parkway Suite 496\nSporerfurt, NH 75532', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'KsKUnLeZ6f', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(134, 'Jerad Dach', 'upton.larue', 'sschaden@example.net', 'https://via.placeholder.com/70x70.png/001155?text=ut', '+1-848-810-0638', '39712 Muller Motorway Suite 697\nKeelytown, HI 14260', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', '7ly8xHPtzt', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(135, 'Marcelle Ferry', 'isac.jast', 'casey.stokes@example.net', 'https://via.placeholder.com/70x70.png/009988?text=vel', '248-472-7501', '5638 Janiya Dam\nSouth Oren, ME 96247', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', '92v2rMULLS', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(136, 'Prof. Berta Mante Jr.', 'ygoyette', 'gregorio.powlowski@example.com', 'https://via.placeholder.com/70x70.png/008899?text=et', '1-341-317-9649', '25348 Marquardt Prairie Apt. 125\nEast Sibyltown, SC 76451-2334', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'ZRu0lTwWqT', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(137, 'America Bogisich', 'bethel.schroeder', 'casper.fisher@example.org', 'https://via.placeholder.com/70x70.png/008877?text=sed', '1-651-738-9728', '1729 Melvina Key\nMurlside, GA 78974', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'iYRZl8XMWy', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(138, 'Mr. Darryl Maggio MD', 'arvilla58', 'odonnelly@example.org', 'https://via.placeholder.com/70x70.png/0011dd?text=deleniti', '567.569.7034', '79750 Konopelski Well\nLake Destiniville, NY 29593-3615', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'ZKYfw5lE54', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(139, 'Dewayne Lesch', 'hane.lew', 'millie48@example.org', 'https://via.placeholder.com/70x70.png/000022?text=qui', '1-347-405-7669', '882 Carroll Bypass\nRosaliaside, NM 32107-9696', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'AAaHv1Qklo', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(140, 'Mr. Pietro Volkman', 'aquitzon', 'schmitt.lisa@example.net', 'https://via.placeholder.com/70x70.png/0033bb?text=est', '(773) 312-4695', '5457 Kyla Orchard\nAuerland, RI 53997', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'abOMEC9Cju', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(142, 'Laverne Herzog', 'jocelyn75', 'kkautzer@example.org', 'https://via.placeholder.com/70x70.png/0066dd?text=ratione', '+16783260708', '51189 Grayce Orchard Suite 627\nJoestad, TX 86372', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'k4E0OPOuwI', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(143, 'Jabari Rosenbaum', 'delphia18', 'obogisich@example.org', 'https://via.placeholder.com/70x70.png/0077cc?text=assumenda', '870-623-6830', '7393 Imani Lodge\nBergstromport, NY 26902', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'Xa80zKq5qi', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(144, 'Danielle Senger', 'archibald.reichel', 'remington.rau@example.org', 'https://via.placeholder.com/70x70.png/0033ff?text=voluptas', '561-869-6826', '86334 Pollich Crossroad Apt. 071\nWest Enola, RI 66934-4108', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'm0S5oUw6oC', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(145, 'Mrs. Trudie Senger', 'waelchi.gene', 'stehr.alysson@example.net', 'https://via.placeholder.com/70x70.png/00aabb?text=architecto', '+1-386-470-6310', '1497 Nicolette Fall Suite 164\nDaishaland, CO 38795', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', '6byhO0O5cW', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(146, 'Elody Keeling', 'zwatsica', 'zweissnat@example.net', 'https://via.placeholder.com/70x70.png/00bb55?text=soluta', '480-445-9418', '479 Schuppe Mountain\nPacochaville, MD 88650', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'iKjO0VKUR2', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(147, 'Joey Marquardt', 'fzboncak', 'rodriguez.cornell@example.org', 'https://via.placeholder.com/70x70.png/0099cc?text=pariatur', '(540) 760-3154', '265 Kilback Glen Apt. 628\nPort Cleveland, AL 66143-1803', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', '1gmZOZHt9D', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(148, 'Hermina Boyer', 'stark.israel', 'orville68@example.org', 'https://via.placeholder.com/70x70.png/006677?text=esse', '+1-303-938-3285', '370 Pollich Gateway Suite 373\nDameonberg, AL 85647', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', '1sYtpFyJDh', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(149, 'Percy Bernier', 'neoma26', 'hilpert.wilfrid@example.com', 'https://via.placeholder.com/70x70.png/001111?text=accusantium', '+1-858-565-7597', '38437 Veda Courts Suite 924\nSouth Pierce, MD 52153-6914', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'q3sne6YyB5', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(150, 'Angelo Collins', 'stracke.jordyn', 'toy.rebeka@example.net', 'https://via.placeholder.com/70x70.png/00ee44?text=aliquam', '850-246-6565', '186 Giovanna Drives Suite 243\nLake Karley, AK 69129', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', '6uZHcaWYTL', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(151, 'Keaton Boehm', 'clare95', 'sunny.ortiz@example.org', 'https://via.placeholder.com/70x70.png/0044cc?text=dolorum', '(818) 752-9563', '66333 Dixie Port Apt. 396\nWillton, DC 31552-1892', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', '200pPefYnS', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(152, 'Ted Kassulke', 'hodkiewicz.cody', 'williamson.leora@example.org', 'https://via.placeholder.com/70x70.png/00bbcc?text=est', '909.783.8055', '2305 Hettinger Burg Suite 205\nWest Kariborough, AZ 83746', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'A9CfOuUJdg', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(153, 'Tony Legros PhD', 'cathrine.waters', 'rossie12@example.org', 'https://via.placeholder.com/70x70.png/00ffaa?text=nihil', '+14243952772', '7933 Braxton Island Apt. 883\nStuartshire, MO 73743-6560', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'A4rg3KksEA', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(154, 'Aliyah Kutch', 'marcus35', 'vmosciski@example.com', 'https://via.placeholder.com/70x70.png/007766?text=iure', '1-872-690-7739', '903 Anahi Turnpike\nNorth Yvonneberg, NJ 33337-3106', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'TePhUJTWtq', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(155, 'Prof. Orlando Will II', 'cristopher23', 'graciela.bergnaum@example.org', 'https://via.placeholder.com/70x70.png/00dd66?text=sunt', '+1-918-729-3374', '2485 McDermott Fort Suite 995\nEast Margareteland, DC 07559', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', '0vPkOyzFVo', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(156, 'Ms. Heloise Dickinson', 'maude80', 'rsauer@example.org', 'https://via.placeholder.com/70x70.png/006677?text=illo', '+1-857-377-6818', '2046 Strosin Heights\nWilhelmineview, AK 53502-9038', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'd6GdNN9bG9', '2023-10-03 13:23:45', '2023-10-03 13:23:45');
INSERT INTO `users` (`id`, `name`, `username`, `email`, `photo`, `phone`, `address`, `email_verified_at`, `password`, `role`, `vendor_join`, `vendor_short_info`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(157, 'Maynard Schmidt', 'naomi64', 'qshields@example.net', 'https://via.placeholder.com/70x70.png/0033cc?text=omnis', '+1-385-950-9763', '830 Katrine River Suite 546\nWhitetown, DE 91807-5680', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'ClhkMAGazQ', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(158, 'Rolando Gerlach', 'tlehner', 'keira34@example.com', 'https://via.placeholder.com/70x70.png/006622?text=ab', '1-854-234-8794', '46598 Mary Springs\nSouth Brennan, MN 50421-4802', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'BgrCwiK1EX', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(159, 'Zackary Bahringer', 'obins', 'dbotsford@example.net', 'https://via.placeholder.com/70x70.png/002299?text=voluptatum', '1-716-686-5825', '98168 Hardy Ford\nRetastad, WA 68813-8589', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'lv6Qm5Ug31', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(160, 'Prof. Rickie Marks', 'immanuel12', 'gwindler@example.net', 'https://via.placeholder.com/70x70.png/008833?text=accusamus', '+15345123614', '5310 Elenora Forges Suite 101\nSchmelerside, VT 97347', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'Heii1R2KjL', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(161, 'Ernesto Stoltenberg', 'ozella15', 'skuhn@example.com', 'https://via.placeholder.com/70x70.png/00ee55?text=cumque', '+1 (484) 587-8616', '70494 Tyree Station\nEast Jude, NC 26392-9908', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'V7VNpEXDcb', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(162, 'Lora Kautzer', 'clemens97', 'pschaefer@example.net', 'https://via.placeholder.com/70x70.png/004422?text=sed', '(424) 288-2692', '5288 Sanford Lock\nKadehaven, MI 50110', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'yeB77n4INh', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(163, 'Alexis Kovacek', 'rozella17', 'jonatan34@example.org', 'https://via.placeholder.com/70x70.png/0000bb?text=iusto', '404.740.5544', '65297 Hamill Lodge\nSanfordstad, WY 44589', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'pfN72FPITH', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(164, 'Dr. Kaylee Dach Jr.', 'ejohnston', 'stephany.franecki@example.org', 'https://via.placeholder.com/70x70.png/000099?text=nihil', '520-283-1736', '4504 Wisozk Vista\nEast Dedricfort, ND 08048', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', '1sJzQg82sV', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(165, 'Elinore Walsh', 'jeanette32', 'dejah.kulas@example.org', 'https://via.placeholder.com/70x70.png/002244?text=a', '419-836-0451', '47065 O\'Keefe Lakes\nLake Linnea, MD 34898-1919', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', '3qiufBo3V6', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(166, 'Heber Ullrich', 'georgianna.auer', 'zola00@example.org', 'https://via.placeholder.com/70x70.png/00eeff?text=est', '(717) 614-2772', '9545 Pfeffer Vista\nJosiahberg, WY 96334-5410', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'uz1vZix46G', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(167, 'Brady Johns DVM', 'swaniawski.susanna', 'dicki.willa@example.com', 'https://via.placeholder.com/70x70.png/003300?text=atque', '830-581-7571', '923 Langworth Square Suite 630\nEast Cornell, NJ 50852', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'BpECs3vExQ', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(168, 'Prof. Jack Watsica', 'akozey', 'swaniawski.eino@example.com', 'https://via.placeholder.com/70x70.png/005555?text=quibusdam', '419.236.2845', '11235 Tara Ridges Suite 838\nPort Adrian, ME 72916', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'dpIv6IdnlB', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(169, 'Dr. Cristian Heller', 'kellie96', 'khintz@example.org', 'https://via.placeholder.com/70x70.png/004422?text=repudiandae', '+1-502-796-1038', '34326 Tamara Streets\nPort Brendanberg, MI 03941-7375', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'Ikv11dYafD', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(170, 'Wallace Sawayn', 'buddy18', 'rice.coty@example.com', 'https://via.placeholder.com/70x70.png/0088bb?text=ut', '(570) 632-8143', '32994 Ferry Ports Apt. 706\nNew Isidro, NJ 56191-8996', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'GkTNNECFS9', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(171, 'Thad Wolf', 'jsanford', 'gregg.schiller@example.org', 'https://via.placeholder.com/70x70.png/003355?text=in', '+1.816.991.4509', '67419 Bette Forges Suite 991\nSouth Yolandabury, MA 49842', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'll3UhSv8rx', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(172, 'Mike Kirlin', 'strosin.amiya', 'vokeefe@example.net', 'https://via.placeholder.com/70x70.png/00ee22?text=non', '+1.256.740.0229', '23993 Monroe Bridge Suite 018\nLake Ole, SC 17519-9070', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'L5aVq7Cl5Z', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(173, 'Dr. Shania Wilkinson IV', 'bpaucek', 'jace.cassin@example.net', 'https://via.placeholder.com/70x70.png/0088dd?text=at', '1-559-716-8403', '95028 Schuyler Mill Apt. 777\nPort Busterside, ID 51195-7185', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'xIIspnzLyU', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(174, 'Friedrich Mertz', 'mariano.parker', 'marianne.little@example.com', 'https://via.placeholder.com/70x70.png/00ee55?text=quisquam', '+1-608-218-5084', '9676 Willms Loop\nRomaguerastad, CA 14990-3378', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'qhLdQdcZSK', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(175, 'Althea Hoppe', 'aschultz', 'lacey.breitenberg@example.org', 'https://via.placeholder.com/70x70.png/005511?text=et', '361.328.3362', '7003 Breitenberg Ramp\nWest Petermouth, MN 26333', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'WGDDi1CMg6', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(176, 'Miss Lacey Keeling', 'zdavis', 'arianna.dubuque@example.org', 'https://via.placeholder.com/70x70.png/00ddcc?text=dolor', '+1-308-364-5396', '125 Kilback Grove Suite 359\nSouth Jermeychester, SD 91190-4138', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'o6o4R5ydCt', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(177, 'Ferne Bechtelar', 'dubuque.remington', 'kelley08@example.net', 'https://via.placeholder.com/70x70.png/003311?text=rem', '(630) 422-0220', '82617 Kub Curve\nEast Carrieside, IL 70788', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'co5HtWHOmy', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(178, 'Hanna Weissnat Jr.', 'hwilliamson', 'hermann.solon@example.org', 'https://via.placeholder.com/70x70.png/00dd88?text=sed', '813-656-7130', '467 Milo Light Apt. 124\nKimchester, AZ 87403-3824', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'yWT9u2nUBx', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(179, 'Dwight Rau', 'okeefe.evan', 'viola50@example.net', 'https://via.placeholder.com/70x70.png/00eeaa?text=consequatur', '1-559-873-0020', '3613 Malvina Lakes Apt. 046\nHowellland, OK 96572-9112', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'fJCnstuneD', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(180, 'Osborne Roberts', 'rowena66', 'gbeahan@example.org', 'https://via.placeholder.com/70x70.png/008855?text=quibusdam', '+1-727-913-1632', '35625 Jones Summit Suite 516\nKuhlmanchester, MS 02564', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'bVrfFhjvU2', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(181, 'Ms. Myrtle Gottlieb IV', 'magdalena.fritsch', 'jwuckert@example.com', 'https://via.placeholder.com/70x70.png/00ff77?text=velit', '(920) 950-6679', '2797 Stark Road\nKarianeshire, IL 25816-4837', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', '74w2c9J6mv', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(182, 'Prof. Maudie Crist', 'oortiz', 'velva.zemlak@example.org', 'https://via.placeholder.com/70x70.png/0055bb?text=unde', '(856) 619-7756', '528 Gretchen Courts\nNew Jerodfurt, ID 42549-1802', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'active', 'txetNZIz7F', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(183, 'Alaina Bahringer II', 'lysanne93', 'major63@example.org', 'https://via.placeholder.com/70x70.png/000066?text=ipsam', '(763) 415-6880', '694 Sanford Village Apt. 341\nBeierstad, VT 48031-0464', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'pPQLV9lnC9', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(184, 'Gabriella Witting', 'tianna47', 'ostehr@example.com', 'https://via.placeholder.com/70x70.png/006611?text=quis', '567.725.1022', '286 Simonis Path Suite 797\nSalvadorshire, ID 85835-5979', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'xrdWPO0hP6', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(185, 'Myrl Stehr', 'preichel', 'luther.shanahan@example.com', 'https://via.placeholder.com/70x70.png/00ccbb?text=aut', '1-650-951-5366', '57547 Johanna Coves Suite 263\nPort Vern, VT 09262-3243', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'inactive', 'pm1JFVA6aw', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(186, 'Mr. Raphael Hickle', 'grayson66', 'randall87@example.net', 'https://via.placeholder.com/70x70.png/003399?text=est', '(240) 567-8539', '5425 Kreiger Forges\nNew Florine, CT 31479-1802', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', '44T2T951Cd', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(187, 'Prof. Reba Smitham DVM', 'carmelo04', 'branson09@example.net', 'https://via.placeholder.com/70x70.png/009922?text=officiis', '+15676100760', '1674 Romaine Stravenue Suite 964\nPort Ariland, CT 28831', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'sH3kHgBkCK', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(188, 'Dr. Marian DuBuque V', 'lmitchell', 'christiansen.magali@example.net', 'https://via.placeholder.com/70x70.png/00dd77?text=deleniti', '(817) 331-1923', '194 Waelchi Pass\nNew Valliemouth, UT 42266-6748', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'ko4riLknHj', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(189, 'Dr. Golda Hammes', 'wellington.oberbrunner', 'nikita.dickens@example.com', 'https://via.placeholder.com/70x70.png/001155?text=deserunt', '1-510-364-7601', '3626 Irwin Flat\nMaggiostad, NM 47592', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'u6eaf71JtE', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(190, 'Howard Lakin', 'shea82', 'jarmstrong@example.net', 'https://via.placeholder.com/70x70.png/007799?text=iure', '+1-857-520-2123', '11143 Streich Summit\nJamalshire, CT 24145', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'RHbw0zQCCm', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(191, 'Julian Schaden', 'durgan.isobel', 'anitzsche@example.com', 'https://via.placeholder.com/70x70.png/008844?text=nihil', '351-458-4236', '746 Brad Ports Suite 766\nTiannaborough, ND 30594-0829', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'ZnXWq0x9ZR', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(192, 'Dr. Sierra Koss Sr.', 'fchristiansen', 'oswaldo.johns@example.net', 'https://via.placeholder.com/70x70.png/004477?text=repellendus', '(838) 701-4796', '99372 Denesik Road\nLake Jefferyton, CT 93761-3832', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'QAUe8Hub7W', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(193, 'Robbie Kessler', 'corkery.keeley', 'tlakin@example.net', 'https://via.placeholder.com/70x70.png/003344?text=vitae', '+1-279-930-1489', '801 Lesch Ports\nLake Sienna, ME 35914', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'vhTcGRFn6L', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(194, 'Coty Schmeler MD', 'ollie.predovic', 'vandervort.stacey@example.com', 'https://via.placeholder.com/70x70.png/006655?text=omnis', '1-240-906-5242', '8275 Trenton Mission Apt. 969\nClintstad, CT 60647-4343', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'qTRVtfamya', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(195, 'Dr. Norberto Conroy Jr.', 'cristian29', 'annette78@example.net', 'https://via.placeholder.com/70x70.png/0077aa?text=at', '331.391.1346', '4888 Mathias Flat\nNorth Cierra, NY 34710', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'x9VU6NYnKJ', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(196, 'Haylie Satterfield DVM', 'mariane58', 'eduardo.kling@example.com', 'https://via.placeholder.com/70x70.png/007700?text=dolor', '+12404626285', '2600 Bauch Walk\nKirabury, KY 31307-0331', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', 'awX7ppyoGT', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(197, 'Jorge Gorczany Jr.', 'damon.zulauf', 'fidel27@example.com', 'https://via.placeholder.com/70x70.png/00bb00?text=laboriosam', '(680) 454-4404', '158 Smith Pine Apt. 832\nDorcasport, CT 56509-0722', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'active', '8R5ul4Y3Oe', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(199, 'Judy Kirlin', 'kaci25', 'dhyatt@example.com', 'https://via.placeholder.com/70x70.png/003311?text=expedita', '+19799616479', '4026 Will Neck Apt. 762\nPort Corinefort, NV 56555', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user', NULL, NULL, 'inactive', 'oh1HmiUz01', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(200, 'Camilla White PhD', 'joe29', 'turner.sydney@example.com', 'https://via.placeholder.com/70x70.png/009944?text=dolorem', '+1-386-815-8488', '50789 Eliane Mills Apt. 829\nLake Deondreville, AZ 31282', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NULL, NULL, 'active', 'sJQcldANvK', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(201, 'Francisco Tillman', 'braxton.boyle', 'darlene20@example.com', 'https://via.placeholder.com/70x70.png/0022bb?text=quo', '+1.726.509.1239', '26255 Runte Fields\nSouth Cristobal, OH 20525', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', 'XNSP2SPFd0', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(203, 'Bessie Pouros', 'tyrell01', 'cecile20@example.net', 'https://via.placeholder.com/70x70.png/008844?text=consectetur', '+1.872.963.5456', '786 Ophelia Union\nSouth Earlfort, DE 99928', '2023-10-03 13:23:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vendor', NULL, NULL, 'inactive', '6v5mFwDhtv', '2023-10-03 13:23:45', '2023-10-03 13:23:45'),
(204, 'Daraz', NULL, 'daraz@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$9z0UqiNcLKvb/Jtx.SZwKupE1mK7u9KAd45qH4O0/X/EskIU5iizS', 'user', NULL, NULL, 'active', NULL, '2023-10-04 06:09:14', '2023-10-04 06:09:14'),
(205, 'Amjad_Store', NULL, 'amjad@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$7P.Wq/t1UaGARye3UU55YOYUWSCKSSDxsfo90FTUe6OAWKrPrFZHu', 'user', NULL, NULL, 'active', NULL, '2023-10-04 06:16:14', '2023-10-04 06:16:14'),
(207, 'Amjad_Store', NULL, 'amjad2@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$yfxnamuGOfIR7Rrd03gil.ITxYosxcEUJ7tWpDBA4J3xZqmvYclUC', 'user', NULL, NULL, 'active', NULL, '2023-10-04 06:21:38', '2023-10-04 06:21:38'),
(208, 'KamalStore', 'KamalStore', 'kamal@gmail.com', NULL, '0177959505', NULL, NULL, '$2y$10$3ZCsFSpJ8C9ZUl/b4gsA1.Ch/OSJyKZu5Rsmwbis4bO21QekQGmo2', 'vendor', '2024', NULL, 'inactive', NULL, NULL, NULL),
(209, 'Amir Hossain333', 'amir', 'amir@gmail.com', NULL, '01699538961', 'banasree', NULL, '$2y$10$pe9NffOTSg0z4TKv/d..aOJxV5M061iQzA7eRPzPwz3n/7wwh.816', 'vendor', '2024', NULL, 'inactive', NULL, NULL, '2023-10-06 02:27:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi__imgs`
--
ALTER TABLE `multi__imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `multi__imgs`
--
ALTER TABLE `multi__imgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
