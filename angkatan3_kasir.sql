-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 09:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `angkatan3_kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(9) NOT NULL,
  `id_kategori` int(9) NOT NULL,
  `nama_barang` varchar(60) NOT NULL,
  `satuan` varchar(60) NOT NULL,
  `qty` int(9) NOT NULL,
  `harga` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `id_kategori`, `nama_barang`, `satuan`, `qty`, `harga`, `created_at`, `updated_at`) VALUES
(2, 2, 'oky jelly drink', 'karton', 0, 3000, '2024-11-06 03:52:49', '2024-11-06 03:52:49'),
(3, 1, 'ciki pansher', '', 90, 6600, '2024-11-08 08:07:16', '2024-11-08 08:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id` int(9) NOT NULL,
  `id_penjualan` int(9) DEFAULT NULL,
  `id_barang` int(9) DEFAULT NULL,
  `jumlah` int(9) DEFAULT NULL,
  `harga` double(10,2) DEFAULT NULL,
  `total_harga` double(10,2) DEFAULT NULL,
  `sub_total` double(10,2) NOT NULL,
  `nominal_bayar` double(10,2) DEFAULT NULL,
  `kembalian` double(10,2) DEFAULT NULL,
  `created-at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id`, `id_penjualan`, `id_barang`, `jumlah`, `harga`, `total_harga`, `sub_total`, `nominal_bayar`, `kembalian`, `created-at`) VALUES
(1, 1, 1, 8, 2000.00, 16000.00, 0.00, 19000.00, 3000.00, '2024-11-07 08:00:34'),
(2, 2, 2, 9, 3000.00, 27000.00, 0.00, 10000000.00, 9973000.00, '2024-11-07 08:24:43'),
(3, 3, 1, 2, 2000.00, 8000.00, 0.00, 10000.00, 2000.00, '2024-11-08 01:48:47'),
(4, 3, 1, 2, 2000.00, 8000.00, 0.00, 10000.00, 2000.00, '2024-11-08 01:48:47'),
(5, 4, 1, 3, 2000.00, 15000.00, 0.00, 20000.00, 5000.00, '2024-11-08 06:45:22'),
(6, 4, 2, 3, 3000.00, 15000.00, 0.00, 20000.00, 5000.00, '2024-11-08 06:45:22'),
(7, 5, 1, 3, 2000.00, 0.00, 0.00, 20000.00, 0.00, '2024-11-08 06:51:08'),
(8, 5, 2, 2, 3000.00, 0.00, 0.00, 20000.00, 0.00, '2024-11-08 06:51:08'),
(9, 6, 1, 3, 2000.00, 18000.00, 6000.00, 20000.00, 2000.00, '2024-11-08 07:59:36'),
(10, 6, 2, 4, 3000.00, 18000.00, 12000.00, 20000.00, 2000.00, '2024-11-08 07:59:36'),
(11, 7, 3, 5, 6600.00, 39000.00, 33000.00, 98000.00, 59000.00, '2024-11-08 08:08:12'),
(12, 7, 2, 2, 3000.00, 39000.00, 6000.00, 98000.00, 59000.00, '2024-11-08 08:08:12');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id` int(11) NOT NULL,
  `name_kategori` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id`, `name_kategori`, `created_at`, `updated_at`) VALUES
(1, 'makanan', '2024-11-06 03:40:02', '2024-11-06 03:40:02'),
(2, 'minuman', '2024-11-06 03:40:02', '2024-11-06 03:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(9) NOT NULL,
  `id_user` int(9) DEFAULT NULL,
  `kode_transaksi` varchar(35) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_user`, `kode_transaksi`, `tanggal_transaksi`, `created_at`, `updated_at`) VALUES
(1, 1, 'TR-241107145641', '2024-11-07', '2024-11-07 08:00:34', '2024-11-07 08:00:34'),
(2, 1, 'TR-241107150035', '2024-11-07', '2024-11-07 08:24:43', '2024-11-07 08:24:43'),
(3, 0, 'TR-241108082432', '2024-11-08', '2024-11-08 01:48:47', '2024-11-08 01:48:47'),
(4, 0, 'TR-241108112550', '2024-11-08', '2024-11-08 06:45:22', '2024-11-08 06:45:22'),
(5, 0, 'TR-241108134824', '2024-11-08', '2024-11-08 06:51:08', '2024-11-08 06:51:08'),
(6, 1, 'TR-241108143115', '2024-11-08', '2024-11-08 07:59:36', '2024-11-08 07:59:36'),
(7, 1, 'TR-241108150726', '2024-11-08', '2024-11-08 08:08:12', '2024-11-08 08:08:12');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `nama_pengguna`, `email`, `password`, `foto`, `cover`, `created_at`, `updated_at`) VALUES
(1, 'riooo', 'ozi', 'admin@gmail.com', '12345678', 'pngtree-illustration-of-an-astronaut-fishing-star-in-the-moon-png-image_15831679.png', 'istockphoto-592031250-612x612.jpg', '2024-10-31 08:08:44', '2024-11-04 08:17:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori_to_kategori_id` (`id_kategori`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penjualan_to_penjualan_id` (`id_penjualan`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `id_kategori_to_kategori_id` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `id_penjualan_to_penjualan_id` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
