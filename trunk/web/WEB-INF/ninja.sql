
-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2022 at 10:43 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

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
  `Detail` varchar(1000) NOT NULL,
  `register_date` date NOT NULL,
  `solve_date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `project_id` int(100) NOT NULL,
  `priority` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bug_assigned`
--

CREATE TABLE `bug_assigned` (
  `id` int(11) NOT NULL,
  `bug_id` int(11) NOT NULL,
  `assigned_by` int(100) NOT NULL,
  `assigned_to` int(100) NOT NULL,
  `assigned_date` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ext` varchar(100) NOT NULL,
  `path` varchar(500) NOT NULL,
  `refer_table` varchar(100) NOT NULL,
  `bug_id` int(100) DEFAULT NULL,
  `project_id` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `priority` int(10) NOT NULL,
  `tech` varchar(300) NOT NULL,
  `phase` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `active` bit(1) NOT NULL,
  `roleid` int(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `emp_code` varchar(20) NOT NULL,
  `emp_designation` varchar(30) NOT NULL,
  `joining_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `bug_assigned`
--
ALTER TABLE `bug_assigned`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_by` (`assigned_by`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `bug_id` (`bug_id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_ibfk_1` (`project_id`),
  ADD KEY `file_ibfk_2` (`bug_id`);

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bug`
--
ALTER TABLE `bug`
  ADD CONSTRAINT `bug_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `bug_assigned`
--
ALTER TABLE `bug_assigned`
  ADD CONSTRAINT `bug_assigned_ibfk_1` FOREIGN KEY (`assigned_by`) REFERENCES `user` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `bug_assigned_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `bug_assigned_ibfk_3` FOREIGN KEY (`bug_id`) REFERENCES `bug` (`id`);

--
-- Constraints for table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `file_ibfk_2` FOREIGN KEY (`bug_id`) REFERENCES `bug` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON UPDATE NO ACTION;
COMMIT;
