-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2025 at 04:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'Sony');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Electronics'),
(2, 'Furniture'),
(3, 'Clothing');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `phone`, `email`, `street`, `city`, `state`, `zip_code`) VALUES
(1, 'John', 'Doe', '987-654-3210', 'john.doe@example.com', '456 Elm St', 'Los Angeles', 'CA', '90001');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `restock_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_name`, `sku`, `quantity`, `restock_level`) VALUES
(18, 'Bluetooth Speaker', 'sony1', 1, 99),
(35, 'aqilah', 'suiii', 111111, 999999),
(36, 'r1', 'cdcd', 99999, 99999),
(39, 'Sony', '01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `action` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user`, `action`, `timestamp`) VALUES
(1, 'aqilah', 'Created new user: zayn with role Procurement Officer', '2025-01-31 08:37:50'),
(2, 'aqilah', 'Created new user: shaz with role Department Head', '2025-01-31 08:38:07'),
(3, 'aqilah', 'Deleted inventory item ID 3', '2025-02-01 17:06:14'),
(4, 'aqilah', 'Deleted inventory item ID 4', '2025-02-18 06:19:19'),
(5, 'aqilah', 'Deleted inventory item ID 3', '2025-02-18 06:19:30'),
(6, 'aqilah', 'Updated inventory item ID 3 with quantity 56565 and restock level 56565', '2025-02-18 06:21:02'),
(7, 'aqilah', 'Updated inventory item ID 3 with quantity 99999 and restock level 999999', '2025-02-18 06:21:28'),
(8, 'zayn', 'Updated inventory item ID 3 with quantity 77 and restock level 777', '2025-02-18 06:22:50'),
(9, 'zayn', 'Updated inventory item ID 3 with quantity 78787 and restock level -7', '2025-02-18 06:24:25'),
(10, 'aqilah', 'Updated inventory item ID 7777777777777777 with quantity 7777777777 and restock level 777777777777', '2025-02-25 16:34:36'),
(11, 'aqilah', 'Updated inventory item ID 1 with quantity 7777777 and restock level 7777777777777', '2025-02-25 16:45:06'),
(12, 'aqilah', 'Updated inventory item ID 1 with quantity 7777777 and restock level 88888888888888888', '2025-02-25 16:45:26'),
(13, 'aqilah', 'Updated inventory item ID 1 with quantity 88888888888888888 and restock level 888888888', '2025-02-25 16:46:03'),
(14, 'aqilah', 'Updated inventory item ID 1 with quantity 5 and restock level 7', '2025-02-25 16:46:40'),
(15, 'aqilah', 'Updated inventory item ID 1 with quantity 171001 and restock level 181001', '2025-02-25 16:47:05'),
(16, 'aqilah', 'Updated inventory item ID 7 with quantity 676767676 and restock level -10', '2025-02-25 16:47:26'),
(17, 'aqilah', 'Updated inventory item ID 7 with quantity -676767676 and restock level -10', '2025-02-25 16:49:32'),
(18, 'aqilah', 'Updated inventory item ID 7 with quantity 0 and restock level 1', '2025-02-25 16:55:52'),
(19, 'aqilah', 'Updated inventory item ID 16 with quantity 1 and restock level 99999999999', '2025-02-25 18:23:33'),
(20, 'aqilah', 'Updated inventory item ID 16 with quantity 9999999999 and restock level 1', '2025-02-25 18:23:46'),
(21, 'aqilah', 'Updated inventory item ID 16 with quantity 777777777777777 and restock level 888888888', '2025-02-25 18:24:20'),
(22, 'aqilah', 'Updated inventory item ID 16 with quantity 7777777777 and restock level 888888888', '2025-02-25 18:25:17'),
(23, 'aqilah', 'Deleted inventory item ID 16', '2025-02-25 18:30:56'),
(24, 'aqilah', 'Deleted inventory item ID 16', '2025-02-25 18:31:04'),
(25, 'aqilah', 'Deleted inventory item ID 5', '2025-02-25 18:31:11'),
(26, 'aqilah', 'Deleted inventory item ID 8', '2025-02-25 18:31:25'),
(27, 'aqilah', 'Deleted inventory item ID 8', '2025-02-25 18:31:27'),
(28, 'aqilah', 'Updated inventory item ID 15 with quantity 7 and restock level 8', '2025-02-25 18:31:54'),
(29, 'aqilah', 'Updated inventory item ID 6 with quantity 566 and restock level 5655', '2025-02-25 18:32:10'),
(30, 'aqilah', 'Updated inventory item ID 2 with quantity 10 and restock level 0', '2025-02-25 18:32:40'),
(31, 'aqilah', 'Deleted inventory item ID 1', '2025-02-25 18:50:28'),
(32, 'aqilah', 'Deleted inventory item ID 6', '2025-02-25 18:50:33'),
(33, 'aqilah', 'Deleted inventory item ID 7', '2025-02-25 18:50:39'),
(34, 'aqilah', 'Deleted inventory item ID 14', '2025-02-25 18:50:42'),
(35, 'aqilah', 'Deleted inventory item ID 15', '2025-02-25 18:50:45'),
(36, 'aqilah', 'Deleted inventory item ID 17', '2025-02-25 18:50:50'),
(37, 'aqilah', 'Updated inventory item ID 18 with quantity 1 and restock level 99', '2025-02-25 18:51:46'),
(38, 'aqilah', 'Updated inventory item ID 19 with quantity 1 and restock level 1', '2025-02-25 19:22:03'),
(39, 'aqilah', 'Deleted inventory item ID 19', '2025-02-25 19:22:08'),
(40, 'aqilah', 'Deleted inventory item ID 20', '2025-02-25 19:30:25'),
(41, 'aqilah', 'Deleted inventory item ID 21', '2025-02-25 19:30:58'),
(42, 'aqilah', 'Deleted inventory item ID 22', '2025-02-25 19:31:18'),
(43, 'aqilah', 'Deleted inventory item ID 23', '2025-02-25 19:32:52'),
(44, 'aqilah', 'Deleted inventory item ID 24', '2025-02-25 19:33:16'),
(45, 'aqilah', 'Deleted inventory item ID 25', '2025-02-25 19:46:10'),
(46, 'aqilah', 'Deleted inventory item ID 26', '2025-02-25 19:50:04'),
(47, 'aqilah', 'Deleted inventory item ID 27', '2025-02-25 19:56:47'),
(48, 'aqilah', 'Deleted inventory item ID 28', '2025-02-25 20:05:57'),
(49, 'aqilah', 'Deleted inventory item ID 29', '2025-02-25 20:07:11'),
(50, 'aqilah', 'Deleted inventory item ID 33', '2025-02-25 20:59:04'),
(51, 'aqilah', 'Deleted inventory item ID 34', '2025-02-25 21:01:11'),
(52, 'aqilah', 'Deleted inventory item ID 30', '2025-02-26 01:57:03'),
(53, 'aqilah', 'Deleted inventory item ID 31', '2025-02-26 02:25:12'),
(54, 'aqilah', 'Deleted inventory item ID 2', '2025-02-26 02:43:54'),
(55, 'aqilah', 'Deleted inventory item ID 38', '2025-02-26 03:13:41');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `required_date` date DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_status`, `order_date`, `required_date`, `shipped_date`, `store_id`, `staff_id`) VALUES
(1, 1, 'Pending', '2024-02-01', '2024-02-05', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `list_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `list_price`) VALUES
(1, 1, 1, 2, 999.99);

-- --------------------------------------------------------

--
-- Table structure for table `procurement_requests`
--

CREATE TABLE `procurement_requests` (
  `id` int(11) NOT NULL,
  `request_details` text NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `procurement_requests`
--

INSERT INTO `procurement_requests` (`id`, `request_details`, `status`) VALUES
(1, 'Request for 5 Laptops', 'Pending'),
(2, 'Request for 10 Mice', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `products1`
--

CREATE TABLE `products1` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `model_year` int(11) DEFAULT NULL,
  `list_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products1`
--

INSERT INTO `products1` (`product_id`, `product_name`, `brand_id`, `category_id`, `model_year`, `list_price`) VALUES
(1, 'iPhone 13', 2, 1, 2021, 999.99),
(2, 'Samsung TV', 1, 1, 2022, 799.99);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` enum('Pending','Approved','Completed','Shipped') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `vendor_id`, `item_id`, `quantity`, `status`, `created_at`) VALUES
(35, 4, 18, 5, 'Completed', '2025-02-25 20:45:12');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `store_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `store_name`, `phone`, `email`, `street`, `city`, `state`, `zip_code`) VALUES
(1, 'Tech Warehouse', '123-456-7890', 'contact@techwarehouse.com', '123 Tech St', 'New York', 'NY', '10001');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Procurement Officer','Department Head') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Admin'),
(2, 'officer1', '7c6a180b36896a0a8c02787eeafb0e4c', 'Procurement Officer'),
(3, 'head1', '6cb75f652a9b52798eb6cf2201057c73', 'Department Head'),
(4, 'aqilah', '$2y$10$Dw2yHsJFxtW6Oa5z2/R6VuwqfJLUJgvAENHW4sUZLOvu5Pwatpum6', 'Admin'),
(5, 'zayn', '$2y$10$LT.IfADKHEWxgzuJO1gjo.E2nYfjzUZYrKuTzLHddK07GU2yb1bTO', 'Procurement Officer'),
(6, 'shaz', '$2y$10$l.UvkbZP9uReBxkgZdDopeEQCD1umqht3ImtocQI4c7OiXOva4606', 'Department Head'),
(8, 'aqilrah', '$2y$10$jIJKr9ZODAh6f35QHm9V3Odgw2FVgsFbYr2mTOrAAJ6GBp175oMIa', ''),
(20, 'lol', '$2y$10$lAOb2flbS4EnZ/e.3ENaLuJxPW.AZsZpinH9F4L/c/in.PC.Y9qf2', '');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `vendor_name` varchar(255) NOT NULL,
  `contact_info` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `services` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `vendor_name`, `contact_info`, `contact`, `services`) VALUES
(4, 'Tech World', 'support@techworld.com', NULL, NULL),
(5, 'Office Depot', 'info@officedepot.com', NULL, NULL),
(6, 'Smart Solutions', 'sales@smartsolutions.com', NULL, NULL),
(7, 'Mega Hardware', 'help@megahardware.com', NULL, NULL),
(8, 'Fast Logistics', 'service@fastlogistics.com', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `fk_order_items_product` (`product_id`);

--
-- Indexes for table `procurement_requests`
--
ALTER TABLE `procurement_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products1`
--
ALTER TABLE `products1`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `purchase_orders_ibfk_2` (`item_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `fk_manager` (`manager_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`store_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `procurement_requests`
--
ALTER TABLE `procurement_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products1`
--
ALTER TABLE `products1`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products1` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `products1`
--
ALTER TABLE `products1`
  ADD CONSTRAINT `products1_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products1_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`),
  ADD CONSTRAINT `purchase_orders_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `fk_manager` FOREIGN KEY (`manager_id`) REFERENCES `staffs` (`staff_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `stocks_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
