-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2022 at 09:00 PM
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
-- Database: `airline_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

CREATE TABLE `aircraft` (
  `aircraft_no` varchar(10) NOT NULL CHECK (`aircraft_no` like 'A%'),
  `date_of_maintenance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`aircraft_no`, `date_of_maintenance`) VALUES
('A0001', '2022-09-24'),
('A0002', '2022-09-23'),
('A0003', '2022-09-23'),
('A0004', '2022-09-24'),
('A0005', '2022-09-24'),
('A0006', '2022-09-22'),
('A0007', '2022-09-22'),
('A0008', '2022-10-15'),
('A0009', '2022-10-14'),
('A0010', '2022-10-18'),
('A0011', '2022-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `air_schedule`
--

CREATE TABLE `air_schedule` (
  `flight_no` varchar(10) NOT NULL,
  `aircraft_no` varchar(10) DEFAULT NULL
) ;

--
-- Dumping data for table `air_schedule`
--

INSERT INTO `air_schedule` (`flight_no`, `aircraft_no`) VALUES
('F0001', 'A0001'),
('F0013', 'A0001'),
('F0002', 'A0002'),
('F0005', 'A0002'),
('F0003', 'A0003'),
('F0004', 'A0004'),
('F0014', 'A0004'),
('F0015', 'A0005'),
('F0006', 'A0006'),
('F0007', 'A0007'),
('F0008', 'A0008'),
('F0009', 'A0009'),
('F0010', 'A0010'),
('F0011', 'A0011'),
('F0012', 'A0011');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_no` varchar(10) NOT NULL,
  `src` varchar(50) DEFAULT NULL,
  `dest` varchar(50) DEFAULT NULL,
  `deptime` time DEFAULT NULL,
  `dep_date` date DEFAULT NULL,
  `arrivaltime` time DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `seats_left` int(5) DEFAULT NULL,
  `price` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_no`, `src`, `dest`, `deptime`, `dep_date`, `arrivaltime`, `arrival_date`, `seats_left`, `price`) VALUES
('F0001', 'Rajkot', 'Mumbai', '10:00:00', '2022-10-23', '11:00:00', '2022-10-23', 150, 5138),
('F0002', 'Rajkot', 'Delhi', '14:00:00', '2022-10-24', '16:00:00', '2022-10-24', 148, 5821),
('F0003', 'Ahmedabad', 'Delhi', '07:30:00', '2022-10-24', '09:30:00', '2022-10-24', 168, 4642),
('F0004', 'Mumbai', 'Chennai', '05:00:00', '2022-10-25', '07:00:00', '2022-10-25', 1, 3400),
('F0005', 'Mumbai', 'Dubai', '10:00:00', '2022-10-23', '12:30:00', '2022-10-23', 145, 14000),
('F0006', 'Kolkata', 'Mumbai', '22:00:00', '2022-10-27', '00:30:00', '2022-10-28', 150, 9000),
('F0007', 'Rajkot', 'Delhi', '16:00:00', '2022-10-31', '18:00:00', '2022-10-31', 123, 5821),
('F0008', 'Rajkot', 'Mumbai', '12:00:00', '2022-10-23', '13:00:00', '2022-10-23', 149, 5138),
('F0009', 'Rajkot', 'Delhi', '08:00:00', '2022-10-24', '10:00:00', '2022-10-24', 147, 5821),
('F0010', 'Ahmedabad', 'Delhi', '08:45:00', '2022-10-24', '10:45:00', '2022-10-24', 168, 4642),
('F0011', 'Mumbai', 'Chennai', '15:00:00', '2022-10-25', '17:00:00', '2022-10-25', 119, 3400),
('F0012', 'Mumbai', 'Thailand', '10:00:00', '2022-10-23', '14:30:00', '2022-10-23', 144, 14000),
('F0013', 'Kolkata', 'Chennai', '22:00:00', '2022-10-28', '00:30:00', '2022-10-29', 149, 7000),
('F0014', 'Rajkot', 'Delhi', '10:00:00', '2022-10-31', '12:00:00', '2022-10-31', 122, 5821),
('F0015', 'Delhi', 'Ahmedabad', '20:00:00', '2022-10-31', '22:00:00', '2022-10-31', 149, 5500);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passenger_no` int(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `payment_method` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passenger_no`, `name`, `address`, `contact_no`, `email_id`, `payment_method`) VALUES
(1, 'Kashyap', 'Jamnagar', '9857463330', 'kp@gmail.com', 'Online Banking'),
(2, 'Dhruv', 'Amreli', '9856543564', 'dhruv@yahoo.com', 'Online Banking'),
(4, 'Keyur', 'Morbi', '9854367565', 'keyur@gmail.com', 'Online Banking'),
(6, 'Prit', 'Surat', '9876303281', 'prit@gmail.com', 'Cash'),
(8, 'Maharshi', 'Navsari', '9876303999', 'maharshi@gmail.com', 'Online Banking'),
(9, 'Neel', 'Dhrol', '9876303888', 'neel_09@gmail.com', 'Online Banking'),
(10, 'Ajay Karmur', 'Bhanvad', '7788856789', 'aj5760@gmail.com', 'Online Banking'),
(13, 'Nilay Kansagara', 'Baroda', '9080706543', 'nilay@gmail.com', 'Cash'),
(14, 'Daxrajsinh', 'Rajkot', '8895840394', 'dax@gmail.com', 'Cash'),
(16, 'Vishwadeep', 'Bhavnagar', '8907809671', 'vishu17@gmail.com', 'Online Banking'),
(17, 'Krish', 'Bhavnagar', '5678904567', 'krish@gmail.com', 'Online Banking'),
(31, 'Bhargav Jivani', 'Morbi', '8877990980', 'bhargavjivani@gamil.com', 'Online Banking'),
(32, 'Yash Patel', 'Ahmedabad', '9977998954', 'kata5652@gmail.com', 'Cash'),
(33, 'Kaustubh', 'Ahmedabad', '7777924054', 'kl24@gmail.com', 'Online Banking'),
(34, 'Parth DK', 'Palanpur', '9967809875', 'parthdk68@gmail.com', 'Online Banking'),
(35, 'Kuldeep', 'Gondal', '5699570087', 'kuld@hotmail.com', 'Online Banking'),
(36, 'Milan Boda', 'Rajkot', '8790675432', 'drmilan@gmail.com', 'Online Banking'),
(37, 'Kevan', 'Jamnagar', '8877993311', 'kevanmehta@gmail.com', 'Online Banking'),
(38, 'Subrat Pradhan', 'Bhuvneshwar', '9900876905', 'subrat6065@gmail.com', 'Cash'),
(39, 'Priyank Boda', 'Rajkot', '8000555520', 'priyank@gmail.com', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `pilot`
--

CREATE TABLE `pilot` (
  `pilot_no` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `experience` int(5) DEFAULT NULL,
  `salary` int(10) DEFAULT NULL
) ;

--
-- Dumping data for table `pilot`
--

INSERT INTO `pilot` (`pilot_no`, `name`, `address`, `contact_no`, `email_id`, `experience`, `salary`) VALUES
('P0001', 'Prey', 'Morbi', '9145678201', 'prey@gmail.com', 3, 150000),
('P0002', 'Bhrugesh Majithiya', 'Green City, Rajkot', '7869540331', 'bhrugeshm156@gmail.com', 5, 160000),
('P0003', 'Meet Boda', 'Panchavati Society, Dhrol', '9157505662', 'meet@gmail.com', 3, 170000),
('P0004', 'Purvesh Dodiya', 'Rajkot', '6879504321', 'dodiyapurvesh@gmail.com', 7, 200000),
('P0005', 'Pranjal Javia', 'Jamnagar', '9876431324', 'pjavia@hotmail.com', 10, 150000),
('P0006', 'Raj Pansara', 'Jamnagar', '9876438884', 'mangal@hotmail.com', 8, 160000),
('P0007', 'Om Chikhaliya', 'Suart', '9856431324', 'om1007@hotmail.com', 6, 200000),
('P0008', 'Hitarth Patel', 'Banaskatha', '6666431324', 'hp@yahoo.com', 12, 220000),
('P0009', 'Rushi Gandhi', 'Anand', '5696431324', 'rushi0508@yahoo.com', 9, 160000),
('P0010', 'Dhruv Dabhi', 'Memadabad', '8006431324', 'ddhruv101@gmail.com', 4, 240000),
('P0011', 'Happy Boda', 'Rajkot', '8144556789', 'happy80@gmail.com', 12, 300000),
('P0012', 'Het Boda', 'Rajkot', '7890987654', 'het@yahoo.com', 6, 250000),
('P0013', 'Dhruvin Pambhar', 'Surat', '6789098765', 'dhruvin@gmail.com', 8, 200000),
('P0014', 'Ayush Gevariya', 'Anand', '9989098765', 'ayush1489@gmail.com', 4, 130000),
('P0015', 'Shivam', 'Bharuch', '6789888765', 'shivam@gmail.com', 3, 120000),
('P0016', 'Jash Shah', 'Surat', '9809098765', 'jashs@gmail.com', 9, 190000),
('P0017', 'Rich Amrutia', 'Jam Jhodhpur', '6712345765', 'rich@gmail.com', 3, 120000),
('P0018', 'Manthan', 'Valsad', '6785666665', 'manthanp@gmail.com', 6, 160000),
('P0019', 'Dhyey Tank', 'Jamnagar', '6554098765', 'dhyey2531@gmail.com', 10, 220000),
('P0020', 'Heet', 'Valsad', '8879098765', 'pardus1611@gmail.com', 5, 150000);

-- --------------------------------------------------------

--
-- Table structure for table `pilot_schedule`
--

CREATE TABLE `pilot_schedule` (
  `pilot_no` varchar(10) NOT NULL,
  `flight_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pilot_schedule`
--

INSERT INTO `pilot_schedule` (`pilot_no`, `flight_no`) VALUES
('P0001', 'F0001'),
('P0001', 'F0015'),
('P0002', 'F0001'),
('P0003', 'F0002'),
('P0003', 'F0005'),
('P0004', 'F0001'),
('P0004', 'F0002'),
('P0005', 'F0003'),
('P0006', 'F0003'),
('P0007', 'F0004'),
('P0007', 'F0005'),
('P0007', 'F0013'),
('P0008', 'F0004'),
('P0008', 'F0013'),
('P0009', 'F0006'),
('P0010', 'F0006'),
('P0011', 'F0007'),
('P0011', 'F0012'),
('P0012', 'F0007'),
('P0012', 'F0012'),
('P0013', 'F0008'),
('P0013', 'F0014'),
('P0014', 'F0008'),
('P0014', 'F0014'),
('P0015', 'F0009'),
('P0016', 'F0009'),
('P0017', 'F0010'),
('P0018', 'F0010'),
('P0019', 'F0011'),
('P0020', 'F0011'),
('P0020', 'F0015');

-- --------------------------------------------------------

--
-- Table structure for table `plane_air`
--

CREATE TABLE `plane_air` (
  `aircraft_no` varchar(10) NOT NULL,
  `type` varchar(50) DEFAULT NULL
) ;

--
-- Dumping data for table `plane_air`
--

INSERT INTO `plane_air` (`aircraft_no`, `type`) VALUES
('A0005', 'Jumbo'),
('A0001', 'Normal'),
('A0002', 'Normal'),
('A0003', 'Normal'),
('A0004', 'Normal'),
('A0006', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `plane_pilot`
--

CREATE TABLE `plane_pilot` (
  `pilot_no` varchar(10) NOT NULL,
  `type` varchar(50) DEFAULT NULL
) ;

--
-- Dumping data for table `plane_pilot`
--

INSERT INTO `plane_pilot` (`pilot_no`, `type`) VALUES
('P0001', 'Jumbo'),
('P0003', 'Jumbo'),
('P0002', 'Normal'),
('P0004', 'Normal'),
('P0005', 'Normal'),
('P0006', 'Normal'),
('P0007', 'Normal'),
('P0008', 'Normal'),
('P0009', 'Normal'),
('P0010', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `plane_type`
--

CREATE TABLE `plane_type` (
  `type` varchar(50) NOT NULL,
  `distance_range` int(10) NOT NULL,
  `passenger_capacity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plane_type`
--

INSERT INTO `plane_type` (`type`, `distance_range`, `passenger_capacity`) VALUES
('Jumbo', 900, 270),
('Normal', 1500, 200);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_flight`
--

CREATE TABLE `schedule_flight` (
  `flight_no` varchar(10) NOT NULL,
  `flight_date` date DEFAULT NULL
) ;

--
-- Dumping data for table `schedule_flight`
--

INSERT INTO `schedule_flight` (`flight_no`, `flight_date`) VALUES
('F0001', '2022-09-26'),
('F0002', '2022-09-26'),
('F0003', '2022-09-27'),
('F0004', '2022-09-30'),
('F0005', '2022-10-02'),
('F0006', '2022-09-25'),
('F0007', '2022-09-26');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_passenger`
--

CREATE TABLE `schedule_passenger` (
  `passenger_no` int(20) NOT NULL,
  `flight_no` varchar(10) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_passenger`
--

INSERT INTO `schedule_passenger` (`passenger_no`, `flight_no`, `payment_method`) VALUES
(1, 'F0001', 'Online Banking'),
(2, 'F0001', 'Online Banking'),
(4, 'F0002', 'Online Banking'),
(6, 'F0003', 'Online Banking'),
(8, 'F0005', 'Online Banking'),
(9, 'F0006', 'Online Banking'),
(10, 'F0007', 'Cash'),
(13, 'F0003', 'Online Banking'),
(14, 'F0005', 'Online Banking'),
(16, 'F0002', 'Cash'),
(17, 'F0005', 'Online Banking'),
(31, 'F0015', NULL),
(32, 'F0014', NULL),
(33, 'F0013', NULL),
(34, 'F0012', NULL),
(35, 'F0011', NULL),
(36, 'F0010', NULL),
(37, 'F0009', NULL),
(38, 'F0008', NULL),
(39, 'F0003', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`aircraft_no`);

--
-- Indexes for table `air_schedule`
--
ALTER TABLE `air_schedule`
  ADD PRIMARY KEY (`flight_no`),
  ADD KEY `FK1_air_schd` (`aircraft_no`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_no`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passenger_no`);

--
-- Indexes for table `pilot`
--
ALTER TABLE `pilot`
  ADD PRIMARY KEY (`pilot_no`);

--
-- Indexes for table `pilot_schedule`
--
ALTER TABLE `pilot_schedule`
  ADD PRIMARY KEY (`pilot_no`,`flight_no`),
  ADD KEY `FK` (`flight_no`);

--
-- Indexes for table `plane_air`
--
ALTER TABLE `plane_air`
  ADD PRIMARY KEY (`aircraft_no`),
  ADD KEY `FK1_plane_air` (`type`);

--
-- Indexes for table `plane_pilot`
--
ALTER TABLE `plane_pilot`
  ADD PRIMARY KEY (`pilot_no`),
  ADD KEY `FK2_plane_pilot` (`type`);

--
-- Indexes for table `plane_type`
--
ALTER TABLE `plane_type`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `schedule_flight`
--
ALTER TABLE `schedule_flight`
  ADD PRIMARY KEY (`flight_no`);

--
-- Indexes for table `schedule_passenger`
--
ALTER TABLE `schedule_passenger`
  ADD PRIMARY KEY (`passenger_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `passenger_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `schedule_passenger`
--
ALTER TABLE `schedule_passenger`
  MODIFY `passenger_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `air_schedule`
--
ALTER TABLE `air_schedule`
  ADD CONSTRAINT `FK1_air_schd` FOREIGN KEY (`aircraft_no`) REFERENCES `aircraft` (`aircraft_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK2_air_schd` FOREIGN KEY (`flight_no`) REFERENCES `flight` (`flight_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pilot_schedule`
--
ALTER TABLE `pilot_schedule`
  ADD CONSTRAINT `FK` FOREIGN KEY (`flight_no`) REFERENCES `flight` (`flight_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK1` FOREIGN KEY (`pilot_no`) REFERENCES `pilot` (`pilot_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plane_air`
--
ALTER TABLE `plane_air`
  ADD CONSTRAINT `FK1_plane_air` FOREIGN KEY (`type`) REFERENCES `plane_type` (`type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK2_plane_air` FOREIGN KEY (`aircraft_no`) REFERENCES `aircraft` (`aircraft_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plane_pilot`
--
ALTER TABLE `plane_pilot`
  ADD CONSTRAINT `FK1_plane_pilot` FOREIGN KEY (`pilot_no`) REFERENCES `pilot` (`pilot_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK2_plane_pilot` FOREIGN KEY (`type`) REFERENCES `plane_type` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule_passenger`
--
ALTER TABLE `schedule_passenger`
  ADD CONSTRAINT `FK1_schd_passenger` FOREIGN KEY (`passenger_no`) REFERENCES `passenger` (`passenger_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
