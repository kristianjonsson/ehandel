-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 07. 06 2018 kl. 09:17:42
-- Serverversion: 10.1.26-MariaDB
-- PHP-version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ehandel`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `cart`
--

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL,
  `session_id` varchar(200) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `cart_line`
--

CREATE TABLE `cart_line` (
  `ID` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `order`
--

CREATE TABLE `order` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(30) NOT NULL,
  `created` datetime NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `order_delivery.address`
--

CREATE TABLE `order_delivery.address` (
  `order_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zipcode` bigint(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `order_line`
--

CREATE TABLE `order_line` (
  `ID` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `product_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `cart_line`
--
ALTER TABLE `cart_line`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks for tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks for tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `cart_line`
--
ALTER TABLE `cart_line`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `order`
--
ALTER TABLE `order`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `order_line`
--
ALTER TABLE `order_line`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `cart_line`
--
ALTER TABLE `cart_line`
  ADD CONSTRAINT `cart_line_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`ID`),
  ADD CONSTRAINT `cart_line_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`ID`);

--
-- Begrænsninger for tabel `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`ID`),
  ADD CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
