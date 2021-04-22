-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2021 at 02:23 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist-mvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('admin','client') NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `uuid`, `username`, `password`, `type`, `fname`, `lname`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'rjoliverio', '$2b$10$eMncrAMtChBZ7S73lsJCfOeg6RTii4elffUNBSnsg1DPHA8FTcYc.', 'client', 'Rj', 'Oliverio', '2021-04-13 09:34:16', '2021-04-13 09:34:16', NULL),
(3, 'sbFqqj7AFqHmwt6ws3vtjyiWbnz6AY0X', 'fayeoliverio', '$2b$10$ciPJLGfwZhWYHZm3S8t.xeziP/o3scuHHLAXXZikJNHD/5LxPgFaO', 'client', 'Faye', 'Oliverio', '2021-04-13 10:05:19', '2021-04-13 10:05:19', NULL),
(4, '7KiZ2E2JFfNvBtA19KgoaoDftt5iF5YQ', 'aryastark', '$2b$10$zc7/MFZc8hVy8e5eTSMujO4qPBZONzfopyQHeg/v6f6yXxZ7dw5b6', 'client', 'Arya', 'Stark', '2021-04-13 10:48:53', '2021-04-13 10:48:53', NULL),
(5, '938uIr01HHyot2L9GXApsJzFmHNj03ZW', 'jonsnow', '$2b$10$cXVMD8G9NczA8ie3/DqheeNhvF4JVIpJ3pRyOQVYuTFtY3ru0v3WK', 'client', 'Jon', 'Snow', '2021-04-13 11:00:26', '2021-04-13 11:00:26', NULL),
(6, 'GkYle8Hs6e9n3U5hnsT1Qgo42dlX9aCc', 'sansastark', '$2b$10$S6ncwaBXWBMt2Hf1SwWBx.2bc11QH29wNIR4b6K31WCgg3tVJyPzq', 'client', 'Sansa', 'Stark', '2021-04-18 02:57:44', '2021-04-18 02:57:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20210413044637-create_accounts_table.js'),
('20210413044729-create_tasks_table.js');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `task` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `completedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `uuid`, `task`, `status`, `completedAt`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'hello world everyone', 0, NULL, '2021-04-13 12:01:29', '2021-04-13 12:17:46', '2021-04-13 12:26:28'),
(2, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'new world', 1, NULL, '2021-04-13 12:17:56', '2021-04-13 12:20:59', '2021-04-13 12:27:35'),
(3, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'Hello world', 1, NULL, '2021-04-13 12:27:43', '2021-04-13 12:27:44', '2021-04-13 12:27:46'),
(4, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'Helloworld', 1, NULL, '2021-04-13 12:29:42', '2021-04-13 12:30:13', '2021-04-13 12:33:52'),
(5, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'Hello world', 1, NULL, '2021-04-13 12:33:02', '2021-04-13 12:33:31', '2021-04-13 12:34:34'),
(6, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'Hello world', 0, NULL, '2021-04-13 12:33:26', '2021-04-13 12:33:26', '2021-04-13 12:33:32'),
(7, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'Sample Jogging', 0, NULL, '2021-04-13 12:35:13', '2021-04-13 12:35:13', '2021-04-13 12:35:16'),
(8, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'Jogging 6AM today', 1, NULL, '2021-04-13 12:35:51', '2021-04-13 12:36:38', '2021-04-13 12:36:41'),
(9, 'sbFqqj7AFqHmwt6ws3vtjyiWbnz6AY0X', 'Hello world', 1, NULL, '2021-04-13 12:36:05', '2021-04-13 12:36:17', '2021-04-13 12:37:06'),
(10, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'helloworld', 1, NULL, '2021-04-18 02:38:36', '2021-04-18 02:39:47', '2021-04-18 02:42:44'),
(11, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'hellowlrd', 1, NULL, '2021-04-18 02:39:43', '2021-04-18 02:40:57', '2021-04-18 02:42:41'),
(12, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'helloworld 123', 1, NULL, '2021-04-18 02:41:13', '2021-04-18 02:41:22', '2021-04-18 02:42:38'),
(13, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'Hello world', 1, NULL, '2021-04-18 02:52:51', '2021-04-18 02:57:16', '2021-04-18 03:00:40'),
(14, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'Jogging 5pm house in', 1, NULL, '2021-04-18 02:59:36', '2021-04-18 03:00:22', NULL),
(15, 'MJoH5EgIbxgZL36A13WIelq3jsPmQTzi', 'Hello world 6pm', 1, NULL, '2021-04-18 03:04:45', '2021-04-18 03:15:29', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
