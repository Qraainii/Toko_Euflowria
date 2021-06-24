-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2021 at 03:28 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_euflowria`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'Bunga Matahari', 'Bibit Bunga Matahari', 'Bibit Bunga', 33000, 25, 'bibitmatahari.png'),
(2, 'Bunga Mawar', 'Bibit Bunga Mawar', 'Bibit Bunga', 27000, 10, 'bibitmawar.png'),
(3, 'Bunga Pink Rose', 'Buket Bunga Pink Rose', 'Buket Bunga', 75000, 7, 'buketmawar.png'),
(4, 'Bunga Red Tulip', 'Buket Bunga Red Tulip', 'Buket Bunga', 90000, 11, 'bukettulip.png'),
(5, 'Bunga Daisy', 'Bibit Bunga Daisy', 'Bibit Bunga', 35000, 3, 'bibitdaisy.png'),
(11, 'Bunga Gysophila', 'Buket Bunga Gysophila', 'Buket Bunga', 50000, 2, 'buketgysophila.png'),
(13, 'Bunga Lily', 'Buket Bunga Lily', 'Bibit Bunga', 45000, 3, 'buketlily.png'),
(14, 'Bunga Krisan', 'Bibit Bunga Krisan', 'Bibit Bunga', 25000, 8, 'bibitkrisan.png'),
(16, 'Bunga Lavender', 'Bibit Bunga Lavender', 'Bibit Bunga', 35000, 12, 'bibitlavender1.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(1, 'Mariana', 'Surabaya', '2021-06-21 11:31:47', '2021-06-22 11:31:47'),
(2, 'Mariana', 'Surabaya', '2021-06-21 11:32:35', '2021-06-22 11:32:35'),
(3, 'Ivana', 'Jogja', '2021-06-21 15:09:47', '2021-06-22 15:09:47'),
(4, 'Ivana', 'Jogja', '2021-06-21 15:10:01', '2021-06-22 15:10:01'),
(5, 'Adelia', 'Jalan Matahari', '2021-06-23 18:55:36', '2021-06-24 18:55:36'),
(6, 'Ariel Noura', 'Jakarta', '2021-06-23 19:00:40', '2021-06-24 19:00:40'),
(7, 'Jay', 'Madura', '2021-06-23 20:00:10', '2021-06-24 20:00:10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 1, 3, 'Bunga Pink Rose', 1, 75000, ''),
(2, 1, 11, 'Bunga Gysophila', 1, 50000, ''),
(3, 1, 14, 'Bunga Krisan', 1, 25000, ''),
(4, 2, 3, 'Bunga Pink Rose', 3, 75000, ''),
(5, 2, 1, 'Bunga Matahari', 1, 33000, ''),
(6, 2, 14, 'Bunga Krisan', 1, 25000, ''),
(7, 2, 16, 'Bunga Lavender', 1, 35000, ''),
(8, 3, 3, 'Bunga Pink Rose', 1, 75000, ''),
(9, 3, 11, 'Bunga Gysophila', 1, 50000, ''),
(10, 5, 13, 'Bunga Lily', 1, 45000, ''),
(11, 6, 11, 'Bunga Gysophila', 1, 50000, ''),
(12, 6, 2, 'Bunga Mawar', 1, 27000, ''),
(13, 7, 4, 'Bunga Red Tulip', 1, 90000, ''),
(14, 7, 1, 'Bunga Matahari', 1, 33000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', '123', 1),
(2, 'user', 'user', '345', 2),
(3, 'Mariana', 'mariaaana', 'maria', 2),
(5, 'Right', 'Right', '234', 2),
(6, 'Ariel Noura', 'Ariel', 'rie', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(5, 'Quratu Aini', 'quratuaini02@gmail.com', 'default.jpg', '$2y$10$E3l.Nc/G4.FjG.VEYRPuXuGnZyYhyEBKJFQIiY3LegeQRmC5jcngq', 2, 1, 1624096003),
(6, 'Fancy', 'scoups@gmail.com', 'default.jpg', '$2y$10$S/wSnbgugBTE5EgyW.mkKuW/dFeCV5/oqw3s.xq4fzeyO3TiyX.nK', 2, 1, 1624098478),
(8, 'Mariana', 'marianaddrees@gmail.com', 'default.jpg', '$2y$10$oe.8YohiY6gTGaBRniPXy.FnRBDM66CU0YfkDPcIxauM0Ya8OruTa', 2, 1, 1624099358);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
