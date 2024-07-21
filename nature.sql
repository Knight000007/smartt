-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 14, 2024 at 01:24 PM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nature`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` varchar(100) DEFAULT NULL,
  `cart_product` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `total_price`, `cart_product`) VALUES
(1, 7, NULL, NULL),
(2, 7, '2295', NULL),
(3, 7, '6502.5', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `image`, `description`) VALUES
(1, 'Rachio Smart Hose Timer', 700, '../images/image1.jpg', 'Kit comes with one valve and one WiFi Hub. Timer valves require a WiFi Hub and two AA batteries (not included). This device only works with 2.4 GHz WiFi network.'),
(2, 'Orbit B-hyve', 900, '../images/image2.jpg', 'offers weather-based irrigation scheduling and can be managed through a mobile app. It supports voice control with Amazon Alexa and allows for remote control and monitoring of your irrigation system.'),
(3, 'RainMachine Touch HD-12', 850, '../images/image3.jpg', 'This smart sprinkler controller features a touchscreen interface and uses weather data to adjust watering schedules. It offers app control, weather-based scheduling, and integration with smart home systems like Google Home and Amazon Alexa.'),
(4, 'Netro Smart Sprinkler Controller', 1200, '../images/image4.jpg', 'The Netro controller is designed for easy installation and operation. It uses weather forecasts and historical data to create efficient watering schedules. The device can be controlled through a mobile app and supports voice commands via Google Assistant and Amazon Alexa.'),
(5, 'Hunter Hydrawise Wi-Fi Irrigation Controller', 1115, '../images/image5.jpg', 'Hunter\'s Hydrawise controller offers advanced water-saving features, including predictive watering based on weather forecasts. It can be managed through a mobile app and integrates with smart home systems for convenient control and monitoring.'),
(6, 'Eve Aqua Smart Water Controller', 980, '../images/image6.jpg', 'The Eve Aqua is a smart water controller that can be attached to any outdoor faucet. It allows you to control your watering schedule via an app and supports automation with Apple HomeKit, enabling voice control with Siri.\r\n'),
(7, 'Blossom 7 Smart Watering Controller', 750, '../images/image7.jpg', 'Blossom\'s smart watering controller uses weather data and plant types to create efficient watering schedules. It can be controlled via a mobile app and helps reduce water usage while keeping your garden healthy.'),
(8, 'GreenIQ Smart Garden Hub', 780, '../images/image8.jpg', 'The GreenIQ Hub connects to various sensors and smart devices to optimize your irrigation system. It uses weather forecasts to adjust watering schedules and supports integration with smart home systems and IoT devices.'),
(9, 'Aeon Matrix Yardian Pro', 750, '../images/image9.jpg', 'The Yardian Pro is a smart sprinkler controller that offers real-time weather adjustments, remote control via a mobile app, and integration with security cameras for additional home monitoring features.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'Customer',
  `firstname` varchar(60) NOT NULL,
  `middlename` varchar(60) DEFAULT NULL,
  `lastname` varchar(60) NOT NULL,
  `contact` varchar(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `role`, `firstname`, `middlename`, `lastname`, `contact`, `email`, `username`, `password`, `token`) VALUES
(5, 'Admin', 'rojan', '', 'shrestha', '9803845800', 'dallukaka89@gmail.com', 'rojan', 'rojan', '342039'),
(7, 'Customer', 'Shreeja', '', 'Neupane', '9863858636', 'neupane.shreejaa@gmail.com', 'shreeja033', 'shreeja033', '17228'),
(8, 'Customer', 'purnima', '', 'dangol', '9847778571', 'purnimadangol7@gmail.com', 'purnima', 'purnima', '982047');

-- --------------------------------------------------------

--
-- Table structure for table `water_usage`
--

CREATE TABLE `water_usage` (
  `id` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `plant` varchar(50) NOT NULL,
  `water_used` float NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `water_usage`
--

INSERT INTO `water_usage` (`id`, `city`, `plant`, `water_used`, `timestamp`, `user_id`) VALUES
(7, 'lalitpur', 'tomatoes', 3, '2024-07-14 00:16:39', 7),
(8, 'lalitpur', 'cucumbers', 2, '2024-07-14 00:16:46', 7),
(9, 'lalitpur', 'corn', 4, '2024-07-14 00:16:53', 7),
(10, 'kathmandu', 'peas', 2, '2024-07-14 00:17:39', 8),
(11, 'kathmandu', 'radishes', 3, '2024-07-14 00:17:48', 8),
(12, 'kathmandu', 'corn', 7, '2024-07-14 00:17:55', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `water_usage`
--
ALTER TABLE `water_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `water_usage`
--
ALTER TABLE `water_usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`);

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `water_usage`
--
ALTER TABLE `water_usage`
  ADD CONSTRAINT `water_usage_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
