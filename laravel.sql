-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 06:48 AM
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
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_image`
--

CREATE TABLE `about_image` (
  `id` int(11) NOT NULL,
  `image_name` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `photo`, `token`, `created_at`, `updated_at`) VALUES
(1, 'bilash kirtonia', 'bilashkirtonia005@gmail.com', '$2y$12$qMzGgPVzY7DhZ3WexdEGoOhzGc7Aj.F5Q6tIH0HJopUiR6CM/89Lm', 'admin.jpg', '', NULL, '2024-03-05 00:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Car Parking Lot', NULL, NULL),
(2, 'Complementary Breakfast', NULL, NULL),
(3, 'Swimming Pool', NULL, NULL),
(4, 'Free wifi', NULL, NULL),
(5, 'Air conditions', NULL, '2024-03-03 23:59:36');

-- --------------------------------------------------------

--
-- Table structure for table `booked_rooms`
--

CREATE TABLE `booked_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_date` text NOT NULL,
  `order_no` text NOT NULL,
  `room_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booked_rooms`
--

INSERT INTO `booked_rooms` (`id`, `booking_date`, `order_no`, `room_id`, `created_at`, `updated_at`) VALUES
(1, '08/08/2022', '1659579248', 1, NULL, NULL),
(2, '15/08/2022', '1659579248', 6, NULL, NULL),
(3, '16/08/2022', '1659579248', 6, NULL, NULL),
(4, '08/08/2022', '1659808495', 4, NULL, NULL),
(5, '09/08/2022', '1659808495', 4, NULL, NULL),
(6, '10/08/2022', '1659808495', 4, NULL, NULL),
(7, '04/09/2022', '1659923618', 4, '2022-08-07 19:53:38', '2022-08-07 19:53:38'),
(8, '12/09/2022', '1659923618', 5, '2022-08-07 19:53:38', '2022-08-07 19:53:38'),
(9, '13/09/2022', '1659923618', 5, '2022-08-07 19:53:38', '2022-08-07 19:53:38'),
(10, '14/09/2022', '1659923618', 5, '2022-08-07 19:53:39', '2022-08-07 19:53:39'),
(11, '15/09/2022', '1659923618', 5, '2022-08-07 19:53:39', '2022-08-07 19:53:39'),
(12, '10/09/2022', '1659954645', 5, '2022-08-08 04:30:45', '2022-08-08 04:30:45'),
(13, '11/09/2022', '1659954645', 5, '2022-08-08 04:30:45', '2022-08-08 04:30:45'),
(14, '12/09/2022', '1659954645', 5, '2022-08-08 04:30:45', '2022-08-08 04:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `phone` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `zip` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `token` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `country`, `address`, `state`, `city`, `zip`, `photo`, `token`, `status`, `created_at`, `updated_at`) VALUES
(21, 'Bilash kirtonia', 'bilashkirtonia005@gmail.com', '$2y$12$H5Qd.BCwDUl4C5fJficLVePotgrQ.Hbmh6fZrwPLh1hCDea/0Zbyq', '01581300161', 'Bangladesh', 'Chatul', 'Dhaka', 'Boalmari', '7860', '1709796510.jpg', '', 1, NULL, '2024-03-07 01:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'What are the precautionary measures being taken by Pan Pacific Sonargaon Dhaka?', '<p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>During these unprecedented times,<i>&nbsp;<a href=\"https://www.panpacific.com/en/panpacific-cares.html\" style=\"color: rgb(72, 68, 65); text-decoration-line: underline;\">Pan Pacific Cares</a></i>&nbsp;is our pledge to you, to give you a peace of mind as you stay and dine with us globally.</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>We have established “Clean Stay” standards in areas that include guest rooms, meeting rooms and dining outlets at our hotel. Precautionary measures taken at Pan Pacific Sonargaon Dhaka include:<br></b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232); list-style-position: unset !important;\"><li><b>Contactless check-in.<br></b></li><li><b>We have stepped up on the disinfection of public spaces and guestrooms, and have made hand sanitisers available.</b></li><li><b>All guests are required to complete health declaration questions during check-in.</b></li><li><b>As a precaution, our employees are taking temperatures twice daily and are constantly reminded to adopt good personal hygiene practices.</b></li><li><b>Mandatory temperature screening for all guests at the hotel entrance upon visiting the hotel.</b></li><li><b>Gatherings and events at venues such as public areas, gym, pool, function rooms, restaurants and dining outlets must also comply with the existing guidelines, which includes improving ventilation, advising participants to reduce contact with others and to ensure separation of at least one metre between people.</b></li><li><b>Hotel vehicle disinfection.</b></li><li><b>Banquet setup revised.</b></li><li><b>Strict health advisery guideline for all staff.</b></li></ul>', NULL, '2024-02-28 01:31:59'),
(2, 'What are the precautionary measures all guests should note?', '<p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>Here are some ways to keep safe from COVID-19:</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232); list-style-position: unset !important;\"><li><b>All guests are required to complete health declaration questions during check-in.</b></li><li><b>Clean your hands often by using soap and water, or an alcohol-based hand rub.</b></li><li><b>Maintain a safe distance from anyone who is coughing or sneezing.</b></li><li><b>Avoid touching your eyes, nose or mouth.</b></li><li><b>Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.</b></li><li><b>If you have a fever, cough and difficulty breathing, seek medical attention immediately</b></li></ul>', NULL, NULL),
(3, 'What is Pan Pacific Sonargaon Dhaka\'s cancellation policy like?', '<p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>Cancellation must be received more than 24 hours prior to arrival to avoid a penalty fee.</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>During these unprecedented times,&nbsp;<i>Pan Pacific Cares</i>&nbsp;is our pledge to you, to give you a peace of mind as you stay and dine with us globally. Find out more about&nbsp;<i>Pan Pacific Cares</i>&nbsp;<a href=\"https://www.panpacific.com/en/panpacific-cares.html\" style=\"color: rgb(72, 68, 65); text-decoration-line: underline;\">here</a>.</b></p>', NULL, NULL),
(4, 'What are the different types of accommodation available at Pan Pacific Sonargaon Dhaka?', '<p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>The types of accomodation at Pan Pacific Sonargaon Dhaka include:</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232); list-style-position: unset !important;\"><li><b>Deluxe Room</b></li><li><b>Premier Room</b></li><li><b>Suites</b></li></ul>', NULL, NULL),
(5, 'What are the check-in and check-out times at Pan Pacific Sonargaon Dhaka?', '<p><span style=\"color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>Check-in at Pan Pacific Sonargaon Dhaka is from 3:00 PM, and check-out is until 12:00 PM.</b></span><br></p>', NULL, NULL),
(6, 'What facilities are available at Pan Pacific Sonargaon Dhaka?', '<p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>Some of the facilities available include:</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232); list-style-position: unset !important;\"><li><b>24-hour Fitness Centre</b></li><li><b>Steam Room</b></li><li><b>Spa/Jacuzzi/Sauna</b></li><li><b>Outdoor Pool</b></li><li><b>Pacific Business Centre</b></li><li><b>Pacific Lounge</b></li></ul>', NULL, NULL),
(7, 'How many restaurants and bars are there at Pan Pacific Sonargaon Dhaka and what are they?', '<p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>Pan Pacific Sonargaon Dhaka has a total of six restaurants and bars:</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232); list-style-position: unset !important;\"><li><b>Jharna Grill</b></li><li><b>Café Bazar</b></li><li><b>Pool Café&nbsp;</b></li><li><b>Aromaz</b></li><li><b>Lobby Lounge</b></li><li><b>Pacific Avenue</b></li></ul>', NULL, NULL),
(8, 'Which local tourist attractions are closest to Pan Pacific Sonargaon Dhaka?', '<p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>Nearby attractions include:</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232); list-style-position: unset !important;\"><li><b>Ahsan Manzil</b></li><li><b>Lalbagh Fort</b></li><li><b>National Parliament House</b></li><li><b>National Museum of Dhaka</b></li></ul>', NULL, NULL),
(9, 'Is there car parking available at Pan Pacific Sonargaon Dhaka?', '<p><span style=\"color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\"><b>Complimentary parking at Pan Pacific Sonargaon Dhaka is available for all in-house guests.</b></span><br></p>', NULL, NULL),
(10, 'Is there a swimming pool in Pan Pacific Sonargaon Dhaka?', '<p><span style=\"color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(247, 242, 232);\">Yes, Pan Pacific Sonargaon Dhaka has an outdoor pool, consisting of a large rectangle swimming pool and a semi-circular wading pool for the young ones.</span><br></p>', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` text NOT NULL,
  `heading` text NOT NULL,
  `text` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `icon`, `heading`, `text`, `created_at`, `updated_at`) VALUES
(1, 'fa fa-hotel', 'City view', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', NULL, '2024-02-27 11:21:27'),
(3, 'fa fa-clock', 'Garden', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', NULL, '2024-02-27 22:55:55'),
(4, 'fa fa-wifi', 'Free Wifi', 'Genius loyalty program Seasonal and holiday deals Travel articlesBooking.com for Business Traveller Review Awards\r\nCar rental Flight finder Restaurant reservations Booking.com for Travel Agents', NULL, '2024-02-27 22:57:46'),
(5, 'fa fa-coffee', 'Complimentary Breakfast', 'Yes, this hotel has a pool. See details about the pool and other facilities on this page. Yes, this hotel has a pool. See details about the pool and other facilities on this page.', NULL, '2024-02-27 23:24:10'),
(6, 'fa fa-crosshairs', 'Swimming Pool', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', NULL, NULL),
(7, 'fa fa-cubes', 'Gym and Fitness', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', NULL, NULL),
(8, 'fa fa-utensils', 'Top Class Restaurant', 'Members get access to an exclusive discounts on Radissonblu.com. Not a member yet? Hurry Up!', NULL, '2024-02-27 23:32:40'),
(9, 'fa fa-money-bill', 'Save up to 40%', 'Members get access to an exclusive discounts on Radissonblu.com. Not a member yet? Hurry Up!', NULL, '2024-02-27 23:31:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_02_18_035205_create_admins_table', 1),
(7, '2022_06_24_093653_create_slides_table', 1),
(8, '2022_06_26_021258_create_features_table', 1),
(9, '2022_06_26_033305_create_testimonials_table', 1),
(10, '2022_06_26_051426_create_posts_table', 1),
(11, '2022_06_26_135533_create_photos_table', 1),
(12, '2022_06_27_021908_create_videos_table', 1),
(13, '2022_06_27_050408_create_faqs_table', 1),
(14, '2022_06_27_104626_create_pages_table', 1),
(15, '2022_06_29_115954_create_subscribers_table', 1),
(16, '2022_07_01_104958_create_amenities_table', 1),
(17, '2022_07_02_005301_create_rooms_table', 1),
(18, '2022_07_02_010035_create_room_photos_table', 1),
(19, '2022_07_04_065843_create_customers_table', 1),
(20, '2022_07_13_034131_create_orders_table', 1),
(21, '2022_07_13_034641_create_order_details_table', 1),
(22, '2022_08_07_135954_create_booked_rooms_table', 1),
(23, '2022_08_08_120610_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_no` text NOT NULL,
  `transaction_id` text NOT NULL,
  `payment_method` text NOT NULL,
  `card_last_digit` text DEFAULT NULL,
  `paid_amount` text NOT NULL,
  `booking_date` text NOT NULL,
  `status` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_no`, `transaction_id`, `payment_method`, `card_last_digit`, `paid_amount`, `booking_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 21, '1659579248', 'PAYID-MLVSWZI3BH9894853819080C', 'PayPal', NULL, '27.00', '04/08/2022', 'Completed', '2022-08-03 20:14:08', '2022-08-03 20:14:08'),
(3, 21, '1659808495', 'txn_3LTrD8F67T3XLjgL0XKh0EJQ', 'Stripe', '4242', '21', '06/08/2022', 'Pending', '2022-08-06 11:54:55', '2022-08-06 11:54:55'),
(4, 21, '1659923618', 'txn_3LUL9yF67T3XLjgL0YHrSzrw', 'Stripe', '4242', '43', '08/08/2022', 'Completed', '2022-08-07 19:53:38', '2022-08-07 19:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `order_no` text NOT NULL,
  `checkin_date` text NOT NULL,
  `checkout_date` text NOT NULL,
  `adult` text NOT NULL,
  `children` text NOT NULL,
  `subtotal` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `room_id`, `order_no`, `checkin_date`, `checkout_date`, `adult`, `children`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 3, 3, '1659579248', '08/08/2022', '09/08/2022', '2', '1', '5', '2022-08-03 20:14:08', '2022-08-03 20:14:08'),
(2, 3, 6, '1659579248', '15/08/2022', '17/08/2022', '3', '2', '22', '2022-08-03 20:14:08', '2022-08-03 20:14:08'),
(5, 3, 4, '1659808495', '08/08/2022', '11/08/2022', '2', '2', '21', '2022-08-06 11:54:55', '2022-08-06 11:54:55'),
(6, 4, 4, '1659923618', '04/09/2022', '05/09/2022', '2', '1', '7', '2022-08-07 19:53:38', '2022-08-07 19:53:38'),
(7, 4, 5, '1659923618', '12/09/2022', '16/09/2022', '2', '2', '36', '2022-08-07 19:53:38', '2022-08-07 19:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `about_heading` text NOT NULL,
  `about_content` text NOT NULL,
  `about_status` int(11) NOT NULL,
  `terms_heading` text NOT NULL,
  `terms_content` text NOT NULL,
  `terms_status` int(11) NOT NULL,
  `privacy_heading` text NOT NULL,
  `privacy_content` text NOT NULL,
  `privacy_status` int(11) NOT NULL,
  `contact_heading` text NOT NULL,
  `contact_map` text DEFAULT NULL,
  `contact_status` int(11) NOT NULL,
  `photo_gallery_heading` text NOT NULL,
  `photo_gallery_status` int(11) NOT NULL,
  `video_gallery_heading` text NOT NULL,
  `video_gallery_status` int(11) NOT NULL,
  `faq_heading` text NOT NULL,
  `faq_status` int(11) NOT NULL,
  `blog_heading` text NOT NULL,
  `blog_status` int(11) NOT NULL,
  `room_heading` text NOT NULL,
  `cart_heading` text NOT NULL,
  `cart_status` int(11) NOT NULL,
  `checkout_heading` text NOT NULL,
  `checkout_status` int(11) NOT NULL,
  `payment_heading` text NOT NULL,
  `signup_heading` text NOT NULL,
  `signup_status` int(11) NOT NULL,
  `signin_heading` text NOT NULL,
  `signin_status` int(11) NOT NULL,
  `forget_password_heading` text NOT NULL,
  `reset_password_heading` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `about_heading`, `about_content`, `about_status`, `terms_heading`, `terms_content`, `terms_status`, `privacy_heading`, `privacy_content`, `privacy_status`, `contact_heading`, `contact_map`, `contact_status`, `photo_gallery_heading`, `photo_gallery_status`, `video_gallery_heading`, `video_gallery_status`, `faq_heading`, `faq_status`, `blog_heading`, `blog_status`, `room_heading`, `cart_heading`, `cart_status`, `checkout_heading`, `checkout_status`, `payment_heading`, `signup_heading`, `signup_status`, `signin_heading`, `signin_status`, `forget_password_heading`, `reset_password_heading`, `created_at`, `updated_at`) VALUES
(1, 'About us', '<p><span style=\"color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\"><b>Pan Pacific Sonargaon Dhaka is centrally located close to Gulshan and the Embassy districts, just 8.7 mi from the International Airport. Pan Pacific Sonargaon Dhaka is located in the city Center.\r\n\r\nRooms here will provide you with a TV, air conditioning and a mini-bar. Featuring a shower with private bathrooms. Some rooms have a pool view. Extras include a seating area and satellite channels.\r\n\r\nAt Pan Pacific Sonargaon Dhaka you will find a health club, spa, swimming pool and spa bath, along with a lobby lounge and café. It also provides a hairdresser, massage center, currency exchange, laundry and free WIFI.\r\n\r\nRestaurants include Jharna Grill acclaimed as being one of the best Restaurants in Dhaka featuring seafood and international grill items. Café Bazar is the all day dinning offers an extensive buffet menu featuring Pan Asian cuisine and European favorites. The property has a Pool Café adjacent to Dhaka’s largest swimming pool and peaceful gardens serve delicious snacks and BBQ items. Pacific Avenue Bar, a popular night club with live music allows guests to mingle. 24-hour room service is available.</b></span></p><p><span style=\"color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\"><b><br></b></span></p><p><span style=\"font-weight: bolder; color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\">Pan Pacific Sonargaon Dhaka is centrally located close to Gulshan and the Embassy districts, just 8.7 mi from the International Airport. Pan Pacific Sonargaon Dhaka is located in the city Center.\r\n\r\nRooms here will provide you with a TV, air conditioning and a mini-bar. Featuring a shower with private bathrooms. Some rooms have a pool view. Extras include a seating area and satellite channels.\r\n\r\nAt Pan Pacific Sonargaon Dhaka you will find a health club, spa, swimming pool and spa bath, along with a lobby lounge and café. It also provides a hairdresser, massage center, currency exchange, laundry and free WIFI.\r\n\r\nRestaurants include Jharna Grill acclaimed as being one of the best Restaurants in Dhaka featuring seafood and international grill items. Café Bazar is the all day dinning offers an extensive buffet menu featuring Pan Asian cuisine and European favorites. The property has a Pool Café adjacent to Dhaka’s largest swimming pool and peaceful gardens serve delicious snacks and BBQ items. Pacific Avenue Bar, a popular night club with live music allows guests to mingle. 24-hour room service is available.</span></p><p><span style=\"font-weight: bolder; color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\"><br></span></p><p><span style=\"font-weight: bolder; color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\">Pan Pacific Sonargaon Dhaka is centrally located close to Gulshan and the Embassy districts, just 8.7 mi from the International Airport. Pan Pacific Sonargaon Dhaka is located in the city Center.\r\n\r\nRooms here will provide you with a TV, air conditioning and a mini-bar. Featuring a shower with private bathrooms. Some rooms have a pool view. Extras include a seating area and satellite channels.\r\n\r\nAt Pan Pacific Sonargaon Dhaka you will find a health club, spa, swimming pool and spa bath, along with a lobby lounge and café. It also provides a hairdresser, massage center, currency exchange, laundry and free WIFI.\r\n\r\nRestaurants include Jharna Grill acclaimed as being one of the best Restaurants in Dhaka featuring seafood and international grill items. Café Bazar is the all day dinning offers an extensive buffet menu featuring Pan Asian cuisine and European favorites. The property has a Pool Café adjacent to Dhaka’s largest swimming pool and peaceful gardens serve delicious snacks and BBQ items. Pacific Avenue Bar, a popular night club with live music allows guests to mingle. 24-hour room service is available.</span><span style=\"font-weight: bolder; color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\"><br></span><span style=\"color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\"><b><br></b></span></p>', 1, 'Who are we?', '<p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>1. Who are we</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>Pan Pacific Hotels Group Limited is in the business of hospitality, and we own and/or manages hotels, resorts and serviced suites under our two brands \"Pan Pacific\" and \"PARKROYAL\". We also operate St Gregory Spa and various dining establishments including the award-winning Si Chuan Dou Hua. For more information about us, please refer to our corporate website:&nbsp;<a href=\"https://www.panpacific.com/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color: rgb(167, 133, 46); text-decoration-line: underline;\">http://www.panpacific.com</a>.</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>2. Why you are at this page</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>(a) You have been invited</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>We note that you have created content, so identified in our message/request to you, which is related to our businesses (\"User Content\"). In particular, if you have recently visited our establishments, we expressly thank you for your patronage.</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>As part of our UGC Terms &amp; Conditions, we are now reaching out to you to seek your permission to collect, transmit, store, publish and use the User Content, including without limitation on storage systems, websites, social media channels, print materials and other promotional materials (regardless of form) whether owned by or created for and behalf of Pan Pacific Hotels Group Limited, our related corporations and our affiliates (collectively \"PPHG\"). We thank you for considering our request.</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>Should you agree to our request to use the User Content in accordance with the terms and conditions set out herein (\"Terms\"), you may respond to our message by replying with the hashtag(s) \"#ShareYourMoments\" and/or grant your approval through system(s) maintained by our service provider(s) providing social curation tools, user-generated content (UGC) management systems. Your agreement to our request will be deemed&nbsp;as an official agreement to these Terms.</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>However, should you not agree to these Terms, please ignore the request. Thank you.</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>(b) You are participating in an event held by PPHG</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>PPHG may hold events (including without limitation competitions and promotions) using websites and social media platform(s) that requires you to submit your User Content. Each such event will have its own terms and conditions (\"Event Terms\"), which you are advised to review. Please use the relevant hashtag(s) indicated under the Event Terms to ensure your submission for the event is valid (\"Event Hashtag\"). By using such Event Hashtag in your submission, you will be deemed&nbsp;to have agreed to the Terms and the Event Terms.</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>3. Terms</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>(a) About you</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>By agreeing to these Terms, you will be deemed to be entering into an agreement with us; and accordingly, you would be representing and warranting to us at first instance that:</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; list-style-position: unset !important;\"><li><b>you are at least 18 years old or considered a legal adult in the jurisdiction that you reside in; and</b></li><li><b>you have the ability and authority to agree to the Terms.</b></li></ul><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>(b) Collection, Storage, Transmission, Publication and/or Use</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; list-style-position: unset !important;\"><li><b>The User Content will be used for commercial or business-related purposes, including without limitation the promoting/marketing of businesses, services and/or products which are sold, distributed and/or marketed by PPHG; and collation of data from potential/actual customer/guest in relation to businesses, services and/or products which are sold, distributed and/or marketed by PPHG for market study and/or loyalty programmes; (collectively \"Purposes\").</b></li><li><b>We engage third party service providers to facilitate the collection, storage, transmission, publication and/or use of content on our websites, social media channels, print material and other promotional materials (regardless of form) (collectively \"PPHG Content\").</b></li><li><b>Further to the above, PPHG Content is also collected, stored, transmitted, published and/or used by our business partners for the Purposes.</b></li><li><b>Accordingly, your agreement to these Terms will be deemed as irrevocable consent to the collection, storage, transmission, publication and/or use the User Content by PPHG, our business partners and our service providers for the Purposes.</b></li><li><b>Your consent will not lapse or be deemed as revoked notwithstanding (a) the User Content has been removed by you from the websites and/or social media platforms which you have originally uploaded/posted/hosted the User Content on; (b) you have changed your username on such websites or social media platforms; (c) you have closed your account on such websites or social media platforms; or (d) you have changed the settings of your accounts on any website or social media platform such that it is to be limited to a restricted audience (\"Setting Change\"). In particular, PPHG (including our business partners and our service providers) would also not be required to limit the viewing of the User Content to the same restricted audience of your Setting Change.</b></li></ul><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>(c) User Content</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; list-style-position: unset !important;\"><li><b>The User Content may be in the form of pictures/graphics, photographs, videos, sound recordings, comments, combination of the above and/or any other form derived from the abovementioned.</b></li><li><b>You own all rights to the User Content and all elements thereof. The User Content is your own creation, and does not contain any element which infringes or violates the rights (including without limitation intellectual property rights, copyright, trademarks, rights of privacy, patent, trade secrets, confidentiality) of other persons.</b></li><li><b>The User Content must not contain or be accompanied by anything abusive, illegal, derogatory, defamatory, harassing, harmful, hateful, indecent, libellous, objectionable, obscene, offensive and/or threatening. User Content should also not contain or be accompanied by any content relating to nudity or pornography,</b></li><li><b>The User Content, the storage and/or the use of the User Content does not violate any applicable laws, rules and/or requirements (including without limitation the terms or requirements of the websites or social media platforms on which they have been uploaded/posted on or are hosted on), as well as the terms and conditions of our service provider(s) including without limitation those providing social curation tools, user-generated content (UGC) management systems.</b></li><li><b>In the event that individuals or personal data of individuals appear in the User Content, you have obtained irrevocable consent from these individuals for their likeness or personal data to be included in the User Content; the User Content to be on websites or social media platforms which you had originally uploaded/posted/hosted the User Content on; and the User Content be collected, stored, transmitted, published and/or used by PPHG, our business partners and our third-party service providers for the Purposes.</b></li><li><b>In particular, if likeness or personal data of any minor form part of the User Content, you have obtained the consent of such child\'s parent/legal guardian for the minor\'s likeness or personal data to be included in the User Content; the User Content to be on websites or social media platforms which you had originally uploaded/posted/hosted it on; and the User Content be collected, stored, transmitted, published and/or used by PPHG, our business partners and our third-party service providers for the Purposes.</b></li><li><b>Upon agreeing to these Terms, you will not modify the User Content such that breaches any of the Terms.</b></li></ul><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>(d) Licence</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; list-style-position: unset !important;\"><li><b>By agreeing to these Terms, you will be granting us a non-exclusive, royalty-free, world-wide, perpetual, transferable, irrevocable and fully sub-licensable right to use, reproduce, modify, adapt, publish, sell, assign, translate, create derivatives work from, distribute and display the User Content (or any part of it) and its related content; and that we may include the User Content (or any part of it and its related content) into other works for any Purpose. In particular, you grant us the right, at our sole discretion and choice, to use your personal data (which may include without limitation your username, real name, image, likeness, location) in connection with our use of the User Content. Notwithstanding the above, we may but are not obliged to use or continue any usage the User Content and/or your personal data. We retain the right to, at our sole discretion and choice, stop or remove any User Content at any time for any reason in our PPHG Content. We reserve the right to moderate the use of User Content and PPHG Content.</b></li><li><b>In the event that we, at our sole discretion and choice, choose to use your personal data, you agree that we shall not be obliged to ensure that any revised personal data (if subsequently changed) be used; and we may continue to use the original personal data first provided when you agreed to these Terms.</b></li><li><b>Such agreement will also be an irrevocable and unconditional waiver (i.e. agreement not to enforce) any and all rights in the User Content which you may have against us. If requested, you will also sign such documentations which we may require to protect, perfect or enforce any of the rights you have given us under these Terms.</b></li><li><b>Our use of your User Content shall not be deemed as any endorsement or affiliation with you and your work. Nothing contained herein shall be construed to be or create a partnership or joint venture between you and PPHG.</b></li></ul><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>(e) Privacy Policy</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; list-style-position: unset !important;\"><li><b>Our privacy policy and/or data protection policy, published on our corporate website, (collectively \"Policies\") form part of these Terms and are deemed to be incorporated hereto by reference. Unless expressly defined hereto or the context requires otherwise, terms defined in the Policies shall have the same meaning ascribed to them hereto.</b></li><li><b>By agreeing to these Terms, you will be bound by our Policies and expressly agree that we may collect, store, transmit, publish and use your personal data (so defined in the Policies). You acknowledge and agree that we may update our Policies, from time to time, at our sole discretion and without reference/notice to you; and notwithstanding the above, the Policies shall continue to apply.</b></li><li><b>Notwithstanding the above, the User Content, your agreeing to these Terms, our request for User Content and/or participation in such event held by PPHG (as the case may be) shall not be deemed to be confidential information, and PPHG shall not owe you a duty to maintain secrecy about.</b></li><li><b>We encourage you to keep and provide us with your full name, contact details, email address and citizenship so that we may contact you if necessary.</b></li><li><b>You agree that we may (but are not obliged to) use your personal data for the purposes of crediting or attributing credit to you for the User Content; promoting/marketing of businesses, services and/or products which are sold, distributed and/or marketed by PPHG, market studies; and inviting you to participate in any loyalty programme.</b></li></ul><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>(f) Limitation of Liability</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; list-style-position: unset !important;\"><li><b>You shall be liable for and indemnify us against any and all actions, claims, demands, liabilities, losses, damages, expenses (including without limitation legal expenses), and proceedings suffered by us, which arose directly or indirectly from a breach by you of your obligations, representations or warranties under these Terms, and/or arise directly or indirectly in connection with the collection, storage, transmission, publication and use of the User Content by us, our business partners and our service providers.</b></li><li><b>PPHG shall not be liable for any direct, special, incidental, indirect or consequential damage, including without limitation any loss of profits or loss of data that results from the collection, storage, transmission, publication and use of the User Content. Your only remedy against PPHG would be to request that we stop using future use of your User Content in new promotional materials (and not in any other PPHG Content already created and in circulation). Should PPHG be found liable to you for any damage or loss which is in any way connected to the User Content, our liability to you shall not exceed S$100.00.</b></li><li><b>While we make an effort to pre-screen User Content, we shall not be responsible in any manner to ensure that User Content incorporated into PPHG Content is not harmful, inaccurate, deceptive, offensive, threatening, defamatory, unlawful or otherwise objectionable. In particular, we wish to highlight that how User Content is collated to appear in PPHG Content may be random due to software/programming automation, and PPHG shall not be responsible if the combination of User Content from different creators appear to be harmful, inaccurate, deceptive, offensive, threatening, defamatory, unlawful or otherwise objectionable.</b></li><li><b>You acknowledge and agree that PPHG has no control over User Content beyond its collection, storage, transmission, publication and/or use for PPHG Content; and PPHG shall not be liable to you should the User Content be misappropriated for collection, storage, transmission, publication and/or use by third parties for any purpose.</b></li></ul><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>(g) Miscellaneous</b></p><ul style=\"padding-inline-start: 20px; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; list-style-position: unset !important;\"><li><b>These Terms may not be assigned or transferred by you to another person without our prior written consent.</b></li><li><b>You agree that we may assign our rights, and obligations under these Terms to any other person, in whole or in part, without consent from or notice to you.</b></li><li><b>Failure by us to exercise, and any delay, forbearance or indulgence by us in exercising any right, power remedy under the Tests (in whole or in part) shall not operate as a waiver of that right, power or remedy; nor shall it preclude the exercise of such right, power or remedy at any subsequent time or on any subsequent occasion.</b></li><li><b>Save for PPHG and you, no other person shall have a right to enforce any of these Terms.</b></li><li><b>These Terms shall be governed by and construed in accordance with the laws of the Republic of Singapore. Unless otherwise provided herein, all laws referred to or applicable for any clauses in this Terms shall be the laws of the Republic of Singapore. You and PPHG shall submit to the exclusive jurisdiction of the courts of the Republic of Singapore to resolve any dispute arising under or in connection with these Terms.</b></li><li><b>If at any time any provision of these Terms is or becomes invalid, illegal or unenforceable in any respect, the validity, legality or enforceability of the remaining provisions of these Terms shall not in any way be affected or impaired thereby.</b></li><li><b>PPHG reserves the right to alter these Terms, from time to time, without reference or advance notice by posting the revised version on its corporate website; and notwithstanding the above, you agree that the revised Terms shall apply to the User Content which approvals were given prior to such revisions. Further to the above, you are also advised to review the Terms each time to you agree to any new or subsequent request in relation to other User Content so identified by us as related to our businesses and which we may subsequently seek your permission to use.</b></li></ul><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>4. Contacting PPHG</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>PPHG respects the intellectual property of others, and we ask you to do the same. If you believe that your content has been copied in any way which constitutes intellectual property right infringement, please inform us in writing immediately and provide us with proof of such infringement.</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>However, we seek your understanding that the content has been provided to us by other individuals on these Terms. Accordingly, if your infringement claim is proven, PPHG may only cease to use such content in any future PPHG Content (excluding those already in circulation) or otherwise with your agreement, continue to use such content on these Terms but attribute the content to you instead.</b></p><p style=\"margin-bottom: 15px; overflow-wrap: break-word; color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><i><b>Last Modified: May 2018</b></i></p>', 1, 'Privacy Policy', '<section class=\"mi-sub-section sub-section l-print-fullbleed l-container l-margin-subsection-bottom-none l-margin-tile-vertical-none l-padding-tile-vertical-none l-padding-subsection-vertical-none\" style=\"position: relative; margin: 0px auto; padding: 0px 1.25rem; max-width: 73.75rem; background-clip: content-box; color: rgb(28, 28, 28); font-family: proxima-nova, Helvetica, Arial, sans-serif; font-size: 16px;\"><span id=\"data-covered\"><div class=\"    l-s-col-4 l-m-col-8 l-s-col-last l-m-col-last l-l-col-12 l-xl-col-12 l-l-col-last l-xl-col-last \" style=\"width: calc(99.9% + 0rem); float: right; margin-right: 0px; clear: both;\"><div id=\"CardText_v19568\" class=\"t-uniform-height\"><section class=\"tile-card-text l-template-1  l-left-align  l-top-valign  l-s-col-4 l-m-col-8 l-l-col-12 l-xl-col-12 l-display-inline-block \" data-component-id=\"CardText_v1_01_9568\" data-component-name=\"cardText\" data-component-endpoint=\"/aries-content/v1/cardText.comp\" style=\"display: inline-block; width: calc(99.9% + 0rem); vertical-align: top; float: left; margin-right: 0px; clear: none; margin-bottom: 0px; padding-bottom: 0px;\"><div class=\"title-desc-cta l-s-col-4  l-padding-left-five-quarters  l-padding-right-five-quarters l-display-inline-block\" style=\"width: calc(99.9% + 0rem); display: inline-block; padding-left: 1.25rem; padding-right: 1.25rem; float: left; margin-right: 0px; clear: both;\"><div class=\"title-desc l-no-cta\" style=\"width: 1136.44px; margin-right: 0px; float: left;\"><b><p class=\"l-s-margin-bottom-none l-l-margin-bottom t-word-break  \" style=\"font-size: 1rem; color: inherit; line-height: 1.25; word-break: break-word;\">This Privacy Statement describes the privacy practices of the Marriott Group for Data that we collect:</p><ul style=\"margin-right: 0px; margin-bottom: 0.5rem; margin-left: 0px; padding: 0px;\"><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">through websites operated by us from which you are accessing this Privacy Statement, including Marriott.com and other websites owned or controlled by the Marriott Group (collectively, our&nbsp;Websites);</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">through the software applications (including automated tools and chat functionalities) made available by us for use on or through computers and mobile devices (collectively, our&nbsp;Apps);</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">through our social media pages that we control from which you are accessing this Privacy Statement (collectively, our&nbsp;Social Media Pages);</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">through email messages that we send you that link to this Privacy Statement and through your communications with us online or in person;</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">from third parties such as&nbsp;Authorized Licensees, Owners and Franchisees, and Other Sources, such as public databases, marketing partners, and other third parties; and</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">when you visit or stay as a guest at one of our properties, or at homes and villas offered on the Homes and Villas by Marriott International platform (Homes and Villas), or through other offline interactions (collectively,&nbsp;Property Visits and Offline Interactions).</li></ul><p style=\"font-size: 1rem; color: inherit; line-height: 1.25;\">Collectively, we refer to our&nbsp;Websites, the&nbsp;Apps, and our&nbsp;Social Media Pages, as the “Online Services” and, together with the&nbsp;Property Visits and Offline Interactions, the “Services.”</p><p style=\"font-size: 1rem; color: inherit; line-height: 1.25;\"><a href=\"https://www.marriott.com/about/privacy.mi#top\" style=\"color: inherit; text-decoration-line: underline;\">Back to top</a></p></b></div></div></section></div></div></span></section><section class=\"mi-sub-section sub-section l-print-fullbleed l-container l-margin-subsection-bottom-none l-margin-tile-vertical-none l-padding-tile-vertical-none l-padding-subsection-vertical-none\" style=\"position: relative; margin: 0px auto; padding: 0px 1.25rem; max-width: 73.75rem; background-clip: content-box; color: rgb(28, 28, 28); font-family: proxima-nova, Helvetica, Arial, sans-serif; font-size: 16px;\"><span id=\"data-we-collect\"><div class=\"    l-s-col-4 l-m-col-8 l-s-col-last l-m-col-last l-l-col-12 l-xl-col-12 l-l-col-last l-xl-col-last \" style=\"width: calc(99.9% + 0rem); float: right; margin-right: 0px; clear: both;\"><div id=\"CardText_v154e9\" class=\"t-uniform-height\"><section class=\"tile-card-text l-template-1  l-left-align  l-top-valign  l-s-col-4 l-m-col-8 l-l-col-12 l-xl-col-12 l-display-inline-block \" data-component-id=\"CardText_v1_01_54e9\" data-component-name=\"cardText\" data-component-endpoint=\"/aries-content/v1/cardText.comp\" style=\"display: inline-block; width: calc(99.9% + 0rem); vertical-align: top; float: left; margin-right: 0px; clear: none; margin-bottom: 0px; padding-bottom: 0px;\"><div class=\"title-desc-cta l-s-col-4  l-padding-left-five-quarters  l-padding-right-five-quarters l-display-inline-block\" style=\"width: calc(99.9% + 0rem); display: inline-block; padding-left: 1.25rem; padding-right: 1.25rem; float: left; margin-right: 0px; clear: both;\"><div class=\"title-desc l-no-cta\" style=\"width: 1136.44px; margin-right: 0px; float: left;\"><b><h3 class=\"\" style=\"font-size: 1.5rem; line-height: 1.75rem; margin: 0.625rem 0px; padding: 0px;\">THE DATA WE COLLECT</h3><p class=\"l-s-margin-bottom-none l-l-margin-bottom t-word-break  \" style=\"font-size: 1rem; color: inherit; line-height: 1.25; word-break: break-word;\">At touchpoints throughout your guest journey, we collect Personal Data in accordance with the law, and to provide you with exemplary services.&nbsp;Personal Data&nbsp;is information that may identify you as an individual or relate to you as an identifiable individual. We collect and process the following types of Personal Data about you:</p><ul style=\"margin-right: 0px; margin-bottom: 0.5rem; margin-left: 0px; padding: 0px;\"><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Name</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Gender</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Postal address</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Telephone number</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Email address</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Financial information (such as credit and debit card number or other payment data)</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Language preference</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Date and place of birth</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Nationality, passport, visa, or other government-issued identification data</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Important dates: birthdays, anniversaries, and special occasions</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Membership or loyalty program data (including co-branded payment cards, travel partner program affiliations)</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Employer details (for business-related bookings)</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Travel itinerary, tour group, or activity data</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Prior guest stays or interactions (including interactions via our automated chat functionalities), goods and services purchased, special service and amenity requests</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Social media account ID, profile photo and other data publicly available, or data made available by linking your social media and loyalty accounts</li></ul><p style=\"font-size: 1rem; color: inherit; line-height: 1.25;\">In more limited circumstances, we may also collect:</p><ul style=\"margin-right: 0px; margin-bottom: 0.5rem; margin-left: 0px; padding: 0px;\"><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Data about family members and companions, names, and ages of children;</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Biometric data; and</li><li style=\"margin: 0px; padding: 0px; line-height: normal; list-style: none; font-size: 1rem;\">Images, video and audio data via: (a) security cameras located in public areas, such as hallways and lobbies, in our properties; and (b) body-worn cameras carried by our loss prevention officers and other security personnel.</li></ul><p style=\"font-size: 1rem; color: inherit; line-height: 1.25;\">We may also collect information about your&nbsp;\"Stay&nbsp;Preferences\"&nbsp;that we use to make your current and future stays and experience with us more enjoyable, including information about your interests and other relevant information that we learn about you during your stay. This may also include any likes and dislikes about our services that you tell us about so that we can improve our services, and specific dietary, health restrictions or personal needs to ensure your wellbeing. We may also collect your “Personal Preferences,” that may include details of your special anniversaries (such as your birthday or wedding anniversary), what type of activities you prefer to take part in when staying with us, and your hobbies. Personal Preferences may also include details about who you usually travel with, their relationship to you, and your marital status.</p><p style=\"font-size: 1rem; color: inherit; line-height: 1.25;\">If you submit any Personal Data about other people to us or our Service Providers (e.g., if you make a reservation for another individual), you represent that you have the authority to do so and you permit us to use the data in accordance with this Privacy Statement.</p><p style=\"font-size: 1rem; color: inherit; line-height: 1.25;\"><a href=\"https://www.marriott.com/about/privacy.mi#top\" style=\"color: inherit; text-decoration-line: underline;\">Back to top</a></p></b></div></div></section></div></div></span></section><section class=\"mi-sub-section sub-section l-print-fullbleed l-container l-margin-subsection-bottom-small l-margin-tile-vertical-default l-padding-tile-vertical-default l-padding-subsection-vertical-none\" style=\"position: relative; margin: 0px auto 0.625rem; padding: 0px 1.25rem; max-width: 73.75rem; background-clip: content-box; color: rgb(28, 28, 28); font-family: proxima-nova, Helvetica, Arial, sans-serif; font-size: 16px;\"><span id=\"cookies\"><div class=\"    l-s-col-4 l-m-col-8 l-s-col-last l-m-col-last l-l-col-12 l-xl-col-12 l-l-col-last l-xl-col-last \" style=\"width: calc(99.9% + 0rem); float: right; margin-right: 0px; clear: both;\"><div id=\"CardText_v1c0e6\" class=\"t-uniform-height\"><section class=\"tile-card-text l-template-1  l-left-align  l-top-valign  l-s-col-4 l-m-col-8 l-l-col-12 l-xl-col-12 l-display-inline-block \" data-component-id=\"CardText_v1_01_c0e6\" data-component-name=\"cardText\" data-component-endpoint=\"/aries-content/v1/cardText.comp\" style=\"display: inline-block; width: calc(99.9% + 0rem); vertical-align: top; float: left; margin-right: 0px; clear: none;\"><div class=\"title-desc-cta l-s-col-4  l-padding-left-five-quarters  l-padding-right-five-quarters l-display-inline-block\" style=\"width: calc(99.9% + 0rem); display: inline-block; padding-left: 1.25rem; padding-right: 1.25rem; float: left; margin-right: 0px; clear: both;\"><div class=\"title-desc l-no-cta\" style=\"width: 1136.44px; margin-right: 0px; float: left;\"><b><h3 class=\"\" style=\"font-size: 1.5rem; line-height: 1.75rem; margin: 0.625rem 0px; padding: 0px;\">THE ONLINE AND MOBILE DATA WE COLLECT</h3><p class=\"l-s-margin-bottom-none l-l-margin-bottom t-word-break  \" style=\"font-size: 1rem; color: inherit; line-height: 1.25; word-break: break-word;\">Typically, we do not collect Personal Data through your use of the Online Services. However, we may collect “Other Data” that does not directly identify you. To the extent Other Data reveal your specific identity or relate to an individual, we will treat Other Data as Personal Data.</p><p style=\"font-size: 1rem; color: inherit; line-height: 1.25;\">“Other Data” includes:</p></b></div></div></section></div></div></span></section>', 1, 'Contact', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d233667.49930605068!2d90.25487553147933!3d23.78106723687385!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8b087026b81%3A0x8fa563bbdd5904c2!2sDhaka!5e0!3m2!1sen!2sbd!4v1709108322418!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 1, 'Photo Gallery', 1, 'Video Gallery', 1, 'FAQ', 1, 'Blog', 1, 'Room', 'cart', 1, 'Checkout', 1, 'Payment', 'Sign Up', 1, 'Sign In', 1, 'Forget Password', 'Reset Password', NULL, '2024-03-01 23:05:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text NOT NULL,
  `caption` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `photo`, `caption`, `created_at`, `updated_at`) VALUES
(4, '1709018900.jpg', 'Enjoy your every single moments with usss', NULL, '2024-03-23 04:10:59'),
(6, '1709018938.jpg', 'Enjoy your every single moments with us', NULL, NULL),
(7, '1709018946.jpg', 'Enjoy your every single moments with us', NULL, NULL),
(8, '1709018955.jpg', 'Enjoy your every single moments with us', NULL, NULL),
(9, '1709018964.jpg', 'Enjoy your every single moments with us', NULL, NULL),
(10, '1709019026.jpg', 'Enjoy your every single moments with us', NULL, NULL),
(11, '1709019034.jpg', 'Enjoy your every single moments with us', NULL, NULL),
(12, '1709019042.jpg', 'Enjoy your every single moments with us', NULL, NULL),
(13, '1709019051.jpg', 'Enjoy your every single moments with us', NULL, NULL),
(15, '1709019072.jpg', 'Enjoy your every single moments with us', NULL, NULL),
(16, '1709189823.jpg', 'Enjoy your every single moments with us', NULL, NULL),
(17, '1711187163.jpg', 'Rahmania International Complex', NULL, '2024-03-23 03:57:50'),
(18, '1711192438.jpg', 'Rahmania International Complexfff', NULL, '2024-03-23 05:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text NOT NULL,
  `heading` text NOT NULL,
  `short_content` text NOT NULL,
  `content` text NOT NULL,
  `total_view` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `photo`, `heading`, `short_content`, `content`, `total_view`, `created_at`, `updated_at`) VALUES
(3, '1709103601.jpg', 'Hotel Shuktara Dhaka', '20/A Indira Road, beside Tejgaon College, Sher-e-Bangla Nagar, 1215 Dhaka, Bangladesh –', '<p data-et-view=\"eWHMcCcCcCSYeJbNXGDJdcSNDeMSZGSRaPSZbRe:1\" style=\"margin-block-start: 0px; color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif;\"><b>You\'re eligible for a Genius discount at Gulshan Lovely 3-Bedroom Luxury Apartment! To save at this property, all you have to do is&nbsp;<a href=\"https://account.booking.com/auth/oauth2?bkng_action=hotel&amp;redirect_uri=https%3A%2F%2Fsecure.booking.com%2Flogin.html%3Fop%3Doauth_return&amp;response_type=sso&amp;dt=1709103493&amp;client_id=vO1Kblk7xX9tUn2cpZLS&amp;aid=304142&amp;state=UtsEamfg7XaTmP9q1s7UnChi4VgK03O5NRytcVMaPxAgU9e8LItUq9ZW9EsowiKF8S18YkHYU2zVl-S49bOYdlLP8he_SKy97qP_YlZ6z43_t1lGLgw9g_TuHZPYyp0qc20APCRbUHQlObUs6X_X_BF5DWrSBDSgXyYG8fsWExOm2DMDO2mUHtefGp4TVdg4MC6U0fpD4D3kgyyVF5yJVIM4FfUzv1-We86pYXB-68G5zmyTVQPJghTWVyjXKkqSgra4CtHT-mHCUvvg0ssIiU3dt8DyVlWxs5xPdk154eQpodn96L_gEntP_Ni7zZaQq72hyoUyI0RpKileo9kq0fy5bdKhDByrPyjRl43rAongHRL9HnQywRWCm_MlhCGbDWQvFR65jq-Un35jmT-M3XqV5pBjQSVGbCBnxHgNqzEo6Wncshc_mPhHtna56M5JCehWXmz8geNihQOe4TxTK0g4s32V5exyv-2f8_JAbRrG9kyrDHxb3teraTvuNpCDhhslMjGqGNA5eD3_O4FK9BrPLa7ZBLZFlRI_C1i1dO3i2P7kjXPTY3DT-FmZAe33A72J_itM-2DJPCETOiFw4Oy_cu3boZAIdTRLs_9t2rq9PGlwXi8tJOW8tFruTvp54CGa9Ro0gWW5HLXzNNqKNtmgZEdmRzvhCHjr71MQEAtUEGePM6ypcq51MVawnVNw3rq4sIrzZhKWlX6Mizz99_Ps1Ta5ePljKlyqXKnaShNP8dcCCE6-6SCyVec4xr1oqVgGe2iZRc5aCXSXu9ZhsP4aw4AhNeZeNjE5A413&amp;lang=en-us\" class=\"bui-link\" data-et-click=\"customGoal:eWHMcCcCcCSYeJbNXGDJdcSNDeMSZGSRaPSZbRe:1\" style=\"color: var(--bui_color_action_foreground); text-decoration-line: underline; cursor: pointer; display: inline;\">sign in</a>.</b></p><div data-capla-component-boundary=\"b-property-web-property-page/PropertyDescriptionDesktop\" style=\"color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif;\"><p class=\"a53cbfa6de b3efd73f69\" style=\"font-size: var(--bui_font_body_2_font-size); line-height: var(--bui_font_body_2_line-height); font-family: var(--bui_font_body_2_font-family); white-space-collapse: preserve; margin-block: 0px;\"><b>Gulshan Lovely 3-Bedroom Luxury Apartment is located in Dhaka, just a 18-minute walk from AUST and 1.4 miles from Consulate of Singapore. This property offers access to a balcony, free private parking, and free Wifi. The accommodation features airport transfers, while a car rental service is also available.\r\n\r\nFeaturing a terrace and city views, the spacious apartment includes 3 bedrooms, a living room, satellite flat-screen TV, an equipped kitchen, and 3 bathrooms with a walk-in shower and a bath. The apartment offers bed linen, towels, and daily room service.\r\n\r\nBangladesh University of Textiles is 1.5 miles from the apartment, while BRAC University is a 19-minute walk from the property. The nearest airport is Hazrat Shahjalal International Airport, 5 miles from Gulshan Lovely 3-Bedroom Luxury Apartment.</b></p></div>', 1, NULL, '2024-02-28 01:00:01'),
(4, '1709103921.jpg', 'Priyo Nibash Stylish Residential Hotel', 'Green Road 152/2/K-2 Green Road, Panthapath ( Near Health and Hope Hospital), 1205 Dhaka,', '<p><span style=\"color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\"><b>Located in Dhaka, a 13-minute walk from Daffodil International University, Priyo Nibash Stylish Residential Hotel provides accommodations with a fitness center, free private parking, a terrace and a restaurant. This 4-star hotel offers room service, a 24-hour front desk and free WiFi. The property has an ATM, a concierge service and currency exchange for guests.\r\n\r\nThe hotel will provide guests with air-conditioned rooms offering a closet, a safety deposit box, a flat-screen TV and a private bathroom with a shower. At Priyo Nibash Stylish Residential Hotel all rooms are equipped with bed linen and towels.\r\n\r\nThe daily breakfast offers buffet, à la carte or continental options.\r\n\r\nPopular points of interest near the accommodation include Dhaka Tribune, State University of Bangladesh and World University of Bangladesh. The nearest airport is Hazrat Shahjalal International Airport, 6.2 miles from Priyo Nibash Stylish Residential Hotel.</b></span><br></p>', 5, NULL, '2024-02-29 01:29:03'),
(5, '1709104176.jpg', 'Hotel City International Residential', 'Green Road 34 Nawab Mansion (1st Floor) Beside Green Life Medical College Hospital, 1205 Dhaka,', '<p><span style=\"color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\"><b>Located in Dhaka, within a 6-minute walk of World University of Bangladesh and 0.9 miles of Daffodil International University, Hotel City International Residential provides accommodations with a shared lounge and free WiFi as well as free private parking for guests who drive. The property is around 1.1 miles from Nothern University Bangladesh, 1.5 miles from Bangladesh Medical College and 1.8 miles from University of Dhaka. The property has a shared kitchen, room service and currency exchange for guests.\r\n\r\nFeaturing a private bathroom with a shower and free toiletries, rooms at the hotel also provide guests with a city view. At Hotel City International Residential every room has a flat-screen TV with cable channels.\r\n\r\nWith staff speaking Bengali and English, guidance is available at the reception.\r\n\r\nPopular points of interest near the accommodation include Dhaka Tribune, State University of Bangladesh and United International University. The nearest airport is Hazrat Shahjalal International Airport, 6.2 miles from Hotel City International Residential.</b></span><br></p>', 6, NULL, '2024-02-29 01:35:49'),
(6, '1709104268.jpg', 'Park Hyatt Dhaka', 'Plot # 35, Road#1/A, Block # I, Banani, Gulshan, 1213 Dhaka, Bangladesh', '<p><span style=\"color: rgb(26, 26, 26); font-family: BlinkMacSystemFont, -apple-system, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\"><b>In a prime location in the Gulshan district of Dhaka, Park Hyatt Dhaka is located a 10-minute walk from Primeasia University, 0.7 miles from BRAC University and a 14-minute walk from Southeast University. With a fitness center, the 3-star hotel has air-conditioned rooms with free WiFi, each with a private bathroom. The hotel has a terrace and city views, and guests can enjoy a meal at the restaurant or a drink at the snack bar.\r\n\r\nAll guest rooms in the hotel are equipped with an electric tea pot. All rooms are equipped with a desk and a flat-screen TV, and some units at Park Hyatt Dhaka have a balcony.\r\n\r\nSpeaking Arabic, English and Hindi at the reception, staff are ready to help around the clock.\r\n\r\nAIUB is a 13-minute walk from the accommodation, while Consulate of Singapore is 1.3 miles away. The nearest airport is Hazrat Shahjalal International, 3.1 miles from Park Hyatt Dhaka, and the property offers a paid airport shuttle service.</b></span><br></p>', 3, NULL, '2024-02-29 01:37:30');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` text NOT NULL,
  `total_rooms` text NOT NULL,
  `amenities` text DEFAULT NULL,
  `size` text DEFAULT NULL,
  `total_beds` text DEFAULT NULL,
  `total_bathrooms` text DEFAULT NULL,
  `total_balconies` text DEFAULT NULL,
  `total_guests` text DEFAULT NULL,
  `featured_photo` text NOT NULL,
  `video_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `description`, `price`, `total_rooms`, `amenities`, `size`, `total_beds`, `total_bathrooms`, `total_balconies`, `total_guests`, `featured_photo`, `video_id`, `created_at`, `updated_at`) VALUES
(3, 'Holiday dream', '<p><span style=\"color: rgb(51, 51, 51); font-family: Karla, sans-serif;\"><b>If you want to get some good contents from the people of your country then just contribute into the main community of your people and I am sure you will be benfitted from that.</b></span><br></p>', '10000', '3', '1,2,3,4,5', '500 sqf', '3', '3', '2', '3', '1709529188.jpg', 'cmMiyZaSELo?si=p2QfLsYvo8W7ZITK', NULL, '2024-03-04 23:00:13'),
(4, 'Honeymoon sweet', '<p><span style=\"color: rgb(51, 51, 51); font-family: Karla, sans-serif;\"><b>If you want to get some good contents from the people of your country then just contribute into the main community of your people and I am sure you will be benfitted from that.</b></span><br></p>', '20000', '3', '2', '500 sqf', '4', '4', '2', '3', '1709529293.jpg', 'XgdY_s1LsZc?si=4mI76Ek8Bl3pIPHi', NULL, NULL),
(5, 'Deluxe Room', '<p><span style=\"color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px; background-color: rgb(239, 239, 242);\"><b>Our Deluxe Room is a relaxing space for you to unwind with its city and pool views as well as a selection of cable television channels.</b></span><br></p>', '15000', '5', '1,2,3,4,5', '1500 Sqf', '2', '3', '2', '3', '1710821647.jpg', '3uvfq4Cu8R8?si=Xf0UFn80n8tSbcti', NULL, NULL),
(6, 'Premier Room', '<p><span style=\"color: rgb(33, 37, 41); font-family: Helvetica, arial, sans-serif; font-size: 16px;\"><b>Our elegant Premier Room comes with expansive city or pool views, an ensuite bathroom with separate shower as well as a well-equipped work area, completing your stay experience at the finest Dhaka city hotel.</b></span><br></p>', '25000', '5', '1,2,3,4,5', '2500 Sqf', '5', '3', '3', '3', '1710821793.jpg', 'rTkD7wp3wo0?si=ILmOZ8BX82MJvY-O', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_photos`
--

CREATE TABLE `room_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` int(11) NOT NULL,
  `photo` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_photos`
--

INSERT INTO `room_photos` (`id`, `room_id`, `photo`, `created_at`, `updated_at`) VALUES
(6, 3, '1709536556.jpg', NULL, NULL),
(7, 3, '1709536615.jpg', NULL, NULL),
(10, 3, '1709536651.jpg', NULL, NULL),
(11, 3, '1709536850.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` text NOT NULL,
  `favicon` text NOT NULL,
  `top_bar_phone` text DEFAULT NULL,
  `top_bar_email` text DEFAULT NULL,
  `home_feature_status` text NOT NULL,
  `home_room_total` text NOT NULL,
  `home_room_status` text NOT NULL,
  `home_testimonial_status` text NOT NULL,
  `home_latest_post_total` text NOT NULL,
  `home_latest_post_status` text NOT NULL,
  `footer_address` text DEFAULT NULL,
  `footer_phone` text DEFAULT NULL,
  `footer_email` text DEFAULT NULL,
  `copyright` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `linkedin` text DEFAULT NULL,
  `pinterest` text DEFAULT NULL,
  `theme_color_1` text NOT NULL,
  `theme_color_2` text NOT NULL,
  `analytic_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `favicon`, `top_bar_phone`, `top_bar_email`, `home_feature_status`, `home_room_total`, `home_room_status`, `home_testimonial_status`, `home_latest_post_total`, `home_latest_post_status`, `footer_address`, `footer_phone`, `footer_email`, `copyright`, `facebook`, `twitter`, `linkedin`, `pinterest`, `theme_color_1`, `theme_color_2`, `analytic_id`, `created_at`, `updated_at`) VALUES
(1, '1711260786.png', '1659970382.png', '01771236592', 'hotelbooking@gamil.com', 'Show', '4', 'Show', 'Show', '3', 'Show', '34 Antiger Lane,\r\nPK Lane, USA, 12937', '01725896325', 'hotelbooking@gmail.com', 'Copyright 2022, bilash. All Rights Reserved.', 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.linkedin.com', 'https://www.pinterest.com', '#e75542', '#ffd3ce', 'UA-84213520-6', NULL, '2024-03-24 00:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text NOT NULL,
  `heading` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `button_text` text DEFAULT NULL,
  `button_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `photo`, `heading`, `text`, `button_text`, `button_url`, `created_at`, `updated_at`) VALUES
(7, '1709018501.jpg', 'Best offer', 'Enjoy your every single moments with us', 'Offer', 'http://localhost:8000/', NULL, '2024-02-27 01:21:41'),
(8, '1709018545.jpg', 'Good trip', 'Enjoy your every single moments with us', 'Take it', 'http://localhost:8000', NULL, '2024-02-27 01:22:25'),
(9, '1709018417.jpg', 'Holiday tripe', 'Enjoy your every single moments with us', 'Offer', 'http://localhost:8000/', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` text NOT NULL,
  `token` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'bilashkirtonia005@gmail.com', '2f2da0c98d4077b2f35f0f4e2dd8080e8bc64edbc8b8ac2ef774bb4fe4079009', 0, '2024-03-02 11:02:11', '2024-03-02 11:02:11'),
(2, 'bilashkirtonia005@gmail.com', 'da9689d7830f29bd13be412fb4c86cc86b5d62f671a6c9f15dd0fc8081244a62', 0, '2024-03-02 11:05:38', '2024-03-02 11:05:38'),
(3, 'bilashkirtonia005@gmail.com', '8572c41c2e5257eb501899fb8028e0212b90cf333c87f25c7b729ac84f2e94d2', 0, '2024-03-02 11:07:47', '2024-03-02 11:07:47'),
(4, 'bilashkirtonia005@gmail.com', '260facb9f29274df1b9471a4e8c8948d4ad0de5aaae2ab9705cccef8992d6abb', 0, '2024-03-02 11:13:42', '2024-03-02 11:13:42'),
(5, 'bilashkirtonia005@gmail.com', 'fc4ecee0e00aaff235d0022cfb2e40345668e6c0b56c1a4dbea9b5e3da846f43', 0, '2024-03-02 11:45:56', '2024-03-02 11:45:56'),
(6, 'bilashkirtonia005@gmail.com', '0908723783721df5467b144f1e512d41b30159d40535d2ca2dba8a0ebe95b3aa', 0, '2024-03-02 11:49:50', '2024-03-02 11:49:50'),
(7, 'bilashkirtonia005@gmail.com', '105a297ca2c9461177a61f6bd6b95140df4237372d8461c978dad3585bf76977', 0, '2024-03-02 11:52:36', '2024-03-02 11:52:36'),
(8, 'bilashkirtonia005@gmail.com', '45ac26cf65a16d79f66acd280d5edfdedc800ebf077b361c8c0a4724c962966b', 0, '2024-03-02 11:53:20', '2024-03-02 11:53:20'),
(9, 'bilashkirtonia005@gmail.com', '', 1, '2024-03-02 11:58:50', '2024-03-02 11:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text NOT NULL,
  `name` text NOT NULL,
  `designation` text NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `photo`, `name`, `designation`, `comment`, `created_at`, `updated_at`) VALUES
(3, '1709102723.jpg', 'Mr. Md. Mokammel Hossain', 'Chairman', 'Secretary\r\nMinistry of Civil Aviation & Tourism', NULL, '2024-02-28 00:45:23'),
(4, '1709102750.jpg', 'Hotel City International Residential', 'Director', 'Senior Secretary, IRD &  the\r\n\r\nChairman, National Board of Revenue\r\n\r\nMinistry of Finance', NULL, '2024-03-23 05:31:57'),
(5, '1709103297.jpg', 'Mr.  ‍Md. Jashim Uddin', 'Director', 'President\r\nFederation of Bangladesh Chamber of Commerce & Industries', NULL, '2024-02-28 00:54:57'),
(6, '1709103339.jpg', 'Mr. H. M. Hakim Ali', 'Director', 'President\r\nInternational Hotel Association of Bangladesh', NULL, '2024-02-28 00:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_id` text NOT NULL,
  `caption` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_id`, `caption`, `created_at`, `updated_at`) VALUES
(2, 'cmMiyZaSELo?si=p2QfLsYvo8W7ZITK', 'Enjoy your every single moments with us', NULL, '2024-02-28 01:19:35'),
(3, 'V8zXLMIjlcw?si=mUyRnHayVI8tJIx-', 'Enjoy your every single moments with us', NULL, NULL),
(4, 'XgdY_s1LsZc?si=4mI76Ek8Bl3pIPHi', 'Enjoy your every single moments with us', NULL, NULL),
(5, 'V056WNg3ECo?si=NaI3nve_HBtd64DH', 'Enjoy your every single moments with us', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_image`
--
ALTER TABLE `about_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booked_rooms`
--
ALTER TABLE `booked_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_photos`
--
ALTER TABLE `room_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_image`
--
ALTER TABLE `about_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `booked_rooms`
--
ALTER TABLE `booked_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `room_photos`
--
ALTER TABLE `room_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
