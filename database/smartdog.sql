-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2015 at 05:24 AM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartdog`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountbank`
--

CREATE TABLE IF NOT EXISTS `accountbank` (
  `idaccount` int(6) NOT NULL,
  `accountname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `belong_to` int(11) NOT NULL,
  `income` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accountbank`
--

INSERT INTO `accountbank` (`idaccount`, `accountname`, `belong_to`, `income`, `date`) VALUES
(13, 'ACB', 1, 4000, '2015-09-29 02:49:48');

-- --------------------------------------------------------

--
-- Table structure for table `expense_cost`
--

CREATE TABLE IF NOT EXISTS `expense_cost` (
  `id_cat` int(11) NOT NULL,
  `cat_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_belong_to` int(11) NOT NULL,
  `cat_sum_cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ex_sub_cat`
--

CREATE TABLE IF NOT EXISTS `ex_sub_cat` (
  `sub_cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double NOT NULL,
  `par_cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encrypted_password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `unique_id`, `name`, `email`, `encrypted_password`, `salt`, `created_at`, `updated_at`) VALUES
(1, '5608e7320acd75.25976132', 'Nguyen Thanh Nhien', 'nhien.nguyen@abc.com', '3MPbj1RxFtX6wzr6AoE/uvsaCg9kZTJkOTFmMjEx', 'de2d91f211', '2015-09-28 14:07:30', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountbank`
--
ALTER TABLE `accountbank`
  ADD PRIMARY KEY (`idaccount`),
  ADD KEY `fk_user_id` (`belong_to`);

--
-- Indexes for table `expense_cost`
--
ALTER TABLE `expense_cost`
  ADD PRIMARY KEY (`id_cat`),
  ADD KEY `fk_belong_to_user` (`cat_belong_to`);

--
-- Indexes for table `ex_sub_cat`
--
ALTER TABLE `ex_sub_cat`
  ADD PRIMARY KEY (`sub_cat_id`),
  ADD KEY `fk_belong_to_cat` (`par_cat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountbank`
--
ALTER TABLE `accountbank`
  MODIFY `idaccount` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `expense_cost`
--
ALTER TABLE `expense_cost`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ex_sub_cat`
--
ALTER TABLE `ex_sub_cat`
  MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountbank`
--
ALTER TABLE `accountbank`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`belong_to`) REFERENCES `users` (`id`);

--
-- Constraints for table `expense_cost`
--
ALTER TABLE `expense_cost`
  ADD CONSTRAINT `fk_belong_to_user` FOREIGN KEY (`cat_belong_to`) REFERENCES `users` (`id`);

--
-- Constraints for table `ex_sub_cat`
--
ALTER TABLE `ex_sub_cat`
  ADD CONSTRAINT `fk_belong_to_cat` FOREIGN KEY (`par_cat_id`) REFERENCES `expense_cost` (`id_cat`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
