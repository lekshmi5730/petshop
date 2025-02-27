-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2025 at 07:45 PM
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
-- Database: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Food', 'Sample Description', 1, '2021-06-21 10:17:41'),
(4, 'Accessories', '&lt;p&gt;Sample Category&lt;/p&gt;', 1, '2021-06-21 16:34:04'),
(5, 'Pet', '', 1, '2025-01-05 23:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'John', 'Smith', 'Male', '09123456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-06-21 16:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 'pcs', 250, 'M', '2021-06-21 13:01:30', '2021-06-21 13:05:23'),
(2, 1, 20, 'Sample', 300, 'L', '2021-06-21 13:07:00', NULL),
(3, 4, 150, 'pcs', 500, 'M', '2021-06-21 16:50:37', NULL),
(4, 3, 50, 'pack', 150, 'M', '2021-06-21 16:51:12', NULL),
(5, 5, 30, 'pcs', 50, 'M', '2021-06-21 16:51:35', NULL),
(6, 4, 10, 'pcs', 550, 'L', '2021-06-21 16:51:54', NULL),
(7, 6, 100, 'pcs', 150, 'S', '2021-06-22 15:50:47', NULL),
(8, 6, 150, 'pcs', 180, 'M', '2021-06-22 15:51:13', NULL),
(9, 7, 1, '1', 15000, '13-18 months', '2024-10-23 09:30:46', NULL),
(10, 8, 2, '4', 10000, '7-12 months', '2024-10-23 09:34:50', NULL),
(11, 9, 2, '2', 12000, '19-24 months', '2024-10-23 09:41:56', '2024-10-23 13:19:30'),
(12, 10, 4, '6', 3354, '13-18 months', '2024-10-23 09:49:52', NULL),
(13, 11, 2, '10', 25000, '7-12 months', '2024-10-23 10:56:45', NULL),
(14, 12, 2, '4', 28000, '7-12 months', '2024-10-23 11:03:43', NULL),
(15, 13, 2, '4', 20000, '7-12 months', '2024-10-23 12:45:13', NULL),
(16, 14, 8, '10', 18000, '7-12 months', '2024-10-23 12:49:42', '2024-10-23 12:52:52'),
(17, 15, 2, '4', 25000, '7-12 months', '2024-10-23 12:59:02', NULL),
(18, 16, 4, '6', 16000, '7-12 months', '2024-10-23 13:05:24', NULL),
(19, 17, 8, '10', 1399, '7-12 months', '2024-10-23 13:11:13', NULL),
(20, 17, 4, '6', 1199, '13-18 months', '2024-10-23 13:12:16', NULL),
(21, 16, 4, '6', 18000, '13-18 months', '2024-10-23 13:13:26', '2024-10-23 13:14:53'),
(22, 16, 4, '6', 20000, '19-24 months', '2024-10-23 13:14:35', NULL),
(23, 15, 8, '10', 28000, '13-18 months', '2024-10-23 13:16:43', NULL),
(24, 9, 4, '6', 10000, '13-18 months', '2024-10-23 13:19:09', NULL),
(25, 18, 1, '10', 1859, '7-12 months', '2024-10-23 13:22:38', NULL),
(26, 19, 4, '10', 1000, '7-12 months', '2024-10-24 01:39:06', NULL),
(27, 20, 5, '15', 1200, 'XS', '2024-10-24 01:42:45', NULL),
(28, 21, 8, '14', 1359, 'XS', '2024-10-24 01:47:55', NULL),
(29, 22, 10, '12', 1400, '7-12 months', '2024-10-24 01:52:28', NULL),
(30, 23, 5, '14', 1278, '7-12 months', '2024-10-24 01:55:11', NULL),
(31, 24, 4, '10', 1480, 'XS', '2024-10-24 01:58:34', NULL),
(32, 36, 2, '4', 7000, '7-12 months', '2025-01-04 15:00:40', NULL),
(33, 35, 4, '6', 8600, '13-18 months', '2025-01-04 15:02:22', NULL),
(34, 38, 1, '10', 4000, '7-12 months', '2025-01-04 15:03:29', NULL),
(35, 37, 2, '6', 10000, '7-12 months', '2025-01-04 15:04:11', NULL),
(36, 39, 1, '12', 30000, '7-12 months', '2025-01-04 15:08:54', NULL),
(37, 31, 1, '12', 40000, '7-12 months', '2025-01-04 15:10:11', NULL),
(38, 32, 2, '12', 22000, '7-12 months', '2025-01-04 15:11:00', NULL),
(39, 34, 1, '12', 50000, '7-12 months', '2025-01-04 15:12:36', NULL),
(40, 33, 1, '10', 20000, '7-12 months', '2025-01-04 15:13:55', NULL),
(41, 30, 1, '12', 45000, '13-18 months', '2025-01-04 15:14:39', NULL),
(42, 29, 1, '12', 40000, '7-12 months', '2025-01-04 15:15:36', NULL),
(43, 25, 1, '6', 35000, '7-12 months', '2025-01-04 15:16:45', NULL),
(44, 28, 1, '12', 30000, '7-12 months', '2025-01-04 15:17:36', NULL),
(45, 27, 1, '6', 38000, '7-12 months', '2025-01-04 15:18:26', NULL),
(46, 26, 1, '6', 48000, '13-18 months', '2025-01-04 15:19:12', NULL),
(47, 40, 1, '4', 6000, '7-12 months', '2025-01-04 15:20:35', NULL),
(48, 41, 1, '12', 8000, '7-12 months', '2025-01-04 15:21:09', NULL),
(49, 42, 1, '10', 300, '13-18 months', '2025-01-04 16:24:53', NULL),
(50, 43, 1, '10', 1999, '13-18 months', '2025-01-04 16:34:43', NULL),
(51, 44, 1, '10', 1299, '7-12 months', '2025-01-04 16:40:46', NULL),
(52, 44, 1, '6', 279, 'NONE', '2025-01-04 16:50:57', NULL),
(53, 45, 1, '6', 279, 'NONE', '2025-01-04 16:52:32', NULL),
(54, 47, 5, '5', 6747, '7-12 MONTHS', '2025-01-05 23:58:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 1, 'Sample Address', 'Online Payment', 1100, 2, 1, '2021-06-22 13:48:54', '2021-06-22 14:49:15'),
(2, 1, 'Sample Address', 'cod', 750, 3, 1, '2021-06-22 15:26:07', '2021-06-22 15:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(1, 1, 4, 'L', 'pcs', 2, 550, 1100),
(2, 2, 3, 'M', 'pack', 5, 150, 750);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`) VALUES
(1, 1, 1, 'Dog Food ', 'Dog food is specially formulated to provide balanced nutrition for dogs, containing essential proteins, vitamins, and minerals to support their health and energy needs. Available in dry, wet, or raw varieties, it caters to different breeds, sizes, and life stages, ensuring optimal growth, digestion, and overall well-being for puppies, adults, and senior dogs.', 1, '2021-06-21 11:19:31'),
(3, 1, 3, 'Cat Food ', '&lt;p&gt;Cat food is specially formulated nutrition designed to meet the dietary needs of cats. It provides essential vitamins, minerals, and proteins to support their overall health, energy, and well-being. Available in dry, wet, or semi-moist varieties, cat food is tailored to different life stages, ensuring balanced nutrition for kittens, adults, and senior cats.&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:48:16'),
(4, 4, 4, 'Dog bed', '&lt;p&gt;A dog bed is a comfortable, cushioned sleeping spot designed for dogs to rest and relax. Made with soft, durable materials, it provides support for joints and helps keep pets warm. Available in various sizes and styles, dog beds offer a cozy and secure space for your dog to sleep or lounge.&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:49:07'),
(5, 4, 5, 'Cat  Plates ', '&lt;p style=&quot;text-align: justify; &quot;&gt;Cat plates are durable, pet-friendly dishes designed for serving food and water to cats. They are often shallow to make eating easier and prevent whisker fatigue, with non-slip bases to avoid spills. Easy to clean and made from safe materials, they ensure a comfortable and hygienic mealtime for your cat.&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:50:11'),
(6, 4, 4, 'Dog Belt', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;A dog belt is a secure, adjustable strap designed to keep dogs safe and comfortable during walks. It features durable materials, an easy-to-use buckle, and a D-ring for leash attachment. Ideal for ensuring your pet&#039;s safety and control.&lt;br&gt;&lt;/p&gt;', 1, '2021-06-22 15:50:16'),
(7, 5, 7, 'German Shepherd', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;German Shepherds are intelligent, loyal, and versatile dogs known for their strong work ethic and protective nature. Originally bred in Germany for herding and guarding sheep, they have become one of the most popular breeds worldwide due to their remarkable trainability and adaptability.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;These dogs are medium to large in size, with a well-balanced, muscular build and a striking double coat that can come in various colors, including black and tan, sable, and all black. Their keen instincts and strong sense of smell make them excellent working dogs, often employed in roles such as police, military, search and rescue, and service dogs.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;German Shepherds thrive on physical and mental stimulation, requiring regular exercise and engagement to maintain their happiness and well-being. They are known for their protective instincts, making them loyal family companions and effective guardians of the home. With proper training and socialization, German Shepherds can be friendly, confident, and loving pets, making them a fantastic addition to active households.&lt;/p&gt;', 1, '2024-10-23 09:29:43'),
(8, 5, 6, 'Persian cat', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Persian cat, also known as the Persian Longhair, is a long-haired breed of cat characterised by a round face and short muzzle. The first documented ancestors of Persian cats might have been imported into Italy from Khorasan as early as around 1620, however, this has not been proven.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-10-23 09:33:45'),
(9, 5, 8, 'Surati goat', '&lt;p&gt;&lt;span style=&quot;color: rgb(189, 193, 198); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Surati or Surti is an Indian breed of goat. It is distributed in north-western Maharashtra and in southern Gujarat. It may also be known as the Khandeshi, Kunyi or Nimari.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-10-23 09:40:30'),
(10, 1, 1, 'Pedigree', '&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Pedigree Dog Food offers nutritious and balanced meals designed to meet the needs of dogs at every life stage. Made with high-quality ingredients, Pedigree provides essential vitamins and minerals to support strong bones, a shiny coat, and healthy digestion. Available in various flavors and formulations, including dry kibble and wet food, Pedigree ensures great taste that dogs love while promoting overall health and well-being. Treat your furry friend to the quality nutrition they deserve with Pedigree!&lt;/div&gt;', 1, '2024-10-23 09:49:01'),
(11, 5, 6, 'Chartreux', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Chartreux is a rare breed of cat from France, and is recognised by a number of registries around the world. The Chartreux is large and muscular with relatively short, fine-boned limbs, and very fast reflexes.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-10-23 10:54:42'),
(12, 5, 6, 'Turkish Angora', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Turkish Angora is a breed of domestic cat. Turkish Angoras are one of the ancient, natural breeds of cat, having originated in central Anatolia. The breed has been documented as early as the 17th century. Outside of the United States, the breed is usually referred to as simply the Angora or Ankara cat.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-10-23 11:02:54'),
(13, 5, 7, 'Beagle', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;The Beagle is a friendly, curious, and energetic breed known for its distinct appearance and charming personality. With their short, sturdy bodies, long ears, and expressive eyes, Beagles are both adorable and highly recognizable. Originally bred for hunting, they possess an incredible sense of smell and a strong instinct to track scents, making them enthusiastic explorers.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Beagles are known for their affectionate nature and love for companionship, making them excellent family pets. They are playful and sociable, thriving in environments where they can interact with people and other animals. Their intelligence and eagerness to please make them trainable, though consistent training is essential to manage their stubborn streak.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Ideal for active households, Beagles require regular exercise to keep them physically and mentally stimulated. Whether it&#039;s a walk in the park or a game of fetch, these dogs enjoy staying active. With their joyful demeanor and loyalty, Beagles bring warmth and happiness to any home.&lt;/p&gt;', 1, '2024-10-23 12:41:28'),
(14, 5, 7, 'Poodle', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;The Poodle is an intelligent and elegant breed known for its distinctive curly coat and playful nature. Available in Standard, Miniature, and Toy sizes, Poodles are highly trainable and excel in obedience and agility. Their hypoallergenic coats shed minimally, making them suitable for allergy sufferers, though regular grooming is essential.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Friendly and affectionate, Poodles thrive on companionship, making them excellent family pets. Whether enjoying outdoor activities or cozying up at home, their playful spirit and loving demeanor bring joy to any household.&lt;/p&gt;', 1, '2024-10-23 12:48:26'),
(15, 5, 8, 'Angora goat', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;The Angora Goat is a charming breed famous for its luxurious mohair fibers. Originating from Turkey, these medium-sized goats have long, curly fleece and a friendly disposition. Social and gentle, Angora goats thrive in herds and require regular grooming to maintain their beautiful coats.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Valued for their exquisite mohair and adaptability, Angora goats make delightful additions to any farm or homestead. Whether raised for fiber or companionship, they bring unique charm and character to their environment.&lt;/p&gt;', 1, '2024-10-23 12:57:38'),
(16, 5, 8, 'Jamnapari', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;The Jamnapari Goat is a majestic breed known for its impressive stature and exceptional milk production. Originating from India, these large goats feature long, pendulous ears and a distinctively graceful appearance. With their sturdy build and adaptability to various climates, Jamnapari goats are popular among farmers for both dairy and meat production.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Renowned for their high-quality milk, which is rich in fat and protein, Jamnapari goats are also appreciated for their friendly temperament and ease of handling. Their striking appearance and productive capabilities make them a valuable asset to any farm or homestead, providing both economic benefits and companionship.&lt;/p&gt;', 1, '2024-10-23 13:03:58'),
(17, 4, 4, 'Dog Jacket', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Keep your furry friend warm and stylish with our dog jacket! Designed for comfort and protection, these jackets are perfect for chilly walks, outdoor adventures, or cozy lounging at home. Made from high-quality, weather-resistant materials, our dog jackets provide insulation and shield against wind and rain.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Available in various sizes and designs, our jackets ensure a snug fit for dogs of all breeds. With easy-to-use fastenings and adjustable features, dressing your pet has never been easier. Give your dog the warmth and protection they deserve while showcasing their unique style with our fashionable dog jackets!&lt;/p&gt;', 1, '2024-10-23 13:10:35'),
(18, 1, 3, 'Me-O', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Me-O Cat Food offers a delicious and nutritious diet tailored for cats of all ages. Made with high-quality ingredients, including real meat and essential nutrients, Me-O ensures your feline friend receives the balanced nutrition they need for optimal health.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;With a variety of flavors and formulations, including options for sensitive stomachs and specific dietary needs, Me-O caters to even the pickiest eaters. Rich in vitamins and minerals, Me-O promotes a healthy coat, strong bones, and overall well-being. Treat your cat to the taste they love while supporting their health with Me-O Cat Food!&lt;/p&gt;', 1, '2024-10-23 13:22:04'),
(19, 5, 9, 'Rex Rabbit', '&lt;p&gt;The Rex Rabbit is a popular breed known for its luxuriously soft, velvety fur, perfect for those looking for a gentle and affectionate pet. With a calm and friendly temperament, Rex rabbits make wonderful companions. Their unique coat comes in a variety of stunning colors, including black, blue, chocolate, and white. Ideal for families or rabbit enthusiasts, Rex rabbits are medium to large-sized, typically weighing between 7.5 to 10.5 pounds, and are loved for their easygoing nature and charming appearance.&lt;br&gt;&lt;/p&gt;', 1, '2024-10-24 01:36:44'),
(20, 5, 9, 'Netherland Dwarf rabbit', '&lt;p&gt;&lt;span style=&quot;color: rgb(189, 193, 198); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Netherland Dwarf is a breed of domestic rabbit that originated in the Netherlands. Weighing 1.1&ndash;2.5 pounds, the Netherland Dwarf is one of the smallest rabbit breeds. Its popularity as a pet or show rabbit may stem from its neotenic appearance.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-10-24 01:41:26'),
(21, 5, 9, 'Florida White rabbit', '&lt;p&gt;&lt;span style=&quot;color: rgb(189, 193, 198); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Florida White is a relatively small breed rabbit originally produced for the laboratory or smaller meat rabbit. They are all white in color with no other markings, and have Albino red eyes. They are a recognized American Rabbit Breeders Association breed.&lt;/span&gt;&lt;span style=&quot;color: rgb(189, 193, 198); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-10-24 01:45:43'),
(22, 5, 9, 'Angora Rabbit', '&lt;p&gt;&lt;span style=&quot;color: rgb(189, 193, 198); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Angora rabbit, one of the most ancient groups of domestic rabbit breeds, which is bred for the long fibers of its coat, known as Angora wool. They are gathered by shearing, combing or plucking.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-10-24 01:50:58'),
(23, 5, 9, 'French Lop', '&lt;p&gt;&lt;span style=&quot;color: rgb(189, 193, 198); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The French Lop is a breed of domestic rabbit developed in France in the 19th century from the selective breeding of English Lop and Flemish Giant stock. The French Lop resembles the English Lop, but the French Lop is heavier in stature and does not have the exaggerated ear length of the English Lop.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-10-24 01:54:32'),
(24, 5, 9, 'American Fuzzy Lop', '&lt;p&gt;&lt;span style=&quot;color: rgb(189, 193, 198); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The American Fuzzy Lop is a rabbit breed recognized by the American Rabbit Breeders Association. It is similar in appearance to a Holland Lop. However, the American Fuzzy Lop is a wool breed and will have wool similar to the Angora breeds although the wool will be shorter than that of a commercial Angora.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-10-24 01:58:04'),
(25, 5, 8, 'Nigerian Dwarf goat', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Nigerian Dwarf is a modern American breed of dwarf goat. Like the American Pygmy Goat, it derives from the West African Dwarf group of breeds of West Africa.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 12:40:53'),
(26, 5, 8, 'Damascus goat', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Damascus goat, also known as Aleppo, Halep, Baladi, Damascene, Shami, or Chami, is a breed of goat. It originated in Syria and was imported by the Antoniades family and the British into Cyprus during the 1920s, where it has been selectively bred.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 12:47:39'),
(27, 5, 8, 'Russian White Dairy', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Russian White Dairy or Russian White is a Russian breed of dairy goat. It derives from cross-breeding of the indigenous North Russian with imported Swiss Saanen goats; this began in about 1905. The Gorki derives from it, but is always horned, while the Russian White may be horned or polled.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 12:53:20'),
(28, 5, 8, 'Kinder goat', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Kinder is an American breed of domestic goat. It originated on a farm in Snohomish, Washington, where in about 1985 an American Pygmy buck was cross-bred with Nubian does. The resulting stock was selectively bred to create a compact but well-muscled goat, suitable both for milk and for meat production.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 12:59:53'),
(29, 5, 8, 'Irish goat', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Irish Goat is a traditional Irish breed of domestic goat. It is a dual-purpose breed, used both for meat and for milk. It is an endangered breed and may survive only in feral populations. It is distinct from the feral Bilberry Goat of Waterford.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 13:02:40'),
(30, 5, 7, 'Bulldog', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Bulldog is a British breed of dog of mastiff type. It may also be known as the English Bulldog or British Bulldog. It is a medium-sized, muscular dog of around 40&ndash;55 lb. They have large heads with thick folds of skin around the face and shoulders and a relatively flat face with a protruding lower jaw.&lt;/span&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 13:09:23'),
(31, 5, 7, 'Boxer', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Boxer is a medium to large, short-haired dog breed of mastiff-type, developed in Germany. The coat is smooth and tight-fitting; colors are fawn or brindled, with or without white markings.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 13:13:38'),
(32, 5, 7, 'Golden Retriever', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Golden Retriever is a Scottish breed of retriever dog of medium size. It is characterised by a gentle and affectionate nature and a striking golden coat. It is a working dog, and registration is subject to successful completion of a working trial.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 13:23:45'),
(33, 5, 7, 'Labrador Retriever', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Labrador Retriever or simply Labrador is a British breed of retriever gun dog. It was developed in the United Kingdom from St. John&#039;s water dogs imported from the colony of Newfoundland, and was named after the Labrador region of that colony.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 13:29:31'),
(34, 5, 7, 'Siberian Husky', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Siberian Husky is a medium-sized working sled dog breed. The breed belongs to the Spitz genetic family. It is recognizable by its thickly furred double coat, erect triangular ears, and distinctive markings, and is smaller than the similar-looking Alaskan Malamute.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 13:33:16'),
(35, 5, 6, 'Maine Coon', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Maine Coon is a large domesticated cat breed. One of the oldest natural breeds in North America, the breed originated in the U.S. state of Maine, where it is the official state cat. The Maine Coon is a large and social cat, commonly referred to as &quot;the gentle giant.&quot;&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 14:10:41'),
(36, 5, 6, 'Birman Cat', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Birman, also called the &quot;Sacred Cat of Burma&quot;, is a domestic cat breed. The Birman is a long-haired, colour-pointed cat distinguished by a silky coat, deep blue eyes, and contrasting white &quot;gloves&quot; on each paw. The breed name is derived from Birmanie, the French form of Burma.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 14:19:45'),
(37, 5, 6, 'Scottish Fold ', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Scottish Fold is a distinctive breed of domestic cat characterised by a natural dominant gene mutation associated with osteochondrodysplasia. This genetic anomaly affects cartilage throughout the body, causing the ears to &quot;fold&quot;, bending forward and down towards the front of the head.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 14:25:16'),
(38, 5, 6, 'Bombay cat', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Bombay cat is a short-haired breed of domestic cat. Bombays are glossy solid black cats with a muscular build, and have characteristic large bright copper-golden eyes. The breed is named after the Indian city of Bombay, referring to the habitat of the Indian black leopard.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 14:42:20'),
(39, 5, 6, 'Japanese Bobtail', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Japanese Bobtail is a breed of domestic cat with an unusual bobtail more closely resembling the tail of a rabbit than that of other cats. The breed was first developed in Japan, and registered officially in the 1960s.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 14:47:21'),
(40, 5, 9, 'Thrianta', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Thrianta is a breed of domestic rabbit that is brilliant red in color. Originating in the Netherlands, the Thrianta was further crossed with a German breed before being exported to the United Kingdom in the early 1980s. During the 1990s, the breed arrived in the United States from both the Netherlands and England.&lt;/span&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 14:54:06'),
(41, 5, 9, 'Tan rabbit', '&lt;p&gt;&lt;span style=&quot;color: rgb(191, 191, 191); font-family: Arial, sans-serif; font-size: 14px; background-color: rgb(31, 31, 31);&quot;&gt;The Tan rabbit is a small fancy breed of rabbit shown throughout the world. While originally from England, it has gained popularity in the United States. Tans come in four varieties: black, blue, chocolate and lilac. Full grown Tans weigh 4-6 pounds.&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 14:57:12'),
(42, 4, 5, 'CREDLY 2 in 1 Bowl Water and Food Cat Feeder with Detachable Stainless Steel Bowl and Automatic Water Dispenser Bottle for Small Pets (Set of 1)', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Arial, sans-serif; font-size: 14px;&quot;&gt;2 in 1 food and water bowls, just one product to solve pet feeding problems. Overturn filled bottle, make the lid of bottle down, put it on the set up of convex location, then press the bottle bottom. Water will outflow into water bowl. Note: Please do not fill hot water into the water bottle. Automatic water device, saving time and safety. No worry about your pet&#039;s drinking water. Stainless steel food bowl can be removed for easy cleaning. Sink partition design to prevent the pet&#039;s mouth from getting wet when drinking water, and even prevent the pet from Putting the feet into the water. Of course, this partition is detachable. High-quality food-grade plastic material, BPA-free, safe, healthy and environmental protection, perfect care of your love pet; 100% new material, high quality, anti-fall durable. color_name:multi | item_width:18 cm item_length:30 cm | item_height:4.6 cm item_weight:499 g | pattern_name:solid&lt;/span&gt;&lt;span style=&quot;color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;/span&gt;&lt;/p&gt;', 1, '2025-01-04 16:22:24'),
(43, 4, 5, 'Semi-Enclosed Unicorn Cave/Bed/House for Cats & Kittens', '&lt;p style=&quot;font-family: &amp;quot;Fira Sans&amp;quot;, sans-serif; letter-spacing: 0.6px;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;Foodie Puppies kitty cat house bed is a soft warm rabbit hut frustum-shape hideout with removable cushions for winter a soft opening play frustum bed, make sure a longer use and is comfortable, warm enough for your lovely pets in the cold weather, gives your puppy or cat or small animals maximum durability.&lt;br&gt;&lt;br&gt;&lt;strong style=&quot;&quot;&gt;Features:&lt;/strong&gt;&lt;br&gt;&lt;/font&gt;&lt;/p&gt;&lt;ul style=&quot;list-style-position: inside; padding-left: 2rem; font-family: &amp;quot;Fira Sans&amp;quot;, sans-serif; letter-spacing: 0.6px;&quot;&gt;&lt;li style=&quot;list-style: inherit;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;Swinging teasing cat hanging ball.&lt;/font&gt;&lt;/li&gt;&lt;li style=&quot;list-style: inherit;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;The plush, Unicorn Design allows your cat to snuggle up completely.&lt;/font&gt;&lt;/li&gt;&lt;li style=&quot;list-style: inherit;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;The deep design of our thick cat tent keeps your pets warm at all times.&lt;/font&gt;&lt;/li&gt;&lt;li style=&quot;list-style: inherit;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;The cushion contains high-elasticity cotton, and high-performance resilience that is not easy to collapse.&lt;/font&gt;&lt;/li&gt;&lt;li style=&quot;list-style: inherit;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;The pad inside the cat home can be taken out, and the two sides use different materials.&lt;/font&gt;&lt;/li&gt;&lt;li style=&quot;list-style: inherit; margin-bottom: 0px;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;The side of the mat is soft artificial lamb wool, which is very velvety and does not fall off.&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;font-family: &amp;quot;Fira Sans&amp;quot;, sans-serif; letter-spacing: 0.6px;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;&lt;strong&gt;Benefits:&lt;/strong&gt;&lt;br&gt;&lt;/font&gt;&lt;/p&gt;&lt;ul style=&quot;list-style-position: inside; padding-left: 2rem; font-family: &amp;quot;Fira Sans&amp;quot;, sans-serif; letter-spacing: 0.6px;&quot;&gt;&lt;li style=&quot;list-style: inherit;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;Giving your pet a sense of security and comfort.&lt;/font&gt;&lt;/li&gt;&lt;li style=&quot;list-style: inherit;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;The hanging ball on the cat tent brings more fun to your pet!&lt;/font&gt;&lt;/li&gt;&lt;li style=&quot;list-style: inherit;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;Help your kitten to relax and have a comfortable and stable sleep environment.&lt;/font&gt;&lt;/li&gt;&lt;li style=&quot;list-style: inherit; margin-bottom: 0px;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;The cat beds have raised and thickened edges, which can provide better support for the neck and back of your cat or puppy.&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 0px; font-family: &amp;quot;Fira Sans&amp;quot;, sans-serif; letter-spacing: 0.6px;&quot;&gt;&lt;font color=&quot;#d6d6e7&quot; style=&quot;&quot;&gt;&lt;strong style=&quot;&quot;&gt;Suitable For:&lt;/strong&gt;&lt;br&gt;Great for kittens, cats, small animals like rabbits, chinchillas, Degu, ferrets, Guinea pigs, Maltese, Yorkie, Pomeranians and chihuahuas.&lt;/font&gt;&lt;/p&gt;', 1, '2025-01-04 16:28:06'),
(44, 4, 5, 'Killerwhale Escape Proof Cat Harness with Leash for Outdoor Walking, Air Mesh Fabric, Easy Control, Adjustable & Durable Cat Leash with Harness for Small Medium & Large Cats', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;&quot;&gt;&lt;font color=&quot;#f7f7f7&quot;&gt;Escape Proof Cat Vest Harness - Customized According to Cat&#039;s Body Type, This Adjustable spliced Kitten Vest Harness features 4 Adjusting straps which allow a perfect fit for your flexible Escape Proof Cat , Adjustable Slide Clips and sturdy safety buckle designed for a more secured closure, so that your kitten won&#039;t slip out Easily or even get lost during outdoor adventures. Plus it Gives more room to Grow for your Curious and fast-growing Pet.&lt;/font&gt;&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;&quot;&gt;&lt;font color=&quot;#f7f7f7&quot;&gt;Ultra Light &amp;amp; Comfortable - This Cat Harness and Leash Escape proof Made of Breathable Mesh fabric , Very Lightweight and Comfortable to Wear. The Cat doesn&#039;t need to be Weight-bearing at all. With soft Padding Edge, the Cat can wear this Harness all day.&lt;/font&gt;&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;&quot;&gt;&lt;font color=&quot;#f7f7f7&quot;&gt;Safe &amp;amp; Secure - You Can Attach The long, Sturdy Nylon Leash to the Metal Leash clip on the Back, Allowing your Kitty to Explore the Great nature Safely and Enjoyable. Its Vest-Style Design can Evenly Distribute Leash Pressure Across the Chest and Shoulder to Prevent Choking or Neck strain, which is much safer and more comfortable than a basic Halter or H-style harness. The reflective strips will keep your kitty always visible in dark environments.&lt;/font&gt;&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;&quot;&gt;&lt;font color=&quot;#f7f7f7&quot;&gt;Size Instruction - This Cat harness is Available in 3 Sizes XS/S|M, This Well-Designed Cat Harness is Adjustable at Both the Neck and Chest (Tips: The harness should be snug enough for you to fit one finger between the straps and any part of your cat&#039;s body). This harness can be used for a long time, especially throughout your cat&rsquo;s growing stage.&lt;/font&gt;&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;&quot;&gt;&lt;font color=&quot;#f7f7f7&quot;&gt;Eye Catching Look - Put the Vest Splilcing Pattern On your Lovely cat , This Amazing Cat Harness Will Be a Complete Charming Outfit for your Sweet Kitties.&lt;/font&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 1, '2025-01-04 16:39:35'),
(45, 4, 4, 'Sage Square Adjustable Strap Muzzle Cum Mouth Cover Cum Basket Cage Cum Pet Safety Collar for Anti Biting Dog (Black) (Medium)', '&lt;section class=&quot;product-key-features border-default jm-pt-m jm-pb-base&quot; style=&quot;margin: 0px; padding-right: 0px; padding-left: 0px; outline: 0px; border-bottom: 1px solid rgb(224, 224, 224); color: rgb(20, 20, 20); font-family: JioType, helvetica, arial, sans-serif; letter-spacing: -0.08px; background-color: rgb(255, 255, 255); padding-top: 24px !important; padding-bottom: 16px !important;&quot;&gt;&lt;div class=&quot;jm-heading-xs jm-mb-base&quot; style=&quot;margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; outline: 0px; margin-bottom: 16px !important; font-weight: 900 !important; font-size: 24px !important; letter-spacing: -0.72px !important; line-height: 1 !important;&quot;&gt;Features &amp;amp; Details&lt;/div&gt;&lt;div class=&quot;product-key-features-list-wrapper jm-body-s jm-mb-base&quot; style=&quot;margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; outline: 0px; margin-bottom: 16px !important; letter-spacing: -0.08px !important; line-height: 1.5 !important;&quot;&gt;&lt;ul class=&quot;product-key-features-list&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 0px 16px; outline: 0px; list-style-position: initial; list-style-image: initial; color: rgba(0, 0, 0, 0.65);&quot;&gt;&lt;li class=&quot;product-key-features-list-item&quot; style=&quot;margin: 0px 0px 4px; padding: 0px; outline: 0px;&quot;&gt;This light weight muzzle features a basket design that gives all-around protection&lt;/li&gt;&lt;li class=&quot;product-key-features-list-item&quot; style=&quot;margin: 0px 0px 4px; padding: 0px; outline: 0px;&quot;&gt;Perfect for vet, training, grooming, walking&lt;/li&gt;&lt;li class=&quot;product-key-features-list-item&quot; style=&quot;margin: 0px 0px 4px; padding: 0px; outline: 0px;&quot;&gt;Very well ventilated muzzle. Lightweight, padded and comfortable&lt;/li&gt;&lt;li class=&quot;product-key-features-list-item&quot; style=&quot;margin: 0px 0px 4px; padding: 0px; outline: 0px;&quot;&gt;Each muzzle has an adjustable strap with a quick-release buckle.&lt;/li&gt;&lt;li class=&quot;product-key-features-list-item&quot; style=&quot;margin: 0px 0px 4px; padding: 0px; outline: 0px;&quot;&gt;Safety strapping ensures the muzzle will always remain securely in place.&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/section&gt;&lt;section class=&quot;product-return-text border-default jm-pt-m jm-pb-base&quot; style=&quot;margin: 0px; padding-right: 0px; padding-left: 0px; outline: 0px; border-bottom: 1px solid rgb(224, 224, 224); color: rgb(20, 20, 20); font-family: JioType, helvetica, arial, sans-serif; letter-spacing: -0.08px; background-color: rgb(255, 255, 255); padding-top: 24px !important; padding-bottom: 16px !important;&quot;&gt;&lt;div class=&quot;jm-heading-xs jm-mb-base&quot; style=&quot;margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; outline: 0px; margin-bottom: 16px !important; font-weight: 900 !important; font-size: 24px !important; letter-spacing: -0.72px !important; line-height: 1 !important;&quot;&gt;Description&lt;/div&gt;&lt;div class=&quot;jm-body-s jm-fc-primary-grey-80 jm-mb-xs expand-content content-reset&quot; id=&quot;pdp_description&quot; style=&quot;margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; outline: 0px; max-height: 250px; overflow: auto hidden; max-width: 100%; margin-bottom: 8px !important; color: rgba(0, 0, 0, 0.65) !important; letter-spacing: -0.08px !important; line-height: 1.5 !important;&quot;&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; outline: 0px; letter-spacing: -0.08px; line-height: 1.5;&quot;&gt;This Basket design Dog Muzzle is known for its precise construction. Due to its impeccable design, this muzzle provides dogs with the best ventilation available. So breathable that your dog will be able to drink water with the muzzle on.&lt;/p&gt;&lt;/div&gt;&lt;/section&gt;', 1, '2025-01-04 16:45:43'),
(48, 4, 4, 'Bio degradable poop bags', '&lt;p&gt;&lt;i&gt;These bags are landfill biodegradable; made with a proprietary additive that renders the bag to biodegrade in an anaerobic environment (a.k.a landfill). The bags attract microbes already present in the landfill which colonize on the surface and completely digest the bag in 28 months (lab tested).&lt;/i&gt;&lt;/p&gt;&lt;p&gt;&lt;i&gt;These poop bags are crafted from 100% plant-based materials, designed to decompose within weeks after disposal. Unlike traditional plastic bags, they are completely non-toxic and safe for the environment. Each bag is thick, durable, and leak-proof, making them perfect for easy and mess-free cleanups. They come in a convenient roll format to fit most standard dispensers, making them travel-friendly. By choosing these bags, you contribute to reducing plastic waste and promoting sustainable pet care. They&rsquo;re ideal for eco-conscious pet owners who want to make a positive impact on the planet.&lt;/i&gt;&lt;/p&gt;', 1, '2025-01-06 00:07:50');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 1100, '2021-06-22 13:48:54'),
(2, 2, 750, '2021-06-22 15:26:07');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, '0-6 months'),
(2, '7-12 months'),
(3, '13-18 months'),
(4, '19-24 months'),
(5, '25-36 months'),
(6, '37+ months'),
(7, 'XS'),
(8, 'S'),
(9, 'M'),
(10, 'L'),
(11, 'XL'),
(12, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Dog Food', '&lt;p&gt;Sample only&lt;/p&gt;', 1, '2021-06-21 10:58:32'),
(3, 1, 'Cat Food', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:34:59'),
(4, 4, 'Dog Needs', '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', 1, '2021-06-21 16:35:26'),
(5, 4, 'Cat Needs', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:35:36'),
(6, 5, 'cat ', '', 1, '2025-01-05 23:55:54'),
(7, 5, 'dog', '', 1, '2025-01-05 23:56:07'),
(8, 5, 'goat', '', 1, '2025-01-05 23:56:19'),
(9, 5, 'rabbit', '', 1, '2025-01-05 23:56:30');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Pet Shop Food and Accessories Shop'),
(6, 'short_name', 'Pet Needs'),
(11, 'logo', 'uploads/1624240440_paw.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1624240440_banner1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
