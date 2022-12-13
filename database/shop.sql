-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2021 at 06:27 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_table`
--

CREATE TABLE `address_table` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `town` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address_table`
--

INSERT INTO `address_table` (`address_id`, `user_id`, `country`, `postcode`, `address`, `town`) VALUES
(12, 3, 'Indonesia', '12121', 'Surabaya', 'Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `cart_table`
--

CREATE TABLE `cart_table` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_buy` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `flag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_table`
--

INSERT INTO `cart_table` (`cart_id`, `user_id`, `date_buy`, `flag`) VALUES
(17, 2, '0000-00-00 00:00:00', 0),
(18, 3, '2021-07-04 21:46:18', 1),
(19, 3, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_table`
--

CREATE TABLE `category_table` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `parent_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_table`
--

INSERT INTO `category_table` (`category_id`, `category_name`, `parent_category_id`) VALUES
(19, 'Audio', 0),
(20, 'Handphone & Tablet', 0),
(21, 'Komputer & Laptop', 0),
(22, 'Lainnya', 0),
(28, 'In Ear Monitor', 19),
(29, 'Earbud', 19),
(30, 'DAC & Amplifier', 19),
(32, 'Handphone', 20),
(33, 'Tablet', 20),
(34, 'Laptop', 21),
(35, 'Networking', 21),
(36, 'Desktop & Mini PC', 21),
(37, 'Aksesoris Komputer', 21),
(38, 'Kipas Angin', 22),
(40, 'Printer', 22),
(41, 'Aksesoris Audio', 19),
(42, 'Aksesoris Gadget', 20);

-- --------------------------------------------------------

--
-- Table structure for table `contact_table`
--

CREATE TABLE `contact_table` (
  `message_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `submit_time` datetime NOT NULL DEFAULT current_timestamp(),
  `flag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_table`
--

INSERT INTO `contact_table` (`message_id`, `full_name`, `email`, `message`, `submit_time`, `flag`) VALUES
(5, 'Dafa Berlian', 'test@test.com', 'askjdbaskjdbajksdbkjasbdkjasbdajksdbkjasdasdasdas d', '2021-07-03 01:39:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_cart_table`
--

CREATE TABLE `product_cart_table` (
  `product_cart_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_cart_table`
--

INSERT INTO `product_cart_table` (`product_cart_id`, `cart_id`, `product_id`, `quantity`, `add_time`) VALUES
(15, 18, 1, 2, '2021-07-04 14:45:35'),
(16, 18, 6, 2, '2021-07-04 14:45:42'),
(17, 19, 1, 2, '2021-07-04 14:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `product_images_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`product_images_id`, `product_id`, `image_link`) VALUES
(1, 1, 'uploads/2116916_194b6e99-5759-4fac-ab41-5d95b0503830_706_7061.jpg'),
(2, 2, 'uploads/6550659_108411a6-a298-4fef-a531-3a212e0ae9fd_800_800.jpg'),
(3, 3, 'uploads/8217de6a-9196-45ea-9393-22ad7dbdc029.jpg'),
(4, 4, 'uploads/616a01f6-e0da-4aeb-91ea-8febf499be81.jpg'),
(5, 5, 'uploads/5024822_c1e89ac0-d0e9-400a-9ea0-2e149a84618b_960_600.jpg'),
(6, 6, 'uploads/bc08c785-a74b-45bc-931d-156e4662702c1.jpg'),
(7, 7, 'uploads/150516_a330871c-c92f-4541-8f1d-f6c5e3df4c77_674_674.jpg'),
(9, 9, 'uploads/f31.jpg'),
(10, 10, 'uploads/asiap.jpg'),
(11, 11, 'uploads/new.jpg'),
(12, 12, 'uploads/ipad.jpg'),
(13, 13, 'uploads/40861697_b79a8e5c-c954-4ae4-aa4a-54db4b0c100a_620_620.jpg'),
(15, 15, 'uploads/ddfadc98-83a6-45bc-bf00-5c2c2f46aebb.jpg'),
(16, 16, 'uploads/5024b500-3b26-46f7-adbb-06d810215d891.jpg'),
(17, 17, 'uploads/6f877cdb-16c6-43f8-8781-9e169fc973bc1.jpg'),
(18, 18, 'uploads/d9da86b3-e80d-4eac-aebd-1249c785bcfc.jpg'),
(19, 19, 'uploads/a08964cf-f27a-4ee1-8637-c17b109afef41.jpg'),
(20, 20, 'uploads/708520_51a5b7ae-99c5-474c-9e0a-968e0a2db781_1017_1017.jpg'),
(21, 21, 'uploads/64938777_579cc26e-23a1-41fc-8a27-62c0752b63a4_700_700.jpg'),
(22, 22, 'uploads/9adf0d12-c606-48f1-b9cc-38e1673151751.jpg'),
(28, 28, 'uploads/d1f67b18-7d38-47ff-a88a-1085269079e61.jpg'),
(29, 29, 'uploads/100010336_9829e4b9-3394-4ceb-953e-4a9eafaf394a_550_5501.jpg'),
(41, 41, 'uploads/3576159_17e9bfe5-b249-43ea-ad15-9c20f2cef41d_2048_2048.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

CREATE TABLE `product_table` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `short_desc` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `stock` smallint(11) UNSIGNED NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active_flag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_table`
--

INSERT INTO `product_table` (`product_id`, `category_id`, `seller_id`, `product_name`, `price`, `short_desc`, `description`, `stock`, `add_time`, `active_flag`) VALUES
(1, 28, 1, 'Blon BL-03', '300000.00', 'BLON BL-03 10mm Carbon Diaphragm Dynamic Driver', '<ul>\r\n	<li>Specification:</li>\r\n	<li>Name: BLON BL-03</li>\r\n	<li>Earphone&nbsp;type:&nbsp;In-ear</li>\r\n	<li>Driver unit:&nbsp;10mm Carbon Diaphragm Dynamic Drive</li>\r\n	<li>Impedance: 32&Omega;</li>\r\n	<li>Earphone&nbsp;sensitivity:&nbsp;102dB/mW</li>\r\n	<li>Frequency range: 20-20000Hz</li>\r\n	<li>Interface: 3.5mm&nbsp;Gilded</li>\r\n	<li>Plug Type: L curved</li>\r\n	<li>Cable Length:&nbsp;1.2m&plusmn;3cm</li>\r\n	<li>Interface:&nbsp;2Pin 0.78MM&nbsp;&nbsp;connector</li>\r\n	<li>Microphone:&nbsp;Yes</li>\r\n	<li>Detachable Cable: Yes</li>\r\n</ul>\r\n', 15, '2021-07-06 04:27:10', 0),
(2, 28, 1, 'TIN HIFI T2 Plus', '650000.00', 'TIN HIFI T2 Plus NanoPure Dynamic Driver', '<ul>\r\n	<li>Tin Hifi</li>\r\n	<li>Drivers: 10 mm NanoPure nickel-zinc alloy dynamic drivers</li>\r\n	<li>Sensitivity: 104 &plusmn; 3 dB at 1 kHz, 0.126V</li>\r\n	<li>Frequency response: 10 Hz &ndash; 20 kHz</li>\r\n	<li>Impedance: 32 ohms &plusmn; 15%</li>\r\n	<li>Rated power: 3 mW</li>\r\n	<li>Maximum power: 5 mW</li>\r\n	<li>Maximum distortion: 1% at 1 kHz, 0.126V</li>\r\n	<li>Input: Gold-plated MMCX connector</li>\r\n	<li>Termination: 3.5 mm black carbon multi-dimensional heavy plug</li>\r\n	<li>Cable: 4-core silver-plated Kevlar-enameled 22AWG copper cable</li>\r\n	<li>Cable length: 4.1 ft (1.25 m)</li>\r\n</ul>\r\n', 50, '2021-07-06 04:27:08', 0),
(3, 28, 1, 'Etymotic Research ER2SE', '1715000.00', 'Etymotic Research ER2SE Dynamic Driver', '<ul>\r\n	<li>Brand Etymotic Research</li>\r\n	<li>Connections = wired</li>\r\n	<li>Model Name ETYER2SE</li>\r\n	<li>Color Multicolored</li>\r\n	<li>Headphones Form Factor In Ear</li>\r\n	<li>About this item</li>\r\n	<li>True high-accuracy sound experience</li>\r\n	<li>Metal earpieces with anodized ?nish</li>\r\n	<li>35+ dB of external noise isolation</li>\r\n	<li>Assortment of ear tips for the perfect in-ear ?t</li>\r\n	<li>Detachable cable allows for easy replacement</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Detachable, 4-foot cable</li>\r\n	<li>Foam and 3-flange ear tips</li>\r\n	<li>Filter removal tool and filters</li>\r\n	<li>Compact storage pouch</li>\r\n	<li>Shirt clip</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(4, 29, 1, 'NiceHCK Traceless', '35000.00', 'NiceHCK Traceless Dynamic Driver Earbud Earphone', '<ul>\r\n	<li>Product Name : NICEHCK Traceless earbud</li>\r\n	<li>Brand : NICEHCK</li>\r\n	<li>Model : Traceless</li>\r\n	<li>Type : Earbud</li>\r\n	<li>Impedance : 32&Omega;</li>\r\n	<li>Earphone sensitivity : 115dB/mW</li>\r\n	<li>Frequency range : 20-20000Hz</li>\r\n	<li>Earphone plug type : 3.5mm straight plug</li>\r\n	<li>Cable Length : 1.2m&plusmn;5cm</li>\r\n	<li>Whether with Mic : With Mic / No Mic ( two versions can choose)</li>\r\n	<li>Driver unit : Single 15.4mm PET Dynamic Drive unit</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(5, 29, 1, 'Edifier H185', '89000.00', 'Edifier H185 With Dynamic Driver', '<p>Spesifikasi :</p>\r\n\r\n<ul>\r\n	<li>Sound Pressur Level : 112dB</li>\r\n	<li>Frequency response: 20Hz-20kHz</li>\r\n	<li>Connector type : straight</li>\r\n	<li>Impedance: 32ohm</li>\r\n	<li>Maximum input power: 1mW</li>\r\n	<li>Cable length: 1.3m</li>\r\n	<li>Plug: 3.5mm stereo straight plug</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(6, 30, 1, 'Hiby FD1 DAC', '790000.00', 'HiBy FD1 Dual DAC Amp External Soundcard Output', '<ul>\r\n	<li>Dual ES9118</li>\r\n	<li>Dual crystal oscillators</li>\r\n	<li>3.5mm SE + 2.5mm balanced</li>\r\n	<li>Native DSD128</li>\r\n	<li>USB mode switch, 1.0 dan 2.0</li>\r\n	<li>Aluminum alloy body</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(7, 30, 1, 'FiiO BTR5 - Limited Edition', '2199000.00', 'FiiO BTR5 USB DAC Bluetooth Headphone Amp - Silver', '<ul>\r\n	<li>Dimensions 72&times;32&times;11.1mm</li>\r\n	<li>Bluetooth 5.0 Supported Audio Format(s) AAC/SBC/aptX/aptX LL/ aptX HD/LDAC</li>\r\n	<li>NFC Supported</li>\r\n	<li>Mic Function Support Bluetooth call,</li>\r\n	<li>built-in omnidirectional microphone;</li>\r\n	<li>support external microphone of CTIA cable</li>\r\n	<li>Headphone Output</li>\r\n	<li>3.5 mm stereo jack</li>\r\n	<li>USB Port</li>\r\n	<li>Type C USB</li>\r\n	<li>Balanced Headphone Output 2.5mm jack Drive Ability 16~100&Omega;?PO?</li>\r\n	<li>16~150&Omega;?BAL?</li>\r\n	<li>Channel Balance &le;0.1 dB Gain Supported(High/Low)</li>\r\n	<li>Volume Control Side buttons Status indication The display indicates the Bluetooth code,</li>\r\n	<li>charging, battery, volume, sampling rate, menu</li>\r\n	<li>APP interconnection Supports setting through App Bluetooth Codes Display Supported</li>\r\n	<li>Charging Time &le;1.5 h (DC 5V 500mA) Power Input Recommend DC 5V 500mA</li>\r\n	<li>Battery Capacity 550 mAh</li>\r\n	<li>Output Power</li>\r\n	<li>PO about 80mW?32&Omega; loaded? Frequency Response 20Hz?20kHz (aptX connection?</li>\r\n	<li>PO about 90mW?16&Omega; loaded?</li>\r\n	<li>BAL about 240mW?32&Omega; loaded? 20Hz?40kHz (LDAC connection?</li>\r\n	<li>BAL about 240mW?16&Omega; loaded?</li>\r\n	<li>THD+N PO?0.003%(LDAC 1kHz A-weighted) Output Impedance PO&le;1.0&Omega;?32&Omega; loaded?</li>\r\n	<li>BAL?0.002%(LDAC 1kHz A-weighted) BAL&le;2.0&Omega;?32&Omega; loaded?</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(9, 32, 1, 'Poco F3 6/128GB', '4499000.00', 'POCO F3  NFC Snapdragon™ 870 48MP 4520mAh', '<p>Penyimpanan &amp; RAM<br />\r\n6GB+128GB, 8GB + 256GB<br />\r\nRAM LPDDR5 + PENYIMPANAN UFS 3.1<br />\r\nBaterai 4520mAh (umum)<br />\r\nPengisian daya cepat 33W<br />\r\n<br />\r\nKamera<br />\r\nKamera utama 48MP f/1,79<br />\r\nPiksel besar 1,6&mu;m (4-in-1)<br />\r\nKamera ultra wide 8MP FOV 119&deg; f/2,2<br />\r\nKamera telemakro 5MP f/2,4 AF (3cm-7cm)<br />\r\nFitur fotografi kamera belakang<br />\r\nJaringan &amp; Konektivitas<br />\r\nSIM ganda<br />\r\nPita jaringan:<br />\r\nMendukung 5G / 4G / 3G / 2G<br />\r\nSensor<br />\r\nSensor jarak | Sensor cahaya ambien | Akselerometer | Giroskop | Kompas elektronik | Motor linear | IR Blaster<br />\r\n<br />\r\nSistem operasi<br />\r\nMIUI 12 untuk POCO<br />\r\n<br />\r\n<br />\r\nIsi Paket Pembelian<br />\r\n<br />\r\nPOCO F3<br />\r\nAdaptor daya<br />\r\nKabel USB Tipe C<br />\r\nAdaptor headphone Tipe C hingga 3,5mm<br />\r\nCasing pelindung<br />\r\nAlat pembuka SIM</p>\r\n', 50, '2021-07-06 02:36:33', 0),
(10, 32, 1, 'Samsung Galaxy S20 FE', '7769000.00', 'Samsung S20 FE SEIN 6.5-inch', '<ul>\r\n	<li>SIM Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</li>\r\n	<li>Size 6.5 inches, 101.0 cm2 (~84.8% screen-to-body ratio)</li>\r\n	<li>PLATFORM OS Android 10, One UI 2.5</li>\r\n	<li>Chipset Exynos 990 (7 nm+)</li>\r\n	<li>CPU Octa-core (2x2.73 GHz Mongoose M5 &amp; 2x2.50 GHz Cortex-A76 &amp; 4x2.0 GHz Cortex-A55)</li>\r\n	<li>GPU Mali-G77 MP11</li>\r\n	<li>MEMORY Card slot microSDXC (uses shared SIM slot)</li>\r\n	<li>Internal 128GB 8GB RAM,</li>\r\n	<li>MAIN CAMERA Triple 12 MP,</li>\r\n	<li>8 MP,</li>\r\n	<li>12 MP,</li>\r\n	<li>SELFIE CAMERA Single 32 MP,</li>\r\n	<li>BATTERY Type Li-Po 4500 mAh, non-removable</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(11, 32, 1, 'Apple iPhone 12 128GB', '13999000.00', 'Apple iPhone 12 - Garansi Resmi iBox Apple Indonesia', '<ul>\r\n	<li>Dimensions 146.7 x 71.5 x 7.4 mm (5.78 x 2.81 x 0.29 in)</li>\r\n	<li>Weight 164 g (5.78 oz)</li>\r\n	<li>Build Glass front (Gorilla Glass), glass back (Gorilla Glass), aluminum frame</li>\r\n	<li>SIM Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by) - for China</li>\r\n	<li>IP68 dust/water resistant (up to 6m for 30 mins)</li>\r\n	<li>Apple Pay (Visa, MasterCard, AMEX certified)</li>\r\n	<li>DISPLAY</li>\r\n	<li>Type Super Retina XDR OLED, HDR10, 625 nits (typ), 1200 nits (peak)</li>\r\n	<li>Size 6.1 inches, 90.2 cm2 (~86.0% screen-to-body ratio)</li>\r\n	<li>Resolution 1170 x 2532 pixels, 19.5:9 ratio (~460 ppi density)</li>\r\n	<li>Protection Scratch-resistant ceramic glass, oleophobic coating</li>\r\n	<li>Dolby Vision</li>\r\n	<li>Wide color gamut</li>\r\n	<li>True-tone</li>\r\n	<li>PLATFORM</li>\r\n	<li>OS iOS 14.1, upgradable to iOS 14.2</li>\r\n	<li>Chipset Apple A14 Bionic (5 nm)</li>\r\n	<li>CPU Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)</li>\r\n	<li>GPU Apple GPU (4-core graphics)</li>\r\n	<li>MEMORY</li>\r\n	<li>Card slot No</li>\r\n	<li>Internal 64GB 4GB RAM, 128GB 4GB RAM, 256GB 4GB RAM</li>\r\n	<li>NVMe</li>\r\n	<li>Dual 12 MP, f/1.6, 26mm (wide), 1.4&micro;m, dual pixel PDAF, OIS</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(12, 33, 1, 'iPad Pro 2020 - WIFI ONLY 128GB', '11190000.00', 'iPad Pro 2020 4th Gen 12.9', '<ul>\r\n	<li>Display: 12.9&nbsp;inches (2160 x 1620 pixels)</li>\r\n	<li>Storage: 128GB</li>\r\n	<li>CPU: A12 Bionic</li>\r\n	<li>Camera: 8MP</li>\r\n	<li>Video recording: 1080p at 30 fps</li>\r\n	<li>Front camera: 1.2MP</li>\r\n	<li>Battery life (claimed): Up to 9 hours</li>\r\n	<li>Size: 9.8 x 6.8 x 0.29 inches</li>\r\n	<li>Weight: 1.08 pounds</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(13, 33, 1, 'SAMSUNG Galaxy TAB S7 Plus [8/256GB]', '15839000.00', 'SAMSUNG Galaxy TAB S7 Plus [8/256GB] - Garansi Resmi SEIN', '<p>Spesifikasi :<br />\r\n<br />\r\n* Prosesor<br />\r\n* CPU Speed 3.09GHz, 2.4GHz, 1.8GHz<br />\r\n* CPU Type Octa-Core?<br />\r\n<br />\r\n* Display<br />\r\n* Ukuran (Main Display) 12.4&quot; (315.0mm)<br />\r\n* Resolusi (Main Display) 2800 x 1752 (WQXGA+)<br />\r\n* Teknologi (Main Display) Super AMOLED<br />\r\n* Kedalaman Warna (Main Display) 16M?<br />\r\n<br />\r\n* Dukungan S Pen Yes (Gesture/Remote Control)?<br />\r\n<br />\r\n* Kamera<br />\r\n* Main Camera - Resolution 13.0 MP + 5.0 MP<br />\r\n* Main Camera - Auto Focus Yes<br />\r\n* Front Camera - Resolution 8.0 MP<br />\r\n* Main Camera - Flash Yes<br />\r\n* Resolusi Rekaman Video UHD 4K (3840 x 2160) @30fps?<br />\r\n<br />\r\n* Memori<br />\r\n* RAM Size (GB) 8<br />\r\n* ROM Size (GB) 256<br />\r\n* Available Memory (GB)* 221.2<br />\r\n* Dukungan Memori Eksternal MicroSD (Up to 1TB)<br />\r\n<br />\r\n* Spesifikasi Fisik<br />\r\n* Dimension (HxWxD, mm) 185.0 x 285.0 x 5.7<br />\r\n* Weight (g) 575<br />\r\n<br />\r\n* Baterai<br />\r\n* Internet Usage Time(LTE) (Hours) Up to 8<br />\r\n* Internet Usage Time(Wi-Fi) (Hours) Up to 8<br />\r\n* Video Playback Time (Hours, Wireless) Up to 14<br />\r\n* Battery Capacity (mAh, Typical) 10090<br />\r\n* Removable No<br />\r\n* Audio Playback Time (Hours, Wireless) Up to 205<br />\r\n* Talk Time (4G LTE) (Hours) Up to 75?</p>\r\n', 50, '2021-07-06 02:36:33', 0),
(15, 42, 1, 'Kabel Charger Anker Powerline USB Type C to C', '99000.00', 'Kabel 0,9M 3FT Data - A8032 - Powerline SLCT+', '<p>PowerLine Select+ [A8032] USB-C to USB-C 2.0 Cable for Samsung, Oppo, Xiaomi, Realmi, Vivo, etc<br />\r\n<br />\r\n<br />\r\n*Length : 3 feet / 0,9m<br />\r\n*Double braided nylon<br />\r\n*Connector One: Type-C | Connector Two: Type-C<br />\r\n*Cable Speed: 480 Mbps<br />\r\n<br />\r\nWarna: Hitam<br />\r\n<br />\r\nSangat Tahan Lama: Pengisian Daya dan Kabel Data Double Braided Nylon.<br />\r\n<br />\r\nPengiriman Daya: Mendukung Pengiriman Daya Pengisian Berkecepatan Tinggi untuk Ponsel, Tablet, dan Laptop.<br />\r\n<br />\r\nDibangun Kuat: Ujung konektor yang diperkuat dan kabel nilon yang dikepang dapat menahan 15.000 Tekukan</p>\r\n', 50, '2021-07-06 02:36:33', 0),
(16, 34, 1, 'ASUS ROG ZEPHYRUS G15', '29999000.00', 'ASUS ROG Ryzen 9-5900HS 16GB 1TB RTX3060 6GB OHS', '<ul>\r\n	<li>Processor: AMD Ryzen&trade; 9 5900HS Processor 3.1 GHz (16M Cache, up to 4.5 GHz)</li>\r\n	<li>Memory: 8GB DDR4 on board + 8GB DDR4-3200 SO-DIMM</li>\r\n	<li>Storage: 1TB M.2 NVMe&trade; PCIe&reg; 3.0 SSD</li>\r\n	<li>Grafis : NVIDIA&reg; GeForce RTX&trade; 3060 Laptop GPU</li>\r\n	<li>With ROG Boost up to 1525MHz at 80W (95W with Dynamic Boost)</li>\r\n	<li>6GB GDDR6</li>\r\n	<li>Display: 15.6-inch QHD (2560 x 1440) 16:9 300nits anti-glare IPS-levelPantone validated panel</li>\r\n	<li>Operating System: Windows 10 Home</li>\r\n	<li>Bundled Software : Office Home Student 2019</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(17, 34, 1, 'MSI GF65 S Edition', '17299000.00', 'MSI GeForce RTX™ 3060 - 144Hz i5 10200H 16GB 512GB', '<p>Specification :</p>\r\n\r\n<ul>\r\n	<li>Graphics : NVIDIA GeForce&reg; RTX 3060, 6GB GDDR6</li>\r\n	<li>Processor Onboard : Intel&reg; Core&trade; i5-10200H Processor (8M Cache, up to 4.10 GHz)</li>\r\n	<li>Memory : 16 GB DDR4 3200Mhz (8*2)</li>\r\n	<li>Display : 15.6&quot; FHD (1920*1080), IPS-Level 144Hz Thin Bezel</li>\r\n	<li>Storage : 512GB NVMe PCIe Gen3x4 SSD</li>\r\n	<li>Chipset : Intel HM470</li>\r\n	<li>Keyboard : Single Red Keyboard</li>\r\n	<li>Camera : HD type (30fps@720p)</li>\r\n	<li>Wireless Network : Intel Wi-Fi 6 AX201(2*2 ax) + BlueTooth 5.1</li>\r\n</ul>\r\n\r\n<p><br />\r\nInterfaces :</p>\r\n\r\n<ul>\r\n	<li>1x RJ45</li>\r\n	<li>1x (4K @ 30Hz) HDMI</li>\r\n	<li>1x Type-C USB3.2 Gen1</li>\r\n	<li>3x Type-A USB3.2 Gen1</li>\r\n	<li>1x M.2 SSD Combo slot (NVMe PCIe Gen3 / SATA</li>\r\n	<li>Operating System : Windows 10 Home</li>\r\n	<li>Batteray : 3 cell , 51Whr</li>\r\n	<li>Dimension : 359 x 254 x 21.7 mm</li>\r\n	<li>Weight: 1,86Kg</li>\r\n	<li>Adapter : 120W adapter</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(18, 35, 1, 'XIAOMI Mi WiFi Router 4C', '175000.00', 'XIAOMI Smart Router 2.4GHz 64MB 4 Antennas', '<p>Xiaomi Router 4C&nbsp;menggunakan&nbsp;jaringan 802.11n 2.4GHz membuat router ini dapat mentransfer data dengan kecepatan 300Mbps. Ditambah lagi dengan penggunaan 4 buah antena eksternal high-gain yang memberi area jangkau sinyal yang luas dan stabil.&nbsp;Versi Mi Router 4C&nbsp;ini cocok untuk pengguna internet broadband rumahan yang menggunakan kecepatan di bawah 100 megabytes.<br />\r\n&nbsp;</p>\r\n\r\n<p>Spesifikasi Xiaomi Mi Router 4C 300Mbps 4 Antena</p>\r\n\r\n<ul>\r\n	<li>Jaringan Wireless</li>\r\n	<li>IEEE 802.11n</li>\r\n	<li>Frekuensi Sinyal</li>\r\n	<li>2.4GHz</li>\r\n	<li>Kecepatan Data</li>\r\n	<li>up to 300Mbps Speed</li>\r\n	<li>Antena</li>\r\n	<li>4</li>\r\n	<li>Dimensi</li>\r\n	<li>178.9 x 107 x 195mm</li>\r\n	<li>Lain-lain</li>\r\n	<li>CPU: MT7628N</li>\r\n	<li>RAM: 64MB DDR2</li>\r\n	<li>ROM: 16MB</li>\r\n	<li>No Of Antena: 4</li>\r\n	<li>iOS And Android Compatible</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(19, 37, 1, 'Rexus Wireless Daxa', '599000.00', 'Rexus PRO Mouse Wireless Gaming Daxa Air II', '<p>Spesifikasi Teknis</p>\r\n\r\n<ul>\r\n	<li>Sensor : PIXART PMW3370</li>\r\n	<li>Frekuensi : 2.4Ghz Zero delay (dengan Nano USB)</li>\r\n	<li>Resolusi : 100 &ndash; 19000 DPI</li>\r\n	<li>Akselerasi maksimal : 50G</li>\r\n	<li>Kecepatan maksimal : 400 IPS</li>\r\n	<li>Polling Rate : 125 - 1000Hz</li>\r\n	<li>Tingkat DPI Default : 400 - 16000 DPI (Dapat diperluas dengan software)</li>\r\n	<li>Tombol utama : Omron (OF) 20M Lifespan</li>\r\n	<li>Kabel : USB2.0</li>\r\n	<li>Panjang kabel : 1,8 m</li>\r\n	<li>Alas mouse : Teflon</li>\r\n	<li>Tipe LED : Running RGB</li>\r\n	<li>Baterai : 580mAh, baterai lithium isi ulang</li>\r\n	<li>Daya tahan baterai : &plusmn; 60 jam di polling rate 500hz (RGB off), &plusmn;30 &ndash; 40 jam di polling rate 1000hz, (RGB off).</li>\r\n	<li>Waktu pengisian daya : &plusmn; 2.5 jam</li>\r\n	<li>Sistem operasional : Win 7 dan setelahnya, MacOS 10.11 atau setelahnya</li>\r\n	<li>Dimensi mouse : 120 x 63.5 x 39milimeter</li>\r\n	<li>Berat : 77gram</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(20, 37, 1, 'Keychron K2', '1299000.00', 'Keychron K2 version 2 Brown Switch White Backlight Plastic', '<p>SPECIFICATION</p>\r\n\r\n<ul>\r\n	<li>Number of Keys: 84 keys</li>\r\n	<li>Layout: ANSI</li>\r\n	<li>Version: Gateron / Optical Hot-swappable</li>\r\n	<li>Switches: Low profile Gateron mechanical / Low profile Keychron Optical</li>\r\n	<li>Number of Multimedia Keys: 12</li>\r\n	<li>Frame Material: ABS+Aluminum frame</li>\r\n	<li>Keycap Material: ABS</li>\r\n	<li>Example compatible keycaps: Roccat Vulcan 120 Aimo, Cooler Master SK630/SK631/SK650/SK651, Corsair K70 RGB MK.2, Alienware AW510K</li>\r\n</ul>\r\n\r\n<p><br />\r\nCONNECTIVITY AND POWER</p>\r\n\r\n<ul>\r\n	<li>Backlit Types: 18</li>\r\n	<li>Backlit: Adjustable 4-level RGB backlit</li>\r\n	<li>System: Windows/Android/Mac/iOS</li>\r\n	<li>Battery: 1550mAh Rechargeable li-polymer battery</li>\r\n	<li>BT Working Time (Single LED): Up to 34 hours (Lab test result may vary by actual use)</li>\r\n	<li>BT Working Time (RGB): Up to 34 hours (Lab test result may vary by actual use)</li>\r\n	<li>Connection: Bluetooth and Type-C cable</li>\r\n	<li>Bluetooth version: 5.1</li>\r\n	<li>Bluetooth Device Name: Keychron K3</li>\r\n	<li>Compatible System: macOS/Windows</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(21, 36, 1, 'Asus AIO V222FAK', '199900.00', 'Asus V222FAK-BA341T I3-10110U 4GB 1TB 21,5\" FHD', '<p>Spesifikasi :</p>\r\n\r\n<ul>\r\n	<li>Display :21.5&quot; LEDbacklit</li>\r\n	<li>Resolution :FHD 1920X 1080</li>\r\n	<li>Glare :nonGlare</li>\r\n	<li>Touch Screen :nonTouch</li>\r\n	<li>On board processor :Intel&reg; Core&trade; i3 10110U</li>\r\n	<li>Memory :DRAM DDR4 4G</li>\r\n	<li>How to upgrade memory :Not available</li>\r\n	<li>Chipset :Integrated</li>\r\n	<li>Graphics :Intel HD Graphics</li>\r\n	<li>Storage :2.5 HDD SATA 1TB</li>\r\n	<li>Wireless 802.11ac+Bluetooth 4.1 (Dual band) 1*1</li>\r\n	<li>LAN 10/100/1000Mbps</li>\r\n	<li>Camera :1 M Pixel</li>\r\n	<li>NFC</li>\r\n	<li>Keyboard &amp; Mouse :Zen Plastic Golden/ Siver White Wired Keyboard+ Mouse</li>\r\n	<li>Operating System :Windows 10 (64bit)</li>\r\n	<li>AC Adapter :&quot;90 W Power adaptor</li>\r\n	<li>Side I/O Port :&quot;</li>\r\n	<li>1 x Microphone / Headphone Combo Jack</li>\r\n	<li>1x USB2.0&quot;</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0),
(22, 38, 1, 'ROBOT Kipas Angin Portable', '99000.00', 'ROBOT Kipas Angin Meja Mini Fan 720 Rotate Clip', '<p>Keunggulan:<br />\r\n1. Kipas kecil dengan daya tinggi, terdapat 3 kecepatan yang dapat disesuaikan<br />\r\n2. Bisa digunakan dimana saja, dirumah, ditempat kerja, atau diluar ruangan.<br />\r\n3. Tidak berisik, bekerja atau beristirahat tanpa harus terganggu suara kipas.<br />\r\n4. Waktu perkiraan pemakaian dengan 3 kecepatan<br />\r\n- level 1 = 7.5 jam<br />\r\n- level 2 = 3.0 jam<br />\r\n- level 3 = 1.5 jam<br />\r\n6. Desain kipas yang mudah dilepas, mudah membersihkan kotoran dan debu<br />\r\n7. Fan mode 720 derajat, pasang di sisi pinggir meja dengan clip dan di atas meja<br />\r\n<br />\r\nSpesifikasi:<br />\r\n*Input: 5V/1A<br />\r\n*Battery: 2,000mAh<br />\r\n*Velocity: 3 mode<br />\r\n*Material: ABS<br />\r\n*Battery: up to 7 hrs<br />\r\n*Product weight: &lt;300g<br />\r\n&nbsp;</p>\r\n', 50, '2021-07-06 02:36:33', 0),
(28, 40, 1, 'Canon MG2570s', '675000.00', 'Canon All-in-One Inkjet Printer MG2570s (A4)', '<p>Spesifikasi Canon PIXMA MG2570S</p>\r\n\r\n<ul>\r\n	<li>PRINT</li>\r\n</ul>\r\n\r\n<p>Speed 8.0 ipm (Black) - 4.0 ipm (Color)<br />\r\nResolution 4800 x 600 dpi<br />\r\nInk Droplet 2 pl (min.)<br />\r\nPaper Size A4, A5, B5, LTR, LGL, 4 x 6&quot;, 5 x 7&quot;, Envelopes (DL, COM10), Custum size (width 101.6mm - 215.9mm, length 152.4mm - 676mm)<br />\r\nCartridge Type PG-745S, CL-746S (PG-745, CL-746,PG-745XL,C;-746XL - optional)</p>\r\n\r\n<ul>\r\n	<li>SCAN</li>\r\n</ul>\r\n\r\n<p>Type Flatbed<br />\r\nScanning Method CIS (Contact Image Sensor)<br />\r\nResolution 600 x 1200 dpi<br />\r\nScanning Speed / Line Gray scale : 1.2 ms/line (300dpi)<br />\r\nColour : 3.5 ms/line (300dpi)<br />\r\nScan Bit Depth (In/Out) Gray Scale : 16/8 bits<br />\r\nColour : 48 / 24 bits (RGB 16 bits / 8 bits )</p>\r\n\r\n<ul>\r\n	<li>COPY</li>\r\n</ul>\r\n\r\n<p>Speed Colour : (A4 / Plain Paper / Max Speed ) : 1.6 ipm<br />\r\nImage Quality 2 positions (Fast &amp; Standart)<br />\r\nNumber of Copies 1 - 21 Pages<br />\r\nCompatible Media A4 &amp; LTR</p>\r\n', 50, '2021-07-06 02:36:33', 0),
(29, 40, 1, 'Epson L3110', '2220000.00', 'Epson L3110 Print Scan Copy', '<ul>\r\n	<li>Spesifikasi</li>\r\n</ul>\r\n\r\n<p>Printing Technology: On-demand inkjet (Piezoelectric)<br />\r\nMaximum Print Resolution: 5760 x 1440 dpi (with Variable-Sized Droplet Technology)</p>\r\n\r\n<ul>\r\n	<li>Print Speed:</li>\r\n</ul>\r\n\r\n<p>Photo Default - 10 x 15 cm / 4 x 6 &quot;:<br />\r\nApprox. 69 sec per photo (Border) / 90 sec per photo (Borderless) *1<br />\r\nDraft, A4 (Black / Colour):<br />\r\nUp to 33 ppm / 15 ppm *1<br />\r\nISO 24734, A4 Simplex (Black / Colour):<br />\r\nUp to 10 ipm / 5.0 ipm *1</p>\r\n', 50, '2021-07-06 02:36:33', 0),
(41, 41, 1, 'SpinFit CP145', '89000.00', 'SpinFit CP145 Earphone Eartips - 1 Pair Size M', '<p>Fitur :</p>\r\n\r\n<ul>\r\n	<li>- Eartip core has a inner diameter of 4.5 mm</li>\r\n	<li>- Included in the box for the high-end earphone AKG N5005</li>\r\n	<li>- Ergonomically designed with the ability to flex in all direction and conform to the ear canal</li>\r\n	<li>- Perfect for those hard to fit ears, and earphones with awkward insertion angles</li>\r\n	<li>- Premium soft silicone material provides great comfort and durability</li>\r\n</ul>\r\n', 50, '2021-07-06 02:36:33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `review_table`
--

CREATE TABLE `review_table` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review` varchar(100) NOT NULL,
  `post_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_table`
--

INSERT INTO `review_table` (`review_id`, `product_id`, `user_id`, `review`, `post_time`) VALUES
(4, 29, 2, 'Keren', '2021-07-02 03:43:33'),
(5, 1, 3, 'Mantap', '2021-07-03 21:51:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(30) NOT NULL DEFAULT 'buyer',
  `ban_flag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `first_name`, `last_name`, `company_name`, `username`, `email`, `password`, `user_type`, `ban_flag`) VALUES
(1, 'Admin', 'Admin', '', 'admin', 'admin@admin.com', '$2y$10$2fsiOiSV9GmPDfBLbo5D7eanESB3cFNLXk0MEAADhkhmv2IQwGZUy', 'admin', 0),
(2, 'Aulia Ihza', 'Hendradi', '', 'aulkiller', 'aulaihzak@gmail.com', '$2y$10$ohoqKSkiKSi8AV7Ui7LWxOCNgwKkk.ER7zWUkRNqmhD53tJ86jWbG', 'user', 0),
(3, 'Daffa', 'Berlian', '', 'dafaberlian', 'dafaberliano@gmailo.com', '$2y$10$YAa7dKh/E1LmnNnUI9GJm.tBiUhKJa3CGOcMfWyb5btyLdlhrtUxe', 'user', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_table`
--
ALTER TABLE `address_table`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_table`
--
ALTER TABLE `cart_table`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `category_table`
--
ALTER TABLE `category_table`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contact_table`
--
ALTER TABLE `contact_table`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `product_cart_table`
--
ALTER TABLE `product_cart_table`
  ADD PRIMARY KEY (`product_cart_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`product_images_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `review_table`
--
ALTER TABLE `review_table`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_table`
--
ALTER TABLE `address_table`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_table`
--
ALTER TABLE `cart_table`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `category_table`
--
ALTER TABLE `category_table`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `contact_table`
--
ALTER TABLE `contact_table`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_cart_table`
--
ALTER TABLE `product_cart_table`
  MODIFY `product_cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `product_images_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `product_table`
--
ALTER TABLE `product_table`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `review_table`
--
ALTER TABLE `review_table`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_table`
--
ALTER TABLE `address_table`
  ADD CONSTRAINT `user_address` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_table`
--
ALTER TABLE `cart_table`
  ADD CONSTRAINT `user_cart` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_cart_table`
--
ALTER TABLE `product_cart_table`
  ADD CONSTRAINT `product_cart_table_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart_table` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_cart_table_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_table`
--
ALTER TABLE `product_table`
  ADD CONSTRAINT `product_category` FOREIGN KEY (`category_id`) REFERENCES `category_table` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_product` FOREIGN KEY (`seller_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review_table`
--
ALTER TABLE `review_table`
  ADD CONSTRAINT `product_review` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_review` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
