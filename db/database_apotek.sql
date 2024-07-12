-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jan 2024 pada 18.41
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_apotek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `ID_Barang` int(11) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`ID_Barang`, `nama_barang`, `kategori`, `harga_jual`, `harga_beli`, `stok`, `foto`) VALUES
(13123, 'You-C 1000 Orange ', 'Vitamin & Suplemen', 6600, 6000, 992, '1428947901_6ec28687-ab4a-493c-a299-1285f3f7c89f_product_image_url.webp'),
(2021344, 'Fituno Immune Kids 6', 'Vitamin', 27000, 26000, 56, '577747837_d04a85a5-4bda-41c0-ad2a-b3fe6c315f1d_product_image_url.webp'),
(2021455, 'Darsi 12 kapsul', 'Obat', 12000, 11000, 49, '1526324058_1d80ca08-25f9-433b-a536-c72960c315ff_product_image_url.webp'),
(2021485, 'Alkohol Swap 100 lem', 'Obat', 16000, 13000, 188, '807692943_78dcc079-1a7a-4c6d-b516-fa3ee79e106a_product_image_url.webp'),
(2021849, 'Paracetamol Drops', 'Obat', 10000, 9000, 89, '1436297371_paracetamol.webp'),
(2021859, 'Paramex Nyeri Otot 4', 'Obat ', 6000, 5000, 98, '1234470455_paramex.webp'),
(2021954, 'Acarbose 50 mg 10 ta', 'obat', 39000, 20000, 99, '1336636551_acarbose.webp'),
(2021958, 'Betadine Skin Cleans', 'Obat', 74800, 60000, 300, '73523359_betadine.webp'),
(20212593, 'Vitamin C IPI 50 mg', 'Vitamin', 13000, 10000, 200, '1597299680_vitamin c.webp'),
(20212595, 'Asam Mefenamat Sirup', 'Obat Sakit GIGI', 20000, 10000, 999, '1210184087_asam metamafat.webp');

-- --------------------------------------------------------

--
-- Struktur dari tabel `beli`
--

CREATE TABLE `beli` (
  `ID_Beli` int(11) NOT NULL,
  `ID_Barang` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_barang` int(10) NOT NULL,
  `total` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `beli`
--

INSERT INTO `beli` (`ID_Beli`, `ID_Barang`, `nama_pelanggan`, `alamat`, `tanggal`, `jumlah_barang`, `total`) VALUES
(1, 2021455, 'vyn', 'Lowanu 99B', '2024-01-04', 1, 39000),
(2, 2021344, 'vyn', 'Lowanu 99B', '2024-01-04', 1, 39000);

--
-- Trigger `beli`
--
DELIMITER $$
CREATE TRIGGER `penjualan_barang` AFTER INSERT ON `beli` FOR EACH ROW BEGIN
	UPDATE barang SET stok=stok-NEW.jumlah_barang
    WHERE ID_Barang = NEW.ID_Barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `staff`
--

CREATE TABLE `staff` (
  `ID_Pegawai` int(11) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Posisi` varchar(20) NOT NULL,
  `Alamat` text NOT NULL,
  `Jenis_kelamin` varchar(20) NOT NULL,
  `No_Telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `staff`
--

INSERT INTO `staff` (`ID_Pegawai`, `Nama`, `Posisi`, `Alamat`, `Jenis_kelamin`, `No_Telp`) VALUES
(34234, 'Ibnu Jati', 'Staff', 'Sorosutan, Umbulharjo', 'Laki-laki', '089767234432'),
(903948, 'Andika Wijaya', 'Staff', 'Gembira Loka', 'Laki-Laki', '082248953948'),
(903954, 'M Ridho Dwi Putra', 'Staff', 'Jl, Maundry Bantul', 'Laki-laki', '085123987654');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `ID_Supplier` int(11) NOT NULL,
  `nama_supplier` varchar(20) NOT NULL,
  `alamat_supplier` text NOT NULL,
  `No_Telp` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`ID_Supplier`, `nama_supplier`, `alamat_supplier`, `No_Telp`) VALUES
(2021855, 'Adji Syhab', 'Jepara', '084948594385'),
(2021856, 'Mamad Biak', 'Biak', '083959439584'),
(2021857, 'Cv. Ambung Jaya', 'Jakarta', '084958698495'),
(2021862, 'Ferdinan', 'Cilacap', '082236474758'),
(2021863, 'Cv. Indonesia Maju', 'Semarang', '084831375712'),
(2021864, 'Cv. Jaya Konde', 'Papua', '085432323488');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `ID_User` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`ID_User`, `nama`, `email`, `level`, `username`, `password`) VALUES
(247951, 'Didik Vinastu', 'vinast@gmail.com', 'kepala', 'vinastt', 'a5df30c592774c1ec8348447d679385f'),
(247952, 'Vynsec', 'vin@gmail.com', 'pelanggan', 'vinn', '045f9636404042137fc555fe181517de'),
(247953, 'Andika Wijaya', 'dika@gmail.com', 'staff', 'Dikaaa', '5227ea98f508fe74ff58c397418ad81d'),
(247954, 'Ibnu Jati', 'ibnujk@gmail.com', 'staff', 'Inuu', '691b772d7e8c5eacc1961514d2aaf9e1'),
(247955, 'M Ridho Dwi', 'putra@gmail.com', 'staff', 'POH', '9a24b6b10942dca2a21ebd0d5575e2f3');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_Barang`);

--
-- Indeks untuk tabel `beli`
--
ALTER TABLE `beli`
  ADD PRIMARY KEY (`ID_Beli`);

--
-- Indeks untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID_Pegawai`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID_Supplier`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_User`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `ID_Barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20212599;

--
-- AUTO_INCREMENT untuk tabel `beli`
--
ALTER TABLE `beli`
  MODIFY `ID_Beli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `staff`
--
ALTER TABLE `staff`
  MODIFY `ID_Pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=903957;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID_Supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2021865;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `ID_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247956;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
