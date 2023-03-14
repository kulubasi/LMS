-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2023 at 11:39 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sacco`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact_no` varchar(30) NOT NULL,
  `upload_img` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `tax_id` varchar(50) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`id`, `firstname`, `middlename`, `lastname`, `contact_no`, `upload_img`, `address`, `email`, `tax_id`, `date_created`) VALUES
(1, 'Emmanual', '', 'Biro', '0778654323', '', 'Plot No.8, Nsambia, Kampala', 'biroemma@gmail.com', 'UIOJK23423', '0000-00-00'),
(3, ' John', 'Kenyi', 'Duku', '0765485347', '', 'Plot No: 18, Adjumani town, uganda', 'dukujk@gmail.com', 'jk34568', '0000-00-00'),
(4, 'Robert', 'Elly', 'Mawa', '0765485347', '', 'Entebbe, Uganda.', 'mrobert@gmail.com', 'MR234-67', '0000-00-00'),
(21, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(22, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(23, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(24, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(25, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(26, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(27, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(28, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(29, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(30, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(31, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(32, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(34, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(43, 'nicholas', '', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(44, 'nicholas', 'werd', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(45, 'nicholas', 'werd', 'Nyo', '0786567876', '', 'm', 'marvin@gmail.com', '786y5tg', '0000-00-00'),
(58, 'marvin', '', 'jumba', '', '', '', 'marvin@gmail.com', '', '0000-00-00'),
(78, 'test', '', 'testeer', '0765432345', 'IMG-640f946b81cbc7.40743683.png', 'busia', 'test@gmail.com', 'tss67', '0000-00-00'),
(79, 'jawa', '', 'Nyawoch', '0785642353', 'IMG-640fa34660b107.65373831.jpg', 'Kikawe', 'lkulubasi@gmail.com', 'jh89', '0000-00-00'),
(80, 'Atwine', '', 'Laban', '0785642111', 'IMG-640fa58b6a1824.05958284.jpg', 'lkulubasi@gmail.com', 'lkulubasi@gmail.com', 'hj', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `loan_list`
--

CREATE TABLE `loan_list` (
  `id` int(30) NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `loan_type_id` int(30) NOT NULL,
  `borrower_id` int(30) NOT NULL,
  `purpose` text NOT NULL,
  `amount` double NOT NULL,
  `plan_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= request, 1= confrimed,2=released,3=complteted,4=denied\r\n',
  `date_released` datetime NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan_list`
--

INSERT INTO `loan_list` (`id`, `ref_no`, `loan_type_id`, `borrower_id`, `purpose`, `amount`, `plan_id`, `status`, `date_released`, `date_created`) VALUES
(1, '80810623', 3, 1, 'Personal Loan as per request.', 12000, 3, 2, '2023-03-13 22:34:00', '2023-03-14 00:34:42'),
(2, '42409268', 4, 2, 'FOR WEDDING PROGRAM', 5500000, 5, 2, '2022-05-27 11:42:00', '2022-05-27 15:12:20'),
(4, '20282933', 1, 4, 'For business use', 2400000, 2, 2, '2022-11-02 09:48:00', '2022-11-02 11:48:18'),
(5, '85423239', 1, 3, 'business use', 500000, 2, 1, '0000-00-00 00:00:00', '2022-12-30 09:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `loan_plan`
--

CREATE TABLE `loan_plan` (
  `id` int(30) NOT NULL,
  `months` int(11) NOT NULL,
  `interest_percentage` float NOT NULL,
  `penalty_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan_plan`
--

INSERT INTO `loan_plan` (`id`, `months`, `interest_percentage`, `penalty_rate`) VALUES
(1, 36, 8, 3),
(2, 24, 5, 2),
(3, 27, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `loan_schedules`
--

CREATE TABLE `loan_schedules` (
  `id` int(30) NOT NULL,
  `loan_id` int(30) NOT NULL,
  `date_due` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan_schedules`
--

INSERT INTO `loan_schedules` (`id`, `loan_id`, `date_due`) VALUES
(37, 2, '2022-06-27'),
(38, 2, '2022-07-27'),
(39, 2, '2022-08-27'),
(40, 2, '2022-09-27'),
(41, 2, '2022-10-27'),
(42, 2, '2022-11-27'),
(43, 2, '2022-12-27'),
(44, 2, '2023-01-27'),
(45, 2, '2023-02-27'),
(46, 2, '2023-03-27'),
(47, 2, '2023-04-27'),
(48, 2, '2023-05-27'),
(49, 2, '2023-06-27'),
(50, 2, '2023-07-27'),
(51, 2, '2023-08-27'),
(52, 2, '2023-09-27'),
(53, 2, '2023-10-27'),
(54, 2, '2023-11-27'),
(55, 2, '2023-12-27'),
(56, 2, '2024-01-27'),
(57, 2, '2024-02-27'),
(58, 2, '2024-03-27'),
(59, 2, '2024-04-27'),
(60, 2, '2024-05-27'),
(61, 2, '2024-06-27'),
(62, 2, '2024-07-27'),
(63, 2, '2024-08-27'),
(64, 2, '2024-09-27'),
(65, 2, '2024-10-27'),
(66, 2, '2024-11-27'),
(67, 2, '2024-12-27'),
(68, 2, '2025-01-27'),
(69, 2, '2025-02-27'),
(70, 2, '2025-03-27'),
(71, 2, '2025-04-27'),
(72, 2, '2025-05-27'),
(73, 2, '2025-06-27'),
(74, 2, '2025-07-27'),
(75, 2, '2025-08-27'),
(76, 2, '2025-09-27'),
(77, 2, '2025-10-27'),
(78, 2, '2025-11-27'),
(79, 2, '2025-12-27'),
(80, 2, '2026-01-27'),
(81, 2, '2026-02-27'),
(82, 2, '2026-03-27'),
(83, 2, '2026-04-27'),
(84, 2, '2026-05-27'),
(85, 2, '2026-06-27'),
(86, 2, '2026-07-27'),
(87, 2, '2026-08-27'),
(88, 2, '2026-09-27'),
(89, 2, '2026-10-27'),
(90, 2, '2026-11-27'),
(91, 2, '2026-12-27'),
(92, 2, '2027-01-27'),
(93, 2, '2027-02-27'),
(94, 2, '2027-03-27'),
(95, 2, '2027-04-27'),
(96, 2, '2027-05-27'),
(97, 2, '2027-06-27'),
(98, 2, '2027-07-27'),
(99, 2, '2027-08-27'),
(100, 2, '2027-09-27'),
(101, 2, '2027-10-27'),
(102, 2, '2027-11-27'),
(103, 2, '2027-12-27'),
(104, 2, '2028-01-27'),
(105, 2, '2028-02-27'),
(106, 2, '2028-03-27'),
(107, 2, '2028-04-27'),
(108, 2, '2028-05-27'),
(109, 3, '2022-11-30'),
(110, 3, '2022-12-30'),
(111, 3, '2023-01-30'),
(112, 3, '2023-03-02'),
(113, 3, '2023-03-30'),
(141, 4, '2022-12-02'),
(142, 4, '2023-01-02'),
(143, 4, '2023-02-02'),
(144, 4, '2023-03-02'),
(145, 4, '2023-04-02'),
(146, 4, '2023-05-02'),
(147, 4, '2023-06-02'),
(148, 4, '2023-07-02'),
(149, 4, '2023-08-02'),
(150, 4, '2023-09-02'),
(151, 4, '2023-10-02'),
(152, 4, '2023-11-02'),
(153, 4, '2023-12-02'),
(154, 4, '2024-01-02'),
(155, 4, '2024-02-02'),
(156, 4, '2024-03-02'),
(157, 4, '2024-04-02'),
(158, 4, '2024-05-02'),
(159, 4, '2024-06-02'),
(160, 4, '2024-07-02'),
(161, 4, '2024-08-02'),
(162, 4, '2024-09-02'),
(163, 4, '2024-10-02'),
(164, 4, '2024-11-02'),
(192, 1, '2023-04-13'),
(193, 1, '2023-05-13'),
(194, 1, '2023-06-13'),
(195, 1, '2023-07-13'),
(196, 1, '2023-08-13'),
(197, 1, '2023-09-13'),
(198, 1, '2023-10-13'),
(199, 1, '2023-11-13'),
(200, 1, '2023-12-13'),
(201, 1, '2024-01-13'),
(202, 1, '2024-02-13'),
(203, 1, '2024-03-13'),
(204, 1, '2024-04-13'),
(205, 1, '2024-05-13'),
(206, 1, '2024-06-13'),
(207, 1, '2024-07-13'),
(208, 1, '2024-08-13'),
(209, 1, '2024-09-13'),
(210, 1, '2024-10-13'),
(211, 1, '2024-11-13'),
(212, 1, '2024-12-13'),
(213, 1, '2025-01-13'),
(214, 1, '2025-02-13'),
(215, 1, '2025-03-13'),
(216, 1, '2025-04-13'),
(217, 1, '2025-05-13'),
(218, 1, '2025-06-13');

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `id` int(30) NOT NULL,
  `type_name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan_types`
--

INSERT INTO `loan_types` (`id`, `type_name`, `description`) VALUES
(1, 'Small Business', 'Small Business Loans'),
(2, 'Mortgages', 'Mortgages'),
(3, 'Personal Loans', 'Personal Loans'),
(4, 'Gold Loan', 'Loan by taking gold as Mortgage');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(30) NOT NULL,
  `loan_id` int(30) NOT NULL,
  `payee` text NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `penalty_amount` float NOT NULL DEFAULT 0,
  `overdue` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=no , 1 = yes',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `loan_id`, `payee`, `amount`, `penalty_amount`, `overdue`, `date_created`) VALUES
(24, 2, '', 0, 0, 0, '2022-11-02 23:07:05'),
(25, 4, 'Mawa', 105000, 0, 0, '2022-11-02 23:07:24'),
(27, 2, '', 0, 0, 0, '2022-11-02 23:46:30'),
(28, 2, '', 0, 0, 0, '2022-11-02 23:46:45'),
(31, 2, '', 0, 0, 0, '2022-11-04 11:17:37'),
(32, 2, '', 0, 0, 0, '2022-11-04 11:18:05'),
(33, 2, '', 0, 0, 0, '2022-11-04 11:18:06'),
(35, 4, 'Biro', 50000, 0, 0, '2022-11-04 14:44:00'),
(37, 2, '', 0, 0, 0, '2022-11-04 14:44:19'),
(38, 2, '', 0, 0, 0, '2022-11-04 14:45:42'),
(39, 2, 'Mawa', 0, 0, 0, '2022-11-05 07:22:31'),
(40, 2, 'Mawa', 0, 0, 0, '2022-11-05 07:22:36'),
(42, 2, '', 0, 0, 0, '2022-11-05 07:34:22'),
(43, 4, 'Dustin', 300000, 0, 0, '2022-11-05 07:34:34'),
(44, 2, '', 0, 0, 0, '2022-11-12 14:51:26'),
(45, 4, 'Biro', 15000, 0, 0, '2022-11-12 14:51:59'),
(46, 4, 'Dustin', 1050000, 0, 0, '2022-11-12 14:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff, 3 = member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'Arua Uganda', '', 'mawarichard45@gmail.com', 'admin1', 1),
(2, 'Duku John  Kenyi', '', '', 'dustinodoi@gmail.com', 'Dustin', 2),
(3, 'Awinjo Brenda', '', '', 'awinjobrenda@gmail.com', 'Brenda', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_list`
--
ALTER TABLE `loan_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_plan`
--
ALTER TABLE `loan_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
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
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `loan_list`
--
ALTER TABLE `loan_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loan_plan`
--
ALTER TABLE `loan_plan`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
