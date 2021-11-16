-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2021 at 12:30 PM
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
CREATE DATABASE IF NOT EXISTS `dorayaki_factory` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dorayaki_factory`;

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
('dadang', '$2b$10$g8Lr4ZN5nUhOrAHGh0KX.O4qe9KGUy6HOIMaa2vpwyJY8IgtH8wZi', 'dadang@gmail.com', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRhZGFuZyIsImVtYWlsIjoiZGFkYW5nQGdtYWlsLmNvbSIsImlhdCI6MTYzNjcyOTcyMywiZXhwIjoxNjM2ODE2MTIzfQ.T5Hzd2vrboqcQjApBT8vDAFm7S7puuVR3XQiqqCN4r0');

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
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request_toko`
--

CREATE TABLE `request_toko` (
  `id_request` int(11) NOT NULL,
  `varian` varchar(255) NOT NULL,
  `jumlah_penambahan` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD KEY `fk_bahan_baku` (`bahan_baku`);

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
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_toko`
--
ALTER TABLE `request_toko`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT;

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
