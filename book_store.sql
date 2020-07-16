-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2020 at 11:44 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `author` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `publisher` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `description`, `price`, `photo`, `publisher`) VALUES
(1, 'Learn Flutter Beginner', 'Mohammad Rangga', 'Learn Fluter Beginner', 100000, '656b947926b8842cacc24f51a5c6e09a73e14398', 'PT. Elex Media Komputindo'),
(2, 'Learn  Golang', 'Mohammad Rangga', 'Learn Golang For Advanced', 100000, '84f86cf1b77613605ab8ce79a0d3681307dd69e6', 'PT. Elex Media Komputindo'),
(3, 'Learn  Mobile with Android Studio', 'Mohammad Rangga', 'Learning Android Studio', 100000, 'a82316d5b98a8bfeaee6f7a9e0371ec3280d559e', 'PT. Elex Media Komputindo'),
(4, 'Learn  Adobe Photosop', 'Mohammad Rangga', 'Learning Adobe Photosop easy', 120000, '4e0a79463fef1715ffa7a5cd26fabfd24645a0f4', 'PT. Elex Media Komputindo'),
(5, 'World War 3 happening', 'Mohammad Rangga', 'World War 3 happening', 120000, '0f946c3b1697b63f7880feca7ed230a686f86378', 'PT. Elex Media Komputindo'),
(6, 'World War 2 : Nazi Crime', 'Mohammad Rangga', 'World War 2 : Nazi Crime', 120000, '5d2dccc85579589a8485cc14e9799ec8f83a5ca6', 'PT. Elex Media Komputindo'),
(7, 'World War 2 : Japan Surrender', 'Mohammad Rangga', 'World War 2 : Japan Surrender', 120000, '6007ae91304ea21ca4b7f07bcf2b014f3d300119', 'PT. Elex Media Komputindo'),
(8, 'History of Arabian King', 'Mohammad Rangga', 'History of Arabian King', 80000, 'bd648c91a5566f15c718e751c8a9cb4ae46d9b43', 'PT. Elex Media Komputindo'),
(9, 'The Death Of Hitler', 'Mohammad Rangga', 'Explaining the death of hitler', 80000, '1613eaacb819f161df488faa9320f951f51b2aa0', 'PT. Elex Media Komputindo'),
(10, 'Fall of Russian Communist', 'Mohammad Rangga', 'The explaining history about Stalin and Red Army destruction', 80000, 'ac82c5aa41507c15dd32ec4b322c987d34263115', 'PT. Elex Media Komputindo'),
(11, 'The Brave of Che Guevara', 'Mohammad Rangga', 'The Charisma of Che Guevara Explained', 80000, '389f1a9836733599376aba59345cc792dd09e207', 'PT. Elex Media Komputindo'),
(12, 'Conflict West Berlin and East Berlin', 'Mohammad Rangga', 'Conflict West Berlin and East Berlin', 80000, '4945c4495a3536d679af954b15d18151425934ff', 'PT. Elex Media Komputindo');

-- --------------------------------------------------------

--
-- Table structure for table `detail_trans_book`
--

CREATE TABLE `detail_trans_book` (
  `trans_id` varchar(150) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_trans_book`
--

INSERT INTO `detail_trans_book` (`trans_id`, `book_id`) VALUES
('TR001', 1),
('TR001', 3),
('TR003', 1),
('TR003', 3),
('TR003', 4),
('TR004', 4),
('TR004', 6),
('TR004', 2),
('TR005', 1),
('TR005', 3),
('TR005', 4),
('TR006', 6),
('TR006', 8),
('TR007', 4),
('TR007', 2),
('TR008', 4),
('TR008', 5),
('TR009', 4),
('TR009', 7),
('TR009', 9),
('TR0010', 1),
('TR0010', 2),
('TR0010', 4),
('TR0011', 3),
('TR0011', 4),
('TR0011', 5),
('TR0012', 1),
('TR0012', 2),
('TR0013', 1),
('TR0013', 2);

-- --------------------------------------------------------

--
-- Table structure for table `trans_book`
--

CREATE TABLE `trans_book` (
  `trans_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_book`
--

INSERT INTO `trans_book` (`trans_id`, `user_id`, `date`) VALUES
('TR001', 2, '2020-02-29'),
('TR001', 2, '2020-02-29'),
('TR003', 2, '2020-02-29'),
('TR004', 2, '2020-02-29'),
('TR005', 2, '2020-02-29'),
('TR006', 2, '2020-02-29'),
('TR007', 2, '2020-03-01'),
('TR008', 2, '2020-03-01'),
('TR009', 2, '2020-03-02'),
('TR0010', 2, '2020-03-04'),
('TR0011', 2, '2020-03-05'),
('TR0012', 2, '2020-03-07'),
('TR0013', 2, '2020-07-16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(2, 'Mohammad Rangga Jayaswara', 'mohammadrangga27@gmail.com', '$2y$10$SkPIjyEtWarfqJ9d.IO74uV8CzQEtBXooclY/H2rN67J7gSUv84Cm'),
(6, 'Osamu Dazai', 'osamu@gmail.com', '$2y$10$iHbtGh5NZLcAove4qku0EeGJtBYMmHPyrYpnuklCJ.t.zINMWa8au'),
(7, 'Reinhard', 'reinhard@gmail.com', '$2y$10$DXrtG7sPh.Dv3vFD.unp1eDtw2JQHqbOQjbzwVoTTejItRgoua4I2'),
(8, 'maliciousOne', 'malicious@gmail.com', '$2y$10$pdaBqs8d56rlvcyKdFhT8.qKNaHSzGWOO255x1NK2yon1lHp68bn.'),
(9, 'Gentar', 'gattuso@gmail.com', '$2y$10$FmbBAoTvwkaa/rwTyUM9FefL.eeYV/6s4eJsBLDf1jB29.Q1ty5zC'),
(10, 'Ardian Egy', 'egy@gmail.com', '$2y$10$dfZcFvtRCdxKPnBe9gZi1eskihQA8QGEZKuXhlbDtEMda7Pmm.wOC'),
(11, 'Ahmed Albar', 'achmed@gmail.com', '$2y$10$yx4UDoZNWryXwqRhWQcFNuHQRvtzpGXfXISsJyd3ykgyB.8w88n36'),
(12, 'wilhelmson', 'wilhelm@gmail.com', '$2y$10$41IkPZ.fGuLcCSBk5Thlo.sl/kI/B1nH2Uwl0kH3jFx17VkyQ1mxa'),
(13, 'Adam sadler', 'adam@gmail.com', '$2y$10$KF6i0IRaeQheH3RMba13x.mXU6ZQ.h0MK9OvhG4B0.moZSxkQbhcS'),
(14, 'fyodor dostoyevky', 'fyodor@gmail.com', '$2y$10$g6q0HoSFF8PqowZUpI7NQuyu2pfJ8ISAnPiW6yxre2mxo28AsXhBG'),
(15, 'jojowind@gmail.com', 'Giorno Giovana', '$2y$10$CBUQABDpkUAz21h9y7j/ZeklcHXmzILfuSFhekoP736toiazhEmI6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
