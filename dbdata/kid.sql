-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-09-23 13:53:28
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `kid`
--

-- --------------------------------------------------------

--
-- 資料表結構 `accumulate_info`
--

CREATE TABLE `accumulate_info` (
  `stuno` int(7) NOT NULL,
  `score_sum` decimal(10,2) NOT NULL,
  `accumulate_credit` decimal(5,2) NOT NULL,
  `obtain_credit` decimal(5,2) NOT NULL,
  `score_avg` decimal(5,2) NOT NULL,
  `gpa_avg` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `course`
--

CREATE TABLE `course` (
  `cono` varchar(32) NOT NULL,
  `chinese_co` varchar(32) NOT NULL,
  `credit` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `pubdep`
--

CREATE TABLE `pubdep` (
  `deptno` varchar(3) NOT NULL,
  `deptName` varchar(32) NOT NULL,
  `degreeName` varchar(32) NOT NULL,
  `collegeName` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `semester`
--

CREATE TABLE `semester` (
  `stuno` int(7) NOT NULL,
  `year` int(3) NOT NULL,
  `semester` int(1) NOT NULL,
  `score_semester_sum` decimal(10,2) NOT NULL,
  `score_semester_avg` decimal(5,2) NOT NULL,
  `accumulate_credit` decimal(5,2) NOT NULL,
  `obtain_credit` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `stufile`
--

CREATE TABLE `stufile` (
  `stuno` int(7) NOT NULL,
  `deptno` int(3) NOT NULL,
  `name` varchar(32) NOT NULL,
  `entryYear` int(3) NOT NULL,
  `gradDate` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `stu_course`
--

CREATE TABLE `stu_course` (
  `stuno` int(7) NOT NULL,
  `year` int(3) NOT NULL,
  `semester` int(1) NOT NULL,
  `stu_course_no` varchar(32) NOT NULL,
  `stu_course_score` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `accumulate_info`
--
ALTER TABLE `accumulate_info`
  ADD PRIMARY KEY (`stuno`);

--
-- 資料表索引 `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cono`);

--
-- 資料表索引 `pubdep`
--
ALTER TABLE `pubdep`
  ADD PRIMARY KEY (`deptno`);

--
-- 資料表索引 `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`stuno`,`year`,`semester`);

--
-- 資料表索引 `stufile`
--
ALTER TABLE `stufile`
  ADD PRIMARY KEY (`stuno`);

--
-- 資料表索引 `stu_course`
--
ALTER TABLE `stu_course`
  ADD PRIMARY KEY (`stuno`,`year`,`semester`,`stu_course_no`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `accumulate_info`
--
ALTER TABLE `accumulate_info`
  ADD CONSTRAINT `accumulate_info_ibfk_1` FOREIGN KEY (`stuno`) REFERENCES `stufile` (`stuno`);

--
-- 資料表的限制式 `semester`
--
ALTER TABLE `semester`
  ADD CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`stuno`) REFERENCES `stufile` (`stuno`);

--
-- 資料表的限制式 `stu_course`
--
ALTER TABLE `stu_course`
  ADD CONSTRAINT `stu_course_ibfk_1` FOREIGN KEY (`stuno`) REFERENCES `stufile` (`stuno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
