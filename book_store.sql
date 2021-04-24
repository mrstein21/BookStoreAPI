-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2021 at 09:51 AM
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
(13, 'El Narco Mexico', 'Smithsonian', 'The Breakthrough of Narco in Mexico', 150000, '1e783d141bb56c1f94c078d7218e407e51f560e1', 'Gramedia'),
(14, 'Learn Golang', 'Smithsonian', 'Mastering Golang from Beginning', 150000, '3079280f47e16e15c656166db29a82157615de7a', 'Gramedia'),
(15, 'Learn Flutter', 'Smithsonian', 'Mastering Flutter from Beginning', 120000, '7bbdc4c16e083db0181291cfe3413ed2b84a76c9', 'Gramedia'),
(16, 'Learn Adobe Photoshop', 'Smithsonian', 'Mastering Adobe from Beginning', 120000, 'cb398e6bc8b4d332003f86cd9edcc411208b9afb', 'Gramedia'),
(17, 'Microservices  Architecture', 'Smithsonian', 'Step By Step To Understand Microservices', 120000, 'db5c9baf9726e9508fb0297b73d0e7dd15c92e16', 'Gramedia'),
(19, 'Che Guevara', 'Smithsonian', 'The History of Che Guevara', 130000, '5c2ebb76046ae6b65667ac06b1134bd369195983', 'Gramedia'),
(20, 'Berlin Airlift', 'Smithsonian', 'Berlin Airlift Strategy in Cold War Era to Save People of Berlin', 130000, '35556464324384df56d3d3332ec8fd1e55f5dc31', 'Gramedia'),
(21, 'The Fall of Soviet', 'Smithsonian', 'The Failure of Soviet Government against West ', 150000, 'f9fc314e015b1b5de3a2130f8e242e56fe0fca31', 'Gramedia'),
(22, 'World War 2 History', 'Smithsonian', 'The History of World War', 150000, '0af6b7ad4de56855a3b87540988b66feb39138cc', 'Gramedia'),
(23, 'The Nazis', 'Smithsonian', 'The history of cruel Nazis and its Goverment', 110000, 'f8bcacb6b7bffc5baaf016e2300cdb711d5c8bd8', 'Gramedia'),
(24, 'Node Js For Beginner', 'Smithsonian', 'Learn Node Js Step By Step', 200000, '66c544af03295a060c45f7909574a2d24d669d96', 'Gramedia'),
(25, 'The Devops', 'Smithsonian', 'Learn and Understand the DevOps', 200000, '28f0b6184e3cdecf71004e9efc1a7d49c9f4b088', 'Gramedia');

-- --------------------------------------------------------

--
-- Table structure for table `detail_trans_book`
--

CREATE TABLE `detail_trans_book` (
  `trans_id` varchar(150) NOT NULL,
  `book_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_trans_book`
--

INSERT INTO `detail_trans_book` (`trans_id`, `book_id`, `qty`) VALUES
('TR001', 14, 1),
('TR001', 15, 1),
('TR002', 19, 2),
('TR002', 17, 2);

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
('TR001', 11, '2021-04-24'),
('TR002', 11, '2021-04-24');

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
(11, 'Ahmed Albar', 'achmed@gmail.com', '$2y$10$yx4UDoZNWryXwqRhWQcFNuHQRvtzpGXfXISsJyd3ykgyB.8w88n36'),
(17, 'jojowind@gmail.com', 'Giorno Giovana', '$2y$10$tIn5v3I8faQ/Olm/G8chxuVTGzuH23YvFXDlw7o87sodHkyPvyvO6'),
(18, 'Agus Nursikuwagus', 'agusnur@gmail.com', '$2y$10$Tt4Qo7FRIbvAz612awNID..bNOkLBmiH.RPLlgBKpFksUOhwT9Dl2');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
