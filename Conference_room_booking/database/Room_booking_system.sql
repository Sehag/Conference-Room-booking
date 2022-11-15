-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 15, 2022 at 09:09 PM
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
-- Database: `Room_booking_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings_list`
--

CREATE TABLE `bookings_list` (
  `id` int(30) NOT NULL,
  `room_id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `schedule` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= for verification, 1=confirmed,2= reschedule,3=done',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings_list`
--

INSERT INTO `bookings_list` (`id`, `room_id`, `employee_id`, `schedule`, `status`, `date_created`) VALUES
(16, 1, 7, '2022-11-23 13:30:00', 0, '2022-11-16 01:38:28'),
(17, 2, 7, '2022-11-21 14:00:00', 0, '2022-11-16 01:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `img_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `name`, `img_path`) VALUES
(1, 'Projector', 'projector.jpg'),
(3, 'Wi-fi', 'wifi.jpg'),
(4, 'Video Conferencing', 'video_conferencing.jpg'),
(5, 'Air-conditioning', 'AC.jpg'),
(6, 'Break room', 'breakroom.png');

-- --------------------------------------------------------

--
-- Table structure for table `rooms_list`
--

CREATE TABLE `rooms_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `clinic_address` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `specialty_ids` text NOT NULL,
  `img_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms_list`
--

INSERT INTO `rooms_list` (`id`, `name`, `clinic_address`, `contact`, `email`, `specialty_ids`, `img_path`, `date_created`) VALUES
(1, 'Room1', '4th floor', '+91 5655455623', 'room1@gmail.com', '[5,6,1,3]', 'room1.jpg', '2020-09-24 09:52:00'),
(2, 'Room2', '25th floor', '+91 5461466323', 'room2@gmail.com', '[5,1,4]', 'room2.jpg', '2022-11-15 22:31:13'),
(3, 'Room3', '21st floor', '+91 61786178612', 'room3@gmail.com', '[1]', 'room3.jpg', '2022-11-16 01:00:38'),
(4, 'Room4', 'Ground floor', '+91 1986787156', 'room4@gmail.com', '[5,1,4]', 'room4.jpg', '2022-11-16 01:02:20'),
(5, 'Room5', '13th floor', '+91 6827761453', 'room5@gmail.com', '[5,6,3]', 'room5.jpg', '2022-11-16 01:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `rooms_schedule`
--

CREATE TABLE `rooms_schedule` (
  `id` int(30) NOT NULL,
  `room_id` int(30) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms_schedule`
--

INSERT INTO `rooms_schedule` (`id`, `room_id`, `day`, `time_from`, `time_to`) VALUES
(3, 2, 'Monday', '10:00:00', '17:00:00'),
(4, 2, 'Wednesday', '10:00:00', '17:00:00'),
(5, 3, 'Monday', '10:00:00', '15:00:00'),
(6, 3, 'Tuesday', '10:00:00', '15:00:00'),
(7, 3, 'Wednesday', '10:00:00', '15:00:00'),
(8, 3, 'Thursday', '10:00:00', '15:00:00'),
(9, 3, 'Friday', '10:00:00', '15:00:00'),
(10, 2, 'Tuesday', '08:00:00', '16:00:00'),
(11, 1, 'Monday', '08:00:00', '17:00:00'),
(12, 1, 'Wednesday', '08:00:00', '17:00:00'),
(13, 1, 'Friday', '08:00:00', '17:00:00'),
(14, 1, 'Sunday', '08:00:00', '17:00:00'),
(15, 5, 'Saturday', '06:00:00', '20:00:00'),
(16, 5, 'Sunday', '06:00:00', '20:00:00'),
(17, 4, 'Friday', '00:00:00', '23:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Conference Room Booking System', 'SE_project@sample.com', '8296390830', 'conference.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;welcome&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `room_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = room manager,3=employee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `room_id`, `name`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', 'admin', 'admin123', 1),
(2, 2, 'Room2', 'room2@gmail.com', 'room2', 2),
(7, 0, 'Employee1', 'employee1', 'employee1', 3),
(9, 1, 'Room1', 'room1@gmail.com', 'room1', 2),
(11, 3, 'Room3', 'room3@gmail.com', 'room3', 2),
(12, 4, 'Room4', 'room4@gmail.com', 'room4', 2),
(13, 5, 'Room5', 'room5@gmail.com', 'room5', 2),
(14, 0, 'Employee2', 'employee2', 'employee2', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings_list`
--
ALTER TABLE `bookings_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms_list`
--
ALTER TABLE `rooms_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms_schedule`
--
ALTER TABLE `rooms_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
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
-- AUTO_INCREMENT for table `bookings_list`
--
ALTER TABLE `bookings_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rooms_list`
--
ALTER TABLE `rooms_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rooms_schedule`
--
ALTER TABLE `rooms_schedule`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
