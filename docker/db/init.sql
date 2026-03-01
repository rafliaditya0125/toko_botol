-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 28, 2026 at 12:25 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_toko`
--
CREATE DATABASE IF NOT EXISTS `kasir_toko` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `kasir_toko`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_lengkap` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', '$2y$12$Ph5lwSGt/fkmt3/dYcVpJOyraWWO3Tt71uOmtjt0zwwQfFnmBT8b6', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `id` int NOT NULL,
  `nama_cabang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`id`, `nama_cabang`, `alamat`) VALUES
(1, 'KONTER', 'Jl. Mangin, Terminal Indihiang'),
(2, 'CIKURUBUK', 'Jl. Pasar Cikurubuk'),
(3, 'SL.TOBING', 'Jl. SL.Tobing'),
(4, 'GUDANG', '');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `batch` int NOT NULL DEFAULT '1',
  `executed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`, `executed_at`) VALUES
(1, '2026_02_24_000001_create_admin_table.php', 1, '2026-02-28 04:57:29'),
(2, '2026_02_24_000002_create_cabang_table.php', 1, '2026-02-28 04:57:29'),
(3, '2026_02_24_000003_create_produk_table.php', 1, '2026-02-28 04:57:29'),
(4, '2026_02_24_000004_create_pengeluaran_table.php', 1, '2026-02-28 04:57:29'),
(5, '2026_02_24_000005_create_session_kasir_table.php', 1, '2026-02-28 04:57:29'),
(6, '2026_02_24_000006_create_riwayat_login_kasir_table.php', 1, '2026-02-28 04:57:29'),
(7, '2026_02_24_000007_create_stok_cabang_table.php', 1, '2026-02-28 04:57:29'),
(8, '2026_02_24_000008_create_stok_masuk_table.php', 1, '2026-02-28 04:57:29'),
(9, '2026_02_24_000009_create_stok_keluar_table.php', 1, '2026-02-28 04:57:29'),
(10, '2026_02_24_000010_create_stock_opname_table.php', 1, '2026-02-28 04:57:29'),
(11, '2026_02_24_000011_create_transaksi_header_table.php', 1, '2026-02-28 04:57:29'),
(12, '2026_02_24_000012_create_transaksi_detail_table.php', 1, '2026-02-28 04:57:29'),
(13, '2026_02_26_000001_create_trigger_sync_stok_gudang.php', 1, '2026-02-28 04:57:29'),
(14, '2026_02_28_000001_add_botol_perdus_and_pengeluaran_softdelete.php', 2, '2026-02-28 06:44:26'),
(15, '2026_02_28_000002_create_setoran_table.php', 3, '2026-02-28 12:25:07'),
(16, '2026_02_28_000003_add_sudah_disetor_column_to_transaksi_header_table.php', 3, '2026-02-28 12:25:07'),
(17, '2026_02_28_000004_modify_setoran_table_allow_null_cabang.php', 3, '2026-02-28 12:25:07');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int NOT NULL,
  `nominal` int NOT NULL DEFAULT '0',
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id`, `nominal`, `keterangan`, `created_at`, `deleted_at`) VALUES
(1, 140000, 'DUSAN 56 BTL', '2026-02-28 05:43:13', NULL),
(2, 20000, 'POLRES', '2026-02-28 05:43:39', NULL),
(3, 20000, 'POLSEK', '2026-02-28 05:43:46', NULL),
(4, 50000, 'ROKOK BAPA', '2026-02-28 05:44:01', NULL),
(5, 100000, 'WIFI RUMAH', '2026-02-28 05:44:15', NULL),
(6, 80000, 'DUSAN 32 BTL', '2026-02-28 05:53:36', NULL),
(7, 40000, 'POLRES, POLSEK', '2026-02-28 05:53:57', NULL),
(8, 25000, 'BENSIN', '2026-02-28 05:54:10', NULL),
(9, 50000, 'ROKOK BAPA', '2026-02-28 05:54:22', NULL),
(10, 100000, 'TOKEN KONTER', '2026-02-28 05:54:42', NULL),
(11, 180000, 'DUSAN 72 BTL', '2026-02-28 06:05:54', NULL),
(12, 40000, 'POLRES, POLSEK', '2026-02-28 06:06:20', NULL),
(13, 70000, 'BELI LELE + BUMBU', '2026-02-28 06:06:48', NULL),
(14, 10000, 'BENSIN', '2026-02-28 06:07:03', NULL),
(15, 50000, 'ROKOK BAPA', '2026-02-28 06:07:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int NOT NULL,
  `kode_produk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_produk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `satuan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'botol',
  `botol_perdus` int NOT NULL DEFAULT '12',
  `harga_beli` int NOT NULL DEFAULT '0',
  `stok_gudang` int NOT NULL DEFAULT '0',
  `status` enum('active','deleted') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode_produk`, `nama_produk`, `satuan`, `botol_perdus`, `harga_beli`, `stok_gudang`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'AGK', 'AG KAKAKTUA', 'botol', 12, 45000, 34, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:14:46'),
(2, 'ARCIL', 'ARCIL', 'botol', 24, 30000, 103, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 15:11:19'),
(3, 'BB', 'BINTANG', 'botol', 12, 35000, 66, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 13:00:47'),
(4, 'DB', 'DRUM BESAR', 'botol', 12, 146000, 14, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:15:13'),
(5, 'DK', 'DRUM KECIL', 'botol', 12, 75000, 17, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:15:27'),
(6, 'AOB', 'AOB', 'botol', 12, 60000, 110, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 13:04:39'),
(7, 'AM', 'AM', 'botol', 12, 60000, 123, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 13:00:47'),
(8, 'KMPT', 'KAMPUT', 'botol', 12, 55000, 37, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:12:26'),
(9, 'KH', 'KH', 'botol', 12, 69000, 83, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 13:01:01'),
(10, 'BH', 'GUINNES', 'botol', 12, 45000, 54, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:12:26'),
(11, 'ATLAS', 'ATLAS', 'botol', 12, 62000, 53, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 13:04:39'),
(12, 'IBC', 'INTISARI BC', 'botol', 12, 60000, 22, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:51:21'),
(13, 'ICB', 'ICB', 'botol', 12, 105000, 18, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:16:01'),
(14, 'INTI', 'INTISARI', 'botol', 12, 45000, 43, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 13:00:47'),
(15, 'JKR', 'JOKER', 'botol', 12, 62000, 12, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:16:20'),
(16, 'API', 'API', 'botol', 12, 69000, 7, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:16:33'),
(17, 'AOM', 'AO MILD', 'botol', 12, 60000, 25, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:41:04'),
(18, 'VIBE', 'VIBE', 'botol', 12, 250000, 1, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:17:06'),
(19, 'CM', 'C. MORGAN', 'botol', 12, 280000, 5, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:17:21'),
(20, 'AP', 'AP', 'botol', 12, 58000, 20, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:17:35'),
(21, 'AGP', 'AG PREMIUM', 'botol', 12, 41000, 30, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 13:04:39'),
(22, 'PROST', 'PROST', 'botol', 12, 25000, 60, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:52:07'),
(23, 'KWBC', 'KWBC', 'botol', 12, 64000, 60, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 12:18:17'),
(24, 'AG', 'AG', 'botol', 12, 35500, 1098, 'active', NULL, '2026-02-28 11:57:29', '2026-02-28 13:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_login_kasir`
--

CREATE TABLE `riwayat_login_kasir` (
  `id` int NOT NULL,
  `nama_kasir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cabang_id` int NOT NULL DEFAULT '0',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `riwayat_login_kasir`
--

INSERT INTO `riwayat_login_kasir` (`id`, `nama_kasir`, `cabang_id`, `login_time`) VALUES
(1, 'Rafli', 1, '2026-02-28 08:31:23'),
(2, 'Rafli', 1, '2026-02-28 08:32:44');

-- --------------------------------------------------------

--
-- Table structure for table `session_kasir`
--

CREATE TABLE `session_kasir` (
  `id` int NOT NULL,
  `nama_kasir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cabang_id` int NOT NULL DEFAULT '0',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_time` datetime DEFAULT NULL,
  `status` enum('login','logout') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'login'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_kasir`
--

INSERT INTO `session_kasir` (`id`, `nama_kasir`, `cabang_id`, `login_time`, `logout_time`, `status`) VALUES
(1, 'Rafli', 1, '2026-02-28 08:31:23', '2026-02-28 15:32:17', 'logout'),
(2, 'Rafli', 1, '2026-02-28 08:32:44', '2026-02-28 15:34:31', 'logout');

-- --------------------------------------------------------

--
-- Table structure for table `setoran`
--

CREATE TABLE `setoran` (
  `id` int NOT NULL,
  `cabang_id` int DEFAULT NULL,
  `total_setor` int NOT NULL DEFAULT '0',
  `tanggal_dari` date NOT NULL,
  `tanggal_sampai` date NOT NULL,
  `keterangan` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname`
--

CREATE TABLE `stock_opname` (
  `id` int NOT NULL,
  `produk_id` int NOT NULL DEFAULT '0',
  `stok_sistem` int NOT NULL DEFAULT '0',
  `stok_fisik` int NOT NULL DEFAULT '0',
  `selisih` int NOT NULL DEFAULT '0',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'HILANG',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `petugas` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stok_cabang`
--

CREATE TABLE `stok_cabang` (
  `id` int NOT NULL,
  `produk_id` int NOT NULL DEFAULT '0',
  `cabang_id` int NOT NULL DEFAULT '0',
  `stok` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_cabang`
--

INSERT INTO `stok_cabang` (`id`, `produk_id`, `cabang_id`, `stok`) VALUES
(1, 23, 4, 60),
(2, 22, 4, 56),
(3, 21, 4, 28),
(4, 20, 4, 20),
(5, 19, 4, 5),
(6, 18, 4, 1),
(7, 17, 4, 23),
(8, 16, 4, 7),
(9, 15, 4, 12),
(10, 14, 4, 40),
(11, 13, 4, 18),
(12, 11, 4, 48),
(13, 10, 4, 54),
(14, 9, 4, 80),
(15, 8, 4, 37),
(16, 7, 4, 116),
(17, 5, 4, 17),
(18, 4, 4, 14),
(19, 3, 4, 65),
(20, 2, 4, 98),
(21, 1, 4, 34),
(22, 24, 4, 1074),
(23, 6, 4, 95),
(24, 12, 4, 20),
(25, 24, 1, 7),
(26, 21, 1, 0),
(27, 2, 1, 5),
(28, 14, 1, 3),
(29, 7, 1, 0),
(30, 6, 1, 7),
(31, 11, 1, 3),
(32, 9, 1, 0),
(33, 3, 1, 1),
(34, 24, 2, 9),
(35, 6, 2, 4),
(36, 21, 2, 2),
(37, 11, 2, 2),
(38, 17, 2, 2),
(39, 7, 2, 4),
(40, 22, 2, 4),
(41, 24, 3, 8),
(42, 6, 3, 4),
(43, 7, 3, 3),
(44, 9, 3, 3),
(45, 12, 1, 2);

--
-- Triggers `stok_cabang`
--
DELIMITER $$
CREATE TRIGGER `sync_stok_after_delete` AFTER DELETE ON `stok_cabang` FOR EACH ROW BEGIN
                UPDATE produk
                SET stok_gudang = (
                    SELECT COALESCE(SUM(stok), 0)
                    FROM stok_cabang
                    WHERE produk_id = OLD.produk_id
                )
                WHERE id = OLD.produk_id;
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sync_stok_after_insert` AFTER INSERT ON `stok_cabang` FOR EACH ROW BEGIN
                UPDATE produk
                SET stok_gudang = (
                    SELECT COALESCE(SUM(stok), 0)
                    FROM stok_cabang
                    WHERE produk_id = NEW.produk_id
                )
                WHERE id = NEW.produk_id;
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sync_stok_after_update` AFTER UPDATE ON `stok_cabang` FOR EACH ROW BEGIN
                UPDATE produk
                SET stok_gudang = (
                    SELECT COALESCE(SUM(stok), 0)
                    FROM stok_cabang
                    WHERE produk_id = NEW.produk_id
                )
                WHERE id = NEW.produk_id;
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stok_keluar`
--

CREATE TABLE `stok_keluar` (
  `id` int NOT NULL,
  `produk_id` int NOT NULL DEFAULT '0',
  `jumlah` int NOT NULL DEFAULT '0',
  `kondisi` enum('rusak','transfer') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cabang_asal` int DEFAULT NULL,
  `cabang_tujuan` int DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `batch_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_keluar`
--

INSERT INTO `stok_keluar` (`id`, `produk_id`, `jumlah`, `kondisi`, `cabang_asal`, `cabang_tujuan`, `keterangan`, `batch_id`, `created_at`) VALUES
(1, 24, 36, 'transfer', 4, 1, '', 'ST-20260228-2446', '2026-02-28 05:24:26'),
(2, 21, 5, 'transfer', 4, 1, '', 'ST-20260228-2446', '2026-02-28 05:24:26'),
(3, 2, 5, 'transfer', 4, 1, '', 'ST-20260228-2446', '2026-02-28 05:24:26'),
(4, 14, 5, 'transfer', 4, 1, '', 'ST-20260228-2446', '2026-02-28 05:24:26'),
(5, 7, 3, 'transfer', 4, 1, '', 'ST-20260228-2446', '2026-02-28 05:24:26'),
(6, 6, 3, 'transfer', 4, 1, '', 'ST-20260228-2446', '2026-02-28 05:24:26'),
(7, 11, 6, 'transfer', 4, 1, '', 'ST-20260228-2446', '2026-02-28 05:24:26'),
(8, 9, 6, 'transfer', 4, 1, '', 'ST-20260228-2446', '2026-02-28 05:24:26'),
(9, 3, 4, 'transfer', 4, 1, '', 'ST-20260228-2446', '2026-02-28 05:24:26'),
(10, 24, 24, 'transfer', 4, 2, '', 'ST-20260228-7329', '2026-02-28 05:26:59'),
(11, 6, 6, 'transfer', 4, 2, '', 'ST-20260228-7329', '2026-02-28 05:26:59'),
(12, 21, 4, 'transfer', 4, 2, '', 'ST-20260228-7329', '2026-02-28 05:26:59'),
(13, 11, 5, 'transfer', 4, 2, '', 'ST-20260228-7329', '2026-02-28 05:26:59'),
(14, 17, 3, 'transfer', 4, 2, '', 'ST-20260228-7329', '2026-02-28 05:26:59'),
(15, 7, 5, 'transfer', 4, 2, '', 'ST-20260228-7329', '2026-02-28 05:26:59'),
(16, 22, 6, 'transfer', 4, 2, '', 'ST-20260228-7329', '2026-02-28 05:26:59'),
(17, 24, 12, 'transfer', 4, 3, '', 'ST-20260228-7605', '2026-02-28 05:28:10'),
(18, 6, 6, 'transfer', 4, 3, '', 'ST-20260228-7605', '2026-02-28 05:28:10'),
(19, 7, 3, 'transfer', 4, 3, '', 'ST-20260228-7605', '2026-02-28 05:28:10'),
(20, 9, 3, 'transfer', 4, 3, '', 'ST-20260228-7605', '2026-02-28 05:28:10'),
(21, 12, 4, 'transfer', 4, 1, '', 'ST-20260228-1606', '2026-02-28 05:29:59'),
(22, 2, 6, 'transfer', 4, 1, '', 'ST-20260228-1606', '2026-02-28 05:29:59'),
(23, 11, 4, 'transfer', 4, 1, '', 'ST-20260228-1606', '2026-02-28 05:29:59'),
(24, 24, 24, 'transfer', 4, 1, '', 'ST-20260228-1606', '2026-02-28 05:29:59'),
(25, 6, 10, 'transfer', 4, 1, '', 'ST-20260228-1119', '2026-02-28 05:38:48'),
(26, 24, 30, 'transfer', 4, 1, '', 'ST-20260228-8506', '2026-02-28 05:56:26'),
(27, 14, 5, 'transfer', 4, 1, '', 'ST-20260228-6292', '2026-02-28 05:59:03');

-- --------------------------------------------------------

--
-- Table structure for table `stok_masuk`
--

CREATE TABLE `stok_masuk` (
  `id` int NOT NULL,
  `produk_id` int NOT NULL DEFAULT '0',
  `jumlah` int NOT NULL DEFAULT '0',
  `harga_beli_satuan` int NOT NULL DEFAULT '0',
  `harga_perdus` int NOT NULL DEFAULT '0',
  `total_belanja` int NOT NULL DEFAULT '0',
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `batch_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_masuk`
--

INSERT INTO `stok_masuk` (`id`, `produk_id`, `jumlah`, `harga_beli_satuan`, `harga_perdus`, `total_belanja`, `keterangan`, `batch_id`, `created_at`) VALUES
(1, 23, 60, 64000, 768000, 3840000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(2, 22, 62, 25000, 300000, 1550000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(3, 21, 37, 41000, 492000, 1517000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(4, 20, 20, 58000, 696000, 1160000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(5, 19, 5, 280000, 3360000, 1400000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(6, 18, 1, 250000, 3000000, 250000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(7, 17, 26, 60000, 720000, 1560000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(8, 16, 7, 69000, 828000, 483000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(9, 15, 12, 62000, 744000, 744000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(10, 14, 2, 45000, 540000, 90000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(11, 13, 18, 105000, 1260000, 1890000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(12, 11, 3, 62000, 744000, 186000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(13, 10, 18, 45000, 540000, 810000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(14, 9, 5, 69000, 828000, 345000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(15, 8, 1, 55000, 660000, 55000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(16, 7, 7, 60000, 720000, 420000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(17, 5, 17, 75000, 900000, 1275000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(18, 4, 14, 146000, 1752000, 2044000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(19, 3, 9, 35000, 420000, 315000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(20, 2, 37, 30000, 720000, 1110000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(21, 1, 34, 45000, 540000, 1530000, '', 'SM-20260228-9574', '2026-02-28 05:03:22'),
(22, 24, 1200, 425000, 425000, 42500000, '', 'SM-20260228-6899', '2026-02-28 05:12:26'),
(23, 6, 120, 720000, 720000, 7200000, '', 'SM-20260228-6899', '2026-02-28 05:12:26'),
(24, 2, 72, 30000, 720000, 2160000, '', 'SM-20260228-6899', '2026-02-28 05:12:26'),
(25, 7, 120, 60000, 720000, 7200000, '', 'SM-20260228-6899', '2026-02-28 05:12:26'),
(26, 14, 48, 45000, 530000, 2120000, '', 'SM-20260228-6899', '2026-02-28 05:12:26'),
(27, 12, 24, 60000, 725000, 1450000, '', 'SM-20260228-6899', '2026-02-28 05:12:26'),
(28, 9, 84, 67916, 815000, 5705000, '', 'SM-20260228-6899', '2026-02-28 05:12:26'),
(29, 8, 36, 55000, 660000, 1980000, '', 'SM-20260228-6899', '2026-02-28 05:12:26'),
(30, 3, 60, 35000, 421000, 2105000, '', 'SM-20260228-6899', '2026-02-28 05:12:26'),
(31, 10, 36, 45000, 531000, 1593000, '', 'SM-20260228-6899', '2026-02-28 05:12:26'),
(32, 11, 60, 62000, 745000, 3725000, '', 'SM-20260228-6899', '2026-02-28 05:12:26');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id` int NOT NULL,
  `transaksi_header_id` int NOT NULL DEFAULT '0',
  `no_invoice` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `produk_id` int NOT NULL DEFAULT '0',
  `nama_produk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah` int NOT NULL DEFAULT '0',
  `satuan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'botol',
  `harga_satuan` int NOT NULL DEFAULT '0',
  `subtotal` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id`, `transaksi_header_id`, `no_invoice`, `produk_id`, `nama_produk`, `jumlah`, `satuan`, `harga_satuan`, `subtotal`, `created_at`) VALUES
(1, 1, 'INV-20260228-1519', 24, 'AG', 17, 'botol', 50000, 850000, '2026-02-28 05:36:28'),
(2, 1, 'INV-20260228-1519', 21, 'AG PREMIUM', 1, 'botol', 55000, 55000, '2026-02-28 05:36:28'),
(3, 1, 'INV-20260228-1519', 6, 'AOB', 1, 'botol', 80000, 80000, '2026-02-28 05:36:28'),
(4, 1, 'INV-20260228-1519', 11, 'ATLAS', 1, 'botol', 90000, 90000, '2026-02-28 05:36:28'),
(5, 1, 'INV-20260228-1519', 7, 'AM', 1, 'botol', 80000, 80000, '2026-02-28 05:36:28'),
(6, 1, 'INV-20260228-1519', 12, 'INTISARI BC', 1, 'botol', 80000, 80000, '2026-02-28 05:36:28'),
(7, 1, 'INV-20260228-1519', 14, 'INTISARI', 2, 'botol', 60000, 120000, '2026-02-28 05:36:28'),
(8, 1, 'INV-20260228-1519', 2, 'ARCIL', 1, 'botol', 40000, 40000, '2026-02-28 05:36:28'),
(9, 2, 'INV-20260228-2649', 24, 'AG', 6, 'botol', 42500, 255000, '2026-02-28 05:36:59'),
(10, 3, 'INV-20260228-6119', 24, 'AG', 1, 'dus', 500000, 500000, '2026-02-28 05:39:59'),
(11, 3, 'INV-20260228-6119', 24, 'AG', 6, 'botol', 42000, 252000, '2026-02-28 05:39:59'),
(12, 3, 'INV-20260228-6119', 6, 'AOB', 3, 'botol', 70000, 210000, '2026-02-28 05:39:59'),
(13, 4, 'INV-20260228-5650', 7, 'AM', 1, 'botol', 70000, 70000, '2026-02-28 05:41:04'),
(14, 4, 'INV-20260228-5650', 11, 'ATLAS', 1, 'botol', 75000, 75000, '2026-02-28 05:41:04'),
(15, 4, 'INV-20260228-5650', 17, 'AO MILD', 1, 'botol', 70000, 70000, '2026-02-28 05:41:04'),
(16, 4, 'INV-20260228-5650', 22, 'PROST', 1, 'botol', 35000, 35000, '2026-02-28 05:41:04'),
(17, 5, 'INV-20260228-6335', 24, 'AG', 6, 'botol', 50000, 300000, '2026-02-28 05:49:40'),
(18, 5, 'INV-20260228-6335', 21, 'AG PREMIUM', 1, 'botol', 65000, 65000, '2026-02-28 05:49:40'),
(19, 6, 'INV-20260228-5473', 21, 'AG PREMIUM', 2, 'botol', 60000, 120000, '2026-02-28 05:51:21'),
(20, 6, 'INV-20260228-5473', 14, 'INTISARI', 2, 'botol', 60000, 120000, '2026-02-28 05:51:21'),
(21, 6, 'INV-20260228-5473', 2, 'ARCIL', 3, 'botol', 40000, 120000, '2026-02-28 05:51:21'),
(22, 6, 'INV-20260228-5473', 6, 'AOB', 1, 'botol', 80000, 80000, '2026-02-28 05:51:21'),
(23, 6, 'INV-20260228-5473', 9, 'KH', 1, 'botol', 90000, 90000, '2026-02-28 05:51:21'),
(24, 6, 'INV-20260228-5473', 7, 'AM', 1, 'botol', 80000, 80000, '2026-02-28 05:51:21'),
(25, 6, 'INV-20260228-5473', 12, 'INTISARI BC', 1, 'botol', 80000, 80000, '2026-02-28 05:51:21'),
(26, 6, 'INV-20260228-5473', 11, 'ATLAS', 1, 'botol', 90000, 90000, '2026-02-28 05:51:21'),
(27, 6, 'INV-20260228-5473', 3, 'BINTANG', 1, 'botol', 50000, 50000, '2026-02-28 05:51:21'),
(28, 6, 'INV-20260228-5473', 24, 'AG', 6, 'botol', 42500, 255000, '2026-02-28 05:51:21'),
(29, 7, 'INV-20260228-6866', 24, 'AG', 3, 'botol', 42000, 126000, '2026-02-28 05:52:07'),
(30, 7, 'INV-20260228-6866', 22, 'PROST', 1, 'botol', 35000, 35000, '2026-02-28 05:52:07'),
(31, 8, 'INV-20260228-2408', 6, 'AOB', 2, 'botol', 80000, 160000, '2026-02-28 05:52:25'),
(32, 9, 'INV-20260228-3667', 24, 'AG', 12, 'botol', 50000, 600000, '2026-02-28 05:58:42'),
(33, 9, 'INV-20260228-3667', 24, 'AG', 1, 'dus', 500000, 500000, '2026-02-28 05:58:42'),
(34, 9, 'INV-20260228-3667', 21, 'AG PREMIUM', 1, 'botol', 65000, 65000, '2026-02-28 05:58:42'),
(35, 9, 'INV-20260228-3667', 2, 'ARCIL', 2, 'botol', 40000, 80000, '2026-02-28 05:58:42'),
(36, 10, 'INV-20260228-2156', 14, 'INTISARI', 3, 'botol', 60000, 180000, '2026-02-28 06:00:47'),
(37, 10, 'INV-20260228-2156', 7, 'AM', 1, 'botol', 80000, 80000, '2026-02-28 06:00:47'),
(38, 10, 'INV-20260228-2156', 6, 'AOB', 1, 'botol', 80000, 80000, '2026-02-28 06:00:47'),
(39, 10, 'INV-20260228-2156', 11, 'ATLAS', 2, 'botol', 90000, 180000, '2026-02-28 06:00:47'),
(40, 10, 'INV-20260228-2156', 9, 'KH', 1, 'botol', 90000, 90000, '2026-02-28 06:00:47'),
(41, 10, 'INV-20260228-2156', 3, 'BINTANG', 2, 'botol', 50000, 100000, '2026-02-28 06:00:47'),
(42, 11, 'INV-20260228-4357', 9, 'KH', 4, 'botol', 80000, 320000, '2026-02-28 06:01:01'),
(43, 12, 'INV-20260228-6084', 11, 'ATLAS', 3, 'botol', 75000, 225000, '2026-02-28 06:02:24'),
(44, 12, 'INV-20260228-6084', 24, 'AG', 6, 'botol', 42500, 255000, '2026-02-28 06:02:24'),
(45, 13, 'INV-20260228-8443', 24, 'AG', 1, 'dus', 500000, 500000, '2026-02-28 06:04:39'),
(46, 13, 'INV-20260228-8443', 6, 'AOB', 2, 'botol', 70000, 140000, '2026-02-28 06:04:39'),
(47, 13, 'INV-20260228-8443', 21, 'AG PREMIUM', 2, 'botol', 55000, 110000, '2026-02-28 06:04:39'),
(48, 13, 'INV-20260228-8443', 11, 'ATLAS', 2, 'botol', 75000, 150000, '2026-02-28 06:04:39'),
(49, 14, 'INV-20260228-3021', 24, 'AG', 4, 'botol', 50000, 200000, '2026-02-28 06:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_header`
--

CREATE TABLE `transaksi_header` (
  `id` int NOT NULL,
  `no_invoice` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cabang_id` int NOT NULL DEFAULT '0',
  `session_kasir_id` int DEFAULT NULL,
  `nama_kasir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total_items` int DEFAULT '0',
  `total_harga` int NOT NULL DEFAULT '0',
  `sudah_disetor` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_header`
--

INSERT INTO `transaksi_header` (`id`, `no_invoice`, `cabang_id`, `session_kasir_id`, `nama_kasir`, `total_items`, `total_harga`, `sudah_disetor`, `created_at`) VALUES
(1, 'INV-20260228-1519', 1, NULL, 'PDK', 8, 1395000, 0, '2026-02-28 05:36:28'),
(2, 'INV-20260228-2649', 1, NULL, 'PDK', 1, 255000, 0, '2026-02-28 05:36:59'),
(3, 'INV-20260228-6119', 1, NULL, 'PDK', 3, 962000, 0, '2026-02-28 05:39:59'),
(4, 'INV-20260228-5650', 2, NULL, 'PDK', 4, 250000, 0, '2026-02-28 05:41:04'),
(5, 'INV-20260228-6335', 1, NULL, 'PDK', 2, 365000, 0, '2026-02-28 05:49:40'),
(6, 'INV-20260228-5473', 1, NULL, 'PDK', 10, 1085000, 0, '2026-02-28 05:51:21'),
(7, 'INV-20260228-6866', 2, NULL, 'PDK', 2, 161000, 0, '2026-02-28 05:52:07'),
(8, 'INV-20260228-2408', 3, NULL, 'PDK', 1, 160000, 0, '2026-02-28 05:52:25'),
(9, 'INV-20260228-3667', 1, NULL, 'PDK', 4, 1245000, 0, '2026-02-28 05:58:42'),
(10, 'INV-20260228-2156', 1, NULL, 'PDK', 6, 710000, 0, '2026-02-28 06:00:47'),
(11, 'INV-20260228-4357', 1, NULL, 'PDK', 1, 320000, 0, '2026-02-28 06:01:01'),
(12, 'INV-20260228-6084', 1, NULL, 'PDK', 2, 480000, 0, '2026-02-28 06:02:24'),
(13, 'INV-20260228-8443', 2, NULL, 'PDK', 4, 900000, 0, '2026-02-28 06:04:39'),
(14, 'INV-20260228-3021', 3, NULL, 'PDK', 1, 200000, 0, '2026-02-28 06:04:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_unique` (`username`);

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `migration_unique` (`migration`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_produk_unique` (`kode_produk`),
  ADD KEY `status_index` (`status`);

--
-- Indexes for table `riwayat_login_kasir`
--
ALTER TABLE `riwayat_login_kasir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cabang_id_index` (`cabang_id`);

--
-- Indexes for table `session_kasir`
--
ALTER TABLE `session_kasir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cabang_id_index` (`cabang_id`);

--
-- Indexes for table `setoran`
--
ALTER TABLE `setoran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cabang_id_index` (`cabang_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `stock_opname`
--
ALTER TABLE `stock_opname`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_id_index` (`produk_id`);

--
-- Indexes for table `stok_cabang`
--
ALTER TABLE `stok_cabang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `produk_cabang` (`produk_id`,`cabang_id`),
  ADD KEY `cabang_id_index` (`cabang_id`);

--
-- Indexes for table `stok_keluar`
--
ALTER TABLE `stok_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_id_index` (`produk_id`),
  ADD KEY `cabang_asal_index` (`cabang_asal`),
  ADD KEY `cabang_tujuan_index` (`cabang_tujuan`),
  ADD KEY `idx_batch_id` (`batch_id`);

--
-- Indexes for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_id_index` (`produk_id`),
  ADD KEY `idx_batch_id` (`batch_id`),
  ADD KEY `idx_total_belanja` (`total_belanja`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_header_id_index` (`transaksi_header_id`),
  ADD KEY `no_invoice_index` (`no_invoice`),
  ADD KEY `produk_id_index` (`produk_id`);

--
-- Indexes for table `transaksi_header`
--
ALTER TABLE `transaksi_header`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_invoice_unique` (`no_invoice`),
  ADD KEY `cabang_id_index` (`cabang_id`),
  ADD KEY `session_kasir_id_index` (`session_kasir_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cabang`
--
ALTER TABLE `cabang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `riwayat_login_kasir`
--
ALTER TABLE `riwayat_login_kasir`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `session_kasir`
--
ALTER TABLE `session_kasir`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `setoran`
--
ALTER TABLE `setoran`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_opname`
--
ALTER TABLE `stock_opname`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_cabang`
--
ALTER TABLE `stok_cabang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `stok_keluar`
--
ALTER TABLE `stok_keluar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `transaksi_header`
--
ALTER TABLE `transaksi_header`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `riwayat_login_kasir`
--
ALTER TABLE `riwayat_login_kasir`
  ADD CONSTRAINT `riwayat_login_kasir_cabang_id_foreign` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `session_kasir`
--
ALTER TABLE `session_kasir`
  ADD CONSTRAINT `session_kasir_cabang_id_foreign` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `setoran`
--
ALTER TABLE `setoran`
  ADD CONSTRAINT `setoran_cabang_id_foreign` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `stock_opname`
--
ALTER TABLE `stock_opname`
  ADD CONSTRAINT `stock_opname_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `stok_cabang`
--
ALTER TABLE `stok_cabang`
  ADD CONSTRAINT `stok_cabang_cabang_id_foreign` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stok_cabang_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stok_keluar`
--
ALTER TABLE `stok_keluar`
  ADD CONSTRAINT `stok_keluar_cabang_asal_foreign` FOREIGN KEY (`cabang_asal`) REFERENCES `cabang` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `stok_keluar_cabang_tujuan_foreign` FOREIGN KEY (`cabang_tujuan`) REFERENCES `cabang` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `stok_keluar_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  ADD CONSTRAINT `stok_masuk_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `transaksi_detail_transaksi_header_id_foreign` FOREIGN KEY (`transaksi_header_id`) REFERENCES `transaksi_header` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaksi_header`
--
ALTER TABLE `transaksi_header`
  ADD CONSTRAINT `transaksi_header_cabang_id_foreign` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `transaksi_header_session_kasir_id_foreign` FOREIGN KEY (`session_kasir_id`) REFERENCES `session_kasir` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
