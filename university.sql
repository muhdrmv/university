-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2021 at 10:44 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `cousres_list`
--

CREATE TABLE `cousres_list` (
  `cousre_list_id` int(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `professor_id` int(255) NOT NULL,
  `class_start_time` varchar(255) NOT NULL COMMENT 'example : (Sun Jan 31 2021 08:00:00) = class_has_been_started at 8 am\r\n(Sun Jan 31 2021 10:00:00) = class_has_been_finished at 10 am',
  `class_finish_time` varchar(255) NOT NULL COMMENT 'example : (Sat May 15 2021 00:00:00) = 1621062000000',
  `class_duration` varchar(255) NOT NULL,
  `number_of_students` int(255) NOT NULL,
  `used` int(255) NOT NULL,
  `semester_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cousres_list`
--

INSERT INTO `cousres_list` (`cousre_list_id`, `course`, `professor_id`, `class_start_time`, `class_finish_time`, `class_duration`, `number_of_students`, `used`, `semester_id`) VALUES
(1, 'art', 1, '1612108800000', '1621062000000', '2', 5, 0, 1),
(2, 'art', 1, '1612117800000', '1621062000000', '2', 5, 0, 1),
(3, 'art', 1, '1612132200000', '1621062000000', '2', 5, 0, 1),
(4, 'history', 2, '1612109700000', '1621062000000', '1.5', 20, 0, 1),
(5, 'history', 2, '1612202400000', '1621062000000', '1.5', 20, 0, 1),
(6, 'history', 2, '1612215000000', '1621062000000', '1.5', 20, 0, 1),
(7, 'music', 3, '1612215900000', '1621062000000', '2.5', 8, 0, 1),
(8, 'music', 3, '1612225800000', '1621062000000', '2.5', 8, 0, 1),
(9, 'music', 3, '1612281600000', '1621062000000', '2.5', 8, 0, 1),
(10, 'music', 3, '1612301400000', '1621062000000', '2.5', 8, 0, 1),
(11, 'music', 4, '1612311300000', '1621062000000', '2.5', 8, 0, 1),
(12, 'music', 4, '1612368000000', '1621062000000', '2.5', 8, 0, 1),
(13, 'music', 4, '1612386000000', '1621062000000', '2.5', 8, 0, 1),
(14, 'music', 4, '1612396800000', '1621062000000', '2.5', 8, 0, 1),
(15, 'art', 5, '1612108800000', '1621062000000', '2', 5, 0, 1),
(16, 'art', 5, '1612116900000', '1621062000000', '2', 5, 0, 1),
(17, 'art', 5, '1612127700000', '1621062000000', '2', 5, 0, 1),
(18, 'art', 5, '1612368000000', '1621062000000', '2', 5, 0, 1),
(19, 'art', 5, '1612376100000', '1621062000000', '2', 5, 0, 1),
(20, 'art', 5, '1612386900000', '1621062000000', '2', 5, 0, 1),
(21, 'mathematic', 6, '1612196100000', '', '2.5', 15, 0, 1),
(22, 'mathematic', 6, '1612205100000', '', '2', 15, 0, 1),
(23, 'mathematic', 6, '1612299600000', '', '2', 15, 0, 1),
(24, 'mathematic', 6, '1612308600000', '', '2', 15, 0, 1),
(25, 'mathematic', 7, '1612301400000', '', '2', 15, 0, 1),
(26, 'mathematic', 7, '1612312200000', '', '2', 15, 0, 1),
(27, 'mathematic', 7, '1612368000000', '', '2', 15, 0, 1),
(28, 'mathematic', 7, '1612377000000', '', '2', 15, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `professor_id` int(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`professor_id`, `fullname`, `date`) VALUES
(1, 'Jake', '1630827070784'),
(2, 'Charlie', '1630827111752'),
(3, 'Robert', '1630827125904'),
(4, 'William', '1630827162431'),
(5, 'David', '1630827179191'),
(6, 'Richard', '1630827195679'),
(7, 'Joseph', '1630827214167'),
(8, 'Charles', '1630827226255'),
(9, 'Thomas', '1630827240606'),
(10, 'Daniel', '1630827254990'),
(11, 'James', '1630827269102'),
(12, 'Alexander', '1630827285214');

-- --------------------------------------------------------

--
-- Table structure for table `selected_courses`
--

CREATE TABLE `selected_courses` (
  `selected_course_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `course_list_id` int(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `selected_courses`
--

INSERT INTO `selected_courses` (`selected_course_id`, `user_id`, `course_list_id`, `date`) VALUES
(1, 1, 1, '111');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semester_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start` varchar(255) NOT NULL COMMENT 'example : new Date(2021, 00, 01, 00, 00, 00).getTime()',
  `end` varchar(255) NOT NULL COMMENT 'example : new Date(2021, 05, 30, 23, 59, 59).getTime()'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semester_id`, `name`, `start`, `end`) VALUES
(1, 'first_mid_year', '1609488000000', '1625122799000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cousres_list`
--
ALTER TABLE `cousres_list`
  ADD PRIMARY KEY (`cousre_list_id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`professor_id`);

--
-- Indexes for table `selected_courses`
--
ALTER TABLE `selected_courses`
  ADD PRIMARY KEY (`selected_course_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cousres_list`
--
ALTER TABLE `cousres_list`
  MODIFY `cousre_list_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `professor_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `selected_courses`
--
ALTER TABLE `selected_courses`
  MODIFY `selected_course_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semester_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
