-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2023 at 07:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
CREATE DATABASE blog;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, 4, 'good movie', '', 'Pending', '2023-12-01 01:41:47', '2023-12-01 01:41:47'),
(3, 1, 'jecob job', '', 'Pending', '2023-12-01 01:42:58', '2023-12-01 01:42:58'),
(12, 6, 'READ A BOOK', 'VERY IMPORTANT FOR GROWING', 'ON PROCESS(PAGE 25)', '2023-12-01 07:53:25', '2023-12-01 07:54:01'),
(13, 6, '1 HOUR CODING SESSION', 'FOR GOOD GASP ON CONCEPTS', 'On Way', '2023-12-01 07:54:36', '2023-12-03 18:05:42'),
(14, 6, 'Gym', 'MAKE IT AROUND 6PM TO 8PM', 'Pending', '2023-12-01 17:05:27', '2023-12-01 17:05:27'),
(16, 8, 'BATH', 'BERY IMPORTANT', 'DONE', '2023-12-01 17:51:37', '2023-12-01 17:51:47'),
(17, 6, 'GROCERRY TO BUY', 'PATATO\r\n\r\nDRINKS\r\n', 'Pending', '2023-12-01 20:26:10', '2023-12-01 20:26:37'),
(18, 6, 'Exercise', 'GYM,YOGA', 'Pending', '2023-12-02 02:59:05', '2023-12-02 02:59:26'),
(19, 6, 'Hydrate', '6 LI MINIMUM', 'Pending', '2023-12-02 03:00:02', '2023-12-02 03:00:02'),
(20, 6, 'Breaks', 'between study session', 'Pending', '2023-12-02 03:01:32', '2023-12-02 03:01:32'),
(21, 6, 'Learn something new', 'From Youtube or somewhere', 'Pending', '2023-12-02 03:02:47', '2023-12-02 03:02:47'),
(22, 6, 'Gratitude journal', '', 'Pending', '2023-12-02 03:06:23', '2023-12-02 03:06:23'),
(23, 6, 'Digital detox', '', 'Pending', '2023-12-02 03:07:24', '2023-12-02 03:07:24'),
(24, 6, 'Swimming Lesson', '', 'Pending', '2023-12-03 18:06:08', '2023-12-03 18:06:08'),
(25, 6, 'Watch an anime movie ', '', 'Pending', '2023-12-03 18:06:36', '2023-12-03 18:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `task_mngm`
--

CREATE TABLE `task_mngm` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_mngm`
--

INSERT INTO `task_mngm` (`id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(10, 'car wash', 'to much work', 'Done', '2023-12-01 01:04:32', '2023-12-01 01:09:57'),
(11, 'gym', '', 'Pending', '2023-12-01 01:09:16', '2023-12-01 01:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `Created_at`) VALUES
(1, 0, 'jecob', '', '$2y$10$qZGahX.WPyV86nVD9AOMX.0O/kw.KDoLQ69hyztBn.n1vjiF5VknG', '2023-11-30 22:30:38'),
(3, 0, 'yaksh', 'yaksh@gmail.com', '$2y$10$qe/V7yoCYIVYNCgfzYkLg.xZXZAuMp/mmkXHIU5SkQwZnxHDBv4i2', '2023-12-01 00:01:01'),
(4, 0, 'ayush', 'ayushbkl@gmail.com', '$2y$10$oe6odEymu5S5dLKLf44QQ.GprUy3WuR2RXka3/43ZUch8u6tFi5rC', '2023-12-01 01:08:38'),
(5, 0, 'david', 'abc@gmail.com', '$2y$10$j.9txtIFDclm7WNDUEGgPOB5cePnwUq6Tz0lDBNzO1dRM3SXVVCWu', '2023-12-01 01:46:02'),
(6, 0, 'simran', 'simran123@gmail.com', '$2y$10$hr4in1lqFU4CccY8OMEuuONiYyVaC/uzDgFxVhc1Bt09uIrDeDURq', '2023-12-01 05:07:57'),
(7, 0, 'aryan', 'aryan123@gmail.com', '$2y$10$1IDJowbnUFp20uQvRvC7gORuwOIDcrROW6UFWLGhSeTHBtWRRL83q', '2023-12-01 05:18:03'),
(8, 0, 'HARSIMRAN', 'HARSIMRAN554@GMAIL.COM', '$2y$10$d.X3I5BH2dujRRZYZSoTouWpa4uRgD9Ks8ozpo81nBR8BrSjR8R7W', '2023-12-01 17:51:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `task_mngm`
--
ALTER TABLE `task_mngm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `task_mngm`
--
ALTER TABLE `task_mngm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


ALTER TABLE task_mngm ADD due_date DATE;