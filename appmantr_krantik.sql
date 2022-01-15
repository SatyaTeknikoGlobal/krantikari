-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 15, 2022 at 07:33 AM
-- Server version: 10.1.47-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appmantr_krantik`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias`
--

CREATE TABLE `ias` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(27) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(31) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `remember_token` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `provider` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `provider_id` varchar(28) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_addresses`
--

CREATE TABLE `ias_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `person_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pin_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_default` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_admin`
--

CREATE TABLE `ias_admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0' COMMENT '"0"=>SubAdmin,"1"=>Admin,"2"=>Faculties,"3"=>"accountant"',
  `faculties_id` bigint(20) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ias_admin`
--

INSERT INTO `ias_admin` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `is_admin`, `faculties_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Satya', 'satya@gmail.com', NULL, '$2a$12$ubMv2YbRPzNJi7hkEkaZ3OM0Q6115WCHWW8Et/3JwVZxTB89RBBx6', '123456790', 1, 0, NULL, NULL, '2021-09-28 02:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `ias_allocate_users`
--

CREATE TABLE `ias_allocate_users` (
  `id` int(11) NOT NULL,
  `board_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_app_sidebar`
--

CREATE TABLE `ias_app_sidebar` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `bar_id` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_app_versions`
--

CREATE TABLE `ias_app_versions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `android_cur` int(11) NOT NULL,
  `android_man` int(11) NOT NULL,
  `ios_cur` int(11) NOT NULL,
  `ios_man` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_assignment`
--

CREATE TABLE `ias_assignment` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subcourse_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `pdf` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_assignment_result`
--

CREATE TABLE `ias_assignment_result` (
  `id` int(11) NOT NULL,
  `assignment_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_authors`
--

CREATE TABLE `ias_authors` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_banners`
--

CREATE TABLE `ias_banners` (
  `id` int(11) NOT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timer_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timer_end_on` datetime DEFAULT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_batch_notification`
--

CREATE TABLE `ias_batch_notification` (
  `id` int(11) NOT NULL,
  `batch_id` varchar(255) DEFAULT NULL,
  `text` text,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_boards`
--

CREATE TABLE `ias_boards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `board_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `board_name_hindi` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `is_paid` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `subscription_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'admin@gmail.com',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_bookmark_master`
--

CREATE TABLE `ias_bookmark_master` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `pdf_id` varchar(255) DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `user_id` int(100) DEFAULT NULL,
  `quiz_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_books`
--

CREATE TABLE `ias_books` (
  `id` bigint(20) NOT NULL,
  `book_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int(11) NOT NULL DEFAULT '0',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_book_banners`
--

CREATE TABLE `ias_book_banners` (
  `id` int(11) NOT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_book_categories`
--

CREATE TABLE `ias_book_categories` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_carts`
--

CREATE TABLE `ias_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `product_id` bigint(20) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '0',
  `price` double(25,2) NOT NULL DEFAULT '0.00',
  `net_price` double(25,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_chapters`
--

CREATE TABLE `ias_chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `boards_id` bigint(20) NOT NULL DEFAULT '0',
  `class_id` bigint(20) NOT NULL DEFAULT '0',
  `subject_id` bigint(20) NOT NULL DEFAULT '0',
  `chapter_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapter_name_hindi` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_chats`
--

CREATE TABLE `ias_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `live_class_id` bigint(20) NOT NULL DEFAULT '0',
  `faculties_id` bigint(20) NOT NULL DEFAULT '0',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_chat_group`
--

CREATE TABLE `ias_chat_group` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_chat_users`
--

CREATE TABLE `ias_chat_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_block` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_cities`
--

CREATE TABLE `ias_cities` (
  `id` int(11) NOT NULL,
  `stateID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_contact_us`
--

CREATE TABLE `ias_contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_contents`
--

CREATE TABLE `ias_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `board_id` int(11) NOT NULL DEFAULT '0',
  `chapter_id` int(11) NOT NULL DEFAULT '0',
  `subject_id` bigint(20) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  `faculties_id` int(11) DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_hindi` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `hls` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hls_type` enum('vimeo','local','youtube') COLLATE utf8mb4_unicode_ci DEFAULT 'local',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_free` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `record_updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_corners`
--

CREATE TABLE `ias_corners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_coupons`
--

CREATE TABLE `ias_coupons` (
  `id` bigint(20) NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_cart_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_usage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_courses`
--

CREATE TABLE `ias_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_custom_filters`
--

CREATE TABLE `ias_custom_filters` (
  `id` int(11) NOT NULL,
  `filter_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_daily_goals`
--

CREATE TABLE `ias_daily_goals` (
  `id` int(11) NOT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_discussion_answers`
--

CREATE TABLE `ias_discussion_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `votes` int(11) NOT NULL DEFAULT '0',
  `status` enum('Y','N','S') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_discussion_topics`
--

CREATE TABLE `ias_discussion_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `answers` int(11) NOT NULL DEFAULT '0',
  `status` enum('Y','N','S') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_discussion_votes`
--

CREATE TABLE `ias_discussion_votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` bigint(20) NOT NULL,
  `answer_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `vote` enum('U','D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'U',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_donations`
--

CREATE TABLE `ias_donations` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_doubts`
--

CREATE TABLE `ias_doubts` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_type` varchar(255) DEFAULT NULL,
  `receiver_type` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_enquiry`
--

CREATE TABLE `ias_enquiry` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_events`
--

CREATE TABLE `ias_events` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `event_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `is_shown` varchar(255) NOT NULL DEFAULT 'N',
  `read_status` varchar(255) DEFAULT NULL,
  `notes` longtext,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_event_remainders`
--

CREATE TABLE `ias_event_remainders` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `event_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_exams`
--

CREATE TABLE `ias_exams` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '"1"=>"Test Series","2"=>"Mock Test","3"=>"Quiz"',
  `instruction` int(11) NOT NULL DEFAULT '0',
  `image` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `board_id` int(11) DEFAULT '1',
  `class_id` int(11) NOT NULL DEFAULT '10',
  `sub_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `topic_id` int(11) DEFAULT '1',
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_by` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_id` int(11) NOT NULL,
  `marks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `negetive_marks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `reward_mark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_exam_group`
--

CREATE TABLE `ias_exam_group` (
  `id` int(11) NOT NULL,
  `type_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_exam_question`
--

CREATE TABLE `ias_exam_question` (
  `id` bigint(20) NOT NULL,
  `exam_id` int(8) NOT NULL,
  `q_id` int(8) NOT NULL,
  `marks` decimal(4,2) NOT NULL,
  `negative_mark` decimal(4,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_exam_type`
--

CREATE TABLE `ias_exam_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_exam_type_chat`
--

CREATE TABLE `ias_exam_type_chat` (
  `id` int(11) NOT NULL,
  `type_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_faculties`
--

CREATE TABLE `ias_faculties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `total_exp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speciality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `college_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `college_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_failed_jobs`
--

CREATE TABLE `ias_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_faqs`
--

CREATE TABLE `ias_faqs` (
  `id` int(11) NOT NULL,
  `question` mediumtext COLLATE utf8mb4_unicode_ci,
  `answer` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_feedback_content`
--

CREATE TABLE `ias_feedback_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_feedback_course`
--

CREATE TABLE `ias_feedback_course` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_group_chat`
--

CREATE TABLE `ias_group_chat` (
  `id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_initiate_txn`
--

CREATE TABLE `ias_initiate_txn` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `topic_id` text NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `data` text NOT NULL,
  `currency` text NOT NULL,
  `amount` text NOT NULL,
  `gateway` varchar(255) NOT NULL DEFAULT 'razor',
  `status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_instamojo`
--

CREATE TABLE `ias_instamojo` (
  `id` int(11) NOT NULL,
  `instamojo_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `payload` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `webhook_response` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_instructions`
--

CREATE TABLE `ias_instructions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `h_content` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_jobs`
--

CREATE TABLE `ias_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_join_live_classes`
--

CREATE TABLE `ias_join_live_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `live_class_id` bigint(20) NOT NULL DEFAULT '0',
  `faculties_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_live_classes`
--

CREATE TABLE `ias_live_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faculties_id` bigint(20) NOT NULL DEFAULT '0',
  `course_id` bigint(20) NOT NULL DEFAULT '1',
  `subject_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topic_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passcode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `live_type` enum('zoom','youtube') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'youtube',
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_migrations`
--

CREATE TABLE `ias_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_new`
--

CREATE TABLE `ias_new` (
  `id` int(11) NOT NULL,
  `name` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_news_bookmark`
--

CREATE TABLE `ias_news_bookmark` (
  `id` int(11) NOT NULL,
  `news_id` varchar(255) DEFAULT NULL,
  `is_bookmark` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_news_feeds`
--

CREATE TABLE `ias_news_feeds` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext,
  `image` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `short_description` longtext,
  `link` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_notes`
--

CREATE TABLE `ias_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` bigint(20) NOT NULL DEFAULT '0',
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_notifications`
--

CREATE TABLE `ias_notifications` (
  `notificationID` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_send` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_notifications_scheduling`
--

CREATE TABLE `ias_notifications_scheduling` (
  `id` int(11) NOT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `batch_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext,
  `image` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_options`
--

CREATE TABLE `ias_options` (
  `id` int(11) NOT NULL,
  `q_id` int(8) NOT NULL,
  `option_h` text COLLATE utf8mb4_unicode_ci,
  `option_e` text COLLATE utf8mb4_unicode_ci,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_orders`
--

CREATE TABLE `ias_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `person_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_price` double(25,2) DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_disc` double(25,2) DEFAULT NULL,
  `delivery_charges` double(25,2) DEFAULT NULL,
  `txn_id` int(11) DEFAULT NULL,
  `grand_total` double(25,2) DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_prime`
--

CREATE TABLE `ias_prime` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `is_prime` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_prime_content`
--

CREATE TABLE `ias_prime_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_prime_course`
--

CREATE TABLE `ias_prime_course` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_promotional_video`
--

CREATE TABLE `ias_promotional_video` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `video_id` varchar(255) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `status` varchar(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_publishers`
--

CREATE TABLE `ias_publishers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_questions`
--

CREATE TABLE `ias_questions` (
  `id` int(11) NOT NULL,
  `h_question` longtext COLLATE utf8mb4_unicode_ci,
  `e_question` longtext COLLATE utf8mb4_unicode_ci,
  `image` mediumtext COLLATE utf8mb4_unicode_ci,
  `subject_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `boards` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `chapter` int(11) NOT NULL DEFAULT '0',
  `topic` int(8) NOT NULL DEFAULT '0',
  `time` int(5) DEFAULT NULL,
  `marks` int(11) NOT NULL DEFAULT '1',
  `create_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_by_id` int(11) DEFAULT NULL,
  `difficulty_level` tinyint(1) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_report_lists`
--

CREATE TABLE `ias_report_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `report_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_report_questions`
--

CREATE TABLE `ias_report_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `q_id` bigint(20) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `report` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_reset_device`
--

CREATE TABLE `ias_reset_device` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_results`
--

CREATE TABLE `ias_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT '0',
  `exam_id` bigint(20) DEFAULT '0',
  `exam_data` longtext COLLATE utf8mb4_unicode_ci,
  `subject_result` text COLLATE utf8mb4_unicode_ci,
  `subject_analysis` text COLLATE utf8mb4_unicode_ci,
  `total_question` bigint(20) DEFAULT '0',
  `correct_question` bigint(20) DEFAULT '0',
  `incorrect_question` bigint(20) DEFAULT '0',
  `skip_question` bigint(20) DEFAULT '0',
  `total_makrs` bigint(20) DEFAULT '0',
  `marks` bigint(20) DEFAULT '0',
  `time` bigint(20) DEFAULT '0',
  `rank` int(11) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_resumes`
--

CREATE TABLE `ias_resumes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_sessions`
--

CREATE TABLE `ias_sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_settings`
--

CREATE TABLE `ias_settings` (
  `id` bigint(20) NOT NULL,
  `referral_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `privacy` longtext COLLATE utf8mb4_unicode_ci,
  `terms` longtext COLLATE utf8mb4_unicode_ci,
  `about_us` text COLLATE utf8mb4_unicode_ci,
  `follow_us` text COLLATE utf8mb4_unicode_ci,
  `help_feed` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ias_settings`
--

INSERT INTO `ias_settings` (`id`, `referral_amount`, `privacy`, `terms`, `about_us`, `follow_us`, `help_feed`, `created_at`, `updated_at`) VALUES
(1, 10.00, 'fgh', 'fgh', 'dfg', 'dfg', 'dfg', '2022-01-13 13:33:33', '2022-01-13 13:33:33');

-- --------------------------------------------------------

--
-- Table structure for table `ias_slides`
--

CREATE TABLE `ias_slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slides` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_solutions`
--

CREATE TABLE `ias_solutions` (
  `id` int(11) NOT NULL,
  `q_id` int(8) NOT NULL,
  `e_solutions` text COLLATE utf8mb4_unicode_ci,
  `h_solutions` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admitted_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_states`
--

CREATE TABLE `ias_states` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_storages`
--

CREATE TABLE `ias_storages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Y','N','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_storage_push_job`
--

CREATE TABLE `ias_storage_push_job` (
  `id` int(11) NOT NULL,
  `storage_id` int(11) NOT NULL,
  `content_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_student_events`
--

CREATE TABLE `ias_student_events` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `sub_name` varchar(255) DEFAULT NULL,
  `chapter_name` varchar(255) DEFAULT NULL,
  `preference` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'N',
  `end_date` varchar(255) DEFAULT NULL,
  `strategy` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_student_subject`
--

CREATE TABLE `ias_student_subject` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_subjects`
--

CREATE TABLE `ias_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `board_id` bigint(20) NOT NULL DEFAULT '0',
  `class_id` bigint(20) NOT NULL DEFAULT '0',
  `faculties_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_hindi` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `about` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contents` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `batch_schedule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `more_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `world_record` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_record` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avg_rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mrp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_subscription_histories`
--

CREATE TABLE `ias_subscription_histories` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `board_id` varchar(255) DEFAULT NULL,
  `subject_id` varchar(255) DEFAULT NULL,
  `topic_id` varchar(255) DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `package_id` varchar(255) DEFAULT NULL,
  `subs_type` varchar(255) DEFAULT NULL,
  `subs_sub_type` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `paid_amount` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text,
  `subs_sub_type_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `new_amount` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_subscription_historiesnew`
--

CREATE TABLE `ias_subscription_historiesnew` (
  `user_id` varchar(255) DEFAULT NULL,
  `board_id` varchar(255) DEFAULT NULL,
  `subject_id` varchar(255) DEFAULT NULL,
  `topic_id` varchar(255) DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `package_id` varchar(255) DEFAULT NULL,
  `subs_type` varchar(255) DEFAULT NULL,
  `subs_sub_type` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `paid_amount` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text,
  `subs_sub_type_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `new_amount` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_subscription_histories_old`
--

CREATE TABLE `ias_subscription_histories_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `txn_id` bigint(20) DEFAULT '0',
  `package_id` bigint(20) DEFAULT '0',
  `board_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topic_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subs_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subs_sub_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `subs_sub_type_id` bigint(20) DEFAULT '0',
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `new_amount` double(25,2) NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double(25,2) NOT NULL DEFAULT '0.00',
  `paid_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_subscription_packages`
--

CREATE TABLE `ias_subscription_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` bigint(20) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `amount` double(25,2) NOT NULL DEFAULT '0.00',
  `new_amount` double(25,2) NOT NULL DEFAULT '0.00',
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_subscription_types`
--

CREATE TABLE `ias_subscription_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '100000.00',
  `new_amount` double(8,2) NOT NULL DEFAULT '180000.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_sub_topic`
--

CREATE TABLE `ias_sub_topic` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `topic_name` varchar(255) DEFAULT NULL,
  `status` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_teacher_logins`
--

CREATE TABLE `ias_teacher_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceToken` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_testimonials`
--

CREATE TABLE `ias_testimonials` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `status` int(100) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_topics`
--

CREATE TABLE `ias_topics` (
  `id` bigint(20) NOT NULL,
  `course_id` int(11) NOT NULL DEFAULT '0',
  `subject_id` int(11) NOT NULL DEFAULT '0',
  `chapter_id` int(8) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_hindi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify_text` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `subscription_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `hls` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `is_offer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `batch_status` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `batch_duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_limit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_topics_old`
--

CREATE TABLE `ias_topics_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `chapter_id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_transaction_histories`
--

CREATE TABLE `ias_transaction_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(25,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_users`
--

CREATE TABLE `ias_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_added` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_preparing` text COLLATE utf8mb4_unicode_ci,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_subscription` tinyint(1) NOT NULL DEFAULT '0',
  `yoga_mastry` tinyint(1) NOT NULL DEFAULT '0',
  `study_secrats` tinyint(1) NOT NULL DEFAULT '0',
  `stock_market` tinyint(1) NOT NULL DEFAULT '0',
  `vedic_maths` tinyint(1) NOT NULL DEFAULT '0',
  `is_english_buy` tinyint(1) NOT NULL DEFAULT '0',
  `video_editing` tinyint(1) NOT NULL DEFAULT '0',
  `memory_mastery` tinyint(1) NOT NULL DEFAULT '0',
  `app_subscription` tinyint(1) NOT NULL DEFAULT '0',
  `reffer_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yoga_mastry_txn_id` text COLLATE utf8mb4_unicode_ci,
  `study_secrats_txn_id` text COLLATE utf8mb4_unicode_ci,
  `stock_market_txn_id` text COLLATE utf8mb4_unicode_ci,
  `vedic_maths_trxn_id` text COLLATE utf8mb4_unicode_ci,
  `date_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `english_trxn_id` text COLLATE utf8mb4_unicode_ci,
  `state_id` int(11) NOT NULL DEFAULT '1',
  `studying_for` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_editing_trxn_id` text COLLATE utf8mb4_unicode_ci,
  `city_id` int(11) DEFAULT NULL,
  `referredBy` int(11) DEFAULT NULL,
  `memory_mastery_trxn_id` text COLLATE utf8mb4_unicode_ci,
  `whatsapp_given` tinyint(1) NOT NULL DEFAULT '0',
  `deviceid` text COLLATE utf8mb4_unicode_ci,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_enabled` int(11) NOT NULL DEFAULT '1',
  `school_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `board_id` int(11) DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `is_change` int(11) DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_users_old`
--

CREATE TABLE `ias_users_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `wallet` double DEFAULT '0',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_enabled` smallint(6) DEFAULT '1',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `school_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `board_id` int(11) DEFAULT '0',
  `class_id` int(11) DEFAULT '0',
  `state_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `referredBy` int(11) DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_user_classes`
--

CREATE TABLE `ias_user_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_user_logins`
--

CREATE TABLE `ias_user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_user_notes`
--

CREATE TABLE `ias_user_notes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_user_otps`
--

CREATE TABLE `ias_user_otps` (
  `id` int(11) NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_user_pattern`
--

CREATE TABLE `ias_user_pattern` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_user_settings`
--

CREATE TABLE `ias_user_settings` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `sound` int(11) NOT NULL DEFAULT '1',
  `vibration` int(11) NOT NULL DEFAULT '1',
  `dnd_from` varchar(255) DEFAULT NULL,
  `dnd_to` varchar(255) DEFAULT NULL,
  `dnd_status` int(11) NOT NULL DEFAULT '0',
  `date_format` varchar(255) DEFAULT NULL,
  `snooz_length` int(11) NOT NULL DEFAULT '10',
  `task_not_time` varchar(255) DEFAULT NULL,
  `task_not_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_user_wallets`
--

CREATE TABLE `ias_user_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `wallet` double(25,2) NOT NULL DEFAULT '0.00',
  `points` double(25,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_user_wallet_point_histories`
--

CREATE TABLE `ias_user_wallet_point_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `points` double(25,2) NOT NULL DEFAULT '0.00',
  `type` enum('CREDIT','DEBIT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CREDIT',
  `remarsks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_videos`
--

CREATE TABLE `ias_videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `converted_for_downloading_at` datetime DEFAULT NULL,
  `converted_for_streaming_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ias_video_rating`
--

CREATE TABLE `ias_video_rating` (
  `id` int(11) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `star` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ias_weekmonthpdf`
--

CREATE TABLE `ias_weekmonthpdf` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pdf` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `ntime` datetime DEFAULT NULL,
  `repeat` int(11) DEFAULT '1',
  `nloop` int(11) NOT NULL DEFAULT '1',
  `publish_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification_user`
--

CREATE TABLE `notification_user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ias_addresses`
--
ALTER TABLE `ias_addresses`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_admin`
--
ALTER TABLE `ias_admin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_allocate_users`
--
ALTER TABLE `ias_allocate_users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_app_sidebar`
--
ALTER TABLE `ias_app_sidebar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_app_versions`
--
ALTER TABLE `ias_app_versions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_assignment`
--
ALTER TABLE `ias_assignment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_assignment_result`
--
ALTER TABLE `ias_assignment_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_authors`
--
ALTER TABLE `ias_authors`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_banners`
--
ALTER TABLE `ias_banners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_batch_notification`
--
ALTER TABLE `ias_batch_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_boards`
--
ALTER TABLE `ias_boards`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_bookmark_master`
--
ALTER TABLE `ias_bookmark_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_books`
--
ALTER TABLE `ias_books`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_book_banners`
--
ALTER TABLE `ias_book_banners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_book_categories`
--
ALTER TABLE `ias_book_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_carts`
--
ALTER TABLE `ias_carts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_chapters`
--
ALTER TABLE `ias_chapters`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_chats`
--
ALTER TABLE `ias_chats`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_chat_group`
--
ALTER TABLE `ias_chat_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_chat_users`
--
ALTER TABLE `ias_chat_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_cities`
--
ALTER TABLE `ias_cities`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`),
  ADD KEY `name` (`name`(250));

--
-- Indexes for table `ias_contact_us`
--
ALTER TABLE `ias_contact_us`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_contents`
--
ALTER TABLE `ias_contents`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_corners`
--
ALTER TABLE `ias_corners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_coupons`
--
ALTER TABLE `ias_coupons`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_courses`
--
ALTER TABLE `ias_courses`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_custom_filters`
--
ALTER TABLE `ias_custom_filters`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_daily_goals`
--
ALTER TABLE `ias_daily_goals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`id`);

--
-- Indexes for table `ias_discussion_answers`
--
ALTER TABLE `ias_discussion_answers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_discussion_topics`
--
ALTER TABLE `ias_discussion_topics`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_discussion_votes`
--
ALTER TABLE `ias_discussion_votes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_donations`
--
ALTER TABLE `ias_donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_doubts`
--
ALTER TABLE `ias_doubts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_enquiry`
--
ALTER TABLE `ias_enquiry`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_events`
--
ALTER TABLE `ias_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_event_remainders`
--
ALTER TABLE `ias_event_remainders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_exams`
--
ALTER TABLE `ias_exams`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_exam_group`
--
ALTER TABLE `ias_exam_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_exam_question`
--
ALTER TABLE `ias_exam_question`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_exam_type`
--
ALTER TABLE `ias_exam_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_exam_type_chat`
--
ALTER TABLE `ias_exam_type_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_faculties`
--
ALTER TABLE `ias_faculties`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_failed_jobs`
--
ALTER TABLE `ias_failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_faqs`
--
ALTER TABLE `ias_faqs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_feedback_content`
--
ALTER TABLE `ias_feedback_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_feedback_course`
--
ALTER TABLE `ias_feedback_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_group_chat`
--
ALTER TABLE `ias_group_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_initiate_txn`
--
ALTER TABLE `ias_initiate_txn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_instamojo`
--
ALTER TABLE `ias_instamojo`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_instructions`
--
ALTER TABLE `ias_instructions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_jobs`
--
ALTER TABLE `ias_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_join_live_classes`
--
ALTER TABLE `ias_join_live_classes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_live_classes`
--
ALTER TABLE `ias_live_classes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_migrations`
--
ALTER TABLE `ias_migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_new`
--
ALTER TABLE `ias_new`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_news_bookmark`
--
ALTER TABLE `ias_news_bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_news_feeds`
--
ALTER TABLE `ias_news_feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_notes`
--
ALTER TABLE `ias_notes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_notifications`
--
ALTER TABLE `ias_notifications`
  ADD PRIMARY KEY (`notificationID`);

--
-- Indexes for table `ias_notifications_scheduling`
--
ALTER TABLE `ias_notifications_scheduling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_options`
--
ALTER TABLE `ias_options`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_orders`
--
ALTER TABLE `ias_orders`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_prime`
--
ALTER TABLE `ias_prime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ias_prime_content`
--
ALTER TABLE `ias_prime_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_prime_course`
--
ALTER TABLE `ias_prime_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_promotional_video`
--
ALTER TABLE `ias_promotional_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_publishers`
--
ALTER TABLE `ias_publishers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_questions`
--
ALTER TABLE `ias_questions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_report_lists`
--
ALTER TABLE `ias_report_lists`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_report_questions`
--
ALTER TABLE `ias_report_questions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_reset_device`
--
ALTER TABLE `ias_reset_device`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_results`
--
ALTER TABLE `ias_results`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_resumes`
--
ALTER TABLE `ias_resumes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_settings`
--
ALTER TABLE `ias_settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ias_solutions`
--
ALTER TABLE `ias_solutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_states`
--
ALTER TABLE `ias_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `name` (`name`(250));

--
-- Indexes for table `ias_storage_push_job`
--
ALTER TABLE `ias_storage_push_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_student_events`
--
ALTER TABLE `ias_student_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_student_subject`
--
ALTER TABLE `ias_student_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_subjects`
--
ALTER TABLE `ias_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ias_subjects` (`id`,`title`(191));

--
-- Indexes for table `ias_subscription_histories`
--
ALTER TABLE `ias_subscription_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ias_subscription_histories` (`id`,`board_id`,`topic_id`,`subject_id`);

--
-- Indexes for table `ias_subscription_histories_old`
--
ALTER TABLE `ias_subscription_histories_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_subscription_packages`
--
ALTER TABLE `ias_subscription_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_subscription_types`
--
ALTER TABLE `ias_subscription_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_sub_topic`
--
ALTER TABLE `ias_sub_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_testimonials`
--
ALTER TABLE `ias_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_topics`
--
ALTER TABLE `ias_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ias_topics` (`id`,`name`(191));

--
-- Indexes for table `ias_transaction_histories`
--
ALTER TABLE `ias_transaction_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_users`
--
ALTER TABLE `ias_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `id` (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `name` (`name`),
  ADD KEY `phone` (`phone`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `ias_users_old`
--
ALTER TABLE `ias_users_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_user_logins`
--
ALTER TABLE `ias_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_user_notes`
--
ALTER TABLE `ias_user_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_user_otps`
--
ALTER TABLE `ias_user_otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_user_pattern`
--
ALTER TABLE `ias_user_pattern`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_user_settings`
--
ALTER TABLE `ias_user_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_user_wallets`
--
ALTER TABLE `ias_user_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_video_rating`
--
ALTER TABLE `ias_video_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ias_weekmonthpdf`
--
ALTER TABLE `ias_weekmonthpdf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_user`
--
ALTER TABLE `notification_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ias_admin`
--
ALTER TABLE `ias_admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ias_allocate_users`
--
ALTER TABLE `ias_allocate_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_app_sidebar`
--
ALTER TABLE `ias_app_sidebar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_assignment`
--
ALTER TABLE `ias_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_assignment_result`
--
ALTER TABLE `ias_assignment_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_banners`
--
ALTER TABLE `ias_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_batch_notification`
--
ALTER TABLE `ias_batch_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_boards`
--
ALTER TABLE `ias_boards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_bookmark_master`
--
ALTER TABLE `ias_bookmark_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_books`
--
ALTER TABLE `ias_books`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_book_categories`
--
ALTER TABLE `ias_book_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_chapters`
--
ALTER TABLE `ias_chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_chat_group`
--
ALTER TABLE `ias_chat_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_chat_users`
--
ALTER TABLE `ias_chat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_contents`
--
ALTER TABLE `ias_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_corners`
--
ALTER TABLE `ias_corners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_daily_goals`
--
ALTER TABLE `ias_daily_goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_donations`
--
ALTER TABLE `ias_donations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_doubts`
--
ALTER TABLE `ias_doubts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_events`
--
ALTER TABLE `ias_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_event_remainders`
--
ALTER TABLE `ias_event_remainders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_exams`
--
ALTER TABLE `ias_exams`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_exam_group`
--
ALTER TABLE `ias_exam_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_exam_question`
--
ALTER TABLE `ias_exam_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_exam_type`
--
ALTER TABLE `ias_exam_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_exam_type_chat`
--
ALTER TABLE `ias_exam_type_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_faculties`
--
ALTER TABLE `ias_faculties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_faqs`
--
ALTER TABLE `ias_faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_feedback_content`
--
ALTER TABLE `ias_feedback_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_feedback_course`
--
ALTER TABLE `ias_feedback_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_group_chat`
--
ALTER TABLE `ias_group_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_initiate_txn`
--
ALTER TABLE `ias_initiate_txn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_instructions`
--
ALTER TABLE `ias_instructions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_jobs`
--
ALTER TABLE `ias_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_live_classes`
--
ALTER TABLE `ias_live_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_new`
--
ALTER TABLE `ias_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_news_bookmark`
--
ALTER TABLE `ias_news_bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_news_feeds`
--
ALTER TABLE `ias_news_feeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_notes`
--
ALTER TABLE `ias_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_notifications`
--
ALTER TABLE `ias_notifications`
  MODIFY `notificationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_notifications_scheduling`
--
ALTER TABLE `ias_notifications_scheduling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_options`
--
ALTER TABLE `ias_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_prime`
--
ALTER TABLE `ias_prime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_prime_content`
--
ALTER TABLE `ias_prime_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_prime_course`
--
ALTER TABLE `ias_prime_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_promotional_video`
--
ALTER TABLE `ias_promotional_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_questions`
--
ALTER TABLE `ias_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_reset_device`
--
ALTER TABLE `ias_reset_device`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_results`
--
ALTER TABLE `ias_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_resumes`
--
ALTER TABLE `ias_resumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_settings`
--
ALTER TABLE `ias_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ias_solutions`
--
ALTER TABLE `ias_solutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_states`
--
ALTER TABLE `ias_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_storage_push_job`
--
ALTER TABLE `ias_storage_push_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_student_events`
--
ALTER TABLE `ias_student_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_student_subject`
--
ALTER TABLE `ias_student_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_subjects`
--
ALTER TABLE `ias_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_subscription_histories`
--
ALTER TABLE `ias_subscription_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_subscription_histories_old`
--
ALTER TABLE `ias_subscription_histories_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_subscription_packages`
--
ALTER TABLE `ias_subscription_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_subscription_types`
--
ALTER TABLE `ias_subscription_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_sub_topic`
--
ALTER TABLE `ias_sub_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_testimonials`
--
ALTER TABLE `ias_testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_topics`
--
ALTER TABLE `ias_topics`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_transaction_histories`
--
ALTER TABLE `ias_transaction_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_users`
--
ALTER TABLE `ias_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_users_old`
--
ALTER TABLE `ias_users_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_user_logins`
--
ALTER TABLE `ias_user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_user_notes`
--
ALTER TABLE `ias_user_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_user_otps`
--
ALTER TABLE `ias_user_otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_user_pattern`
--
ALTER TABLE `ias_user_pattern`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_user_settings`
--
ALTER TABLE `ias_user_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_user_wallets`
--
ALTER TABLE `ias_user_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_video_rating`
--
ALTER TABLE `ias_video_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ias_weekmonthpdf`
--
ALTER TABLE `ias_weekmonthpdf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_user`
--
ALTER TABLE `notification_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
