-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 09, 2024 at 08:24 AM
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
-- Database: `db_saw`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternative_criteria`
--

CREATE TABLE `alternative_criteria` (
  `id_alternative` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alternative_criteria`
--

INSERT INTO `alternative_criteria` (`id_alternative`, `id_criteria`) VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 12),
(1, 13),
(1, 14),
(1, 26),
(1, 27),
(1, 28),
(1, 31),
(1, 32),
(1, 33),
(1, 38),
(1, 42),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 52),
(1, 53),
(1, 57),
(1, 58),
(1, 59),
(2, 1),
(2, 7),
(2, 30),
(3, 1),
(4, 1),
(4, 3),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 12),
(4, 13),
(4, 18),
(4, 23),
(4, 24),
(4, 26),
(4, 28),
(4, 33),
(5, 2),
(5, 12),
(5, 18),
(5, 23),
(5, 24),
(5, 37),
(5, 39),
(5, 43),
(5, 49),
(5, 56),
(6, 2),
(6, 23),
(6, 30),
(6, 37),
(6, 38),
(6, 48),
(7, 2),
(7, 23),
(7, 30),
(7, 37),
(7, 38),
(7, 49),
(7, 59),
(8, 2),
(8, 23),
(8, 37),
(8, 39),
(8, 43),
(9, 3),
(9, 7),
(9, 8),
(10, 3),
(10, 42),
(10, 52),
(11, 3),
(11, 6),
(11, 13),
(11, 23),
(11, 26),
(11, 31),
(11, 46),
(11, 47),
(11, 57),
(12, 4),
(12, 11),
(12, 20),
(13, 4),
(13, 5),
(13, 9),
(13, 10),
(13, 11),
(13, 15),
(13, 27),
(13, 32),
(13, 56),
(14, 4),
(14, 5),
(14, 11),
(15, 4),
(15, 8),
(15, 9),
(15, 11),
(15, 15),
(15, 16),
(15, 20),
(15, 21),
(15, 27),
(15, 29),
(15, 30),
(15, 41),
(15, 46),
(15, 54),
(15, 59),
(16, 8),
(16, 10),
(16, 14),
(16, 16),
(16, 20),
(16, 21),
(16, 27),
(16, 29),
(16, 31),
(16, 34),
(16, 35),
(16, 41),
(16, 42),
(16, 45),
(16, 46),
(16, 47),
(16, 48),
(16, 50),
(16, 52),
(16, 55),
(16, 58),
(16, 59),
(17, 15),
(17, 16),
(17, 21),
(17, 29),
(17, 34),
(17, 35),
(17, 41),
(17, 54),
(17, 58),
(18, 5),
(18, 13),
(18, 14),
(18, 31),
(18, 32),
(18, 33),
(18, 34),
(18, 35),
(18, 47),
(18, 49),
(18, 55),
(18, 58),
(19, 1),
(19, 5),
(19, 6),
(19, 9),
(19, 13),
(19, 30),
(19, 32),
(19, 42),
(19, 47),
(19, 48),
(19, 50),
(19, 57),
(19, 58),
(20, 10),
(20, 27),
(20, 33),
(21, 11),
(21, 15),
(21, 20),
(21, 28),
(21, 34),
(21, 35),
(21, 41),
(21, 54),
(21, 56),
(22, 12),
(22, 14),
(22, 18),
(22, 24),
(22, 26),
(22, 55),
(23, 6),
(23, 7),
(23, 13),
(23, 26),
(23, 42),
(23, 47),
(23, 51),
(23, 55),
(23, 57),
(24, 14),
(24, 31),
(24, 33),
(26, 15),
(26, 18),
(26, 24),
(26, 31),
(27, 16),
(27, 21),
(27, 29),
(28, 18),
(28, 24),
(28, 51),
(29, 26),
(29, 33),
(30, 9),
(30, 10),
(30, 27),
(30, 32),
(30, 47),
(31, 12),
(31, 28),
(32, 28),
(33, 28),
(34, 29),
(34, 34),
(34, 35),
(34, 36),
(34, 41),
(37, 30),
(37, 33),
(37, 44),
(37, 45),
(37, 48),
(38, 30),
(41, 12),
(41, 20),
(41, 34),
(41, 35),
(42, 59),
(43, 59),
(44, 59),
(45, 36),
(45, 38),
(46, 36),
(47, 36),
(47, 38),
(48, 36),
(48, 38),
(48, 40),
(49, 36),
(49, 38),
(49, 40),
(50, 37),
(50, 50),
(50, 51),
(50, 53),
(51, 37),
(51, 39),
(51, 43),
(51, 50),
(51, 51),
(51, 53),
(52, 37),
(52, 39),
(52, 40),
(52, 43),
(52, 50),
(52, 51),
(52, 53),
(52, 54),
(52, 57),
(53, 38),
(54, 40),
(54, 44),
(55, 40),
(56, 42),
(56, 52),
(57, 44),
(58, 44),
(59, 45),
(60, 45),
(61, 45),
(62, 46),
(62, 52),
(63, 46),
(63, 52),
(64, 48),
(65, 54),
(65, 55),
(66, 50),
(69, 51),
(70, 49),
(71, 34),
(71, 35),
(71, 41),
(71, 54),
(71, 56),
(72, 14),
(72, 55),
(72, 58),
(73, 56),
(75, 57);

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id_criteria` int(11) NOT NULL,
  `criteria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id_criteria`, `criteria`) VALUES
(1, 'Mata Terasa Keras'),
(2, 'Lensa Mata Keruh'),
(3, 'Pandangan Kabur'),
(4, 'Mata Merah'),
(5, 'Mata Berair'),
(6, 'Sakit Pada Bola Mata'),
(7, 'Sakit Kepala'),
(8, 'Mata Terasa Mengganjal (seperti kelilipan)'),
(9, 'Mata Sulit Dibuka'),
(10, 'Kelopak Mata Bengkak'),
(11, 'Sekret Mata Banyak'),
(12, 'Mata Terasa Panas'),
(13, 'Mata Terasa Nyeri'),
(14, 'Mata Gatal'),
(15, 'Sekret Mata Mucous'),
(16, 'Keluarnya Cairan Purulen (nanah)'),
(17, 'Nyeri Mata'),
(18, 'Fotofobia'),
(19, 'Penglihatan Kabur'),
(20, 'Kelopak Mata Lengket'),
(21, 'Keluarnya Cairan Mukopurulen'),
(22, 'Secret Mata Banyak'),
(23, 'Kornea Keruh'),
(24, 'Peka Terhadap Cahaya'),
(25, 'Pengelihatan Kabur'),
(26, 'Mata Sulit Digerakkan'),
(27, 'Bola Mata Bengkak'),
(28, 'Demam'),
(29, 'Nanah Pada Tepi Kornea'),
(30, 'Blepharospasme'),
(31, 'Merah Pada Tepi Kornea'),
(32, 'Mata Sulit Dibuka'),
(33, 'Terasa Nyeri Pada Kantong Mata'),
(34, 'Terdapat Radang Pada Palpebra'),
(35, 'Mata Terlihat Pucat'),
(36, 'Riwayat Penyakit Diabetes'),
(37, 'Penyakit Pada Badan Kaca (Vitreus)'),
(38, 'Riwayat Penyakit Hypertensi'),
(39, 'Warna Putih Pada Pupil'),
(40, 'Mata Juling (Strabismus)'),
(41, 'Bila Kelopak Mata Ditekan Akan Mengeluarkan Sekret'),
(42, 'Pengelihatan Berbayang'),
(43, 'Terdapat Bercak Putih Pada Pupil'),
(44, 'Pengelihatan Tidak Jelas Saat Melihat Jarak Dekat'),
(45, 'Cepat Mengantuk Saat Membaca'),
(46, 'Tidak Jelas Melihat Jarak Jauh'),
(47, 'Mata Terasa Sakit'),
(48, 'Objek Yang Dilihat Bergoyang'),
(49, 'Terdapat Benjolan Segitiga Pada Selaput Lendir Dengan Puncak Mengarah pada Kornea'),
(50, 'Melihat Objek Seperti Terbang (Floaters)'),
(51, 'Melihat Kilatan Cahaya (Photopsia)'),
(52, 'Visus Menurun'),
(53, 'Pengelihatan Seperti Tertutup'),
(54, 'Terbentuk Borok pada Selaput Bening'),
(55, 'Nyeri atau Rasa Terbakar'),
(56, 'Lepuhan'),
(57, 'Rasa Sakit Disekitaran Mata'),
(58, 'Mata Terasa Perih'),
(59, 'Selaput Bening dan Konjuctiva Pucat');

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id_disease` int(11) NOT NULL,
  `disease_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id_disease`, `disease_name`) VALUES
(1, 'Glaukoma'),
(2, 'Conjunctivitis Bakteri'),
(3, 'Conjunctivitis Virus'),
(4, 'Conjunctivitis Allergen'),
(5, 'Gonoblenore'),
(6, 'Trachoma'),
(7, 'Panoftalmitis'),
(8, 'Uveitis'),
(9, 'Ulkus Kornea'),
(10, 'Keratitis'),
(11, 'Herdeolum'),
(12, 'Retinopati Diabrtika'),
(13, 'Retinopati hypertensi'),
(14, 'Retinoblastoma'),
(15, 'Dakriosistitis'),
(16, 'Katarak'),
(17, 'Rabun dekat (Hipermetropia)'),
(18, 'Rabun jauh (Miopia)'),
(19, 'Astigmatis (Silinder)'),
(20, 'Pterigium'),
(21, 'Ablasio retina'),
(22, 'Herpes simplex'),
(23, 'Herpes zoster'),
(24, 'Xeroftalmia'),
(25, 'Endoftalmitis');

-- --------------------------------------------------------

--
-- Table structure for table `saw_alternatives`
--

CREATE TABLE `saw_alternatives` (
  `id_alternative` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saw_alternatives`
--

INSERT INTO `saw_alternatives` (`id_alternative`, `name`) VALUES
(1, 'Kurang tidur'),
(2, 'Konsumsi kafein berlebihan'),
(3, 'Stres'),
(4, 'Dehidrasi'),
(5, 'Paparan sinar UV tanpa perlindungan'),
(6, 'Konsumsi alkohol berlebihan'),
(7, 'Merokok'),
(8, 'Kurang nutrisi (vitamin C, E, dan antioksidan)'),
(9, 'Ketegangan mata karena layar elektronik'),
(10, 'Penyakit sistemik (diabetes, hipertensi)'),
(11, 'Penggunaan lensa kontak yang tidak tepat'),
(12, 'Penggunaan lensa kontak yang tidak bersih'),
(13, 'Alergi'),
(14, 'Iritasi akibat kosmetik'),
(15, 'Paparan debu atau polutan'),
(16, 'Mengucek mata dengan tangan kotor'),
(17, 'Penggunaan lensa kontak yang tidak bersih atau terlalu lama'),
(18, 'Paparan angin atau polutan'),
(19, 'Penggunaan gadget dalam waktu lama'),
(20, 'Konsumsi garam berlebihan'),
(21, 'Infeksi bakteri atau virus'),
(22, 'Paparan layar elektronik dalam waktu lama'),
(23, 'Ketegangan mata'),
(24, 'Alergi (debu, serbuk sari, bulu hewan)'),
(25, 'Iritasi akibat lensa kontak yang tidak bersih atau terlalu lama digunakan'),
(26, 'Iritasi akibat kosmetik atau produk perawatan mata yang tidak cocok'),
(27, 'Infeksi bakteri akibat kebersihan mata yang buruk'),
(28, 'Penyakit sistemik (seperti migrain)'),
(29, 'Infeksi atau peradangan pada otot atau saraf mata akibat kebersihan yang buruk'),
(30, 'Infeksi mata (seperti blefaritis atau konjungtivitis)'),
(31, 'Paparan polutan atau lingkungan yang tidak bersih'),
(32, 'Stres tinggi'),
(33, 'Konsumsi makanan yang tidak sehat'),
(34, 'Menggunakan kosmetik mata yang tidak higienis'),
(35, 'Peradangan akibat kebersihan yang buruk'),
(36, 'Penyakit sistemik (seperti migrain)'),
(37, 'Kelelahan'),
(38, 'Kekurangan nutrisi seperti magnesium'),
(39, 'Infeksi atau peradangan akibat kebersihan yang buruk'),
(40, 'Penggunaan kosmetik yang tidak higienis'),
(41, 'Alergi terhadap kosmetik atau produk perawatan mata'),
(42, 'Anemia atau kekurangan zat besi'),
(43, 'Malnutrisi atau diet tidak seimbang'),
(44, 'Kelelahan kronis'),
(45, 'Obesitas'),
(46, 'Pola makan yang tinggi gula dan lemak'),
(47, 'Kurang aktivitas fisik'),
(48, 'Keturunan'),
(49, 'Stres kronis'),
(50, 'Proses penuaan alami'),
(51, 'Diabetes yang tidak terkontrol'),
(52, 'Trauma atau cedera mata'),
(53, 'Pola makan tinggi garam'),
(54, 'Penggunaan gadget atau membaca dalam posisi tidak nyaman untuk waktu lama'),
(55, 'Gangguan perkembangan visual sejak lahir'),
(56, 'Penggunaan lensa kontak atau kacamata yang tidak tepat'),
(57, 'Paparan layar elektronik tanpa jeda'),
(58, 'Kurang asupan nutrisi seperti vitamin A dan beta-karoten'),
(59, 'Posisi membaca yang tidak nyaman'),
(60, 'Pencahayaan yang buruk saat membaca'),
(61, 'Konsumsi makanan berat sebelum membaca'),
(62, 'Malnutrisi (kekurangan vitamin A)'),
(63, 'Ketegangan mata karena penggunaan gadget dalam waktu lama'),
(64, 'Penyakit sistemik (seperti vertigo)'),
(65, 'Kekeringan mata kronis'),
(66, 'Miopia tinggi'),
(67, 'Trauma atau cedera pada mata'),
(68, 'Migrain atau sakit kepala berat'),
(69, 'Penyakit retina'),
(70, 'Kekeringan mata kronis'),
(71, 'Kebersihan mata yang buruk'),
(72, 'Penggunaan kosmetik yang tidak cocok'),
(73, 'Paparan bahan kimia iritan'),
(74, 'Kebersihan wajah yang buruk'),
(75, 'Infeksi atau peradangan sinus');

-- --------------------------------------------------------

--
-- Table structure for table `saw_criterias`
--

CREATE TABLE `saw_criterias` (
  `id_disease` int(11) NOT NULL,
  `id_criteria` int(11) NOT NULL,
  `weight` float DEFAULT NULL,
  `attribute` enum('benefit','cost') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saw_criterias`
--

INSERT INTO `saw_criterias` (`id_disease`, `id_criteria`, `weight`, `attribute`) VALUES
(1, 1, 0.2, 'benefit'),
(1, 2, 0.03, 'benefit'),
(1, 3, 0.2, 'benefit'),
(1, 4, 0.15, 'benefit'),
(1, 5, 0.15, 'benefit'),
(1, 6, 0.17, 'benefit'),
(1, 7, 0.1, 'benefit'),
(2, 4, 0.4, 'benefit'),
(2, 8, 0.2, 'benefit'),
(2, 9, 0.15, 'benefit'),
(2, 10, 0.1, 'benefit'),
(2, 11, 0.15, 'benefit'),
(3, 4, 0.4, 'benefit'),
(3, 5, 0.2, 'benefit'),
(3, 8, 0.1, 'benefit'),
(3, 10, 0.1, 'benefit'),
(3, 12, 0.1, 'benefit'),
(3, 13, 0.1, 'benefit'),
(4, 4, 0.3, 'benefit'),
(4, 5, 0.2, 'benefit'),
(4, 8, 0.1, 'benefit'),
(4, 10, 0.1, 'benefit'),
(4, 14, 0.2, 'benefit'),
(4, 15, 0.1, 'benefit'),
(5, 3, 0.1, 'benefit'),
(5, 4, 0.25, 'benefit'),
(5, 5, 0.05, 'benefit'),
(5, 10, 0.15, 'benefit'),
(5, 16, 0.2, 'benefit'),
(5, 17, 0.1, 'benefit'),
(5, 18, 0.05, 'benefit'),
(5, 20, 0.1, 'benefit'),
(6, 3, 0.05, 'benefit'),
(6, 4, 0.15, 'benefit'),
(6, 5, 0.05, 'benefit'),
(6, 10, 0.15, 'benefit'),
(6, 11, 0.05, 'benefit'),
(6, 14, 0.15, 'benefit'),
(6, 21, 0.15, 'benefit'),
(6, 23, 0.1, 'benefit'),
(6, 24, 0.15, 'benefit'),
(7, 4, 0.3, 'benefit'),
(7, 7, 0.1, 'benefit'),
(7, 13, 0.15, 'benefit'),
(7, 26, 0.2, 'benefit'),
(7, 27, 0.15, 'benefit'),
(7, 28, 0.1, 'benefit'),
(8, 3, 0.2, 'benefit'),
(8, 4, 0.3, 'benefit'),
(8, 5, 0.2, 'benefit'),
(8, 13, 0.2, 'benefit'),
(8, 29, 0.05, 'benefit'),
(8, 31, 0.05, 'benefit'),
(9, 2, 0.05, 'benefit'),
(9, 5, 0.2, 'benefit'),
(9, 24, 0.3, 'benefit'),
(9, 29, 0.05, 'benefit'),
(9, 30, 0.05, 'benefit'),
(9, 31, 0.05, 'benefit'),
(9, 47, 0.3, 'benefit'),
(10, 3, 0.2, 'benefit'),
(10, 4, 0.2, 'benefit'),
(10, 13, 0.2, 'benefit'),
(10, 24, 0.2, 'benefit'),
(10, 31, 0.1, 'benefit'),
(10, 32, 0.1, 'benefit'),
(11, 10, 0.3, 'benefit'),
(11, 14, 0.2, 'benefit'),
(11, 33, 0.2, 'benefit'),
(11, 34, 0.3, 'benefit'),
(12, 3, 0.25, 'benefit'),
(12, 35, 0.2, 'benefit'),
(12, 36, 0.5, 'benefit'),
(12, 37, 0.05, 'benefit'),
(13, 3, 0.25, 'benefit'),
(13, 35, 0.2, 'benefit'),
(13, 37, 0.05, 'benefit'),
(13, 38, 0.5, 'benefit'),
(14, 3, 0.2, 'benefit'),
(14, 4, 0.2, 'benefit'),
(14, 39, 0.2, 'benefit'),
(14, 40, 0.2, 'benefit'),
(14, 47, 0.2, 'benefit'),
(15, 4, 0.25, 'benefit'),
(15, 5, 0.25, 'benefit'),
(15, 10, 0.2, 'benefit'),
(15, 28, 0.05, 'benefit'),
(15, 41, 0.25, 'benefit'),
(16, 2, 0.2, 'benefit'),
(16, 3, 0.2, 'benefit'),
(16, 24, 0.1, 'benefit'),
(16, 36, 0.1, 'benefit'),
(16, 42, 0.2, 'benefit'),
(16, 43, 0.2, 'benefit'),
(17, 5, 0.2, 'benefit'),
(17, 7, 0.25, 'benefit'),
(17, 44, 0.25, 'benefit'),
(17, 45, 0.1, 'benefit'),
(17, 47, 0.2, 'benefit'),
(18, 5, 0.2, 'benefit'),
(18, 7, 0.25, 'benefit'),
(18, 45, 0.1, 'benefit'),
(18, 46, 0.25, 'benefit'),
(18, 47, 0.2, 'benefit'),
(19, 5, 0.1, 'benefit'),
(19, 7, 0.15, 'benefit'),
(19, 42, 0.25, 'benefit'),
(19, 45, 0.05, 'benefit'),
(19, 46, 0.15, 'benefit'),
(19, 47, 0.05, 'benefit'),
(19, 48, 0.25, 'benefit'),
(20, 4, 0.25, 'benefit'),
(20, 8, 0.25, 'benefit'),
(20, 49, 0.5, 'benefit'),
(21, 50, 0.25, 'benefit'),
(21, 51, 0.25, 'benefit'),
(21, 52, 0.25, 'benefit'),
(21, 53, 0.25, 'benefit'),
(22, 4, 0.2, 'benefit'),
(22, 5, 0.2, 'benefit'),
(22, 8, 0.15, 'benefit'),
(22, 10, 0.2, 'benefit'),
(22, 28, 0.1, 'benefit'),
(22, 54, 0.15, 'benefit'),
(23, 7, 0.2, 'benefit'),
(23, 14, 0.1, 'benefit'),
(23, 28, 0.1, 'benefit'),
(23, 55, 0.2, 'benefit'),
(23, 56, 0.2, 'benefit'),
(23, 57, 0.2, 'benefit'),
(24, 14, 0.25, 'benefit'),
(24, 24, 0.25, 'benefit'),
(24, 58, 0.25, 'benefit'),
(24, 59, 0.25, 'benefit'),
(25, 3, 0.2, 'benefit'),
(25, 4, 0.2, 'benefit'),
(25, 5, 0.2, 'benefit'),
(25, 10, 0.2, 'benefit'),
(25, 13, 0.2, 'benefit');

-- --------------------------------------------------------

--
-- Table structure for table `saw_evaluations`
--

CREATE TABLE `saw_evaluations` (
  `id_alternative` smallint(5) UNSIGNED NOT NULL,
  `id_criteria` tinyint(3) UNSIGNED NOT NULL,
  `value` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `saw_evaluations`
--

INSERT INTO `saw_evaluations` (`id_alternative`, `id_criteria`, `value`) VALUES
(1, 1, 4),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(19, 1, 4),
(5, 2, 4),
(6, 2, 4),
(7, 2, 2),
(8, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `saw_users`
--

CREATE TABLE `saw_users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `saw_users`
--

INSERT INTO `saw_users` (`id_user`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternative_criteria`
--
ALTER TABLE `alternative_criteria`
  ADD PRIMARY KEY (`id_alternative`,`id_criteria`),
  ADD KEY `id_criteria` (`id_criteria`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id_criteria`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id_disease`);

--
-- Indexes for table `saw_alternatives`
--
ALTER TABLE `saw_alternatives`
  ADD PRIMARY KEY (`id_alternative`);

--
-- Indexes for table `saw_criterias`
--
ALTER TABLE `saw_criterias`
  ADD PRIMARY KEY (`id_disease`,`id_criteria`),
  ADD KEY `id_criteria` (`id_criteria`);

--
-- Indexes for table `saw_evaluations`
--
ALTER TABLE `saw_evaluations`
  ADD PRIMARY KEY (`id_alternative`,`id_criteria`);

--
-- Indexes for table `saw_users`
--
ALTER TABLE `saw_users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id_criteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id_disease` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `saw_alternatives`
--
ALTER TABLE `saw_alternatives`
  MODIFY `id_alternative` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `saw_users`
--
ALTER TABLE `saw_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alternative_criteria`
--
ALTER TABLE `alternative_criteria`
  ADD CONSTRAINT `alternative_criteria_ibfk_1` FOREIGN KEY (`id_alternative`) REFERENCES `saw_alternatives` (`id_alternative`),
  ADD CONSTRAINT `alternative_criteria_ibfk_2` FOREIGN KEY (`id_criteria`) REFERENCES `saw_criterias` (`id_criteria`);

--
-- Constraints for table `saw_criterias`
--
ALTER TABLE `saw_criterias`
  ADD CONSTRAINT `saw_criterias_ibfk_1` FOREIGN KEY (`id_disease`) REFERENCES `diseases` (`id_disease`),
  ADD CONSTRAINT `saw_criterias_ibfk_2` FOREIGN KEY (`id_criteria`) REFERENCES `criteria` (`id_criteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
