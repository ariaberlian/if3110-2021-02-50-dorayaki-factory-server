-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2021 at 03:03 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dorayaki_factory`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `refresh_token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `email`, `refresh_token`) VALUES
('dadang', '$2b$10$g8Lr4ZN5nUhOrAHGh0KX.O4qe9KGUy6HOIMaa2vpwyJY8IgtH8wZi', 'dadang@gmail.com', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZGFuZyIsImVtYWlsIjoiZGFkYW5nQGdtYWlsLmNvbSIsImlhdCI6MTYzNzc2MTA1MiwiZXhwIjoxNjM3ODQ3NDUyfQ.M5DfhYIoWZoqcj1geGvUqo3Tjubv7_y38RMFZXoKcvw');

-- --------------------------------------------------------

--
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `nama_bahan` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bahan_baku`
--

INSERT INTO `bahan_baku` (`nama_bahan`, `stok`) VALUES
('Gula', 10),
('Pasir', 100),
('Terigu', 250);

-- --------------------------------------------------------

--
-- Table structure for table `bahan_resep`
--

CREATE TABLE `bahan_resep` (
  `id_resep` int(11) NOT NULL,
  `bahan_baku` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bahan_resep`
--

INSERT INTO `bahan_resep` (`id_resep`, `bahan_baku`, `jumlah`) VALUES
(5, 'Gula', 3),
(5, 'Pasir', 5),
(5, 'Terigu', 2);

-- --------------------------------------------------------

--
-- Table structure for table `log_request`
--

CREATE TABLE `log_request` (
  `id_log` int(11) NOT NULL,
  `ip` text NOT NULL,
  `endpoint` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_request`
--

INSERT INTO `log_request` (`id_log`, `ip`, `endpoint`, `timestamp`) VALUES
(1, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:49:58'),
(2, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:51:55'),
(3, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:52:37'),
(4, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:54:29'),
(5, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:55:01'),
(6, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:55:03'),
(7, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:55:03'),
(8, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:55:04'),
(9, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:55:05'),
(10, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:55:06'),
(11, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:55:07'),
(12, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:55:08'),
(13, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:55:09'),
(14, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:55:09'),
(15, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:59:21'),
(16, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 19:59:48'),
(17, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:02:46'),
(18, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:04:12'),
(19, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:11:54'),
(20, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:13:18'),
(21, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:40:07'),
(22, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:40:54'),
(23, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:50:01'),
(24, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:51:06'),
(25, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:51:24'),
(26, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:51:53'),
(27, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:51:53'),
(28, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:53:09'),
(29, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:54:10'),
(30, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:54:25'),
(31, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:54:25'),
(32, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:54:34'),
(33, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:54:34'),
(34, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:54:40'),
(35, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:54:40'),
(36, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:54:49'),
(37, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:54:49'),
(38, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:54:57'),
(39, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:54:58'),
(40, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:55:02'),
(41, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:55:02'),
(42, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:55:07'),
(43, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:55:07'),
(44, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:55:11'),
(45, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:55:12'),
(46, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:55:15'),
(47, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:55:15'),
(48, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:55:19'),
(49, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:55:19'),
(50, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:55:23'),
(51, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:55:23'),
(52, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 20:55:32'),
(53, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 20:55:32'),
(54, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:00:48'),
(55, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:02:38'),
(56, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:02:48'),
(57, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:02:56'),
(58, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 21:02:56'),
(59, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:03:04'),
(60, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 21:03:04'),
(61, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:03:08'),
(62, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 21:03:08'),
(63, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:03:11'),
(64, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 21:03:11'),
(65, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:03:13'),
(66, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 21:03:13'),
(67, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:03:15'),
(68, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 21:03:15'),
(69, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:03:17'),
(70, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 21:03:17'),
(71, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:03:18'),
(72, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 21:03:18'),
(73, '::1', 'http://localhost:8080/JayenInterface/services/VariantServiceImpl', '2021-11-22 21:03:21'),
(74, '::1', 'http://localhost:8080/JayenInterface/services/AddStokServiceImpl', '2021-11-22 21:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `request_toko`
--

CREATE TABLE `request_toko` (
  `id_request` int(11) NOT NULL,
  `ip` text NOT NULL,
  `varian` varchar(255) NOT NULL,
  `jumlah_penambahan` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_toko`
--

INSERT INTO `request_toko` (`id_request`, `ip`, `varian`, `jumlah_penambahan`, `status`) VALUES
(1, '192.168.1.4', 'Rasa Pasir', 20, 0),
(2, '::1', 'Rasa Pasir', 20, NULL),
(3, '::1', 'Rasa Pasir', -90, NULL),
(4, '::1', 'Rasa Pasir', 23, NULL),
(5, '::1', 'Rasa Pasir', 135, NULL),
(6, '::1', 'Rasa Pasir', 0, NULL),
(7, '::1', 'Rasa Pasir', 32, NULL),
(8, '::1', 'Rasa Pasir', -50, NULL),
(9, '::1', 'Rasa Pasir', -40, NULL),
(10, '::1', 'Rasa Pasir', -30, NULL),
(11, '::1', 'Rasa Pasir', 224, NULL),
(12, '::1', 'Rasa Pasir', 245, NULL),
(13, '::1', 'Rasa Pasir', 123000, NULL),
(14, '::1', 'Rasa Pasir', 224, NULL),
(15, '::1', 'Rasa Pasir', 20, NULL),
(16, '::1', 'Rasa Pasir', 1100, NULL),
(17, '::1', 'Rasa Pasir', 2000, NULL),
(18, '::1', 'Rasa Pasir', 3000, NULL),
(19, '::1', 'Rasa Pasir', 4000, NULL),
(20, '::1', 'Rasa Pasir', 2000, NULL),
(21, '::1', 'Rasa Pasir', 3000, NULL),
(22, '::1', 'Rasa Pasir', 1000, NULL),
(23, '::1', 'Rasa Pasir', 3000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `id_resep` int(11) NOT NULL,
  `nama_resep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`id_resep`, `nama_resep`) VALUES
(5, 'Rasa Pasir'),
(1, 'Terigu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`nama_bahan`);

--
-- Indexes for table `bahan_resep`
--
ALTER TABLE `bahan_resep`
  ADD PRIMARY KEY (`id_resep`,`bahan_baku`),
  ADD KEY `fk_bahan_baku` (`bahan_baku`),
  ADD KEY `id_resep` (`id_resep`);

--
-- Indexes for table `log_request`
--
ALTER TABLE `log_request`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `request_toko`
--
ALTER TABLE `request_toko`
  ADD PRIMARY KEY (`id_request`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id_resep`),
  ADD UNIQUE KEY `nama_resep` (`nama_resep`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_request`
--
ALTER TABLE `log_request`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `request_toko`
--
ALTER TABLE `request_toko`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `resep`
--
ALTER TABLE `resep`
  MODIFY `id_resep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bahan_resep`
--
ALTER TABLE `bahan_resep`
  ADD CONSTRAINT `fk_bahan_baku` FOREIGN KEY (`bahan_baku`) REFERENCES `bahan_baku` (`nama_bahan`),
  ADD CONSTRAINT `fk_id_resep` FOREIGN KEY (`id_resep`) REFERENCES `resep` (`id_resep`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
