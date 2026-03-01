SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+07:00";

-- Buat Database jika belum ada
CREATE DATABASE IF NOT EXISTS `kasir_toko` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `kasir_toko`;

-- --------------------------------------------------------
-- Table structure for table `admin`
-- --------------------------------------------------------
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin` (`id`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', '$2y$12$Ph5lwSGt/fkmt3/dYcVpJOyraWWO3Tt71uOmtjt0zwwQfFnmBT8b6', 'Admin');

-- --------------------------------------------------------
-- Table structure for table `cabang`
-- --------------------------------------------------------
CREATE TABLE `cabang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_cabang` varchar(50) NOT NULL,
  `alamat` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cabang` (`id`, `nama_cabang`, `alamat`) VALUES
(1, 'KONTER', 'Jl. Mangin, Terminal Indihiang'),
(2, 'CIKURUBUK', 'Jl. Pasar Cikurubuk'),
(3, 'SL.TOBING', 'Jl. SL.Tobing'),
(4, 'GUDANG', '');

-- --------------------------------------------------------
-- Table structure for table `produk`
-- --------------------------------------------------------
CREATE TABLE `produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_produk` varchar(50) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `satuan` varchar(20) NOT NULL DEFAULT 'botol',
  `botol_perdus` int(11) NOT NULL DEFAULT 12,
  `harga_beli` int(11) NOT NULL DEFAULT 0,
  `stok_gudang` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','deleted') NOT NULL DEFAULT 'active',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_produk_unique` (`kode_produk`),
  KEY `status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Sisipkan produk-produk kamu di bawah sini jika perlu, atau biarkan kosong)
INSERT INTO `produk` (`id`, `kode_produk`, `nama_produk`, `satuan`, `botol_perdus`, `harga_beli`, `stok_gudang`, `status`) VALUES
(1, 'AGK', 'AG KAKAKTUA', 'botol', 12, 45000, 34, 'active'),
(2, 'ARCIL', 'ARCIL', 'botol', 24, 30000, 103, 'active'),
(24, 'AG', 'AG', 'botol', 12, 35500, 1098, 'active');

-- --------------------------------------------------------
-- Table structure for table `stok_cabang`
-- --------------------------------------------------------
CREATE TABLE `stok_cabang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produk_id` int(11) NOT NULL DEFAULT 0,
  `cabang_id` int(11) NOT NULL DEFAULT 0,
  `stok` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `produk_cabang` (`produk_id`,`cabang_id`),
  KEY `cabang_id_index` (`cabang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- SCRIPT TRIGGER (PENTING)
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER `sync_stok_after_insert` AFTER INSERT ON `stok_cabang` FOR EACH ROW BEGIN
  UPDATE produk SET stok_gudang = (SELECT COALESCE(SUM(stok), 0) FROM stok_cabang WHERE produk_id = NEW.produk_id) WHERE id = NEW.produk_id;
END$$

CREATE TRIGGER `sync_stok_after_update` AFTER UPDATE ON `stok_cabang` FOR EACH ROW BEGIN
  UPDATE produk SET stok_gudang = (SELECT COALESCE(SUM(stok), 0) FROM stok_cabang WHERE produk_id = NEW.produk_id) WHERE id = NEW.produk_id;
END$$

CREATE TRIGGER `sync_stok_after_delete` AFTER DELETE ON `stok_cabang` FOR EACH ROW BEGIN
  UPDATE produk SET stok_gudang = (SELECT COALESCE(SUM(stok), 0) FROM stok_cabang WHERE produk_id = OLD.produk_id) WHERE id = OLD.produk_id;
END$$
DELIMITER ;

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;