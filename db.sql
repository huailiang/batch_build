-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-02-01 06:12:31
-- 服务器版本： 5.7.11
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dn`
--
CREATE DATABASE IF NOT EXISTS `dn` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dn`;

-- --------------------------------------------------------

--
-- 表的结构 `record`
--

CREATE TABLE `record` (
  `Name` varchar(15) DEFAULT NULL,
  `Des` varchar(100) DEFAULT NULL,
  `Stamp` datetime DEFAULT NULL,
  `Opt` int(11) DEFAULT NULL,
  `log` varchar(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `record`
--

INSERT INTO `record` (`Name`, `Des`, `Stamp`, `Opt`, `log`) VALUES
('alexpeng', 'push official and improve version', '2018-01-31 09:33:27', 3, '1517362407'),
('alexpeng', 'push official and improve version', '2018-01-31 09:35:43', 3, '1517362543'),
('alexpeng', 'push official and improve version', '2018-01-31 09:49:14', 3, '1517363354'),
('alexpeng', 'push official and improve version', '2018-01-31 09:52:38', 3, '1517363558'),
('alexpeng', 'push official and improve version', '2018-01-31 09:53:13', 3, '1517363593'),
('alexpeng', 'push official and improve version', '2018-01-31 09:56:24', 3, '1517363784'),
('alexpeng', 'push official and improve version', '2018-01-31 09:59:34', 3, '1517363974'),
('alexpeng', 'push official and improve version', '2018-01-31 10:08:24', 3, '1517364504'),
('alexpeng', 'push official and improve version', '2018-01-31 10:12:50', 3, '1517364770'),
('alexpeng', 'push official and improve version', '2018-01-31 10:17:09', 3, '1517365029'),
('alexpeng', 'build bundle', '2018-01-31 10:20:50', 2, '1517365250'),
('alexpeng', 'push official and improve version', '2018-01-31 10:31:00', 3, '1517365860'),
('alexpeng', 'reset option', '2018-01-31 10:49:09', 4, '1517366949'),
('alexpeng', 'reset option', '2018-01-31 10:51:30', 4, '1517367090'),
('alexpeng', 'pull git', '2018-01-31 10:51:57', 1, '1517367117'),
('alexpeng', 'build bundle', '2018-01-31 10:52:41', 2, '1517367161'),
('alexpeng', 'push official and improve version', '2018-01-31 10:59:18', 3, '1517367558'),
('alexpeng', 'reset option', '2018-01-31 11:05:28', 4, '1517367928'),
('alexpeng', 'pull git', '2018-01-31 11:06:33', 1, '1517367993'),
('alexpeng', 'pull git', '2018-01-31 11:08:00', 1, '1517368080'),
('alexpeng', 'pull git', '2018-01-31 11:13:01', 1, '1517368381'),
('alexpeng', 'pull git', '2018-01-31 11:13:04', 1, '1517368384'),
('alexpeng', 'reset option', '2018-01-31 11:13:16', 4, '1517368396'),
('alexpeng', 'pull git', '2018-01-31 11:18:13', 1, '1517368693'),
('alexpeng', 'reset option', '2018-01-31 11:18:35', 4, '1517368715'),
('alexpeng', 'pull git', '2018-01-31 11:18:52', 1, '1517368732'),
('alexpeng', 'pull git', '2018-01-31 11:20:20', 1, '1517368820'),
('alexpeng', 'pull git', '2018-01-31 11:20:54', 1, '1517368854'),
('alexpeng', 'pull git', '2018-01-31 11:24:08', 1, '1517369048'),
('alexpeng', 'pull git', '2018-01-31 11:24:18', 1, '1517369058'),
('alexpeng', 'pull git', '2018-01-31 11:28:59', 1, '1517369339'),
('alexpeng', 'pull git', '2018-01-31 11:29:18', 1, '1517369358'),
('alexpeng', 'pull git', '2018-01-31 11:29:39', 1, '1517369379'),
('alexpeng', 'pull git', '2018-01-31 11:36:34', 1, '1517369794'),
('alexpeng', 'pull git', '2018-01-31 11:37:09', 1, '1517369829'),
('alexpeng', 'pull git', '2018-01-31 11:38:05', 1, '1517369885'),
('alexpeng', 'build bundle', '2018-01-31 11:38:35', 2, '1517369915'),
('alexpeng', 'pull git', '2018-01-31 11:38:55', 1, '1517369935'),
('alexpeng', 'pull git', '2018-01-31 11:42:55', 1, '1517370175'),
('alexpeng', 'pull git', '2018-01-31 11:47:57', 1, '1517370477'),
('alexpeng', 'pull git', '2018-01-31 11:48:45', 1, '1517370525'),
('alexpeng', 'pull git', '2018-01-31 11:50:45', 1, '1517370645'),
('alexpeng', 'pull git', '2018-01-31 11:52:09', 1, '1517370729'),
('alexpeng', 'pull git', '2018-01-31 11:54:15', 1, '1517370855'),
('alexpeng', 'pull git', '2018-01-31 11:55:39', 1, '1517370939'),
('alexpeng', 'pull git', '2018-01-31 11:56:45', 1, '1517371005'),
('alexpeng', 'pull git', '2018-01-31 11:57:39', 1, '1517371059'),
('alexpeng', 'pull git', '2018-01-31 11:58:09', 1, '1517371089'),
('alexpeng', 'pull git', '2018-01-31 12:05:51', 1, '1517371551'),
('alexpeng', 'pull git', '2018-01-31 12:08:57', 1, '1517371737'),
('alexpeng', 'pull git', '2018-01-31 12:11:20', 1, '1517371880'),
('alexpeng', 'pull git', '2018-01-31 12:11:55', 1, '1517371915'),
('alexpeng', 'pull git', '2018-01-31 12:16:04', 1, '1517372164'),
('alexpeng', 'pull git', '2018-01-31 12:18:14', 1, '1517372294'),
('alexpeng', 'pull git', '2018-01-31 12:19:57', 1, '1517372397'),
('alexpeng', 'pull git', '2018-01-31 12:21:13', 1, '1517372473'),
('alexpeng', 'pull git', '2018-01-31 12:21:35', 1, '1517372495'),
('alexpeng', 'pull git', '2018-01-31 12:23:22', 1, '1517372602'),
('alexpeng', 'pull git', '2018-01-31 12:29:35', 1, '1517372975'),
('alexpeng', 'pull git', '2018-01-31 12:30:07', 1, '1517373007'),
('alexpeng', 'pull git', '2018-01-31 12:33:05', 1, '1517373185'),
('alexpeng', 'pull git', '2018-01-31 12:34:44', 1, '1517373284'),
('alexpeng', 'pull git', '2018-01-31 12:35:07', 1, '1517373307'),
('alexpeng', 'build bundle', '2018-01-31 12:35:40', 2, '1517373340'),
('alexpeng', 'push official and improve version', '2018-01-31 12:42:03', 3, '1517373723'),
('alexpeng', 'push official and improve version', '2018-01-31 12:44:39', 3, '1517373879'),
('alexpeng', 'build bundle', '2018-01-31 12:52:26', 2, '1517374346'),
('alexpeng', 'push official and improve version', '2018-01-31 12:55:26', 3, '1517374526'),
('alexpeng', 'reset option', '2018-01-31 12:56:54', 4, '1517374614'),
('alexpeng', 'pull git', '2018-01-31 12:59:24', 1, '1517374764'),
('alexpeng', 'build bundle', '2018-01-31 13:00:02', 2, '1517374802'),
('alexpeng', 'push official and improve version', '2018-01-31 13:03:59', 3, '1517375039'),
('alexpeng', 'reset option', '2018-01-31 13:12:27', 4, '1517375547'),
('alexpeng', 'reset option', '2018-01-31 13:29:30', 4, '1517376570'),
('alexpeng', 'reset option', '2018-01-31 13:37:56', 4, '1517377076'),
('alexpeng', 'reset option', '2018-01-31 13:38:40', 4, '1517377120'),
('alexpeng', 'reset option', '2018-01-31 13:39:33', 4, '1517377173'),
('alexpeng', 'reset option', '2018-01-31 13:40:27', 4, '1517377227'),
('alexpeng', 'reset option', '2018-01-31 13:44:36', 4, '1517377476'),
('alexpeng', 'reset option', '2018-01-31 14:13:53', 4, '1517379233'),
('alexpeng', 'reset option', '2018-01-31 14:16:53', 4, '1517379413'),
('alexpeng', 'reset option', '2018-01-31 14:17:54', 4, '1517379474'),
('alexpeng', 'pull git', '2018-01-31 14:29:32', 1, '1517380172'),
('alexpeng', 'pull git', '2018-01-31 14:31:07', 1, '1517380267'),
('alexpeng', 'pull git', '2018-01-31 14:32:59', 1, '1517380379'),
('alexpeng', 'build bundle', '2018-01-31 14:33:36', 2, '1517380416'),
('alexpeng', 'reset option', '2018-01-31 14:37:06', 4, '1517380626'),
('alexpeng', 'pull git', '2018-01-31 14:37:27', 1, '1517380647'),
('alexpeng', 'build bundle', '2018-01-31 14:38:25', 2, '1517380705'),
('alexpeng', 'push official and improve version', '2018-01-31 14:41:35', 3, '1517380895'),
('alexpeng', 'reset option', '2018-01-31 14:43:42', 4, '1517381022'),
('alexpeng', 'pull git', '2018-01-31 15:06:02', 1, '1517382362'),
('alexpeng', 'pull git', '2018-01-31 15:06:33', 1, '1517382393'),
('alexpeng', 'pull git', '2018-01-31 16:05:20', 1, '1517385920'),
('alexpeng', 'pull git', '2018-01-31 16:06:03', 1, '1517385963'),
('alexpeng', 'pull git', '2018-01-31 16:09:10', 1, '1517386150'),
('alexpeng', 'pull git', '2018-01-31 16:12:44', 1, '1517386364'),
('bnmjtzma', 'pull git', '2018-01-31 16:16:13', 1, '1517386572'),
('bnmjtzma', 'pull git', '2018-01-31 16:17:29', 1, '1517386649'),
('bnmjtzma', 'build bundle', '2018-01-31 16:18:36', 2, '1517386716'),
('bnmjtzma', 'reset option', '2018-01-31 16:23:23', 4, '1517387003'),
('alexpeng', 'pull git', '2018-01-31 16:33:33', 1, '1517387613'),
('alexpeng', 'build bundle', '2018-01-31 16:34:12', 2, '1517387652'),
('alexpeng', 'pull git', '2018-01-31 16:43:45', 1, '1517388225'),
('alexpeng', 'build bundle', '2018-01-31 16:44:31', 2, '1517388271'),
('alexpeng', 'reset option', '2018-01-31 16:50:01', 4, '1517388601'),
('alexpeng', 'pull git', '2018-01-31 16:50:51', 1, '1517388651'),
('alexpeng', 'build bundle', '2018-01-31 16:53:49', 2, '1517388829'),
('alexpeng', 'reset option', '2018-01-31 17:00:32', 4, '1517389232'),
('alexpeng', 'pull git', '2018-01-31 17:01:01', 1, '1517389261'),
('alexpeng', 'build bundle', '2018-01-31 17:01:28', 2, '1517389288'),
('alexpeng', 'build bundle', '2018-01-31 17:07:51', 2, '1517389671'),
('alexpeng', 'push official and improve version', '2018-01-31 17:10:36', 3, '1517389836'),
('alexpeng', 'reset option', '2018-01-31 17:14:56', 4, '1517390096'),
('alexpeng', 'reset option', '2018-01-31 17:23:03', 4, '1517390583'),
('alexpeng', 'pull git', '2018-01-31 17:46:15', 1, '1517391975'),
('alexpeng', 'pull git', '2018-02-01 11:11:09', 1, '1517454669'),
('alexpeng', 'pull git', '2018-02-01 11:13:36', 1, '1517454816'),
('alexpeng', 'build bundle', '2018-02-01 11:14:25', 2, '1517454865'),
('alexpeng', 'push official and improve version', '2018-02-01 11:22:48', 3, '1517455368'),
('alexpeng', 'pull git', '2018-02-01 11:39:42', 1, '1517456382'),
('alexpeng', 'build bundle', '2018-02-01 11:40:32', 2, '1517456432'),
('alexpeng', 'build bundle', '2018-02-01 11:42:15', 2, '1517456535'),
('alexpeng', 'push official and improve version', '2018-02-01 11:46:25', 3, '1517456785'),
('alexpeng', 'reset option', '2018-02-01 12:25:08', 4, '1517459108'),
('alexpeng', 'reset option', '2018-02-01 12:26:00', 4, '1517459160'),
('alexpeng', 'reset option', '2018-02-01 12:26:22', 4, '1517459182'),
('alexpeng', 'reset option', '2018-02-01 12:26:51', 4, '1517459211'),
('alexpeng', 'reset option', '2018-02-01 12:27:29', 4, '1517459249'),
('alexpeng', 'reset option', '2018-02-01 12:27:53', 4, '1517459273'),
('alexpeng', 'pull git', '2018-02-01 12:31:11', 1, '1517459471'),
('alexpeng', 'build bundle', '2018-02-01 12:31:42', 2, '1517459502'),
('alexpeng', 'push official and improve version', '2018-02-01 12:45:05', 3, '1517460305'),
('alexpeng', 'pull git', '2018-02-01 13:48:27', 1, '1517464107'),
('alexpeng', 'reset option', '2018-02-01 13:48:57', 4, '1517464137'),
('alexpeng', 'pull git', '2018-02-01 13:59:45', 1, '1517464785'),
('alexpeng', 'reset option', '2018-02-01 14:00:12', 4, '1517464812');

-- --------------------------------------------------------

--
-- 表的结构 `status`
--

CREATE TABLE `status` (
  `name` varchar(15) NOT NULL,
  `step` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `name` varchar(25) NOT NULL,
  `ltime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`name`, `ltime`) VALUES
('alexpeng', '2018-02-01 13:59:43'),
('bnmjtzma', '2018-01-31 16:14:37'),
('iteevohe', '2018-01-31 17:53:01'),
('paulluo', '2018-01-27 14:21:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
