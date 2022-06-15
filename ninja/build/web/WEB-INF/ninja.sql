-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2022 at 02:28 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ninja`
--

-- --------------------------------------------------------

--
-- Table structure for table `bug`
--

CREATE TABLE `bug` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `detail` varchar(1000) NOT NULL,
  `register_date` date NOT NULL,
  `solve_date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `project_id` int(100) NOT NULL,
  `priority` int(1) NOT NULL,
  `assigned_by` int(11) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `assigned_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bug`
--

INSERT INTO `bug` (`id`, `name`, `detail`, `register_date`, `solve_date`, `status`, `comment`, `project_id`, `priority`, `assigned_by`, `assigned_to`, `assigned_date`) VALUES
(2, 'DB Issue', 'null', '2022-06-01', '2022-06-02', 'Open', 'asdasdsad', 1, 1, 3, 2, '2022-06-01'),
(3, 'Add assigned by to bug db', 'null', '2022-06-01', '2022-06-01', 'New', 'do it', 2, 1, 2, 3, '2022-06-01'),
(4, 'Add fetch details to user page', 'null', '2022-06-01', '2022-06-02', 'Open', 'asdasdasd', 2, 2, 3, 2, '2022-06-01'),
(5, 'BUG3', 'null', '2022-06-07', '2022-06-07', 'Fixed', 'asdasd', 1, 1, 2, 2, '2022-06-07');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `end_date` date NOT NULL,
  `priority` int(10) NOT NULL,
  `tech` varchar(300) NOT NULL,
  `phase` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `details` varchar(9999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `name`, `end_date`, `priority`, `tech`, `phase`, `start_date`, `details`) VALUES
(1, 'NINJA', '2022-06-04', 1, 'JSP', 'PRE PROD', '2022-06-01', ''),
(2, 'Ninja2', '2022-06-04', 1, 'JSP', 'PRE PROD', '2022-06-01', '');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'project_manager'),
(3, 'software_engineer');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `roleid` int(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `emp_code` varchar(20) NOT NULL,
  `emp_designation` varchar(30) NOT NULL,
  `joining_date` date NOT NULL,
  `active` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `roleid`, `phone`, `emp_code`, `emp_designation`, `joining_date`, `active`) VALUES
(1, 'Shikhar', 'shikhar@gmail.com', 'admin', 1, '9422467205', 'abc', 'Admin', '2022-05-01', '1'),
(2, 'Rahul', 'rahul@gmail.com', 'admin', 2, '9898989898', 'a', 'Project Manager', '2022-05-01', '1'),
(3, 'Mukul', 'mukul@gmail.com', 'admin', 3, '9898989897', 'ab', 'Software Engineer', '2022-05-01', '1'),
(4, 'asd', 'asd@asd.com', 'admin', 1, '8368313927', 'asd927', 'admin', '2022-05-31', '1'),
(9, 'asd', 'shikhar23@gmail.com', 'admin', 1, '123123123123', 'asd123', 'admin', '2022-05-31', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bug`
--
ALTER TABLE `bug`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `emp_code` (`emp_code`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `roleid` (`roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bug`
--
ALTER TABLE `bug`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bug`
--
ALTER TABLE `bug`
  ADD CONSTRAINT `bug_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
