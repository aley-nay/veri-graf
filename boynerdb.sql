-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6799
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for boynerdb
DROP DATABASE IF EXISTS `boynerdb`;
CREATE DATABASE IF NOT EXISTS `boynerdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `boynerdb`;

-- Dumping structure for table boynerdb.urungruplari
DROP TABLE IF EXISTS `urungruplari`;
CREATE TABLE IF NOT EXISTS `urungruplari` (
  `urungrpid` int unsigned NOT NULL AUTO_INCREMENT,
  `grpadi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`urungrpid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table boynerdb.urungruplari: ~8 rows (approximately)
INSERT INTO `urungruplari` (`urungrpid`, `grpadi`) VALUES
	(1, 'Kadın'),
	(2, 'Erkek'),
	(3, 'Çocuk'),
	(4, 'Spor'),
	(5, 'Ayakkabı & Çanta'),
	(6, 'Kozmetik'),
	(7, 'Ev & Yaşam'),
	(8, 'Outlet'),
	(9, 'Heidye'),
	(10, 'Markalar');

-- Dumping structure for table boynerdb.urunler
DROP TABLE IF EXISTS `urunler`;
CREATE TABLE IF NOT EXISTS `urunler` (
  `urunid` int unsigned NOT NULL AUTO_INCREMENT,
  `magazakodu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `urungrpid` int unsigned DEFAULT '1',
  `urunturu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cinsiyet` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'K',
  `urunadi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marka` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fiyat` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`urunid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table boynerdb.urunler: ~8 rows (approximately)
INSERT INTO `urunler` (`urunid`, `magazakodu`, `urungrpid`, `urunturu`, `cinsiyet`, `urunadi`, `marka`, `fiyat`) VALUES
	(1, 'F4SL-PNT0822', 1, 'Pantolon', 'K', 'Bej Kadın Lastikli Bol Kesim Çizgili Keten Pantolon', 'Fabrika', 1199.00),
	(2, 'F3WL-PNT2', 1, 'Pantolon', 'K', 'Yüksek Bel Havuç Lacivert - Beyaz Kadın Pantolon', 'Fabrika', 1559.99),
	(3, 'M1600843-71407', 1, 'T-Shirt', 'K', 'Yuvarlak Yaka Turuncu Kadın T-Shirt ', 'Mavi', 299.99),
	(4, 'M101077-30503', 1, 'Pantolon', 'K', 'STAR INDIGO Yüksek Bel Dar Paça Mom Fit  Denim Pantolon', 'Mavi', 1099.99),
	(5, '12216305_JCOHIKING', 2, 'Sweatshırt', 'E', 'Kapüşon Yaka Siyah Erkek Sweatshırt', 'Jack & Jones', 420.74),
	(6, '12238998_JCOSWEEP', 2, 'Mont', 'E', ' Krem Erkek Mont ', 'Jack & Jones', 4859.99),
	(7, '900303-9662', 3, 'Sandalet', 'K', 'Mor Kız Çocuk Sandalet', 'Hummel', 624.95),
	(8, '900356-2594', 3, 'Ayakkabı', 'E', 'Siyah - Sarı Erkek Çocuk Halı Saha Ayakkabısı', 'Hummel', 974.95),
	(9, '02473901', 1, 'Şapka', 'E', 'Lacivert Erkek Şapka', 'Puma', 399.90),
	(10, '84749101', 1, 'Rüzgarlık', 'K', 'Siyah Kadın Rüzgarlık', 'Puma', 1700.00),
		(12, 'Alu', 1, 'Pantolon', 'K', 'Yüksek Bel Normal Bej Kadın Pantolon', 'Fabrika', 699.99),
	(13, 'Alu', 1, 'Pantolon', 'K', 'Neon Kırmızı Kadın Pantolon', 'Fabrika', 454.99),
	(14, 'Alu', 1, 'Pantolon', 'K', 'Shaded College Yüksek Bel Düz Paça Mom', 'Mavi', 999.99),
	(15, 'Alu', 2, 'Pantolon', 'E', 'Siyah Erkek Düşük Bel Skinny Fit Denim Pantolonn', 'Jack & Jones', 649.95),
	(16, 'Alu', 2, 'Pantolon', 'E', 'Düşük Bel Slim Fit Denim Pantolon', 'Jack & Jones', 959.95),
	(17, 'Alu', 2, 'Pantolon', 'E', 'Erkek Düşük Bel Skinny Fit Denim Pantolon', 'Jack & Jones', 869.95),
	(18, 'Alu', 2, 'Sweatshırt', 'E', 'Kapüşon Yaka Koyu Yeşil Erkek Sweatshırt', 'Jack & Jones', 367.24),
	(19, 'Alu', 2, 'Sweatshırt', 'E', 'Kapüşon Yaka Koyu Lacivert Erkek Sweatshırt', 'Jack & Jones', 474.99),
	(20, 'Alu', 2, 'Sweatshırt', 'E', 'Kapüşon Yaka Beyaz Erkek Sweatshırt', 'Jack & Jones', 340.99),
	(21, 'Alu', 1, 'Sweatshırt', 'K', 'Kapüşon Yaka Düz Siyah Kadın Sweatshırt', 'Aeropostale', 349.99),
	(22, 'Alu', 1, 'Sweatshırt', 'K', 'Kapüşon Yaka Beyaz Kadın Sweatshırt', 'Aeropostale', 249.99),
	(23, 'Alu', 1, 'Sweatshırt', 'K', 'Kapüşon Yaka Pembe Siyah Kadın Sweatshırt', 'Aeropostale', 469.99),
	(24, 'Alu', 3, 'Ayakkabı', 'E', 'Siyah Erkek Çocuk Basketbol Ayakkabısı', 'Nike', 999.99),
	(25, 'Alu', 3, 'Ayakkabı', 'E', 'Beyaz Erkek Çocuk Ayakkabısı', 'Adidas', 452.99),
	(26, 'Alu', 3, 'Ayakkabı', 'E', 'Mavi Erkek Çocuk Basketbol Ayakkabısı', 'Nike', 970.99),
	(27, 'Alu', 3, 'Ayakkabı', 'K', 'Pembe Kız Çocuk Yürüyüş Ayakkabısı', 'Vans', 600.99),
	(28, 'Alu', 3, 'Ayakkabı', 'K', 'Siyah Kız Çocuk Yürüyüş Ayakkabısı', 'Vans', 400.99),
	(29, 'Alu', 3, 'Ayakkabı', 'K', 'Beyaz Kız Çocuk Yürüyüş Ayakkabısı', 'Vans', 760.99),	
	(30, 'Alu', 9, 'Heidye', 'K', 'Cacharel Noa Edt 30 Ml Kadın Parfüm', 'Cacharel', 760.99),
	(31, 'Alu', 9, 'Heidyeı', 'K', 'Burberry Classic For Women Edp 100 Ml Spray Parfüm', 'Burberry', 1240.99),
	(32, 'Alu', 9, 'Heidyeı', 'K', 'Channel Edp 100 Ml', 'Channel', 1299.99),
	(33, 'Alu', 8, 'Outlet', 'K', 'Mammaramma Lastik Desenli Pembe Kız Çocuk Etek', 'Mammaramma', 199.99),
	(34, 'Alu', 8, 'Outlet', 'K', 'Mammaramma Eskitme Desenli Çocuk Etek', 'Mammaramma', 299.99),
	(35, 'Alu', 8, 'Outlet', 'K', 'Mammaramma Düğmeli Beyaz Kız Çocuk Etek', 'Mammaramma', 50.99);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
