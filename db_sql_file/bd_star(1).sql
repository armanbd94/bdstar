-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 17, 2021 at 10:09 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_star`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjustment_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `item` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `total_tax` double NOT NULL,
  `grand_total` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adjustment_products`
--

CREATE TABLE `adjustment_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjustment_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `base_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `base_unit_qty` double NOT NULL,
  `base_unit_price` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowance_deductions`
--

CREATE TABLE `allowance_deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Alowance, 2=Deduction, 3=Others',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowance_deduction_manages`
--

CREATE TABLE `allowance_deduction_manages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `allowance_deduction_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=Alowance, 2=Deduction, 3=Others',
  `basic_salary` double NOT NULL,
  `percentage` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asms`
--

CREATE TABLE `asms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `nid_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_target_value` double DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asms`
--

INSERT INTO `asms` (`id`, `name`, `username`, `phone`, `email`, `avatar`, `password`, `district_id`, `address`, `nid_no`, `monthly_target_value`, `status`, `created_by`, `modified_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mohammad Arman', NULL, '01680950265', 'mohammadarman456789@gmail.com', NULL, '', 1, '2102/B Ayesha Manson, Panwala Para, Chittagong.', NULL, 500000, '1', 'Super Admin', 'Super Admin', NULL, '2021-10-11 06:41:15', '2021-10-11 07:54:12');

-- --------------------------------------------------------

--
-- Table structure for table `asm_module`
--

CREATE TABLE `asm_module` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `asm_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asm_permission`
--

CREATE TABLE `asm_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `asm_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `employee_route_id` int(11) DEFAULT NULL,
  `wallet_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `am_pm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_str` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_str_am_pm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `bank_name`, `account_name`, `account_number`, `warehouse_id`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(2, 'City Bank', 'BD Star', '6486456456465', 1, '1', 'Super Admin', NULL, '2021-10-11 10:13:24', '2021-10-11 10:13:24'),
(3, 'Dutch Bangla Bank Ltd.', 'BD Star', '46846465456', 1, '1', 'Super Admin', NULL, '2021-10-11 10:17:54', '2021-10-11 10:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('bd_star_cache_active_departments', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:0:{}}', 1949824804),
('bd_star_cache_active_designations', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:0:{}}', 1949824814),
('bd_star_cache_active_divisions', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:0:{}}', 1949824814),
('bd_star_cache_active_shifts', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:0:{}}', 1949824811),
('bd_star_cache_banks', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:2:{i:0;O:8:\"stdClass\":10:{s:2:\"id\";i:2;s:9:\"bank_name\";s:9:\"City Bank\";s:12:\"account_name\";s:7:\"BD Star\";s:14:\"account_number\";s:13:\"6486456456465\";s:12:\"warehouse_id\";i:1;s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2021-10-11 16:13:24\";s:10:\"updated_at\";s:19:\"2021-10-11 16:13:24\";}i:1;O:8:\"stdClass\":10:{s:2:\"id\";i:3;s:9:\"bank_name\";s:22:\"Dutch Bangla Bank Ltd.\";s:12:\"account_name\";s:7:\"BD Star\";s:14:\"account_number\";s:11:\"46846465456\";s:12:\"warehouse_id\";i:1;s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2021-10-11 16:17:54\";s:10:\"updated_at\";s:19:\"2021-10-11 16:17:54\";}}}', 1949824920);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Material Category, 2=Product Category',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Liquid', '1', '1', 'Super Admin', NULL, '2021-09-14 11:57:21', '2021-09-14 11:57:21'),
(2, 'Element', '1', '1', 'Super Admin', NULL, '2021-09-14 11:57:30', '2021-09-14 11:57:30'),
(3, 'Powder', '1', '1', 'Super Admin', NULL, '2021-09-14 11:57:37', '2021-09-14 11:57:37'),
(4, 'Can', '1', '1', 'Super Admin', NULL, '2021-09-14 11:57:51', '2021-09-14 11:57:51'),
(5, 'Paper', '1', '1', 'Super Admin', NULL, '2021-09-14 11:57:56', '2021-09-14 11:57:56'),
(6, 'Foil', '1', '1', 'Super Admin', NULL, '2021-09-14 11:58:04', '2021-09-14 11:58:04'),
(7, 'Powder', '2', '1', 'Super Admin', NULL, '2021-09-14 15:19:30', '2021-09-14 15:19:30'),
(8, 'Liquid', '2', '1', 'Super Admin', NULL, '2021-09-14 15:19:36', '2021-09-14 15:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `type` enum('A','L','I','E') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A=Asset, L=Liabilty, I=income, E=Expense',
  `transaction` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `general_ledger` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `salesmen_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `mobile_bank_id` int(11) DEFAULT NULL,
  `budget` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `depreciation` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `code`, `name`, `parent_name`, `level`, `type`, `transaction`, `general_ledger`, `customer_id`, `supplier_id`, `salesmen_id`, `bank_id`, `mobile_bank_id`, `budget`, `depreciation`, `depreciation_rate`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '1', 'Assets', 'COA', 0, 'A', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(2, '2', 'Equity', 'COA', 0, 'L', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(3, '3', 'Income', 'COA', 0, 'I', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(4, '4', 'Expense', 'COA', 0, 'E', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(5, '5', 'Liabilities', 'COA', 0, 'L', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(6, '101', 'Non Current Asset', 'Assets', 1, 'A', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(7, '102', 'Current Asset', 'Assets', 1, 'A', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(8, '301', 'Product Sale', 'Income', 1, 'I', '1', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(9, '302', 'Service Income', 'Income', 1, 'I', '1', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(10, '401', 'Default Expense', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, '1', '1', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(11, '402', 'Material Purchase', 'Expense', 1, 'E', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(12, '403', 'Employee Salary', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(13, '404', 'Machine Purchase', 'Expense', 1, 'E', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(14, '405', 'Maintenance Service', 'Expense', 1, 'E', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(15, '501', 'Non Current Liabilities', 'Liabilities', 1, 'L', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(16, '502', 'Current Liabilities', 'Liabilities', 1, 'L', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(17, '10101', 'Inventory', 'Non Current Asset', 2, 'A', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(18, '10201', 'Cash & Cash Equivalent', 'Current Asset', 2, 'A', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(19, '10202', 'Account Receivable', 'Current Asset', 2, 'A', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(20, '50201', 'Account Payable', 'Current Liabilities', 2, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(21, '50202', 'Employee Ledger', 'Current Liabilities', 2, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(22, '50203', 'Tax', 'Current Liabilities', 2, 'L', '2', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(23, '1020101', 'Cash In Hand', 'Cash & Cash Equivalent', 3, 'A', '1', '2', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(24, '1020102', 'Cash At Bank', 'Cash & Cash Equivalent', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(25, '1020103', 'Cash At Mobile Bank', 'Cash & Cash Equivalent', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(26, '1020201', 'Customer Receivable', 'Account Receivable', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(27, '1020202', 'Loan Receivable', 'Account Receivable', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-02 23:14:59', '2021-04-02 23:14:59'),
(40, '50101', 'Loans', 'Non Current Liabilities', 2, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-09-13 05:17:53', '2021-09-13 05:17:53'),
(41, '50204', 'Loans & Overdrafts', 'Current Liabilities', 2, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-09-13 05:18:27', '2021-09-13 05:18:27'),
(42, '5010101', 'Loan Payable Long Term', 'Loans', 3, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-09-13 05:19:20', '2021-09-13 05:19:20'),
(43, '5020401', 'Loan Payable Short Term', 'Loans & Overdrafts', 3, 'L', '2', '1', NULL, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-09-13 05:19:55', '2021-09-13 05:19:55'),
(71, '5020101', '1-Mohammad Arman', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 1, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-10-11 07:56:35', '2021-10-11 07:56:35'),
(72, '5020102', '2-Md. Shahed', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 2, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-10-11 09:42:17', '2021-10-11 09:42:17'),
(73, '5020103', '1-Mr. Ahmed', 'Account Payable', 3, 'L', '1', '2', NULL, 1, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-10-11 10:09:30', '2021-10-11 10:09:30'),
(74, '5020104', '2-Mr. Akkas', 'Account Payable', 3, 'L', '1', '2', NULL, 2, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-10-11 10:09:57', '2021-10-11 10:09:57'),
(75, '10202010001', '1-Mr. Sojol', 'Customer Receivable', 4, 'A', '1', '2', 1, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-10-11 10:11:03', '2021-10-11 10:11:03'),
(76, '10202010002', '2-Mr. Sajib', 'Customer Receivable', 4, 'A', '1', '2', 2, NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-10-11 10:11:50', '2021-10-11 10:11:50'),
(77, '102010202', 'City Bank', 'Cash At Bank', 4, 'A', '1', '2', NULL, NULL, NULL, 2, NULL, '2', '2', 0, '1', 'Super Admin', 'Super Admin', '2021-10-11 10:12:43', '2021-10-11 10:13:24'),
(78, '102010301', 'Bkash', 'Cash At Mobile Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, 1, '2', '2', 0, '1', 'Super Admin', NULL, '2021-10-11 10:14:00', '2021-10-11 10:14:00'),
(79, '102010203', 'Dutch Bangla Bank Ltd.', 'Cash At Bank', 4, 'A', '1', '2', NULL, NULL, NULL, 3, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2021-10-11 10:17:54', '2021-10-11 10:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `upazila_id` bigint(20) UNSIGNED NOT NULL,
  `route_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `shop_name`, `mobile`, `email`, `avatar`, `customer_group_id`, `district_id`, `upazila_id`, `route_id`, `area_id`, `address`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Sojol', 'SJ', '01521225982', NULL, NULL, 1, 1, 70, 573, 583, 'Lorem Ipsum Dollar', '1', 'Super Admin', NULL, '2021-10-11 10:11:03', '2021-10-11 10:11:03'),
(2, 'Mr. Sajib', 'SJ', '01521225986', NULL, NULL, 1, 1, 70, 573, 583, 'zxdcfvghb', '1', 'Super Admin', NULL, '2021-10-11 10:11:50', '2021-10-11 10:11:50');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double(8,2) DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `group_name`, `percentage`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Regular', 0.00, '1', 'Super Admin', NULL, '2021-09-14 14:30:18', '2021-09-14 14:30:18');

-- --------------------------------------------------------

--
-- Table structure for table `daily_closings`
--

CREATE TABLE `daily_closings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `last_day_closing` double DEFAULT NULL,
  `cash_in` double DEFAULT NULL,
  `cash_out` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `transfer` double DEFAULT NULL,
  `closing_amount` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  `date` date NOT NULL,
  `thousands` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `five_hundred` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hundred` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fifty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `twenty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `five` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `two` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `one` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `damage_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_price` double NOT NULL,
  `total_deduction` double DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `deducted_sr_commission` double(10,2) DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `damage_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `damage_products`
--

CREATE TABLE `damage_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `damage_id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `damage_qty` double NOT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_rate` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photograph` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holiday` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance_type` int(11) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finger_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shift_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `job_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Permanent,2=Probation,3=Resigned,4=Suspended',
  `duty_type` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Full Time,2=Part Time,3=Contractual,4=Other',
  `joining_designation_id` bigint(20) UNSIGNED NOT NULL,
  `current_designation_id` bigint(20) UNSIGNED NOT NULL,
  `joining_date` date DEFAULT NULL,
  `probation_start` date DEFAULT NULL,
  `probation_end` date DEFAULT NULL,
  `contract_start` date DEFAULT NULL,
  `contract_end` date DEFAULT NULL,
  `confirmation_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `termination_reason` text COLLATE utf8mb4_unicode_ci,
  `rate_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Hourly,2=Salary',
  `rate` double NOT NULL,
  `joining_rate` double DEFAULT NULL,
  `overtime` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Allowed,2=Not Allowed',
  `pay_freequency` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Weekly,2=Biweekly,3=Monthly,4=Annual',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supervisor_id` int(10) UNSIGNED DEFAULT NULL,
  `is_supervisor` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Yes,2=No',
  `father_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Male,2=Female,3=Other',
  `marital_status` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Single,2=Married,3=Divorced,4=Widowed,5=Other',
  `blood_group` enum('1','2','3','4','5','6','7','8') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=A+,2=B+,3=A-,4=B-,5=AB+,6=AB-,7=O+,8=O-',
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_status` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Resident,2=Non-Resident',
  `emergency_contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_education`
--

CREATE TABLE `employee_education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institute` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_professional_information`
--

CREATE TABLE `employee_professional_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `responsibility` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_routes`
--

CREATE TABLE `employee_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `expense_item_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `payment_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Bank,3=Mobile',
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_items`
--

CREATE TABLE `expense_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `holiday_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Weekly, 2=Public',
  `holiday_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Holiday, 2=General, 3=Others',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) DEFAULT NULL,
  `leave_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Unpaid, 2=Paid',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_application_manages`
--

CREATE TABLE `leave_application_manages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `alternative_employee` int(11) DEFAULT NULL,
  `number_leave` int(11) DEFAULT NULL,
  `leave_type` int(11) DEFAULT NULL,
  `employee_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submission` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pre, 2=Post',
  `leave_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Accepted, 3=Cancel',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `adjust_amount` double DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_adjusted_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_changed_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjusted_date` date DEFAULT NULL,
  `loan_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Personal,2=Official',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Cash,2=Cheque,3=Mobile',
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `loan_status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Complete,2=Pending',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Active,2=InActive',
  `approve` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT '2' COMMENT '1=approve\r\n2=not approve',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_installments`
--

CREATE TABLE `loan_installments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `installment_amount` double DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_changed_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installment_date` date DEFAULT NULL,
  `month_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Personal,2=Official',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Cash,2=Cheque,3=Mobile',
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Active,2=InActive',
  `approve` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_people`
--

CREATE TABLE `loan_people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `loan_term_type` set('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Short Term, 2= Long Term',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Active,2=InActive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `grand_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `grand_grand_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=District, 2=Upazila, 3=Route,4=Area',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `parent_id`, `grand_parent_id`, `grand_grand_parent_id`, `type`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(2, 'Faridpur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(3, 'Gazipur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(4, 'Gopalganj', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(5, 'Jamalpur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(6, 'Kishoreganj', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(7, 'Madaripur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(8, 'Manikganj', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(9, 'Munshiganj', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(10, 'Mymensingh', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(11, 'Narayanganj', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(12, 'Narsingdi', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(13, 'Netrokona', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(14, 'Rajbari', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(15, 'Shariatpur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(16, 'Sherpur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(17, 'Tangail', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(18, 'Bogra', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(19, 'Joypurhat', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(20, 'Naogaon', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(21, 'Natore', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(22, 'Nawabganj', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(23, 'Pabna', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(24, 'Rajshahi', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(25, 'Sirajgonj', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(26, 'Dinajpur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(27, 'Gaibandha', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(28, 'Kurigram', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(29, 'Lalmonirhat', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(30, 'Nilphamari', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(31, 'Panchagarh', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(32, 'Rangpur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(33, 'Thakurgaon', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(34, 'Barguna', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(35, 'Barisal', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(36, 'Bhola', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(37, 'Jhalokati', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(38, 'Patuakhali', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(39, 'Pirojpur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(40, 'Bandarban', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(41, 'Brahmanbaria', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(42, 'Chandpur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(43, 'Chittagong', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(44, 'Comilla', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(45, 'Cox\'s Bazar', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(46, 'Feni', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(47, 'Khagrachari', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(48, 'Lakshmipur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(49, 'Noakhali', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(50, 'Rangamati', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(51, 'Habiganj', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(52, 'Maulvibazar', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(53, 'Sunamganj', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(54, 'Sylhet', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(55, 'Bagerhat', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(56, 'Chuadanga', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(57, 'Jessore', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(58, 'Jhenaidah', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(59, 'Khulna', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(60, 'Kushtia', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(61, 'Magura', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(62, 'Meherpur', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(63, 'Narail', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(64, 'Satkhira', 0, NULL, NULL, '1', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(65, 'Gulsan 1', 1, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(66, 'Dhamrai Upazila', 1, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(67, 'Dohar Upazila', 1, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(68, 'Keraniganj Upazila', 1, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(69, 'Nawabganj Upazila', 1, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(70, 'Savar Upazila', 1, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(71, 'Charbhadrasan Upazila', 2, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(72, 'Sadarpur Upazila', 2, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(73, 'Shaltha Upazila', 2, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(74, 'Nagarkanda Upazila', 2, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(75, 'Bhanga Upazila', 2, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(76, 'Madhukhali Upazila', 2, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(77, 'Alfadanga Upazila', 2, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(78, 'Boalmari Upazila', 2, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(79, 'Faridpur Sadar Upazila', 2, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(80, 'Tongi', 3, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(81, 'Kaliganj', 3, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(82, 'Sripur', 3, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(83, 'Kapasia', 3, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(84, 'Kaliakior', 3, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(85, 'Gazipur Sadar-Joydebpur', 3, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(86, 'Kotalipara Upazila', 4, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(87, 'Tungipara Upazila', 4, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(88, 'Muksudpur Upazila', 4, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(89, 'Kashiani Upazila', 4, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(90, 'Gopalganj Sadar Upazila', 4, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(91, 'Sarishabari Upazila', 5, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(92, 'Melandaha Upazila', 5, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(93, 'Narundi Police I.C', 5, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(94, 'Madarganj Upazila', 5, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(95, 'Jamalpur Sadar Upazila', 5, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(96, 'Islampur Upazila', 5, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(97, 'Baksiganj Upazila', 5, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(98, 'Dewanganj Upazila', 5, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(99, 'Tarail Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(100, 'Pakundia Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(101, 'Nikli Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(102, 'Mithamain Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(103, 'Kuliarchar Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(104, 'Kishoreganj Sadar Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(105, 'Karimganj Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(106, 'Itna Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(107, 'Astagram Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(108, 'Bajitpur Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(109, 'Hossainpur Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(110, 'Bhairab Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(111, 'Katiadi Upazila', 6, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(112, 'Kalkini', 7, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(113, 'Rajoir', 7, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(114, 'Madaripur Sadar', 7, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(115, 'Shibchar', 7, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(116, 'Harirampur Upazila', 8, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(117, 'Manikganj Sadar Upazila', 8, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(118, 'Daulatpur Upazila', 8, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(119, 'Ghior Upazila', 8, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(120, 'Singair Upazila', 8, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(121, 'Shibalaya Upazila', 8, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(122, 'Saturia Upazila', 8, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(123, 'Tongibari Upazila', 9, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(124, 'Sirajdikhan Upazila', 9, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(125, 'Munshiganj Sadar Upazila', 9, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(126, 'Sreenagar Upazila', 9, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(127, 'Gazaria Upazila', 9, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(128, 'Lohajang Upazila', 9, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(129, 'Nandail', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(130, 'Phulpur', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(131, 'Mymensingh Sadar', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(132, 'Ishwarganj', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(133, 'Gauripur', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(134, 'Gaffargaon', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(135, 'Fulbaria', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(136, 'Dhobaura', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(137, 'Trishal', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(138, 'Haluaghat', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(139, 'Bhaluka', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(140, 'Muktagachha', 10, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(141, 'Rupganj Upazila', 11, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(142, 'Naryanganj Sadar Upazila', 11, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(143, 'Bandar', 11, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(144, 'Sonargaon Upazila', 11, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(145, 'Araihazar Upazila', 11, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(146, 'Siddirgonj Upazila', 11, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(147, 'Shibpur Upazila', 12, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(148, 'Raipura Upazila, Narsingdi', 12, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(149, 'Palash Upazila', 12, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(150, 'Narsingdi Sadar Upazila', 12, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(151, 'Monohardi Upazila', 12, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(152, 'Belabo Upazila', 12, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(153, 'Khaliajuri Upazilla', 13, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(154, 'Purbadhala Upazilla', 13, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(155, 'Netrakona-S Upazilla', 13, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(156, 'Mohanganj Upazilla', 13, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(157, 'Madan Upazilla', 13, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(158, 'Kalmakanda Upazilla', 13, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(159, 'Durgapur Upazilla', 13, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(160, 'Barhatta Upazilla', 13, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(161, 'Atpara Upazilla', 13, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(162, 'Kendua Upazilla', 13, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(163, 'Rajbari Sadar Upazila', 14, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(164, 'Kalukhali Upazila', 14, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(165, 'Pangsha Upazila', 14, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(166, 'Goalandaghat Upazila', 14, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(167, 'Baliakandi Upazila', 14, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(168, 'Gosairhat Upazila', 15, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(169, 'Bhedarganj Upazila', 15, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(170, 'Jajira Upazila', 15, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(171, 'Damudya Upazila', 15, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(172, 'Shariatpur Sadar -Palong', 15, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(173, 'Naria Upazila', 15, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(174, 'Sreebardi Upazila', 16, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(175, 'Sherpur Sadar Upazila', 16, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(176, 'Nalitabari Upazila', 16, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(177, 'Nakla Upazila', 16, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(178, 'Jhenaigati Upazila', 16, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(179, 'Tangail Sadar Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(180, 'Sakhipur Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(181, 'Basail Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(182, 'Madhupur Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(183, 'Ghatail Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(184, 'Kalihati Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(185, 'Dhanbari Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(186, 'Bhuapur Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(187, 'Delduar Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(188, 'Gopalpur Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(189, 'Mirzapur Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(190, 'Nagarpur Upazila', 17, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(191, 'Sonatala', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(192, 'Shibganj', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(193, 'Sariakandi', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(194, 'Sahajanpur', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(195, 'Nandigram', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(196, 'Kahaloo', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(197, 'Adamdighi', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(198, 'Gabtali', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(199, 'Dhupchanchia', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(200, 'Dhunat', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(201, 'Bogra Sadar', 18, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(202, 'Panchbibi', 19, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(203, 'Khetlal', 19, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(204, 'Kalai', 19, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(205, 'Joypurhat S', 19, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(206, 'Akkelpur', 19, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(207, 'Patnitala Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(208, 'Dhamoirhat Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(209, 'Sapahar Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(210, 'Porsha Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(211, 'Badalgachhi Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(212, 'Atrai Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(213, 'Niamatpur Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(214, 'Raninagar Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(215, 'Manda Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(216, 'Mohadevpur Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(217, 'Naogaon Sadar Upazila', 20, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(218, 'Baraigram Upazila', 21, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(219, 'Natore Sadar Upazila', 21, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(220, 'Lalpur Upazila', 21, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(221, 'Bagatipara Upazila', 21, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(222, 'Shibganj Upazila', 22, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(223, 'Nawabganj Sadar Upazila', 22, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(224, 'Nachole Upazila', 22, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(225, 'Gomastapur Upazila', 22, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(226, 'Bholahat Upazila', 22, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(227, 'Sujanagar Upazila', 23, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(228, 'Santhia Upazila', 23, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(229, 'Pabna Sadar Upazila', 23, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(230, 'Ishwardi Upazila', 23, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(231, 'Faridpur Upazila', 23, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(232, 'Chatmohar Upazila', 23, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(233, 'Bhangura Upazila', 23, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(234, 'Bera Upazila', 23, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(235, 'Atgharia Upazila', 23, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(236, 'Godagari', 24, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(237, 'Tanore', 24, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(238, 'Puthia', 24, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(239, 'Paba', 24, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(240, 'Mohanpur', 24, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(241, 'Durgapur', 24, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(242, 'Charghat', 24, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(243, 'Bagmara', 24, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(244, 'Bagha', 24, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(245, 'Chauhali Upazila', 25, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(246, 'Ullahpara Upazila', 25, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(247, 'Tarash Upazila', 25, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(248, 'Shahjadpur Upazila', 25, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(249, 'Raiganj Upazila', 25, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(250, 'Kazipur Upazila', 25, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(251, 'Kamarkhanda Upazila', 25, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(252, 'Belkuchi Upazila', 25, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(253, 'Sirajganj Sadar Upazila', 25, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(254, 'Hakimpur Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(255, 'Kaharole Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(256, 'Khansama Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(257, 'Dinajpur Sadar Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(258, 'Nawabganj', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(259, 'Parbatipur Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(260, 'Ghoraghat Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(261, 'Phulbari Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(262, 'Chirirbandar Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(263, 'Bochaganj Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(264, 'Biral Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(265, 'Birganj', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(266, 'Birampur Upazila', 26, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(267, 'Sadullapur', 27, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(268, 'Saghata', 27, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(269, 'Sundarganj', 27, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(270, 'Palashbari', 27, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(271, 'Gaibandha sadar', 27, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(272, 'Fulchhari', 27, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(273, 'Gobindaganj', 27, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(274, 'Char Rajibpur', 28, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(275, 'Rowmari', 28, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(276, 'Chilmari', 28, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(277, 'Ulipur', 28, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(278, 'Rajarhat', 28, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(279, 'Phulbari', 28, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(280, 'Bhurungamari', 28, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(281, 'Nageshwari', 28, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(282, 'Kurigram Sadar', 28, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(283, 'Patgram', 29, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(284, 'Hatibandha', 29, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(285, 'Kaliganj', 29, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(286, 'Aditmari', 29, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(287, 'Lalmanirhat Sadar', 29, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(288, 'Dimla', 30, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(289, 'Domar', 30, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(290, 'Kishoreganj', 30, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(291, 'Jaldhaka', 30, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(292, 'Saidpur', 30, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(293, 'Nilphamari Sadar', 30, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(294, 'Panchagarh Sadar', 31, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(295, 'Debiganj', 31, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(296, 'Boda', 31, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(297, 'Atwari', 31, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(298, 'Tetulia', 31, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(299, 'Kaunia', 32, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(300, 'Badarganj', 32, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(301, 'Mithapukur', 32, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(302, 'Gangachara', 32, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(303, 'Rangpur Sadar', 32, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(304, 'Pirgachha', 32, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(305, 'Pirganj', 32, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(306, 'Taraganj', 32, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(307, 'Baliadangi Upazila', 33, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(308, 'Thakurgaon Sadar Upazila', 33, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(309, 'Pirganj Upazila', 33, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(310, 'Haripur Upazila', 33, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(311, 'Ranisankail Upazila', 33, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(312, 'Patharghata Upazila', 34, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(313, 'Betagi Upazila', 34, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(314, 'Barguna Sadar Upazila', 34, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(315, 'Bamna Upazila', 34, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(316, 'Taltali Upazila', 34, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(317, 'Amtali Upazila', 34, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(318, 'Gaurnadi Upazila', 35, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(319, 'Banaripara Upazila', 35, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(320, 'Hizla Upazila', 35, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(321, 'Mehendiganj Upazila', 35, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(322, 'Wazirpur Upazila', 35, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(323, 'Bakerganj Upazila', 35, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(324, 'Barisal Sadar Upazila', 35, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(325, 'Babuganj Upazila', 35, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(326, 'Muladi Upazila', 35, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(327, 'Agailjhara Upazila', 35, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(328, 'Daulatkhan Upazila', 36, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(329, 'Tazumuddin Upazila', 36, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(330, 'Manpura Upazila', 36, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(331, 'Lalmohan Upazila', 36, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(332, 'Char Fasson Upazila', 36, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(333, 'Burhanuddin Upazila', 36, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(334, 'Bhola Sadar Upazila', 36, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(335, 'Nalchity Upazila', 37, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(336, 'Rajapur Upazila', 37, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(337, 'Jhalokati Sadar Upazila', 37, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(338, 'Kathalia Upazila', 37, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(339, 'Mirzaganj Upazila', 38, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(340, 'Patuakhali Sadar Upazila', 38, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(341, 'Rangabali Upazila', 38, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(342, 'Dumki Upazila', 38, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(343, 'Kalapara Upazila', 38, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(344, 'Galachipa Upazila', 38, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(345, 'Dashmina Upazila', 38, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(346, 'Bauphal Upazila', 38, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(347, 'Zianagar', 39, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(348, 'Pirojpur Sadar', 39, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(349, 'Nazirpur', 39, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(350, 'Mathbaria', 39, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(351, 'Kaukhali', 39, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(352, 'Bhandaria', 39, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(353, 'Nesarabad', 39, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(354, 'Rowangchhari', 40, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(355, 'Ruma', 40, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(356, 'Ali kadam', 40, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(357, 'Naikhongchhari', 40, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(358, 'Lama', 40, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(359, 'Thanchi', 40, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(360, 'Bandarban Sadar', 40, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(361, 'Bancharampur Upazila', 41, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(362, 'Bijoynagar Upazila', 41, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(363, 'Ashuganj Upazila', 41, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(364, 'Akhaura Upazila', 41, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(365, 'Kasba Upazila', 41, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(366, 'Shahbazpur Town', 41, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(367, 'Sarail Upazila', 41, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(368, 'Nabinagar Upazila', 41, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(369, 'Nasirnagar Upazila', 41, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(370, 'Brahmanbaria Sadar Upazila', 41, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(371, 'Shahrasti', 42, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(372, 'Matlab Dakkhin', 42, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(373, 'Matlab Uttar', 42, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(374, 'Kachua', 42, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(375, 'Haziganj', 42, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(376, 'Faridganj', 42, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(377, 'Chandpur Sadar', 42, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(378, 'Haimchar', 42, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(379, 'Patiya Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(380, 'Rangunia Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(381, 'Raozan Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(382, 'Sandwip Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(383, 'Satkania Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(384, 'Sitakunda Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(385, 'Mirsharai Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(386, 'Lohagara Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(387, 'Hathazari Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(388, 'Fatikchhari Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(389, 'Chandanaish Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(390, 'Khulshi', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(391, 'Banshkhali Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(392, 'Anwara Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(393, 'Panchlaish', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(394, 'Boalkhali Upazila', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(395, 'Chittagong Port', 43, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(396, 'Chauddagram Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(397, 'Monohorgonj Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(398, 'Laksam Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(399, 'Comilla Sadar Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(400, 'Homna Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(401, 'Debidwar Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(402, 'Daudkandi Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(403, 'Chandina Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(404, 'Burichong Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(405, 'Brahmanpara Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(406, 'Barura Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(407, 'Meghna Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(408, 'Nangalkot Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(409, 'Comilla Sadar South Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(410, 'Titas Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(411, 'Muradnagar Upazila', 44, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(412, 'Kutubdia Upazila', 45, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(413, 'Pekua Upazila', 45, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(414, 'Ukhia Upazila', 45, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(415, 'Teknaf Upazila', 45, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(416, 'Ramu Upazila', 45, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(417, 'Maheshkhali Upazila', 45, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(418, 'Cox\'s Bazar Sadar Upazila', 45, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(419, 'Chakaria Upazila', 45, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(420, 'Sonagazi', 46, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(421, 'Fhulgazi', 46, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(422, 'Parshuram', 46, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(423, 'Chagalnaiya', 46, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(424, 'Feni Sadar', 46, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(425, 'Daganbhuiyan', 46, NULL, NULL, '2', '1', 'Super Admin', 'Mohammad Arman', '2021-01-27 21:58:52', '2021-08-16 03:18:26'),
(426, 'Dighinala Upazila', 47, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(427, 'Ramgarh Upazila', 47, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(428, 'Panchhari Upazila', 47, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(429, 'Matiranga Upazila', 47, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(430, 'Mahalchhari Upazila', 47, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(431, 'Lakshmichhari Upazila', 47, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(432, 'Khagrachhari Upazila', 47, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(433, 'Manikchhari Upazila', 47, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(434, 'Lakshmipur Sadar Upazila', 48, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(435, 'Komol Nagar Upazila', 48, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(436, 'Ramgati Upazila', 48, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(437, 'Raipur Upazila', 48, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(438, 'Ramganj Upazila', 48, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(439, 'Chatkhil Upazila', 49, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(440, 'Begumganj Upazila', 49, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(441, 'Noakhali Sadar Upazila', 49, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(442, 'Shenbag Upazila', 49, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(443, 'Hatia Upazila', 49, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(444, 'Kobirhat Upazila', 49, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(445, 'Sonaimuri Upazila', 49, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(446, 'Suborno Char Upazila', 49, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(447, 'Companyganj Upazila', 49, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(448, 'Bagaichhari Upazila', 50, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(449, 'Kaptai Upazila', 50, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(450, 'Langadu Upazila', 50, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(451, 'Nannerchar Upazila', 50, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(452, 'Kaukhali Upazila', 50, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(453, 'Rajasthali Upazila', 50, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(454, 'Juraichhari Upazila', 50, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(455, 'Barkal Upazila', 50, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(456, 'Rangamati Sadar Upazila', 50, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(457, 'Belaichhari Upazila', 50, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(458, 'Nabiganj', 51, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(459, 'Madhabpur', 51, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(460, 'Lakhai', 51, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(461, 'Habiganj Sadar', 51, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(462, 'Chunarughat', 51, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(463, 'Shaistagonj Upazila', 51, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(464, 'Bahubal', 51, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(465, 'Ajmiriganj', 51, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(466, 'Baniachang', 51, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(467, 'Sreemangal', 52, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(468, 'Rajnagar', 52, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(469, 'Kulaura', 52, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(470, 'Kamalganj', 52, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(471, 'Barlekha', 52, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(472, 'Moulvibazar Sadar', 52, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(473, 'Juri', 52, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(474, 'Sulla', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(475, 'Jamalganj', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(476, 'Tahirpur', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(477, 'Jagannathpur', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(478, 'Dowarabazar', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(479, 'Dharampasha', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(480, 'Derai', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(481, 'Chhatak', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(482, 'Bishwamvarpur', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(483, 'Shanthiganj', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(484, 'Sunamganj Sadar', 53, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(485, 'Sylhet Sadar', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(486, 'Beanibazar', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(487, 'Bishwanath', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(488, 'Balaganj', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(489, 'Companiganj', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(490, 'Golapganj', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(491, 'Gowainghat', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(492, 'Jaintiapur', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(493, 'Kanaighat', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(494, 'Fenchuganj', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(495, 'Zakiganj', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(496, 'Nobigonj', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(497, 'Dakshin Surma Upazila', 54, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(498, 'Chitalmari Upazila', 55, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(499, 'Bagerhat Sadar Upazila', 55, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(500, 'Fakirhat Upazila', 55, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(501, 'Kachua Upazila', 55, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(502, 'Mollahat Upazila', 55, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(503, 'Mongla Upazila', 55, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(504, 'Morrelganj Upazila', 55, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(505, 'Rampal Upazila', 55, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(506, 'Sarankhola Upazila', 55, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(507, 'Chuadanga-S Upazila', 56, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(508, 'Jibannagar Upazila', 56, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL);
INSERT INTO `locations` (`id`, `name`, `parent_id`, `grand_parent_id`, `grand_grand_parent_id`, `type`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(509, 'Alamdanga Upazila', 56, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(510, 'Damurhuda Upazila', 56, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(511, 'Manirampur Upazila', 57, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(512, 'Sharsha Upazila', 57, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(513, 'Jhikargachha Upazila', 57, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(514, 'Chaugachha Upazila', 57, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(515, 'Abhaynagar Upazila', 57, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(516, 'Jessore Sadar Upazila', 57, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(517, 'Bagherpara Upazila', 57, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(518, 'Keshabpur Upazila', 57, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(519, 'Harinakunda Upazila', 58, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(520, 'Shailkupa Upazila', 58, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(521, 'Kotchandpur Upazila', 58, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(522, 'Kaliganj Upazila', 58, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(523, 'Maheshpur Upazila', 58, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(524, 'Jhenaidah Sadar Upazila', 58, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(525, 'Batiaghata Upazila', 59, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(526, 'Dacope Upazila', 59, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(527, 'Dumuria Upazila', 59, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(528, 'Dighalia Upazila', 59, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(529, 'Koyra Upazila', 59, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(530, 'Paikgachha Upazila', 59, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(531, 'Rupsa Upazila', 59, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(532, 'Phultala Upazila', 59, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(533, 'Terokhada Upazila', 59, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(534, 'Mirpur', 60, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(535, 'Daulatpur', 60, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(536, 'Bheramara', 60, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(537, 'Khoksa', 60, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(538, 'Kumarkhali', 60, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(539, 'Kushtia Sadar', 60, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(540, 'Sreepur Upazila', 61, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(541, 'Magura Sadar Upazila', 61, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(542, 'Mohammadpur Upazila', 61, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(543, 'Shalikha Upazila', 61, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(544, 'Meherpur-S Upazila', 62, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(545, 'angni Upazila', 62, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(546, 'Mujib Nagar Upazila', 62, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(547, 'Kalia Upazilla', 63, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(548, 'Narail-S Upazilla', 63, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(549, 'Lohagara Upazilla', 63, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(550, 'Shyamnagar Upazila', 64, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(551, 'Kaliganj Upazila', 64, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(552, 'Kalaroa Upazila', 64, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(553, 'Tala Upazila', 64, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(554, 'Debhata Upazila', 64, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(555, 'Satkhira Sadar Upazila', 64, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(556, 'Assasuni Upazila', 64, NULL, NULL, '2', '1', 'Super Admin', NULL, '2021-01-27 21:58:52', NULL),
(560, 'Yakubpur', 425, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 16:51:02', '2021-01-29 16:51:02'),
(561, 'Jailashkara', 425, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 16:51:35', '2021-01-29 16:51:35'),
(562, 'Daganbhuiyan', 425, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 16:51:58', '2021-01-29 16:51:58'),
(564, 'Mathu Bhuiyan', 425, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 16:52:54', '2021-01-29 16:52:54'),
(565, 'Rajapur', 425, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 16:53:19', '2021-01-29 16:53:19'),
(566, 'Sindurpur', 425, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 16:53:39', '2021-01-29 16:53:39'),
(567, 'Amjadhat', 421, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 17:04:37', '2021-01-29 17:04:37'),
(568, 'Anandapur', 421, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 17:04:54', '2021-01-29 17:04:54'),
(569, 'Darbarpur', 421, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 17:05:09', '2021-01-29 17:05:09'),
(570, 'Fulgazi', 421, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 17:05:23', '2021-01-29 17:05:23'),
(571, 'G.M. Hat', 421, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 17:05:37', '2021-01-29 17:05:37'),
(572, 'Munshirhat', 421, 46, NULL, '3', '1', 'Super Admin', NULL, '2021-01-29 17:05:54', '2021-02-01 22:11:59'),
(573, 'Shimuliya', 70, 1, NULL, '3', '1', 'Mr. XYZ', NULL, '2021-02-09 17:13:50', '2021-02-09 17:13:50'),
(574, 'Dhamshona', 70, 1, NULL, '3', '1', 'Mr. XYZ', NULL, '2021-02-09 17:14:07', '2021-02-09 17:14:07'),
(575, 'Pataliya', 70, 1, NULL, '3', '1', 'Mr. XYZ', NULL, '2021-02-09 17:14:22', '2021-02-09 17:14:22'),
(576, 'Biruliya', 70, 1, NULL, '3', '1', 'Mr. XYZ', NULL, '2021-02-09 17:14:36', '2021-02-09 17:14:36'),
(577, 'Savar', 70, 1, NULL, '3', '1', 'Mr. XYZ', NULL, '2021-02-09 17:14:50', '2021-02-09 17:14:50'),
(578, 'Tetulzhora', 70, 1, NULL, '3', '1', 'Mr. XYZ', NULL, '2021-02-09 17:15:09', '2021-02-09 17:15:09'),
(581, 'Darbesher Hat', 566, 425, 46, '4', '1', 'Super Admin', NULL, '2021-07-13 22:26:51', '2021-07-13 22:26:51'),
(582, 'Olatoli Bazar', 566, 425, 46, '4', '1', 'Super Admin', NULL, '2021-07-13 22:27:29', '2021-07-13 22:27:29'),
(583, 'Area One', 573, 70, 1, '4', '1', 'Super Admin', NULL, '2021-09-22 04:42:12', '2021-09-22 04:42:12');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `material_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_unit_id` bigint(20) UNSIGNED NOT NULL,
  `cost` double DEFAULT NULL,
  `old_cost` double(10,2) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `alert_qty` double DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_method` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Exclusive,2=Inclusive',
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Raw,2=Packaging',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `has_opening_stock` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Yes, 2=No',
  `opening_stock_qty` double DEFAULT NULL,
  `opening_cost` double DEFAULT NULL,
  `opening_warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `material_name`, `material_code`, `category_id`, `unit_id`, `purchase_unit_id`, `cost`, `old_cost`, `qty`, `alert_qty`, `tax_id`, `tax_method`, `type`, `status`, `has_opening_stock`, `opening_stock_qty`, `opening_cost`, `opening_warehouse_id`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Turmeric Seed', '40150237', 3, 2, 2, 210, 0.00, 90, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2021-10-11 10:07:31', '2021-10-11 14:50:28'),
(2, 'Corrugated Box', '24511607', 5, 1, 1, 24, 0.00, 90, 0, NULL, '1', '2', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2021-10-11 10:08:14', '2021-10-11 14:50:28'),
(3, 'Pump Oil', '91090687', 1, 9, 9, 0, NULL, NULL, 0, NULL, '1', '1', '1', '2', NULL, 0, NULL, 'Super Admin', NULL, '2021-10-11 12:11:29', '2021-10-11 12:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `material_purchase`
--

CREATE TABLE `material_purchase` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `received` double NOT NULL,
  `purchase_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `net_unit_cost` double NOT NULL,
  `new_unit_cost` double(10,2) DEFAULT NULL,
  `old_cost` double DEFAULT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `labor_cost` double DEFAULT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `material_purchase`
--

INSERT INTO `material_purchase` (`id`, `purchase_id`, `material_id`, `qty`, `received`, `purchase_unit_id`, `net_unit_cost`, `new_unit_cost`, `old_cost`, `discount`, `tax_rate`, `tax`, `labor_cost`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 100, 100, 2, 180, 210.00, 0, 0, 0, 0, 1000, 19000, '2021-10-11 11:19:11', '2021-10-11 12:37:08'),
(2, 2, 2, 100, 100, 1, 20, 24.00, 0, 0, 0, 0, 200, 2200, '2021-10-11 11:20:10', '2021-10-11 12:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_name`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 'Admin Sidebar Menu', '1', '2021-03-26 17:49:24', '2021-07-16 19:07:49'),
(2, 'ASM Sidebar Menu', '1', '2021-07-16 19:07:13', '2021-07-16 19:07:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_11_09_121424_create_roles_table', 1),
(4, '2020_11_09_121426_create_users_table', 1),
(5, '2020_11_09_121433_create_menus_table', 1),
(6, '2020_11_09_121444_create_modules_table', 1),
(7, '2020_11_09_121457_create_permissions_table', 1),
(8, '2020_11_09_121707_class_module_role_table', 1),
(9, '2020_11_09_121724_class_permission_role_table', 1),
(10, '2020_11_09_121842_create_settings_table', 1),
(11, '2020_11_11_114846_create_sessions_table', 1),
(12, '2020_11_11_115012_create_cache_table', 1),
(13, '2020_11_14_070601_create_categories_table', 1),
(14, '2020_11_15_082501_create_units_table', 1),
(15, '2020_11_16_112644_create_taxes_table', 1),
(16, '2020_11_16_112645_create_locations_table', 1),
(17, '2020_11_16_112652_create_asms_table', 1),
(18, '2020_11_17_101058_create_warehouses_table', 1),
(19, '2020_11_17_101065_create_customer_groups_table', 1),
(20, '2021_11_17_102900_create_suppliers_table', 1),
(21, '2020_11_18_121707_class_asm_module_table', 2),
(22, '2020_11_18_121724_class_asm_permission_table', 2),
(25, '2020_12_27_043903_create_salesmen_table', 3),
(26, '2021_01_28_090833_create_sales_men_daily_routes_table', 3),
(29, '2021_03_28_032515_create_materials_table', 4),
(30, '2021_03_28_033220_create_warehouse_material_table', 4),
(40, '2020_11_19_081237_create_products_table', 5),
(41, '2020_11_19_081255_create_product_material_table', 5),
(42, '2020_11_19_081265_create_warehouse_product_table', 6),
(49, '2021_08_03_153419_create_productions_table', 7),
(50, '2021_08_03_153516_create_production_products_table', 7),
(53, '2021_08_03_153525_create_production_product_materials_table', 8),
(54, '2021_03_26_063920_create_customers_table', 9),
(55, '2021_03_27_111921_create_chart_of_accounts_table', 10),
(56, '2021_03_27_111946_create_transactions_table', 10),
(58, '2020_11_18_131359_create_purchases_table', 11),
(59, '2020_11_19_054144_create_material_purchase_table', 11),
(60, '2021_02_06_081548_create_purchase_payments_table', 11),
(61, '2020_11_19_081427_create_adjustments_table', 12),
(62, '2020_11_19_081454_create_adjustment_products_table', 12),
(63, '2021_08_03_153541_create_production_coupons_table', 13),
(64, '2021_08_12_011143_create_transfers_table', 14),
(65, '2021_08_12_011156_create_transfer_products_table', 14),
(66, '2021_02_03_094656_create_received_coupons_table', 15),
(67, '2021_03_30_115339_create_sales_table', 16),
(68, '2021_03_30_115349_create_sale_products_table', 16),
(69, '2021_04_01_033716_create_expense_items_table', 17),
(70, '2021_04_01_033719_create_expenses_table', 17),
(73, '2021_03_28_045127_create_banks_table', 18),
(74, '2021_03_28_045148_create_mobile_banks_table', 19),
(75, '2021_06_19_141703_create_purchase_returns_table', 20),
(76, '2021_06_19_141731_create_purchase_return_materials_table', 20),
(77, '2021_06_19_141741_create_sale_returns_table', 20),
(78, '2021_06_19_141758_create_sale_return_products_table', 20),
(79, '2021_03_27_112248_create_daily_closings_table', 21),
(80, '2014_10_12_100000_create_password_resets_table', 21),
(81, '2021_03_06_114840_create_departments_table', 21),
(82, '2020_11_16_112645_create_locations_table', 21),
(83, '2020_11_16_112652_create_asms_table', 21),
(84, '2020_11_17_101058_create_warehouses_table', 21),
(85, '2014_10_12_100000_create_password_resets_table', 21),
(87, '2021_10_05_141516_create_damages_table', 22),
(88, '2021_10_05_141527_create_damage_products_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_banks`
--

CREATE TABLE `mobile_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_banks`
--

INSERT INTO `mobile_banks` (`id`, `bank_name`, `account_name`, `account_number`, `warehouse_id`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Bkash', 'BD Star', '01521225982', 1, '1', 'Super Admin', NULL, '2021-10-11 10:14:00', '2021-10-11 10:14:00');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=divider,2=module',
  `module_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `divider_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `target` enum('_self','_blank') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `menu_id`, `type`, `module_name`, `divider_title`, `icon_class`, `url`, `order`, `parent_id`, `target`, `created_at`, `updated_at`) VALUES
(1, 1, '2', 'Dashboard', NULL, 'fas fa-tachometer-alt', '/', 1, NULL, NULL, NULL, '2021-10-06 08:17:42'),
(2, 1, '1', NULL, 'Menus', NULL, NULL, 2, NULL, NULL, NULL, '2021-10-06 08:17:42'),
(3, 1, '1', NULL, 'Access Control', NULL, NULL, 20, NULL, NULL, NULL, '2021-10-06 08:17:42'),
(4, 1, '2', 'User', NULL, 'fas fa-users', 'user', 21, NULL, NULL, NULL, '2021-10-06 08:17:42'),
(5, 1, '2', 'Role', NULL, 'fas fa-user-tag', 'role', 22, NULL, NULL, NULL, '2021-10-06 08:17:42'),
(6, 1, '1', NULL, 'System', NULL, NULL, 25, NULL, NULL, NULL, '2021-10-06 08:17:42'),
(7, 1, '2', 'Setting', NULL, 'fas fa-cogs', NULL, 26, NULL, NULL, NULL, '2021-10-06 08:17:42'),
(8, 1, '2', 'Menu', NULL, 'fas fa-th-list', 'menu', 27, NULL, NULL, NULL, '2021-10-06 08:17:42'),
(9, 1, '2', 'Permission', NULL, 'fas fa-tasks', 'menu/module/permission', 28, NULL, NULL, NULL, '2021-10-06 08:17:42'),
(10, 1, '2', 'General Setting', NULL, NULL, 'setting', 1, 7, NULL, '2021-03-26 18:01:48', '2021-03-26 18:06:29'),
(11, 1, '2', 'Warehouse', NULL, NULL, 'warehouse', 2, 7, NULL, '2021-03-26 18:07:10', '2021-10-11 05:42:35'),
(12, 1, '2', 'Customer Group', NULL, NULL, 'customer-group', 3, 7, NULL, '2021-03-26 18:07:41', '2021-03-26 18:08:14'),
(13, 1, '2', 'Unit', NULL, NULL, 'unit', 4, 7, NULL, '2021-03-26 18:07:54', '2021-06-05 21:48:54'),
(14, 1, '2', 'Tax', NULL, NULL, 'tax', 5, 7, NULL, '2021-03-26 18:08:03', '2021-07-12 19:59:29'),
(15, 1, '2', 'Material', NULL, 'fas fa-toolbox', NULL, 3, NULL, NULL, '2021-07-13 04:20:56', '2021-10-06 08:17:42'),
(16, 1, '2', 'Category', NULL, NULL, 'material/category', 1, 15, '_self', '2021-07-13 04:21:32', '2021-07-13 04:42:48'),
(17, 1, '2', 'Manage Material', NULL, NULL, 'material', 2, 15, NULL, '2021-07-13 04:22:22', '2021-07-13 04:42:54'),
(18, 1, '2', 'Material Stock Report', NULL, NULL, 'material-stock-report', 3, 15, NULL, '2021-07-13 04:41:53', '2021-07-13 04:42:58'),
(20, 1, '2', 'Purchase', NULL, 'fas fa-cart-arrow-down', NULL, 4, NULL, NULL, '2021-07-13 04:45:27', '2021-10-06 08:17:42'),
(21, 1, '2', 'Add Purchase', NULL, NULL, 'purchase/add', 1, 20, NULL, '2021-07-13 04:46:05', '2021-07-13 04:46:35'),
(22, 1, '2', 'Manage Purchase', NULL, NULL, 'purchase', 2, 20, NULL, '2021-07-13 04:46:31', '2021-07-13 04:46:44'),
(23, 1, '2', 'Product', NULL, 'fas fa-box', NULL, 5, NULL, NULL, '2021-07-13 04:49:30', '2021-10-06 08:17:42'),
(24, 1, '2', 'Category', NULL, NULL, 'product/category', 1, 23, NULL, '2021-07-13 04:50:00', '2021-07-13 04:52:42'),
(25, 1, '2', 'Add Product', NULL, NULL, 'product/add', 2, 23, NULL, '2021-07-13 04:50:23', '2021-08-14 04:30:42'),
(26, 1, '2', 'Manage Product', NULL, NULL, 'product', 3, 23, NULL, '2021-07-13 04:51:10', '2021-10-04 04:00:53'),
(28, 1, '2', 'Print Barcode', NULL, NULL, 'print-barcode', 4, 23, NULL, '2021-07-13 04:53:40', '2021-10-04 04:00:53'),
(29, 1, '2', 'Add Adjustment', NULL, NULL, 'adjustment/add', 5, 23, NULL, '2021-07-13 04:54:21', '2021-10-04 04:00:53'),
(30, 1, '2', 'Manage Adjustment', NULL, NULL, 'adjustment', 6, 23, NULL, '2021-07-13 04:55:23', '2021-10-04 04:00:53'),
(31, 1, '2', 'Product Stock Report', NULL, NULL, 'product-stock-report', 7, 23, NULL, '2021-07-13 04:57:37', '2021-10-04 04:00:53'),
(33, 1, '2', 'Production', NULL, 'fas fa-industry', NULL, 6, NULL, NULL, '2021-07-13 05:47:47', '2021-10-06 08:17:42'),
(34, 1, '2', 'Add Production', NULL, NULL, 'production/add', 1, 33, NULL, '2021-07-13 05:48:09', '2021-07-13 05:49:41'),
(35, 1, '2', 'Manage Production', NULL, NULL, 'production', 2, 33, NULL, '2021-07-13 05:48:34', '2021-07-13 05:49:47'),
(41, 1, '2', 'Customer', NULL, 'far fa-handshake', NULL, 9, NULL, '_self', '2021-07-13 05:58:05', '2021-10-06 08:17:42'),
(42, 1, '2', 'Manage Customer', NULL, NULL, 'customer', 1, 41, NULL, '2021-07-13 05:59:22', '2021-07-13 06:01:37'),
(43, 1, '2', 'Customer Ledger', NULL, NULL, 'customer-ledger', 2, 41, NULL, '2021-07-13 05:59:47', '2021-07-13 06:01:37'),
(44, 1, '2', 'Credit Customer', NULL, NULL, 'credit-customer', 3, 41, NULL, '2021-07-13 06:00:15', '2021-07-13 06:01:40'),
(45, 1, '2', 'Paid Customer', NULL, NULL, 'paid-customer', 4, 41, NULL, '2021-07-13 06:00:44', '2021-07-13 06:01:43'),
(46, 1, '2', 'Customer Advance', NULL, NULL, 'customer-advance', 5, 41, NULL, '2021-07-13 06:01:22', '2021-07-13 06:01:47'),
(47, 1, '2', 'Supplier', NULL, 'fas fa-user-tie', NULL, 10, NULL, NULL, '2021-07-13 06:02:42', '2021-10-06 08:17:42'),
(48, 1, '2', 'Manage Supplier', NULL, NULL, 'supplier', 1, 47, NULL, '2021-07-13 06:03:11', '2021-07-13 06:04:20'),
(49, 1, '2', 'Supplier Ledger', NULL, NULL, 'supplier-ledger', 2, 47, NULL, '2021-07-13 06:03:44', '2021-07-13 06:04:37'),
(50, 1, '2', 'Supplier Advance', NULL, NULL, 'supplier-advance', 3, 47, NULL, '2021-07-13 06:04:13', '2021-07-13 06:04:37'),
(51, 1, '2', 'Stock Return', NULL, 'fas fa-undo-alt', NULL, 11, NULL, NULL, '2021-07-13 06:14:46', '2021-10-06 08:17:42'),
(52, 1, '2', 'Return', NULL, NULL, 'return', 1, 51, '_self', '2021-07-13 06:15:33', '2021-09-23 04:37:04'),
(53, 1, '2', 'Purchase Return', NULL, NULL, 'purchase-return', 2, 51, NULL, '2021-07-13 06:16:14', '2021-09-23 04:37:15'),
(55, 1, '2', 'Manage ASM', NULL, 'fas fa-user-shield', 'assistant-sales-manager', 23, NULL, '_self', '2021-07-13 06:22:38', '2021-10-06 08:17:42'),
(56, 1, '2', 'Manage SR', NULL, 'fas fa-user-secret', 'sales-representative', 1, 243, '_self', '2021-07-13 06:25:04', '2021-10-04 04:00:19'),
(57, 1, '2', 'Location', NULL, 'fas fa-map-marker-alt', NULL, 19, NULL, NULL, '2021-07-13 06:56:46', '2021-10-06 08:17:42'),
(58, 1, '2', 'Manage District', NULL, NULL, 'district', 1, 57, '_self', '2021-07-13 06:57:29', '2021-07-13 06:58:53'),
(59, 1, '2', 'Manage Upazila', NULL, NULL, 'upazila', 2, 57, NULL, '2021-07-13 06:57:58', '2021-07-13 06:58:57'),
(60, 1, '2', 'Manage Route', NULL, NULL, 'route', 3, 57, NULL, '2021-07-13 06:58:27', '2021-07-13 06:59:00'),
(61, 1, '2', 'Manage Area', NULL, NULL, 'area', 4, 57, NULL, '2021-07-13 06:58:48', '2021-07-13 06:59:04'),
(62, 1, '2', 'Bank', NULL, 'fas fa-university', NULL, 16, NULL, NULL, '2021-07-13 08:16:58', '2021-10-06 08:17:42'),
(63, 1, '2', 'Manage Bank', NULL, NULL, 'bank', 1, 62, NULL, '2021-07-13 08:17:23', '2021-07-13 08:18:19'),
(64, 1, '2', 'Bank Transaction', NULL, NULL, 'bank-transaction', 2, 62, NULL, '2021-07-13 08:17:50', '2021-07-13 08:18:23'),
(65, 1, '2', 'Bank Ledger', NULL, NULL, 'bank-ledger', 3, 62, NULL, '2021-07-13 08:18:15', '2021-07-13 08:18:27'),
(66, 1, '2', 'Mobile Bank', NULL, 'fas fa-mobile-alt', NULL, 17, NULL, NULL, '2021-07-13 08:19:07', '2021-10-06 08:17:42'),
(67, 1, '2', 'Manage Mobile Bank', NULL, NULL, 'mobile-bank', 1, 66, NULL, '2021-07-13 08:19:31', '2021-07-13 08:20:41'),
(68, 1, '2', 'Mobile Bank Transaction', NULL, NULL, 'mobile-bank-transaction', 2, 66, NULL, '2021-07-13 08:20:10', '2021-09-06 04:19:26'),
(69, 1, '2', 'Mobile Bank Ledger', NULL, NULL, 'mobile-bank-ledger', 3, 66, NULL, '2021-07-13 08:20:37', '2021-09-06 04:19:54'),
(70, 1, '2', 'Expense', NULL, 'fas fa-money-check-alt', NULL, 15, NULL, NULL, '2021-07-13 09:00:55', '2021-10-06 08:17:42'),
(71, 1, '2', 'Manage Expense Item', NULL, NULL, 'expense-item', 1, 70, NULL, '2021-07-13 09:01:28', '2021-07-13 09:02:23'),
(72, 1, '2', 'Manage Expense', NULL, NULL, 'expense', 2, 70, NULL, '2021-07-13 09:01:50', '2021-07-13 09:02:31'),
(73, 1, '2', 'Expense Statement', NULL, NULL, 'expense-statement', 3, 70, NULL, '2021-07-13 09:02:19', '2021-07-13 09:02:36'),
(74, 1, '2', 'Accounts', NULL, 'far fa-money-bill-alt', NULL, 12, NULL, NULL, '2021-03-26 18:52:27', '2021-10-06 08:17:42'),
(75, 1, '2', 'Chart of Account', NULL, NULL, 'coa', 1, 74, NULL, '2021-03-26 18:52:53', '2021-05-11 06:10:34'),
(76, 1, '2', 'Opening Balance', NULL, NULL, 'opening-balance', 2, 74, NULL, '2021-03-26 18:53:20', '2021-05-11 06:10:34'),
(77, 1, '2', 'Supplier Payment', NULL, NULL, 'supplier-payment', 3, 74, NULL, '2021-03-26 18:53:43', '2021-05-11 06:10:34'),
(78, 1, '2', 'Customer Receive', NULL, NULL, 'customer-receive', 4, 74, NULL, '2021-03-26 18:54:01', '2021-05-11 06:10:34'),
(79, 1, '2', 'Cash Adjustment', NULL, NULL, 'cash-adjustment/create', 6, 74, NULL, '2021-03-26 18:54:30', '2021-10-03 09:57:52'),
(80, 1, '2', 'Debit Voucher', NULL, NULL, 'debit-voucher/create', 8, 74, '_self', '2021-03-26 18:54:52', '2021-10-03 09:57:52'),
(81, 1, '2', 'Credit Voucher', NULL, NULL, 'credit-voucher/create', 10, 74, '_self', '2021-03-26 18:55:10', '2021-10-03 09:57:52'),
(82, 1, '2', 'Contra Voucher', NULL, NULL, 'contra-voucher/create', 12, 74, '_self', '2021-03-26 18:55:31', '2021-10-03 09:57:52'),
(83, 1, '2', 'Contra Voucher List', NULL, NULL, 'contra-voucher', 13, 74, NULL, '2021-07-03 05:53:42', '2021-10-03 09:57:52'),
(84, 1, '2', 'Journal Voucher', NULL, NULL, 'journal-voucher/create', 14, 74, '_self', '2021-03-26 18:55:50', '2021-10-03 09:57:52'),
(85, 1, '2', 'Journal Voucher List', NULL, NULL, 'journal-voucher', 15, 74, NULL, '2021-07-03 05:54:24', '2021-10-03 09:57:52'),
(86, 1, '2', 'Voucher Approval', NULL, NULL, 'voucher-approval', 16, 74, NULL, '2021-03-26 18:56:21', '2021-10-03 09:57:52'),
(87, 1, '2', 'Report', NULL, 'fas fa-file-signature', NULL, 17, 74, NULL, '2021-03-26 18:58:02', '2021-10-03 09:57:52'),
(88, 1, '2', 'Cash Book', NULL, NULL, 'cash-book', 1, 87, NULL, '2021-03-26 18:58:53', '2021-03-26 19:01:24'),
(89, 1, '2', 'Inventory Ledger', NULL, NULL, 'inventory-ledger', 2, 87, NULL, '2021-03-26 18:59:21', '2021-03-26 19:01:25'),
(90, 1, '2', 'Bank Book', NULL, NULL, 'bank-book', 3, 87, NULL, '2021-03-26 18:59:42', '2021-03-26 19:01:30'),
(91, 1, '2', 'Mobile Bank Book', NULL, NULL, 'mobile-bank-book', 4, 87, NULL, '2021-03-26 19:00:00', '2021-03-26 19:01:41'),
(92, 1, '2', 'General Ledger', NULL, NULL, 'general-ledger', 5, 87, NULL, '2021-03-26 19:00:23', '2021-03-26 19:01:42'),
(93, 1, '2', 'Trial Balance', NULL, NULL, 'trial-balance', 6, 87, NULL, '2021-03-26 19:00:42', '2021-03-26 19:01:46'),
(94, 1, '2', 'Profit Loss', NULL, NULL, 'profit-loss', 7, 87, NULL, '2021-03-26 19:01:03', '2021-03-26 19:01:47'),
(95, 1, '2', 'Cash Flow', NULL, NULL, 'cash-flow', 8, 87, NULL, '2021-03-26 19:01:21', '2021-03-26 19:01:51'),
(96, 1, '2', 'Human Resource', NULL, 'fas fa-users', NULL, 14, NULL, NULL, '2021-04-03 10:54:02', '2021-10-06 08:17:42'),
(97, 1, '2', 'HRM', NULL, NULL, NULL, 1, 96, NULL, '2021-04-03 10:54:49', '2021-04-25 23:02:56'),
(98, 1, '2', 'Manage Department', NULL, NULL, 'department', 1, 97, NULL, '2021-04-03 10:55:36', '2021-04-25 22:59:58'),
(99, 1, '2', 'Manage Division', NULL, NULL, 'division', 2, 97, NULL, '2021-04-03 10:55:58', '2021-04-25 23:00:21'),
(100, 1, '2', 'Manage Designation', NULL, NULL, 'designation', 3, 97, NULL, '2021-04-03 10:56:21', '2021-04-25 23:01:09'),
(101, 1, '2', 'Shift', NULL, NULL, 'shift', 4, 97, NULL, '2021-04-26 01:09:53', '2021-04-26 01:20:08'),
(102, 1, '2', 'Add Employee', NULL, NULL, 'employee/add', 5, 97, NULL, '2021-04-03 10:57:01', '2021-04-25 23:02:24'),
(103, 1, '2', 'Manage Employee', NULL, NULL, 'employee', 6, 97, NULL, '2021-04-03 10:59:55', '2021-04-26 17:16:32'),
(104, 1, '2', 'Attendance', NULL, NULL, NULL, 2, 96, NULL, '2021-04-03 11:00:34', '2021-04-25 23:06:51'),
(105, 1, '2', 'Manage Attendance', NULL, NULL, 'attendance', 1, 104, NULL, '2021-04-03 11:01:28', '2021-04-25 23:04:12'),
(106, 1, '2', 'Attendance Report', NULL, NULL, 'attendance-report', 2, 104, NULL, '2021-04-03 11:01:53', '2021-04-25 23:04:16'),
(107, 1, '2', 'Payroll', NULL, NULL, NULL, 4, 96, NULL, '2021-04-03 11:08:19', '2021-04-25 23:09:25'),
(108, 1, '2', 'Manage Benifits', NULL, NULL, 'benifits', 1, 107, NULL, '2021-04-03 11:09:11', '2021-04-25 23:08:33'),
(109, 1, '2', 'Add Salary Setup', NULL, NULL, 'salary.setup/add', 2, 107, NULL, '2021-04-03 11:09:53', '2021-05-08 22:34:40'),
(110, 1, '2', 'Manage Salary Setup', NULL, NULL, 'salary-setup', 3, 107, NULL, '2021-04-03 11:10:19', '2021-04-25 23:08:57'),
(111, 1, '2', 'Manage Salary Generate', NULL, NULL, 'salary-generate', 4, 107, NULL, '2021-04-03 11:14:01', '2021-04-25 23:08:57'),
(112, 1, '2', 'Leave', NULL, NULL, NULL, 3, 96, NULL, '2021-04-03 12:02:43', '2021-04-25 23:06:51'),
(113, 1, '2', 'Weekly Holiday', NULL, NULL, 'weekly-holiday', 1, 112, NULL, '2021-04-03 12:03:11', '2021-04-25 23:05:09'),
(114, 1, '2', 'Holiday', NULL, NULL, 'holiday', 2, 112, NULL, '2021-04-03 12:03:29', '2021-04-26 01:11:00'),
(115, 1, '2', 'Manage Leave Type', NULL, NULL, 'leave-type', 3, 112, NULL, '2021-04-03 12:03:56', '2021-04-26 01:11:00'),
(116, 1, '2', 'Manage Leave Application', NULL, NULL, 'leave-application', 4, 112, NULL, '2021-04-03 12:04:31', '2021-04-26 01:11:00'),
(119, 2, '2', 'Dashboard', NULL, 'fas fa-tachometer-alt', '/', 1, NULL, '_self', '2021-07-16 19:28:05', '2021-09-11 18:49:59'),
(121, 2, '1', NULL, 'Menus', NULL, NULL, 2, NULL, NULL, '2021-07-16 19:30:20', '2021-09-11 18:49:59'),
(122, 2, '2', 'Product', NULL, 'fas fa-box', NULL, 3, NULL, NULL, '2021-07-16 19:31:30', '2021-09-11 18:49:59'),
(123, 2, '2', 'Manage Product', NULL, NULL, 'product', 1, 122, '_self', '2021-07-16 19:31:55', '2021-07-16 19:31:59'),
(124, 2, '2', 'Product Stock Report', NULL, NULL, 'product-stock-report', 2, 122, NULL, '2021-07-16 19:32:45', '2021-07-16 19:32:54'),
(126, 1, '2', 'Production Finish Goods', NULL, NULL, 'finish-goods', 3, 33, '_self', '2021-08-12 12:56:32', '2021-10-17 09:51:28'),
(127, 1, '2', 'ASM Permission', NULL, 'fas fa-tasks', 'asm-permission', 29, NULL, '_self', '2021-08-14 04:30:16', '2021-10-06 08:17:42'),
(128, 2, '2', 'Customer', NULL, 'far fa-handshake', NULL, 7, NULL, NULL, '2021-08-16 05:30:14', '2021-09-11 18:49:59'),
(129, 2, '2', 'Manage Customer', NULL, NULL, 'customer', 1, 128, '_self', '2021-08-16 05:30:53', '2021-08-16 05:33:41'),
(130, 2, '2', 'Customer Ledger', NULL, NULL, 'customer-ledger', 2, 128, '_self', '2021-08-16 05:31:33', '2021-08-16 05:33:51'),
(131, 2, '2', 'Credit Customer', NULL, NULL, 'credit-customer', 3, 128, '_self', '2021-08-16 05:32:01', '2021-08-16 05:33:54'),
(132, 2, '2', 'Paid Customer', NULL, NULL, 'paid-customer', 4, 128, '_self', '2021-08-16 05:32:29', '2021-08-16 05:34:05'),
(133, 2, '2', 'Customer Advance', NULL, NULL, 'customer-advance', 5, 128, '_self', '2021-08-16 05:32:58', '2021-08-16 05:34:11'),
(134, 2, '2', 'Stock Transfer', NULL, 'fas fa-share-square', 'transfer', 5, NULL, '_self', '2021-08-16 05:36:59', '2021-09-11 18:49:59'),
(135, 2, '2', 'Sale', NULL, 'fab fa-opencart', NULL, 4, NULL, '_self', '2021-08-16 05:39:15', '2021-09-11 18:49:59'),
(136, 2, '2', 'Add Sale', NULL, NULL, 'sale/add', 1, 135, '_self', '2021-08-16 05:39:45', '2021-08-16 05:40:16'),
(137, 2, '2', 'Manage Sale', NULL, NULL, 'sale', 2, 135, '_self', '2021-08-16 05:40:12', '2021-08-16 05:40:25'),
(138, 2, '2', 'Stock Return', NULL, 'fas fa-undo-alt', NULL, 6, NULL, NULL, '2021-08-16 05:41:56', '2021-09-11 18:49:59'),
(139, 2, '2', 'Return', NULL, NULL, 'return', 1, 138, '_self', '2021-08-16 05:42:21', '2021-08-16 05:45:29'),
(140, 2, '2', 'Manage Sale Return', NULL, NULL, 'sale-return', 2, 138, '_self', '2021-08-16 05:43:16', '2021-08-16 05:45:34'),
(141, 2, '2', 'Location', NULL, 'fas fa-map-marker-alt', NULL, 14, NULL, NULL, '2021-08-16 07:50:29', '2021-09-11 17:20:54'),
(142, 2, '2', 'Manage Upazila', NULL, NULL, 'upazila', 1, 141, '_self', '2021-08-16 07:51:01', '2021-08-16 07:51:58'),
(143, 2, '2', 'Manage Route', NULL, NULL, 'route', 2, 141, '_self', '2021-08-16 07:51:28', '2021-08-16 07:52:03'),
(144, 2, '2', 'Manage Area', NULL, NULL, 'area', 3, 141, '_self', '2021-08-16 07:51:51', '2021-08-16 07:56:16'),
(145, 2, '2', 'Manage SR', NULL, 'fas fa-user-secret', 'sales-representative', 13, NULL, '_self', '2021-08-16 07:57:44', '2021-09-11 17:20:54'),
(148, 2, '2', 'Expense', NULL, 'fas fa-money-check-alt', NULL, 9, NULL, NULL, '2021-08-23 13:56:43', '2021-09-11 17:20:54'),
(149, 2, '2', 'Manage Expense Item', NULL, NULL, 'expense-item', 1, 148, '_self', '2021-08-23 13:57:24', '2021-08-23 13:58:28'),
(150, 2, '2', 'Manage Expense', NULL, NULL, 'expense', 2, 148, '_self', '2021-08-23 13:57:55', '2021-08-23 13:58:39'),
(151, 2, '2', 'Expense Statement', NULL, NULL, 'expense-statement', 3, 148, '_self', '2021-08-23 13:58:23', '2021-08-23 13:58:44'),
(152, 2, '2', 'Report', NULL, 'fas fa-file-signature', NULL, 12, NULL, NULL, '2021-08-23 14:00:52', '2021-09-11 17:20:54'),
(153, 2, '2', 'Sales Report', NULL, NULL, 'sales-report', 4, 152, '_self', '2021-08-23 15:41:13', '2021-08-30 05:15:57'),
(154, 2, '2', 'Inventory Report', NULL, NULL, 'inventory-report', 5, 152, '_self', '2021-08-23 15:41:59', '2021-08-30 05:15:57'),
(155, 2, '2', 'Today\'s Customer Receipt', NULL, NULL, 'todays-customer-receipt', 6, 152, '_self', '2021-08-23 16:02:58', '2021-08-30 05:15:57'),
(156, 2, '2', 'Customer Receipt List', NULL, NULL, 'customer-receipt-list', 7, 152, '_self', '2021-08-23 16:03:49', '2021-08-30 05:15:57'),
(157, 2, '2', 'Salesman Wise Sales Report', NULL, NULL, 'salesman-wise-sales-report', 8, 152, '_self', '2021-08-23 16:05:31', '2021-08-30 05:15:57'),
(158, 2, '2', 'Due Report', NULL, NULL, 'due-report', 9, 152, '_self', '2021-08-23 16:06:23', '2021-08-30 05:15:57'),
(159, 2, '2', 'Shipping Cost Report', NULL, NULL, 'shipping-cost-report', 10, 152, '_self', '2021-08-23 16:07:07', '2021-08-30 05:15:57'),
(160, 2, '2', 'Product Wise Sales Report', NULL, NULL, 'product-wise-sales-report', 11, 152, '_self', '2021-08-23 16:08:05', '2021-08-30 05:15:57'),
(161, 2, '2', 'Damage Report', NULL, NULL, 'damage-report', 12, 152, '_self', '2021-08-23 16:08:37', '2021-08-30 05:15:57'),
(162, 2, '2', 'Warehouse Expense Report', NULL, NULL, 'warehouse-expense-report', 13, 152, '_self', '2021-08-23 16:09:14', '2021-08-30 05:15:57'),
(163, 2, '2', 'Collection Report', NULL, NULL, 'collection-report', 14, 152, '_self', '2021-08-23 16:10:01', '2021-08-30 05:15:57'),
(165, 2, '2', 'Warehouse Summary', NULL, NULL, 'warehouse-summary', 15, 152, '_self', '2021-08-23 16:11:38', '2021-09-06 04:04:59'),
(166, 2, '2', 'Coupon Received Report', NULL, NULL, 'coupon-received-report', 16, 152, '_self', '2021-08-23 16:26:24', '2021-09-06 04:04:59'),
(167, 2, '2', 'Bank', NULL, 'fas fa-university', NULL, 10, NULL, NULL, '2021-08-29 03:39:56', '2021-09-11 17:20:54'),
(168, 2, '2', 'Manage Bank', NULL, NULL, 'bank', 1, 167, '_self', '2021-08-29 03:40:34', '2021-08-29 03:41:31'),
(169, 2, '2', 'Bank Transaction', NULL, NULL, 'bank-transaction', 2, 167, '_self', '2021-08-29 03:41:02', '2021-08-29 03:41:43'),
(170, 2, '2', 'Bank Ledger', NULL, NULL, 'bank-ledger', 3, 167, '_self', '2021-08-29 03:41:25', '2021-08-29 03:41:51'),
(171, 2, '2', 'Mobile Bank', NULL, 'fas fa-mobile-alt', NULL, 11, NULL, '_self', '2021-08-29 03:43:48', '2021-09-11 17:20:54'),
(172, 2, '2', 'Manage Mobile Bank', NULL, NULL, 'mobile-bank', 1, 171, '_self', '2021-08-29 03:44:44', '2021-08-29 03:52:37'),
(173, 2, '2', 'Mobile Bank Transaction', NULL, NULL, 'mobile-bank-transaction', 2, 171, '_self', '2021-08-29 03:51:37', '2021-08-29 03:52:43'),
(174, 2, '2', 'Mobile Bank Ledger', NULL, NULL, 'mobile-bank-ledger', 3, 171, '_self', '2021-08-29 03:52:30', '2021-08-29 03:52:49'),
(176, 2, '2', 'Closing', NULL, NULL, 'closing', 1, 152, '_self', '2021-08-30 05:13:12', '2021-08-30 05:15:23'),
(177, 2, '2', 'Closing Report', NULL, NULL, 'closing-report', 2, 152, '_self', '2021-08-30 05:13:37', '2021-08-30 05:15:44'),
(178, 2, '2', 'Today Sales Report', NULL, NULL, 'today-sales-report', 3, 152, '_self', '2021-08-30 05:14:48', '2021-08-30 05:15:57'),
(179, 1, '2', 'Report', NULL, 'fas fa-file-signature', NULL, 18, NULL, NULL, '2021-09-06 04:06:13', '2021-10-06 08:17:42'),
(180, 1, '2', 'Closing', NULL, NULL, 'closing', 1, 179, '_self', '2021-09-06 04:06:36', '2021-09-06 04:15:28'),
(181, 1, '2', 'Closing Report', NULL, NULL, 'closing-report', 2, 179, '_self', '2021-09-06 04:06:57', '2021-09-06 04:15:33'),
(182, 1, '2', 'Today\'s Sales Report', NULL, NULL, 'today-sales-report', 3, 179, '_self', '2021-09-06 04:07:35', '2021-10-17 10:03:54'),
(183, 1, '2', 'Sales Report', NULL, NULL, 'sales-report', 4, 179, '_self', '2021-09-06 04:07:55', '2021-09-23 06:57:46'),
(184, 1, '2', 'Inventory Report', NULL, NULL, 'inventory-report', 5, 179, '_self', '2021-09-06 04:08:24', '2021-09-23 06:57:46'),
(185, 1, '2', 'Today\'s Customer Receipt', NULL, NULL, 'todays-customer-receipt', 6, 179, '_self', '2021-09-06 04:09:08', '2021-09-23 06:57:46'),
(186, 1, '2', 'Customer Receipt List', NULL, NULL, 'customer-receipt-list', 7, 179, '_self', '2021-09-06 04:09:36', '2021-09-23 06:57:46'),
(187, 1, '2', 'Salesman Wise Sales Report', NULL, NULL, 'salesman-wise-sales-report', 8, 179, '_self', '2021-09-06 04:10:07', '2021-09-23 06:57:46'),
(188, 1, '2', 'Due Report', NULL, NULL, 'due-report', 10, 179, '_self', '2021-09-06 04:10:43', '2021-09-23 08:30:55'),
(189, 1, '2', 'Shipping Cost Report', NULL, NULL, 'shipping-cost-report', 11, 179, '_self', '2021-09-06 04:11:09', '2021-09-23 08:30:55'),
(190, 1, '2', 'Product Wise Sales Report', NULL, NULL, 'product-wise-sales-report', 12, 179, '_self', '2021-09-06 04:11:35', '2021-09-23 08:30:55'),
(193, 1, '2', 'Collection Report', NULL, NULL, 'collection-report', 13, 179, '_self', '2021-09-06 04:13:08', '2021-09-23 08:30:55'),
(194, 1, '2', 'Warehouse Summary', NULL, NULL, 'warehouse-summary', 14, 179, '_self', '2021-09-06 04:13:36', '2021-09-23 08:30:55'),
(196, 1, '2', 'Material Stock Alert Report', NULL, NULL, 'material-stock-alert-report', 17, 179, '_self', '2021-09-06 04:14:40', '2021-09-23 08:30:55'),
(198, 1, '2', 'Material Issue Report', NULL, NULL, 'material-issue-report', 16, 179, '_self', '2021-09-06 04:45:17', '2021-09-23 08:30:55'),
(199, 1, '2', 'Finish Goods Inventory Report', NULL, NULL, 'finish-goods-inventory-report', 15, 179, '_self', '2021-09-06 04:51:29', '2021-09-23 08:30:55'),
(203, 1, '2', 'Debit Voucher List', NULL, NULL, 'debit-voucher', 9, 74, '_self', '2021-09-07 09:55:31', '2021-10-03 09:57:52'),
(204, 1, '2', 'Credit Voucher List', NULL, NULL, 'credit-voucher', 11, 74, '_self', '2021-09-07 09:56:13', '2021-10-03 09:57:52'),
(205, 2, '2', 'Accounts', NULL, 'far fa-money-bill-alt', NULL, 8, NULL, NULL, '2021-09-11 16:56:18', '2021-09-11 18:49:59'),
(206, 2, '2', 'Customer Receive', NULL, NULL, 'customer-receive', 1, 205, '_self', '2021-09-11 16:56:57', '2021-09-11 17:19:27'),
(207, 2, '2', 'Cash Adjustment', NULL, NULL, 'cash-adjustment/create', 2, 205, '_self', '2021-09-11 17:06:14', '2021-09-11 17:34:36'),
(208, 2, '2', 'Create Debit Voucher', NULL, NULL, 'debit-voucher/create', 4, 205, '_self', '2021-09-11 17:06:43', '2021-09-11 18:49:41'),
(209, 2, '2', 'Debit Voucher List', NULL, NULL, 'debit-voucher', 5, 205, '_self', '2021-09-11 17:07:41', '2021-09-11 18:49:41'),
(210, 2, '2', 'Create Credit Voucher', NULL, NULL, 'credit-voucher/create', 6, 205, '_self', '2021-09-11 17:13:51', '2021-09-11 18:49:41'),
(211, 2, '2', 'Credit Voucher List', NULL, NULL, 'credit-voucher', 7, 205, '_self', '2021-09-11 17:14:37', '2021-09-11 18:49:41'),
(212, 2, '2', 'Create Contra Voucher', NULL, NULL, 'contra-voucher/create', 8, 205, '_self', '2021-09-11 17:15:30', '2021-09-11 18:49:41'),
(213, 2, '2', 'Contra Voucher List', NULL, NULL, 'contra-voucher', 9, 205, '_self', '2021-09-11 17:15:58', '2021-09-11 18:49:41'),
(214, 2, '2', 'Create Journal Voucher', NULL, NULL, 'journal-voucher/create', 10, 205, '_self', '2021-09-11 17:16:32', '2021-09-11 18:49:41'),
(215, 2, '2', 'Journal Voucher List', NULL, NULL, 'journal-voucher', 11, 205, '_self', '2021-09-11 17:17:08', '2021-09-11 18:49:41'),
(216, 2, '2', 'Report', NULL, NULL, NULL, 12, 205, NULL, '2021-09-11 17:17:27', '2021-09-11 18:49:41'),
(217, 2, '2', 'Cash Book', NULL, NULL, 'cash-book', 1, 216, '_self', '2021-09-11 17:17:51', '2021-09-11 17:20:34'),
(218, 2, '2', 'Bank Book', NULL, NULL, 'bank-book', 2, 216, '_self', '2021-09-11 17:18:25', '2021-09-11 17:20:42'),
(219, 2, '2', 'Mobile Bank Book', NULL, NULL, 'mobile-bank-book', 3, 216, '_self', '2021-09-11 17:18:53', '2021-09-11 17:20:48'),
(220, 2, '2', 'General Ledger', NULL, NULL, 'general-ledger', 4, 216, '_self', '2021-09-11 17:19:21', '2021-09-11 17:20:54'),
(221, 2, '2', 'Cash Adjustment List', NULL, NULL, 'cash-adjustment', 3, 205, '_self', '2021-09-11 18:49:34', '2021-09-11 18:49:41'),
(222, 1, '2', 'Cash Adjustment List', NULL, NULL, 'cash-adjustment', 7, 74, '_self', '2021-09-12 10:39:28', '2021-10-03 09:57:52'),
(223, 1, '2', 'Loan', NULL, 'far fa-money-bill-alt', NULL, 13, NULL, NULL, '2021-09-13 04:31:56', '2021-10-06 08:17:42'),
(224, 1, '2', 'Personal Loan', NULL, NULL, NULL, 1, 223, NULL, '2021-09-13 04:32:14', '2021-09-13 04:33:23'),
(225, 1, '2', 'Mangage Person', NULL, NULL, 'personal-loan-person', 1, 224, NULL, '2021-09-13 04:32:32', '2021-09-13 04:33:31'),
(226, 1, '2', 'Manage Personal Loan', NULL, NULL, 'personal-loan', 2, 224, NULL, '2021-09-13 04:32:53', '2021-10-17 09:56:38'),
(227, 1, '2', 'Manage Personal Loan Installment', NULL, NULL, 'personal-loan-installment', 3, 224, NULL, '2021-09-13 04:33:13', '2021-10-17 09:57:02'),
(228, 1, '2', 'Official Loan', NULL, NULL, NULL, 2, 223, NULL, '2021-09-13 04:34:00', '2021-10-17 09:57:22'),
(229, 1, '2', 'Manage Office Loan', NULL, NULL, 'official-loan', 1, 228, NULL, '2021-09-13 04:34:18', '2021-10-17 09:57:48'),
(230, 1, '2', 'Manage Office Loan Installment', NULL, NULL, 'official-loan-installment', 2, 228, NULL, '2021-09-13 04:34:37', '2021-10-17 09:58:05'),
(231, 1, '2', 'Loan Report', NULL, NULL, NULL, 3, 223, NULL, '2021-09-13 04:35:25', '2021-09-13 04:35:44'),
(232, 1, '2', 'Report', NULL, NULL, 'loan-report', 1, 231, NULL, '2021-09-13 04:35:37', '2021-09-13 04:35:40'),
(233, 1, '2', 'Balance Sheet', NULL, NULL, 'balance-sheet', 9, 87, '_self', '2021-09-13 05:21:49', '2021-09-13 05:22:04'),
(234, 1, '2', 'Sale', NULL, 'fab fa-opencart', NULL, 7, NULL, '_self', '2021-09-22 08:55:19', '2021-10-06 08:17:42'),
(235, 1, '2', 'Add Sale', NULL, NULL, 'sale/add', 1, 234, '_self', '2021-09-22 08:55:45', '2021-09-22 08:56:03'),
(236, 1, '2', 'Manage Sale', NULL, NULL, 'sale', 2, 234, '_self', '2021-09-22 09:18:29', '2021-09-22 09:18:34'),
(237, 1, '2', 'Sale Return', NULL, NULL, 'sale-return', 3, 51, '_self', '2021-09-23 04:37:37', '2021-09-23 04:37:49'),
(238, 1, '2', 'Product Stock Alert Report', NULL, NULL, 'product-stock-alert-report', 18, 179, '_self', '2021-09-23 06:59:01', '2021-09-23 08:30:55'),
(239, 1, '2', 'SR Commission Report', NULL, NULL, 'sr-commission-report', 9, 179, '_self', '2021-09-23 08:30:24', '2021-09-23 08:30:55'),
(240, 1, '2', 'Invoice Report', NULL, NULL, 'invoice-report', 3, 234, NULL, '2021-10-03 04:47:28', '2021-10-03 05:44:17'),
(241, 1, '2', 'Salesman Payment', NULL, NULL, 'salesmen-payment', 5, 74, NULL, '2021-10-03 09:56:32', '2021-10-17 09:54:15'),
(242, 1, '2', 'Salesman Ledger', NULL, NULL, 'salesmen-ledger', 2, 243, NULL, '2021-10-03 11:40:20', '2021-10-17 10:04:16'),
(243, 1, '2', 'SR', NULL, 'fas fa-user-secret', NULL, 24, NULL, NULL, '2021-10-04 03:59:49', '2021-10-06 08:17:42'),
(244, 1, '2', 'Damage Product', NULL, 'fas fa-recycle', NULL, 8, NULL, NULL, '2021-10-05 07:58:44', '2021-10-06 08:17:42'),
(245, 1, '2', 'Damage', NULL, NULL, 'damage', 1, 244, NULL, '2021-10-05 07:59:04', '2021-10-05 09:24:26'),
(246, 1, '2', 'Damage Product', NULL, NULL, 'damage-product', 2, 244, NULL, '2021-10-06 08:16:38', '2021-10-06 08:16:48'),
(247, 1, '2', 'Material Stock Ledger', NULL, 'fas fa-file', 'material-stock-ledger', 4, 15, NULL, '2021-10-07 06:54:47', '2021-10-07 06:54:53'),
(248, 2, '2', 'Product Stock Ledger', NULL, NULL, 'product-stock-ledger', 3, 122, NULL, '2021-10-07 08:45:03', '2021-10-07 08:50:45'),
(249, 1, '2', 'Product Stock Ledger', NULL, NULL, 'product-stock-ledger', 8, 23, NULL, '2021-10-07 08:46:55', '2021-10-07 08:51:54');

-- --------------------------------------------------------

--
-- Table structure for table `module_role`
--

CREATE TABLE `module_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_role`
--

INSERT INTO `module_role` (`id`, `module_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(2, 2, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(3, 15, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(4, 16, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(5, 17, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(6, 18, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(7, 23, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(8, 24, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(10, 25, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(11, 26, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(12, 28, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(13, 29, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(14, 30, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(15, 31, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(16, 33, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(17, 34, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(18, 35, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(19, 126, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(20, 47, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(21, 48, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(22, 49, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(23, 50, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(24, 57, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(25, 58, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(26, 59, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(27, 60, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(28, 61, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(29, 3, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(30, 4, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(31, 5, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(32, 55, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(33, 56, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(34, 6, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(35, 7, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(36, 10, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(37, 11, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(38, 12, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(39, 13, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(40, 14, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(41, 20, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(42, 21, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(43, 22, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(44, 41, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(45, 42, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(46, 43, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(47, 44, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(48, 45, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(49, 46, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(51, 51, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(52, 52, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(53, 53, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(55, 74, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(56, 75, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(57, 76, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(58, 77, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(59, 78, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(60, 79, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(61, 222, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(63, 203, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(65, 204, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(66, 82, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(67, 83, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(68, 84, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(69, 85, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(70, 86, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(71, 87, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(72, 88, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(73, 89, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(74, 90, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(75, 91, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(76, 92, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(77, 93, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(78, 94, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(79, 95, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(80, 233, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(81, 223, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(82, 224, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(83, 225, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(84, 226, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(85, 227, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(86, 228, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(87, 229, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(88, 230, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(89, 231, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(90, 232, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(91, 96, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(92, 97, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(93, 98, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(94, 99, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(95, 100, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(96, 101, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(97, 102, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(98, 103, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(99, 104, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(100, 105, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(101, 106, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(102, 112, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(103, 113, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(104, 114, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(105, 115, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(106, 116, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(107, 107, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(108, 108, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(109, 109, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(110, 110, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(111, 111, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(112, 70, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(113, 71, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(114, 72, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(115, 73, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(116, 62, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(117, 63, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(118, 64, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(119, 65, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(120, 66, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(121, 67, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(122, 68, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(123, 69, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(124, 179, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(125, 180, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(126, 181, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(128, 182, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(129, 183, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(130, 184, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(131, 185, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(132, 186, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(133, 187, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(134, 188, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(135, 189, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(136, 190, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(139, 193, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(140, 194, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(143, 199, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(145, 198, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(146, 196, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(147, 80, 2, '2021-09-20 09:42:13', '2021-09-20 09:42:13'),
(148, 81, 2, '2021-09-20 09:42:13', '2021-09-20 09:42:13'),
(149, 234, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(150, 235, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(151, 236, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(152, 237, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(153, 247, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(154, 249, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(155, 240, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(156, 244, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(157, 245, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(158, 246, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(159, 241, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(160, 239, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(161, 238, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(162, 243, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(163, 242, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dashboard Access', 'dashboard-access', '2021-03-26 17:49:24', NULL),
(2, 4, 'User Access', 'user-access', '2021-03-26 17:49:24', NULL),
(3, 4, 'User Add', 'user-add', '2021-03-26 17:49:24', NULL),
(4, 4, 'User Edit', 'user-edit', '2021-03-26 17:49:24', NULL),
(5, 4, 'User View', 'user-view', '2021-03-26 17:49:24', NULL),
(6, 4, 'User Delete', 'user-delete', '2021-03-26 17:49:24', NULL),
(7, 4, 'User Bulk Delete', 'user-bulk-delete', '2021-03-26 17:49:24', NULL),
(8, 4, 'User Report', 'user-report', '2021-03-26 17:49:24', NULL),
(9, 5, 'Role Access', 'role-access', '2021-03-26 17:49:24', NULL),
(10, 5, 'Role Add', 'role-add', '2021-03-26 17:49:24', NULL),
(11, 5, 'Role Edit', 'role-edit', '2021-03-26 17:49:24', NULL),
(12, 5, 'Role View', 'role-view', '2021-03-26 17:49:24', NULL),
(13, 5, 'Role Delete', 'role-delete', '2021-03-26 17:49:24', NULL),
(14, 5, 'Role Bulk Delete', 'role-bulk-delete', '2021-03-26 17:49:24', NULL),
(15, 5, 'Role Report', 'role-report', '2021-03-26 17:49:24', NULL),
(17, 8, 'Menu Access', 'menu-access', '2021-03-26 17:49:24', NULL),
(18, 8, 'Menu Add', 'menu-add', '2021-03-26 17:49:24', NULL),
(19, 8, 'Menu Edit', 'menu-edit', '2021-03-26 17:49:24', NULL),
(20, 8, 'Menu Delete', 'menu-delete', '2021-03-26 17:49:24', NULL),
(21, 8, 'Menu Bulk Delete', 'menu-bulk-delete', '2021-03-26 17:49:24', NULL),
(22, 8, 'Menu Report', 'menu-report', '2021-03-26 17:49:24', NULL),
(23, 8, 'Menu Builder Access', 'menu-builder-access', '2021-03-26 17:49:24', NULL),
(24, 8, 'Menu Module Add', 'menu-module-add', '2021-03-26 17:49:24', NULL),
(25, 8, 'Menu Module Edit', 'menu-module-edit', '2021-03-26 17:49:24', NULL),
(26, 8, 'Menu Module Delete', 'menu-module-delete', '2021-03-26 17:49:24', NULL),
(27, 9, 'Permission Access', 'permission-access', '2021-03-26 17:49:24', NULL),
(28, 9, 'Permission Add', 'permission-add', '2021-03-26 17:49:24', NULL),
(29, 9, 'Permission Edit', 'permission-edit', '2021-03-26 17:49:24', NULL),
(30, 9, 'Permission Delete', 'permission-delete', '2021-03-26 17:49:24', NULL),
(31, 9, 'Permission Bulk Delete', 'permission-bulk-delete', '2021-03-26 17:49:24', NULL),
(32, 9, 'Permission Report', 'permission-report', '2021-03-26 17:49:24', NULL),
(33, 11, 'Warehouse Access', 'warehouse-access', '2021-03-26 20:06:16', '2021-10-11 05:43:11'),
(34, 11, 'Warehouse Add', 'warehouse-add', '2021-03-26 20:06:16', '2021-10-11 05:43:21'),
(35, 11, 'Warehouse Edit', 'warehouse-edit', '2021-03-26 20:06:16', '2021-10-11 05:43:32'),
(36, 11, 'Warehouse Delete', 'warehouse-delete', '2021-03-26 20:06:16', '2021-10-11 05:43:42'),
(37, 11, 'Warehouse Bulk Delete', 'warehouse-bulk-delete', '2021-03-26 20:06:16', '2021-10-11 05:43:53'),
(38, 11, 'Warehouse Report', 'warehouse-report', '2021-03-26 20:06:16', '2021-10-11 05:44:05'),
(39, 10, 'General Setting Access', 'general-setting-access', '2021-03-26 20:07:15', NULL),
(40, 12, 'Customer Group Access', 'customer-group-access', '2021-03-26 20:08:50', NULL),
(41, 12, 'Customer Group Add', 'customer-group-add', '2021-03-26 20:08:50', NULL),
(42, 12, 'Customer Group Edit', 'customer-group-edit', '2021-03-26 20:08:50', NULL),
(43, 12, 'Customer Group Delete', 'customer-group-delete', '2021-03-26 20:08:50', NULL),
(44, 12, 'Customer Group Bulk Delete', 'customer-group-bulk-delete', '2021-03-26 20:08:50', NULL),
(45, 12, 'Customer Group Report', 'customer-group-report', '2021-03-26 20:08:50', NULL),
(46, 13, 'Unit Access', 'unit-access', '2021-03-26 20:10:02', NULL),
(47, 13, 'Unit Add', 'unit-add', '2021-03-26 20:10:02', NULL),
(48, 13, 'Unit Edit', 'unit-edit', '2021-03-26 20:10:02', NULL),
(49, 13, 'Unit Delete', 'unit-delete', '2021-03-26 20:10:02', NULL),
(50, 13, 'Unit Bulk Delete', 'unit-bulk-delete', '2021-03-26 20:10:02', NULL),
(51, 13, 'Unit Report', 'unit-report', '2021-03-26 20:10:02', NULL),
(52, 14, 'Tax Access', 'tax-access', '2021-03-26 20:10:46', NULL),
(53, 14, 'Tax Add', 'tax-add', '2021-03-26 20:10:46', NULL),
(54, 14, 'Tax Edit', 'tax-edit', '2021-03-26 20:10:46', NULL),
(55, 14, 'Tax Delete', 'tax-delete', '2021-03-26 20:10:46', NULL),
(56, 14, 'Tax Bulk Delete', 'tax-bulk-delete', '2021-03-26 20:10:46', NULL),
(57, 14, 'Tax Report', 'tax-report', '2021-03-26 20:10:46', NULL),
(58, 16, 'Material Category Access', 'material-category-access', '2021-07-13 10:31:39', NULL),
(59, 16, 'Material Category Add', 'material-category-add', '2021-07-13 10:31:39', NULL),
(60, 16, 'Material Category Edit', 'material-category-edit', '2021-07-13 10:31:39', NULL),
(61, 16, 'Material Category Delete', 'material-category-delete', '2021-07-13 10:31:39', NULL),
(62, 16, 'Material Category Bulk Delete', 'material-category-bulk-delete', '2021-07-13 10:31:39', NULL),
(63, 16, 'Material Category Report', 'material-category-report', '2021-07-13 10:31:39', NULL),
(64, 17, 'Material Access', 'material-access', '2021-07-13 10:34:53', NULL),
(65, 17, 'Material Add', 'material-add', '2021-07-13 10:34:53', NULL),
(66, 17, 'Material Edit', 'material-edit', '2021-07-13 10:34:53', NULL),
(67, 17, 'Material View', 'material-view', '2021-07-13 10:34:53', NULL),
(68, 17, 'Material Delete', 'material-delete', '2021-07-13 10:34:53', NULL),
(69, 17, 'Material Bulk Delete', 'material-bulk-delete', '2021-07-13 10:34:53', NULL),
(70, 17, 'Material Report', 'material-report', '2021-07-13 10:34:53', NULL),
(71, 18, 'Material Stock Report Access', 'material-stock-report-access', '2021-07-13 10:35:17', NULL),
(73, 22, 'Purchase Access', 'purchase-access', '2021-07-13 10:37:12', NULL),
(74, 22, 'Purchase Add', 'purchase-add', '2021-07-13 10:37:12', NULL),
(75, 22, 'Purchase Edit', 'purchase-edit', '2021-07-13 10:37:12', NULL),
(76, 22, 'Purchase View', 'purchase-view', '2021-07-13 10:37:12', NULL),
(77, 22, 'Purchase Delete', 'purchase-delete', '2021-07-13 10:37:12', NULL),
(78, 22, 'Purchase Bulk Delete', 'purchase-bulk-delete', '2021-07-13 10:37:12', NULL),
(79, 22, 'Purchase Report', 'purchase-report', '2021-07-13 10:37:12', NULL),
(80, 24, 'Product Category Access', 'product-category-access', '2021-07-13 10:38:23', NULL),
(81, 24, 'Product Category Add', 'product-category-add', '2021-07-13 10:38:23', NULL),
(82, 24, 'Product Category Edit', 'product-category-edit', '2021-07-13 10:38:23', NULL),
(83, 24, 'Product Category Delete', 'product-category-delete', '2021-07-13 10:38:23', NULL),
(84, 24, 'Product Category Bulk Delete', 'product-category-bulk-delete', '2021-07-13 10:38:23', NULL),
(85, 24, 'Product Category Report', 'product-category-report', '2021-07-13 10:38:23', NULL),
(92, 26, 'Product Access', 'product-access', '2021-07-13 10:42:37', NULL),
(93, 26, 'Product Add', 'product-add', '2021-07-13 10:42:37', NULL),
(94, 26, 'Product Edit', 'product-edit', '2021-07-13 10:42:37', NULL),
(95, 26, 'Product View', 'product-view', '2021-07-13 10:42:37', NULL),
(96, 26, 'Product Delete', 'product-delete', '2021-07-13 10:42:37', NULL),
(97, 26, 'Product Bulk Delete', 'product-bulk-delete', '2021-07-13 10:42:37', NULL),
(98, 26, 'Product Report', 'product-report', '2021-07-13 10:42:37', NULL),
(99, 28, 'Print Barcode Access', 'print-barcode-access', '2021-07-13 10:43:04', NULL),
(100, 30, 'Adjustment Access', 'adjustment-access', '2021-07-13 10:46:34', NULL),
(101, 30, 'Adjustment Add', 'adjustment-add', '2021-07-13 10:46:34', NULL),
(102, 30, 'Adjustment Edit', 'adjustment-edit', '2021-07-13 10:46:34', NULL),
(103, 30, 'Adjustment View', 'adjustment-view', '2021-07-13 10:46:34', NULL),
(104, 30, 'Adjustment Delete', 'adjustment-delete', '2021-07-13 10:46:34', NULL),
(105, 30, 'Adjustment Bulk Delete', 'adjustment-bulk-delete', '2021-07-13 10:46:34', NULL),
(106, 30, 'Adjustment Report', 'adjustment-report', '2021-07-13 10:46:34', NULL),
(107, 31, 'Product Stock Report Access', 'product-stock-report-access', '2021-07-13 10:47:01', NULL),
(109, 35, 'Production Access', 'production-access', '2021-07-13 10:59:50', NULL),
(110, 35, 'Production Add', 'production-add', '2021-07-13 10:59:50', NULL),
(111, 35, 'Production Edit', 'production-edit', '2021-07-13 10:59:50', NULL),
(112, 35, 'Production View', 'production-view', '2021-07-13 10:59:50', NULL),
(113, 35, 'Production Delete', 'production-delete', '2021-07-13 10:59:50', NULL),
(114, 35, 'Production Approve', 'production-approve', '2021-07-13 10:59:50', NULL),
(115, 35, 'Production Report', 'production-report', '2021-07-13 10:59:50', NULL),
(124, 42, 'Customer Access', 'customer-access', '2021-07-13 11:06:18', NULL),
(130, 42, 'Customer Add', 'customer-add', '2021-07-13 11:06:18', '2021-09-22 04:20:36'),
(131, 43, 'Customer Ledger Access', 'customer-ledger-access', '2021-07-13 11:06:41', NULL),
(132, 44, 'Credit Customer Access', 'credit-customer-access', '2021-07-13 11:06:56', NULL),
(133, 45, 'Paid Customer Access', 'paid-customer-access', '2021-07-13 11:07:12', NULL),
(134, 46, 'Customer Advance Access', 'customer-advance-access', '2021-07-13 11:08:16', NULL),
(139, 46, 'Customer Advance Report', 'customer-advance-report', '2021-07-13 11:08:16', NULL),
(140, 48, 'Supplier Access', 'supplier-access', '2021-07-13 11:09:21', NULL),
(141, 48, 'Supplier Add', 'supplier-add', '2021-07-13 11:09:21', NULL),
(142, 48, 'Supplier Edit', 'supplier-edit', '2021-07-13 11:09:21', NULL),
(143, 48, 'Supplier View', 'supplier-view', '2021-07-13 11:09:21', NULL),
(144, 48, 'Supplier Delete', 'supplier-delete', '2021-07-13 11:09:21', NULL),
(145, 48, 'Supplier Bulk Delete', 'supplier-bulk-delete', '2021-07-13 11:09:21', NULL),
(146, 48, 'Supplier Report', 'supplier-report', '2021-07-13 11:09:21', NULL),
(147, 49, 'Supplier Ledger Access', 'supplier-ledger-access', '2021-07-13 11:09:45', NULL),
(148, 50, 'Supplier Advance Access', 'supplier-advance-access', '2021-07-13 11:10:00', NULL),
(152, 52, 'Return Access', 'return-access', '2021-07-13 11:18:24', '2021-09-23 04:38:18'),
(153, 53, 'Purchase Return Access', 'purchase-return-access', '2021-07-13 11:19:27', NULL),
(154, 53, 'Purchase Return Add', 'purchase-return-add', '2021-07-13 11:19:27', NULL),
(155, 53, 'Purchase Return View', 'purchase-return-view', '2021-07-13 11:19:27', NULL),
(156, 53, 'Purchase Return Delete', 'purchase-return-delete', '2021-07-13 11:19:27', NULL),
(160, 75, 'COA Access', 'coa-access', '2021-07-13 16:12:36', '2021-09-13 05:09:58'),
(161, 75, 'COA Add', 'coa-add', '2021-07-13 16:12:36', '2021-09-13 05:09:51'),
(162, 75, 'COA Edit', 'coa-edit', '2021-07-13 16:12:36', '2021-09-13 05:09:43'),
(163, 75, 'COA Delete', 'coa-delete', '2021-07-13 16:12:36', '2021-09-13 05:09:35'),
(164, 76, 'Opening Balance Access', 'opening-balance-access', '2021-07-13 16:13:13', NULL),
(165, 77, 'Supplier Payment Access', 'supplier-payment-access', '2021-07-13 16:13:38', NULL),
(166, 78, 'Customer Receive Access', 'customer-receive-access', '2021-07-13 16:14:05', NULL),
(170, 83, 'Contra Voucher Access', 'contra-voucher-access', '2021-07-13 16:20:59', NULL),
(171, 83, 'Contra Voucher Add', 'contra-voucher-add', '2021-07-13 16:20:59', NULL),
(172, 83, 'Contra Voucher View', 'contra-voucher-view', '2021-07-13 16:20:59', NULL),
(173, 83, 'Contra Voucher Delete', 'contra-voucher-delete', '2021-07-13 16:20:59', NULL),
(174, 85, 'Journal Voucher Access', 'journal-voucher-access', '2021-07-13 16:21:48', '2021-09-20 09:40:17'),
(175, 85, 'Journal Voucher Add', 'journal-voucher-add', '2021-07-13 16:21:48', '2021-09-20 09:40:24'),
(176, 85, 'Journal Voucher View', 'journal-voucher-view', '2021-07-13 16:21:48', '2021-09-20 09:40:30'),
(177, 85, 'Journal Voucher Delete', 'journal-voucher-delete', '2021-07-13 16:21:48', '2021-09-20 09:40:36'),
(178, 86, 'Voucher Access', 'voucher-access', '2021-07-13 16:24:05', NULL),
(179, 86, 'Voucher Approve', 'voucher-approve', '2021-07-13 16:24:05', NULL),
(180, 86, 'Voucher Edit', 'voucher-edit', '2021-07-13 16:24:05', NULL),
(181, 86, 'Voucher Delete', 'voucher-delete', '2021-07-13 16:24:05', NULL),
(182, 88, 'Cash Book Access', 'cash-book-access', '2021-07-13 16:31:28', NULL),
(183, 89, 'Inventory Ledger Access', 'inventory-ledger-access', '2021-07-13 16:31:52', NULL),
(184, 90, 'Bank Book Access', 'bank-book-access', '2021-07-13 16:32:26', NULL),
(185, 91, 'Mobile Bank Book Access', 'mobile-bank-book-access', '2021-07-13 16:32:46', NULL),
(186, 92, 'General Ledger Access', 'general-ledger-access', '2021-07-13 17:00:34', NULL),
(187, 93, 'Trial Balance Access', 'trial-balance-access', '2021-07-13 17:00:59', NULL),
(188, 94, 'Profit Loss Access', 'profit-loss-access', '2021-07-13 17:01:20', NULL),
(189, 95, 'Cash Flow Access', 'cash-flow-access', '2021-07-13 17:01:40', NULL),
(190, 71, 'Expense Item Access', 'expense-item-access', '2021-07-13 17:03:02', NULL),
(191, 71, 'Expense Item Add', 'expense-item-add', '2021-07-13 17:03:02', NULL),
(192, 71, 'Expense Item Edit', 'expense-item-edit', '2021-07-13 17:03:02', NULL),
(193, 71, 'Expense Item Delete', 'expense-item-delete', '2021-07-13 17:03:02', NULL),
(194, 71, 'Expense Item Bulk Delete', 'expense-item-bulk-delete', '2021-07-13 17:03:02', NULL),
(195, 71, 'Expense Item Report', 'expense-item-report', '2021-07-13 17:03:02', NULL),
(196, 72, 'Expense Access', 'expense-access', '2021-07-13 17:04:23', NULL),
(197, 72, 'Expense Add', 'expense-add', '2021-07-13 17:04:23', NULL),
(198, 72, 'Expense Edit', 'expense-edit', '2021-07-13 17:04:23', NULL),
(199, 72, 'Expense Delete', 'expense-delete', '2021-07-13 17:04:23', NULL),
(200, 72, 'Expense Bulk Delete', 'expense-bulk-delete', '2021-07-13 17:04:23', NULL),
(201, 72, 'Expense Report', 'expense-report', '2021-07-13 17:04:23', NULL),
(202, 72, 'Expense Approve', 'expense-approve', '2021-07-13 17:04:23', NULL),
(203, 73, 'Expense Statement Access', 'expense-statement-access', '2021-07-13 17:04:44', NULL),
(204, 63, 'Bank Access', 'bank-access', '2021-07-13 17:06:06', NULL),
(205, 63, 'Bank Add', 'bank-add', '2021-07-13 17:06:06', NULL),
(206, 63, 'Bank Edit', 'bank-edit', '2021-07-13 17:06:06', NULL),
(207, 63, 'Bank Delete', 'bank-delete', '2021-07-13 17:06:06', NULL),
(208, 63, 'Bank Report', 'bank-report', '2021-07-13 17:06:06', NULL),
(209, 64, 'Bank Transaction Access', 'bank-transaction-access', '2021-07-13 17:09:48', NULL),
(210, 65, 'Bank Ledger Access', 'bank-ledger-access', '2021-07-13 17:10:05', NULL),
(211, 67, 'Mobile Bank Access', 'mobile-bank-access', '2021-07-13 17:17:15', NULL),
(212, 67, 'Mobile Bank Add', 'mobile-bank-add', '2021-07-13 17:17:15', NULL),
(213, 67, 'Mobile Bank Edit', 'mobile-bank-edit', '2021-07-13 17:17:15', NULL),
(214, 67, 'Mobile Bank Delete', 'mobile-bank-delete', '2021-07-13 17:17:15', NULL),
(215, 67, 'Mobile Bank Bulk Delete', 'mobile-bank-bulk-delete', '2021-07-13 17:17:15', NULL),
(216, 67, 'Mobile Bank Report', 'mobile-bank-report', '2021-07-13 17:17:15', NULL),
(217, 68, 'Mobile Bank Transaction Access', 'mobile-bank-transaction-access', '2021-07-13 17:17:36', NULL),
(218, 69, 'Mobile Bank Ledger Access', 'mobile-bank-ledger-access', '2021-07-13 17:17:56', NULL),
(219, 58, 'District Access', 'district-access', '2021-07-13 17:26:47', NULL),
(220, 58, 'District Add', 'district-add', '2021-07-13 17:26:47', NULL),
(221, 58, 'District Edit', 'district-edit', '2021-07-13 17:26:47', NULL),
(222, 58, 'District Delete', 'district-delete', '2021-07-13 17:26:47', NULL),
(223, 58, 'District Bulk Delete', 'district-bulk-delete', '2021-07-13 17:26:47', NULL),
(224, 58, 'District Report', 'district-report', '2021-07-13 17:26:47', NULL),
(225, 59, 'Upazila Access', 'upazila-access', '2021-07-13 17:30:37', NULL),
(226, 59, 'Upazila Add', 'upazila-add', '2021-07-13 17:30:37', NULL),
(227, 59, 'Upazila Edit', 'upazila-edit', '2021-07-13 17:30:37', NULL),
(228, 59, 'Upazila Delete', 'upazila-delete', '2021-07-13 17:30:37', NULL),
(229, 59, 'Upazila Bulk Delete', 'upazila-bulk-delete', '2021-07-13 17:30:37', NULL),
(230, 59, 'Upazila Report', 'upazila-report', '2021-07-13 17:30:37', NULL),
(231, 60, 'Route Access', 'route-access', '2021-07-13 17:31:38', NULL),
(232, 60, 'Route Add', 'route-add', '2021-07-13 17:31:38', NULL),
(233, 60, 'Route Edit', 'route-edit', '2021-07-13 17:31:38', NULL),
(234, 60, 'Route Delete', 'route-delete', '2021-07-13 17:31:38', NULL),
(235, 60, 'Route Bulk Delete', 'route-bulk-delete', '2021-07-13 17:31:38', NULL),
(236, 60, 'Route Report', 'route-report', '2021-07-13 17:31:38', NULL),
(237, 61, 'Area Access', 'area-access', '2021-07-13 17:32:53', NULL),
(238, 61, 'Area Add', 'area-add', '2021-07-13 17:32:53', NULL),
(239, 61, 'Area Edit', 'area-edit', '2021-07-13 17:32:53', NULL),
(240, 61, 'Area Delete', 'area-delete', '2021-07-13 17:32:53', NULL),
(241, 61, 'Area Bulk Delete', 'area-bulk-delete', '2021-07-13 17:32:53', NULL),
(242, 61, 'Area Report', 'area-report', '2021-07-13 17:32:53', NULL),
(243, 55, 'ASM Access', 'asm-access', '2021-07-13 17:35:08', NULL),
(244, 55, 'ASM Add', 'asm-add', '2021-07-13 17:35:08', NULL),
(245, 55, 'ASM Edit', 'asm-edit', '2021-07-13 17:35:08', NULL),
(246, 55, 'ASM View', 'asm-view', '2021-07-13 17:35:08', NULL),
(247, 55, 'ASM Delete', 'asm-delete', '2021-07-13 17:35:08', NULL),
(248, 55, 'ASM Bulk Delete', 'asm-bulk-delete', '2021-07-13 17:35:08', NULL),
(249, 55, 'ASM Report', 'asm-report', '2021-07-13 17:35:08', NULL),
(251, 56, 'SR Access', 'sr-access', '2021-07-13 17:48:06', NULL),
(252, 56, 'SR Add', 'sr-add', '2021-07-13 17:48:06', NULL),
(253, 56, 'SR Edit', 'sr-edit', '2021-07-13 17:48:06', NULL),
(254, 56, 'SR View', 'sr-view', '2021-07-13 17:48:06', NULL),
(255, 56, 'SR Delete', 'sr-delete', '2021-07-13 17:48:06', NULL),
(256, 56, 'SR Bulk Delete', 'sr-bulk-delete', '2021-07-13 17:48:06', NULL),
(257, 56, 'SR Report', 'sr-report', '2021-07-13 17:48:06', NULL),
(258, 98, 'Department Access', 'department-access', '2021-04-03 18:20:33', NULL),
(259, 98, 'Department Add', 'department-add', '2021-04-03 18:20:33', NULL),
(260, 98, 'Department Edit', 'department-edit', '2021-04-03 18:20:33', NULL),
(261, 98, 'Department Delete', 'department-delete', '2021-04-03 18:20:33', NULL),
(262, 98, 'Department Bulk Delete', 'department-bulk-delete', '2021-04-03 18:20:33', NULL),
(263, 98, 'Department Report', 'department-report', '2021-04-03 18:20:33', NULL),
(264, 99, 'Division Access', 'division-access', '2021-04-03 18:21:27', NULL),
(265, 99, 'Division Add', 'division-add', '2021-04-03 18:21:27', NULL),
(266, 99, 'Division Edit', 'division-edit', '2021-04-03 18:21:27', NULL),
(267, 99, 'Division Delete', 'division-delete', '2021-04-03 18:21:27', NULL),
(268, 99, 'Division Bulk Delete', 'division-bulk-delete', '2021-04-03 18:21:27', NULL),
(269, 99, 'Division Report', 'division-report', '2021-04-03 18:21:27', NULL),
(270, 100, 'Designation Access', 'designation-access', '2021-04-03 18:22:20', NULL),
(271, 100, 'Designation Add', 'designation-add', '2021-04-03 18:22:20', NULL),
(272, 100, 'Designation Edit', 'designation-edit', '2021-04-03 18:22:20', NULL),
(273, 100, 'Designation Delete', 'designation-delete', '2021-04-03 18:22:20', NULL),
(274, 100, 'Designation Bulk Delete', 'designation-bulk-delete', '2021-04-03 18:22:20', NULL),
(275, 100, 'Designation Report', 'designation-report', '2021-04-03 18:22:20', NULL),
(276, 103, 'Employee Access', 'employee-access', '2021-04-03 18:23:18', NULL),
(277, 103, 'Employee Add', 'employee-add', '2021-04-03 18:23:18', NULL),
(278, 103, 'Employee Edit', 'employee-edit', '2021-04-03 18:23:18', NULL),
(279, 103, 'Employee View', 'employee-view', '2021-04-03 18:23:18', NULL),
(280, 103, 'Employee Delete', 'employee-delete', '2021-04-03 18:23:18', NULL),
(281, 103, 'Employee Bulk Delete', 'employee-bulk-delete', '2021-04-03 18:23:18', NULL),
(282, 103, 'Employee Report', 'employee-report', '2021-04-03 18:23:18', NULL),
(283, 105, 'Attendance Access', 'attendance-access', '2021-04-03 18:24:19', NULL),
(284, 105, 'Attendance Add', 'attendance-add', '2021-04-03 18:24:19', NULL),
(285, 105, 'Attendance Edit', 'attendance-edit', '2021-04-03 18:24:19', NULL),
(286, 105, 'Attendance Delete', 'attendance-delete', '2021-04-03 18:24:19', NULL),
(287, 105, 'Attendance Bulk Delete', 'attendance-bulk-delete', '2021-04-03 18:24:19', NULL),
(288, 105, 'Attendance Report', 'attendance-report', '2021-04-03 18:24:19', NULL),
(289, 106, 'Attendance Report Access', 'attendance-report-access', '2021-04-03 18:24:43', NULL),
(290, 113, 'Weekly Holiday Access', 'weekly-holiday-access', '2021-04-03 18:26:00', NULL),
(291, 113, 'Weekly Holiday Add', 'weekly-holiday-add', '2021-04-03 18:26:00', NULL),
(292, 113, 'Weekly Holiday Edit', 'weekly-holiday-edit', '2021-04-03 18:26:00', NULL),
(293, 113, 'Weekly Holiday Delete', 'weekly-holiday-delete', '2021-04-03 18:26:00', NULL),
(294, 113, 'Weekly Holiday Bulk Delete', 'weekly-holiday-bulk-delete', '2021-04-03 18:26:00', NULL),
(295, 113, 'Weekly Holiday Report', 'weekly-holiday-report', '2021-04-03 18:26:00', NULL),
(296, 114, 'Holiday Access', 'holiday-access', '2021-04-03 18:26:54', NULL),
(297, 114, 'Holiday Add', 'holiday-add', '2021-04-03 18:26:54', NULL),
(298, 114, 'Holiday Edit', 'holiday-edit', '2021-04-03 18:26:54', NULL),
(299, 114, 'Holiday Delete', 'holiday-delete', '2021-04-03 18:26:54', NULL),
(300, 114, 'Holiday Bulk Delete', 'holiday-bulk-delete', '2021-04-03 18:26:54', NULL),
(301, 114, 'Holiday Report', 'holiday-report', '2021-04-03 18:26:54', NULL),
(302, 115, 'Leave Type Access', 'leave-type-access', '2021-04-03 18:27:42', NULL),
(303, 115, 'Leave Type Add', 'leave-type-add', '2021-04-03 18:27:42', NULL),
(304, 115, 'Leave Type Edit', 'leave-type-edit', '2021-04-03 18:27:42', NULL),
(305, 115, 'Leave Type Delete', 'leave-type-delete', '2021-04-03 18:27:42', NULL),
(306, 115, 'Leave Type Bulk Delete', 'leave-type-bulk-delete', '2021-04-03 18:27:42', NULL),
(307, 115, 'Leave Type Report', 'leave-type-report', '2021-04-03 18:27:42', NULL),
(308, 116, 'Leave Application Access', 'leave-application-access', '2021-04-03 18:29:45', NULL),
(309, 116, 'Leave Application Add', 'leave-application-add', '2021-04-03 18:29:45', NULL),
(310, 116, 'Leave Application Edit', 'leave-application-edit', '2021-04-03 18:29:45', NULL),
(311, 116, 'Leave Application Delete', 'leave-application-delete', '2021-04-03 18:29:45', NULL),
(312, 116, 'Leave Application Bulk Delete', 'leave-application-bulk-delete', '2021-04-03 18:29:45', NULL),
(313, 116, 'Leave Application Report', 'leave-application-report', '2021-04-03 18:29:45', NULL),
(314, 116, 'Leave Application Approve', 'leave-application-approve', '2021-04-03 18:29:45', NULL),
(315, 108, 'Benifits Access', 'benifits-access', '2021-04-03 18:30:33', NULL),
(316, 108, 'Benifits Add', 'benifits-add', '2021-04-03 18:30:33', NULL),
(317, 108, 'Benifits Edit', 'benifits-edit', '2021-04-03 18:30:33', NULL),
(318, 108, 'Benifits Delete', 'benifits-delete', '2021-04-03 18:30:33', NULL),
(319, 108, 'Benifits Bulk Delete', 'benifits-bulk-delete', '2021-04-03 18:30:33', NULL),
(320, 108, 'Benifits Report', 'benifits-report', '2021-04-03 18:30:33', NULL),
(321, 110, 'Salary Setup Access', 'salary-setup-access', '2021-04-03 18:31:37', NULL),
(322, 110, 'Salary Setup Add', 'salary-setup-add', '2021-04-03 18:31:37', NULL),
(323, 110, 'Salary Setup Edit', 'salary-setup-edit', '2021-04-03 18:31:37', NULL),
(324, 110, 'Salary Setup View', 'salary-setup-view', '2021-04-03 18:31:37', NULL),
(325, 110, 'Salary Setup Delete', 'salary-setup-delete', '2021-04-03 18:31:37', NULL),
(326, 110, 'Salary Setup Bulk Delete', 'salary-setup-bulk-delete', '2021-04-03 18:31:37', NULL),
(327, 110, 'Salary Setup Report', 'salary-setup-report', '2021-04-03 18:31:37', NULL),
(328, 111, 'Salary Generate Access', 'salary-generate-access', '2021-04-03 18:35:39', NULL),
(329, 111, 'Salary Generate Add', 'salary-generate-add', '2021-04-03 18:35:39', NULL),
(330, 111, 'Salary Generate Delete', 'salary-generate-delete', '2021-04-03 18:35:39', NULL),
(331, 111, 'Salary Generate Bulk Delete', 'salary-generate-bulk-delete', '2021-04-03 18:35:39', NULL),
(332, 111, 'Salary Generate Report', 'salary-generate-report', '2021-04-03 18:35:39', NULL),
(333, 101, 'Shift Access', 'shift-access', '2021-04-26 01:14:07', NULL),
(334, 101, 'Shift Add', 'shift-add', '2021-04-26 01:14:07', NULL),
(335, 101, 'Shift Edit', 'shift-edit', '2021-04-26 01:14:07', NULL),
(336, 101, 'Shift Delete', 'shift-delete', '2021-04-26 01:14:07', NULL),
(337, 101, 'Shift Bulk Delete', 'shift-bulk-delete', '2021-04-26 01:14:07', NULL),
(338, 101, 'Shift Report', 'shift-report', '2021-04-26 01:14:07', NULL),
(339, 101, 'Shift Manage Access', 'shift-manage-access', '2021-04-26 01:14:07', NULL),
(340, 101, 'Shift Manage Add', 'shift-manage-add', '2021-04-26 01:14:07', NULL),
(341, 101, 'Shift Manage Edit', 'shift-manage-edit', '2021-04-26 01:14:07', NULL),
(342, 101, 'Shift Manage Delete', 'shift-manage-delete', '2021-04-26 01:14:07', NULL),
(343, 101, 'Shift Manage Bulk Delete', 'shift-manage-bulk-delete', '2021-04-26 01:14:07', NULL),
(344, 101, 'Shift Manage Report', 'shift-manage-report', '2021-04-26 01:14:07', NULL),
(345, 101, 'Employee Shift Change', 'employee-shift-change', '2021-04-26 17:24:58', NULL),
(354, 35, 'Production Operation', 'production-operation', '2021-08-06 17:14:21', NULL),
(355, 35, 'Production Transfer', 'production-transfer', '2021-08-06 17:14:21', NULL),
(356, 50, 'Supplier Advance Add', 'supplier-advance-add', '2021-08-11 08:05:49', NULL),
(357, 50, 'Supplier Advance Edit', 'supplier-advance-edit', '2021-08-11 08:05:49', NULL),
(358, 50, 'Supplier Advance Delete', 'supplier-advance-delete', '2021-08-11 08:05:49', NULL),
(359, 50, 'Supplier Advance Bulk Delete', 'supplier-advance-bulk-delete', '2021-08-11 08:05:49', NULL),
(360, 50, 'Supplier Advance Approve', 'supplier-advance-approve', '2021-08-11 08:05:49', NULL),
(364, 126, 'Finish Goods Access', 'finish-goods-access', '2021-08-12 12:57:26', NULL),
(365, 127, 'ASM Permission Access', 'asm-permission-access', '2021-08-14 04:32:25', NULL),
(366, 127, 'ASM Permission Add', 'asm-permission-add', '2021-08-14 04:32:25', NULL),
(367, 127, 'ASM Permission Edit', 'asm-permission-edit', '2021-08-14 04:32:25', NULL),
(368, 127, 'ASM Permission Delete', 'asm-permission-delete', '2021-08-14 04:32:25', NULL),
(369, 127, 'ASM Permission Bulk Delete', 'asm-permission-bulk-delete', '2021-08-14 04:32:25', NULL),
(370, 127, 'ASM Permission Report', 'asm-permission-report', '2021-08-14 04:32:25', NULL),
(371, 119, 'Dashboard Access', 'dashboard-access', '2021-08-14 04:54:25', NULL),
(372, 123, 'Product Access', 'product-access', '2021-08-14 04:54:54', NULL),
(373, 124, 'Product Stock Report Access', 'product-stock-report-access', '2021-08-14 04:55:19', NULL),
(374, 137, 'Sale Access', 'sale-access', '2021-08-16 06:28:48', NULL),
(375, 137, 'Sale Add', 'sale-add', '2021-08-16 06:28:48', NULL),
(376, 137, 'Sale Edit', 'sale-edit', '2021-08-16 06:28:48', NULL),
(377, 137, 'Sale View', 'sale-view', '2021-08-16 06:28:48', NULL),
(378, 137, 'Sale Delete', 'sale-delete', '2021-08-16 06:28:48', NULL),
(379, 137, 'Sale Export Button', 'sale-export-button', '2021-08-16 06:28:48', NULL),
(380, 134, 'Stock Transfer Access', 'stock-transfer-access', '2021-08-16 06:38:07', NULL),
(381, 139, 'Return Access', 'return-access', '2021-08-16 06:38:49', NULL),
(382, 140, 'Sale Return Access', 'sale-return-access', '2021-08-16 06:39:03', NULL),
(383, 129, 'Customer Access', 'customer-access', '2021-08-16 06:40:24', NULL),
(384, 129, 'Customer Add', 'customer-add', '2021-08-16 06:40:24', NULL),
(385, 129, 'Customer Edit', 'customer-edit', '2021-08-16 06:40:24', NULL),
(386, 129, 'Customer View', 'customer-view', '2021-08-16 06:40:24', NULL),
(387, 129, 'Customer Delete', 'customer-delete', '2021-08-16 06:40:24', NULL),
(388, 129, 'Customer Export Button', 'customer-export-button', '2021-08-16 06:40:24', NULL),
(389, 130, 'Customer Ledger Access', 'customer-ledger-access', '2021-08-16 06:40:53', NULL),
(390, 131, 'Credit Customer Access', 'credit-customer-access', '2021-08-16 06:41:16', NULL),
(391, 132, 'Paid Customer Access', 'paid-customer-access', '2021-08-16 06:41:40', NULL),
(392, 133, 'Customer Advance Access', 'customer-advance-access', '2021-08-16 06:42:40', NULL),
(393, 133, 'Customer Advance Add', 'customer-advance-add', '2021-08-16 06:42:40', NULL),
(394, 133, 'Customer Advance Edit', 'customer-advance-edit', '2021-08-16 06:42:40', NULL),
(395, 133, 'Customer Advance Delete', 'customer-advance-delete', '2021-08-16 06:42:40', NULL),
(396, 133, 'Customer Advance Export Button', 'customer-advance-export-button', '2021-08-16 06:42:40', NULL),
(397, 145, 'SR Access', 'sr-access', '2021-08-16 07:59:35', NULL),
(398, 145, 'SR Export Button', 'sr-export-button', '2021-08-16 07:59:35', NULL),
(399, 142, 'Upazila Access', 'upazila-access', '2021-08-16 08:00:51', NULL),
(400, 142, 'Upazila Add', 'upazila-add', '2021-08-16 08:00:51', NULL),
(401, 142, 'Upazila Edit', 'upazila-edit', '2021-08-16 08:00:51', NULL),
(402, 142, 'Upazila Delete', 'upazila-delete', '2021-08-16 08:00:51', NULL),
(403, 142, 'Upazila Export Button', 'upazila-export-button', '2021-08-16 08:00:51', NULL),
(404, 143, 'Route Access', 'route-access', '2021-08-16 08:01:53', NULL),
(405, 143, 'Route Add', 'route-add', '2021-08-16 08:01:53', NULL),
(406, 143, 'Route Edit', 'route-edit', '2021-08-16 08:01:53', NULL),
(407, 143, 'Route Delete', 'route-delete', '2021-08-16 08:01:53', NULL),
(408, 143, 'Route Export Button', 'route-export-button', '2021-08-16 08:01:53', NULL),
(409, 144, 'Area Access', 'area-access', '2021-08-16 08:02:56', NULL),
(410, 144, 'Area Add', 'area-add', '2021-08-16 08:02:56', NULL),
(411, 144, 'Area Edit', 'area-edit', '2021-08-16 08:02:56', NULL),
(412, 144, 'Area Delete', 'area-delete', '2021-08-16 08:02:56', NULL),
(413, 144, 'Area Export Button', 'area-export-button', '2021-08-16 08:02:56', NULL),
(414, 145, 'SR View', 'sr-view', '2021-08-16 10:50:22', NULL),
(415, 134, 'Stock Transfer Export Button', 'stock-transfer-export-button', '2021-08-17 19:23:27', NULL),
(418, 149, 'Expense Item Access', 'expense-item-access', '2021-08-23 16:33:55', NULL),
(419, 149, 'Expense Item Add', 'expense-item-add', '2021-08-23 16:33:55', NULL),
(420, 149, 'Expense Item Edit', 'expense-item-edit', '2021-08-23 16:33:55', NULL),
(421, 150, 'Expense Access', 'expense-access', '2021-08-23 16:34:50', NULL),
(422, 150, 'Expense Add', 'expense-add', '2021-08-23 16:34:50', NULL),
(423, 150, 'Expense Edit', 'expense-edit', '2021-08-23 16:34:50', NULL),
(424, 150, 'Expense Delete', 'expense-delete', '2021-08-23 16:34:50', NULL),
(425, 151, 'Expense Statement Access', 'expense-statement-access', '2021-08-23 16:38:04', NULL),
(426, 153, 'Sales Report Access', 'sales-report-access', '2021-08-23 16:38:35', NULL),
(427, 154, 'Inventory Report Access', 'inventory-report-access', '2021-08-23 16:45:08', NULL),
(430, 155, 'Todays Customer Receipt Access', 'todays-customer-receipt-access', '2021-08-23 17:36:21', NULL),
(431, 156, 'Customer Receipt List Access', 'customer-receipt-list-access', '2021-08-23 17:36:48', NULL),
(432, 157, 'Salesman Wise Sales Report Access', 'salesman-wise-sales-report-access', '2021-08-23 17:37:14', NULL),
(433, 158, 'Due Report Access', 'due-report-access', '2021-08-23 17:37:32', NULL),
(434, 159, 'Shipping Cost Report Access', 'shipping-cost-report-access', '2021-08-23 17:37:56', NULL),
(435, 160, 'Product Wise Sales Report Access', 'product-wise-sales-report-access', '2021-08-23 17:38:28', NULL),
(436, 161, 'Damage Report Access', 'damage-report-access', '2021-08-23 17:38:51', NULL),
(437, 162, 'Warehouse Expense Report', 'warehouse-expense-report', '2021-08-23 17:39:19', NULL),
(438, 163, 'Collection Report Access', 'collection-report-access', '2021-08-23 17:39:45', NULL),
(440, 165, 'Warehouse Summary Access', 'warehouse-summary-access', '2021-08-23 17:40:35', NULL),
(441, 166, 'Coupon Received Report Access', 'coupon-received-report-access', '2021-08-23 17:40:58', NULL),
(442, 168, 'Bank Access', 'bank-access', '2021-08-29 03:55:23', NULL),
(443, 169, 'Bank Transaction Access', 'bank-transaction-access', '2021-08-29 03:55:42', NULL),
(444, 170, 'Bank Ledger Access', 'bank-ledger-access', '2021-08-29 03:55:57', NULL),
(445, 172, 'Mobile Bank Access', 'mobile-bank-access', '2021-08-29 03:56:14', NULL),
(446, 173, 'Mobile Bank Transaction Access', 'mobile-bank-transaction-access', '2021-08-29 03:56:38', NULL),
(447, 174, 'Mobile Bank Ledger Access', 'mobile-bank-ledger-access', '2021-08-29 03:57:04', NULL),
(449, 176, 'Closing Access', 'closing-access', '2021-08-30 05:16:49', NULL),
(450, 177, 'Closing Report Access', 'closing-report-access', '2021-08-30 05:17:08', NULL),
(451, 178, 'Today Sales Report Access', 'today-sales-report-access', '2021-08-30 05:17:43', NULL),
(452, 180, 'Closing Access', 'closing-access', '2021-09-06 04:21:08', NULL),
(453, 181, 'Closing Report Access', 'closing-report-access', '2021-09-06 04:21:26', NULL),
(454, 182, 'Today Sales Report Access', 'today-sales-report-access', '2021-09-06 04:25:48', NULL),
(455, 183, 'Sales Report Access', 'sales-report-access', '2021-09-06 04:26:08', NULL),
(456, 184, 'Inventory Report Access', 'inventory-report-access', '2021-09-06 04:26:37', NULL),
(457, 185, 'Todays-customer-receipt-access', 'todays-customer-receipt-access', '2021-09-06 04:27:18', NULL),
(458, 186, 'Customer Receipt List Access', 'customer-receipt-list-access', '2021-09-06 04:27:40', NULL),
(459, 187, 'Salesman Wise Sales Report Access', 'salesman-wise-sales-report-access', '2021-09-06 04:28:10', NULL),
(460, 188, 'Due Report Access', 'due-report-access', '2021-09-06 04:28:26', NULL),
(461, 189, 'Shipping Cost Report Access', 'shipping-cost-report-access', '2021-09-06 04:28:49', NULL),
(462, 190, 'Product Wise Sales Report Access', 'product-wise-sales-report-access', '2021-09-06 04:29:23', NULL),
(465, 193, 'Collection Report Access', 'collection-report-access', '2021-09-06 04:31:04', NULL),
(466, 194, 'Warehouse Summary Access', 'warehouse-summary-access', '2021-09-06 04:31:26', NULL),
(468, 196, 'Material Stock Alert Report Access', 'material-stock-alert-report-access', '2021-09-06 04:32:12', '2021-09-06 18:30:08'),
(470, 199, 'Finish Goods Inventory Report Access', 'finish-goods-inventory-report-access', '2021-09-06 04:54:59', NULL),
(472, 198, 'Material Issue Report Access', 'material-issue-report-access', '2021-09-06 04:55:45', NULL),
(475, 203, 'Debit Voucher Access', 'debit-voucher-access', '2021-09-07 09:57:25', '2021-09-20 09:23:24'),
(476, 204, 'Credit Voucher Access', 'credit-voucher-access', '2021-09-07 09:59:32', '2021-09-20 09:28:19'),
(477, 46, 'Customer Advance Add', 'customer-advance-add', '2021-09-07 10:34:17', NULL),
(478, 46, 'Customer Advance Edit', 'customer-advance-edit', '2021-09-07 10:34:50', NULL),
(479, 46, 'Customer Advance Delete', 'customer-advance-delete', '2021-09-07 10:34:50', NULL),
(480, 206, 'Customer Receive Access', 'customer-receive-access', '2021-09-11 17:22:57', NULL),
(481, 221, 'Cash Adjustment Access', 'cash-adjustment-access', '2021-09-11 18:51:48', '2021-09-12 09:51:09'),
(482, 221, 'Cash Adjustment Add', 'cash-adjustment-add', '2021-09-11 18:51:48', '2021-09-12 09:51:21'),
(483, 221, 'Cash Adjustment Edit', 'cash-adjustment-edit', '2021-09-11 18:51:48', '2021-09-12 09:51:34'),
(484, 221, 'Cash Adjustment Delete', 'cash-adjustment-delete', '2021-09-11 18:51:48', '2021-09-12 09:51:51'),
(485, 209, 'Debit Voucher Access', 'debit-voucher-access', '2021-09-11 18:52:59', NULL),
(486, 209, 'Debit Voucher Add', 'debit-voucher-add', '2021-09-11 18:52:59', NULL),
(487, 209, 'Debit Voucher Edit', 'debit-voucher-edit', '2021-09-11 18:52:59', NULL),
(488, 209, 'Debit Voucher View', 'debit-voucher-view', '2021-09-11 18:52:59', NULL),
(489, 209, 'Debit Voucher Delete', 'debit-voucher-delete', '2021-09-11 18:52:59', NULL),
(490, 211, 'Credit Voucher Access', 'credit-voucher-access', '2021-09-11 18:53:52', NULL),
(491, 211, 'Credit Voucher Add', 'credit-voucher-add', '2021-09-11 18:53:52', NULL),
(492, 211, 'Credit Voucher Edit', 'credit-voucher-edit', '2021-09-11 18:53:52', NULL),
(493, 211, 'Credit Voucher View', 'credit-voucher-view', '2021-09-11 18:53:52', NULL),
(494, 211, 'Credit Voucher Delete', 'credit-voucher-delete', '2021-09-11 18:53:52', NULL),
(495, 213, 'Contra Voucher Access', 'contra-voucher-access', '2021-09-11 18:54:59', NULL),
(496, 213, 'Contra Voucher Add', 'contra-voucher-add', '2021-09-11 18:54:59', NULL),
(497, 213, 'Contra Voucher Edit', 'contra-voucher-edit', '2021-09-11 18:54:59', NULL),
(498, 213, 'Contra Voucher View', 'contra-voucher-view', '2021-09-11 18:54:59', NULL),
(499, 213, 'Contra Voucher Delete', 'contra-voucher-delete', '2021-09-11 18:54:59', NULL),
(500, 215, 'Journal Voucher Access', 'journal-voucher-access', '2021-09-11 18:55:57', NULL),
(501, 215, 'Journal Voucher Add', 'journal-voucher-add', '2021-09-11 18:55:57', NULL),
(502, 215, 'Journal Voucher Edit', 'journal-voucher-edit', '2021-09-11 18:55:57', NULL),
(503, 215, 'Journal Voucher View', 'journal-voucher-view', '2021-09-11 18:55:57', NULL),
(504, 215, 'Journal Voucher Delete', 'journal-voucher-delete', '2021-09-11 18:55:57', NULL),
(505, 217, 'Cash Book Access', 'cash-book-access', '2021-09-11 18:56:22', NULL),
(506, 218, 'Bank Book Access', 'bank-book-access', '2021-09-11 18:56:41', NULL),
(507, 219, 'Mobile Bank Book Access', 'mobile-bank-book-access', '2021-09-11 18:57:04', NULL),
(508, 220, 'General Ledger Access', 'general-ledger-access', '2021-09-11 18:57:28', NULL),
(509, 222, 'Cash Adjustment Access', 'cash-adjustment-access', '2021-09-12 10:44:26', NULL),
(510, 222, 'Cash Adjustment Add', 'cash-adjustment-add', '2021-09-12 10:44:26', NULL),
(511, 222, 'Cash Adjustment Edit', 'cash-adjustment-edit', '2021-09-12 10:44:26', NULL),
(512, 222, 'Cash Adjustment Delete', 'cash-adjustment-delete', '2021-09-12 10:44:26', NULL),
(513, 222, 'Cash Adjustment Approve', 'cash-adjustment-approve', '2021-09-12 10:44:26', NULL),
(514, 225, 'Personal Loan Person Access', 'personal-loan-person-access', '2021-09-13 04:57:47', NULL),
(515, 225, 'Personal Loan Person Add', 'personal-loan-person-add', '2021-09-13 04:57:47', NULL),
(516, 225, 'Personal Loan Person Edit', 'personal-loan-person-edit', '2021-09-13 04:57:47', NULL),
(517, 225, 'Personal Loan Person Delete', 'personal-loan-person-delete', '2021-09-13 04:57:47', NULL),
(518, 225, 'Personal Loan Person Bulk Delete', 'personal-loan-person-bulk-delete', '2021-09-13 04:57:47', NULL),
(519, 226, 'Personal Loan Access', 'personal-loan-access', '2021-09-13 04:58:30', NULL),
(520, 226, 'Personal Loan Add', 'personal-loan-add', '2021-09-13 04:58:30', NULL),
(521, 226, 'Personal Loan Edit', 'personal-loan-edit', '2021-09-13 04:58:30', NULL),
(522, 226, 'Personal Loan Delete', 'personal-loan-delete', '2021-09-13 04:58:30', NULL),
(523, 226, 'Personal Loan Bulk Delete', 'personal-loan-bulk-delete', '2021-09-13 04:58:30', NULL),
(524, 227, 'Personal Loan Installment Access', 'personal-loan-installment-access', '2021-09-13 04:59:11', NULL),
(525, 227, 'Personal Loan Installment Add', 'personal-loan-installment-add', '2021-09-13 04:59:11', NULL),
(526, 227, 'Personal Loan Installment Edit', 'personal-loan-installment-edit', '2021-09-13 04:59:11', NULL),
(527, 227, 'Personal Loan Installment Delete', 'personal-loan-installment-delete', '2021-09-13 04:59:11', NULL),
(528, 227, 'Personal Loan Installment Bulk Delete', 'personal-loan-installment-bulk-delete', '2021-09-13 04:59:11', NULL),
(529, 229, 'Official Loan Access', 'official-loan-access', '2021-09-13 05:00:02', NULL),
(530, 229, 'Official Loan Add', 'official-loan-add', '2021-09-13 05:00:02', NULL),
(531, 229, 'Official Loan Edit', 'official-loan-edit', '2021-09-13 05:00:02', NULL),
(532, 229, 'Official Loan Delete', 'official-loan-delete', '2021-09-13 05:00:02', NULL),
(533, 229, 'Official Loan Bulk Delete', 'official-loan-bulk-delete', '2021-09-13 05:00:02', NULL),
(534, 230, 'Official Loan Installment Access', 'official-loan-installment-access', '2021-09-13 05:00:43', NULL),
(535, 230, 'Official Loan Installment Add', 'official-loan-installment-add', '2021-09-13 05:00:43', NULL),
(536, 230, 'Official Loan Installment Edit', 'official-loan-installment-edit', '2021-09-13 05:00:43', NULL),
(537, 230, 'Official Loan Installment Delete', 'official-loan-installment-delete', '2021-09-13 05:00:43', NULL),
(538, 230, 'Official Loan Installment Bulk Delete', 'official-loan-installment-bulk-delete', '2021-09-13 05:00:43', NULL),
(539, 232, 'Loan Report Access', 'loan-report-access', '2021-09-13 05:01:11', NULL),
(540, 233, 'Balance Sheet Access', 'balance-sheet-access', '2021-09-13 05:22:33', NULL),
(541, 111, 'Salary Payment Access', 'salary-payment-access', '2021-09-13 08:29:23', NULL),
(542, 42, 'Customer Edit', 'customer-edit', '2021-09-14 10:04:06', '2021-09-22 04:20:43'),
(543, 42, 'Customer View', 'customer-view', '2021-09-14 10:04:06', '2021-09-22 04:20:55'),
(544, 203, 'Debit Voucher Add', 'debit-voucher-add', '2021-09-20 09:24:08', NULL),
(545, 204, 'Credit Voucher Add', 'credit-voucher-add', '2021-09-20 09:28:51', NULL),
(546, 42, 'Customer Delete', 'customer-delete', '2021-09-22 04:21:13', NULL),
(547, 236, 'Sale Access', 'sale-access', '2021-09-22 09:21:37', NULL),
(548, 236, 'Sale Add', 'sale-add', '2021-09-22 09:21:37', NULL),
(549, 236, 'Sale Edit', 'sale-edit', '2021-09-22 09:21:37', NULL),
(550, 236, 'Sale View', 'sale-view', '2021-09-22 09:21:37', NULL),
(551, 236, 'Sale Delete', 'sale-delete', '2021-09-22 09:21:37', NULL),
(552, 236, 'Sale Bulk Delete', 'sale-bulk-delete', '2021-09-22 09:21:37', NULL),
(553, 237, 'Sale Return Access', 'sale-return-access', '2021-09-23 04:39:13', NULL),
(554, 237, 'Sale Return Add', 'sale-return-add', '2021-09-23 04:39:13', NULL),
(555, 237, 'Sale Return View', 'sale-return-view', '2021-09-23 04:39:13', NULL),
(556, 237, 'Sale Return Delete', 'sale-return-delete', '2021-09-23 04:39:13', NULL),
(557, 239, 'SR Commission Report Access', 'sr-commission-report-access', '2021-09-23 08:31:23', NULL),
(558, 238, 'Product Stock Alert Report Access', 'product-stock-alert-report-access', '2021-09-23 10:12:15', NULL),
(559, 240, 'Invoice Report Access', 'invoice-report-access', '2021-10-03 05:44:41', NULL),
(560, 241, 'Salesmen Payment Access', 'salesmen-payment-access', '2021-10-03 09:57:18', NULL),
(561, 242, 'Salesmen Ledger Access', 'salesmen-ledger-access', '2021-10-03 11:40:46', NULL),
(562, 245, 'Damage Access', 'damage-access', '2021-10-05 09:14:28', NULL),
(563, 245, 'Damage Add', 'damage-add', '2021-10-06 07:45:13', NULL),
(564, 247, 'Material Stock Ledger Access', 'material-stock-ledger-access', '2021-10-07 06:59:00', NULL),
(565, 247, 'Material Stock Ledger Cost View', 'material-stock-ledger-cost-view', '2021-10-07 06:59:00', NULL),
(566, 249, 'Product Ledger Access', 'product-ledger-access', '2021-10-07 08:47:59', NULL),
(567, 249, 'Product Stock Ledger Price View', 'product-stock-ledger-price-view', '2021-10-07 08:47:59', NULL),
(568, 203, 'Debit Voucher View', 'debit-voucher-view', '2021-10-13 11:18:33', NULL),
(569, 203, 'Debit Voucher Delete', 'debit-voucher-delete', '2021-10-13 11:18:33', NULL),
(570, 204, 'Credit Voucher View', 'credit-voucher-view', '2021-10-13 11:19:06', NULL),
(571, 204, 'Credit Voucher Delete', 'credit-voucher-delete', '2021-10-13 11:19:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(2, 58, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(3, 59, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(4, 60, 2, '2021-08-13 13:57:37', '2021-08-13 13:57:37'),
(5, 61, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(6, 62, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(7, 63, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(8, 64, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(9, 65, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(10, 66, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(11, 67, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(12, 68, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(13, 69, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(14, 70, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(15, 71, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(16, 80, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(17, 81, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(18, 82, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(19, 83, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(20, 84, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(21, 85, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(28, 92, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(29, 93, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(30, 94, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(31, 95, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(32, 96, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(33, 97, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(34, 98, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(35, 99, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(36, 100, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(37, 101, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(38, 102, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(39, 103, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(40, 104, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(41, 105, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(42, 106, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(43, 107, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(44, 109, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(45, 110, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(46, 111, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(47, 112, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(48, 113, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(49, 114, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(50, 115, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(51, 354, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(52, 355, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(53, 364, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(54, 140, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(55, 141, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(56, 142, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(57, 143, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(58, 144, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(59, 145, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(60, 146, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(61, 147, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(62, 148, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(63, 356, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(64, 357, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(65, 358, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(66, 359, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(67, 360, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(68, 219, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(69, 220, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(70, 221, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(71, 222, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(72, 223, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(73, 224, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(74, 225, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(75, 226, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(76, 227, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(77, 228, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(78, 229, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(79, 230, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(80, 231, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(81, 232, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(82, 233, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(83, 234, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(84, 235, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(85, 236, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(86, 237, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(87, 238, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(88, 239, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(89, 240, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(90, 241, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(91, 242, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(92, 2, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(93, 3, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(94, 4, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(95, 5, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(96, 6, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(97, 7, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(98, 8, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(99, 9, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(100, 10, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(101, 11, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(102, 12, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(103, 13, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(104, 14, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(105, 15, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(106, 243, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(107, 244, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(108, 245, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(109, 246, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(110, 247, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(111, 248, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(112, 249, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(114, 251, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(115, 252, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(116, 253, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(117, 254, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(118, 255, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(119, 256, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(120, 257, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(121, 39, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(122, 33, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(123, 34, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(124, 35, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(125, 36, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(126, 37, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(127, 38, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(128, 40, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(129, 41, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(130, 42, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(131, 43, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(132, 44, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(133, 45, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(134, 46, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(135, 47, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(136, 48, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(137, 49, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(138, 50, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(139, 51, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(140, 52, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(141, 53, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(142, 54, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(143, 55, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(144, 56, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(145, 57, 2, '2021-08-13 13:57:38', '2021-08-13 13:57:38'),
(146, 73, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(147, 74, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(148, 75, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(149, 76, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(150, 77, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(151, 78, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(152, 79, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(153, 124, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(154, 130, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(155, 131, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(156, 132, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(157, 133, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(158, 134, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(159, 139, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(160, 477, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(161, 478, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(162, 479, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(166, 152, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(167, 153, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(168, 154, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(169, 155, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(170, 156, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(174, 160, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(175, 161, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(176, 162, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(177, 163, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(178, 164, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(179, 165, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(180, 166, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(181, 509, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(182, 510, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(183, 511, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(184, 512, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(185, 513, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(187, 475, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(189, 476, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(190, 170, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(191, 171, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(192, 172, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(193, 173, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(194, 174, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(195, 175, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(196, 176, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(197, 177, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(198, 178, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(199, 179, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(200, 180, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(201, 181, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(202, 182, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(203, 183, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(204, 184, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(205, 185, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(206, 186, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(207, 187, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(208, 188, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(209, 189, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(210, 540, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(211, 514, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(212, 515, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(213, 516, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(214, 517, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(215, 518, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(216, 519, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(217, 520, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(218, 521, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(219, 522, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(220, 523, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(221, 524, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(222, 525, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(223, 526, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(224, 527, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(225, 528, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(226, 529, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(227, 530, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(228, 531, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(229, 532, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(230, 533, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(231, 534, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(232, 535, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(233, 536, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(234, 537, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(235, 538, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(236, 539, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(237, 258, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(238, 259, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(239, 260, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(240, 261, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(241, 262, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(242, 263, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(243, 264, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(244, 265, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(245, 266, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(246, 267, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(247, 268, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(248, 269, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(249, 270, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(250, 271, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(251, 272, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(252, 273, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(253, 274, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(254, 275, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(255, 333, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(256, 334, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(257, 335, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(258, 336, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(259, 337, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(260, 338, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(261, 339, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(262, 340, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(263, 341, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(264, 342, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(265, 343, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(266, 344, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(267, 345, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(268, 276, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(269, 277, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(270, 278, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(271, 279, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(272, 280, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(273, 281, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(274, 282, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(275, 283, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(276, 284, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(277, 285, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(278, 286, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(279, 287, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(280, 288, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(281, 289, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(282, 290, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(283, 291, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(284, 292, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(285, 293, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(286, 294, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(287, 295, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(288, 296, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(289, 297, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(290, 298, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(291, 299, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(292, 300, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(293, 301, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(294, 302, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(295, 303, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(296, 304, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(297, 305, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(298, 306, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(299, 307, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(300, 308, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(301, 309, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(302, 310, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(303, 311, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(304, 312, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(305, 313, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(306, 314, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(307, 315, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(308, 316, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(309, 317, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(310, 318, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(311, 319, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(312, 320, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(313, 321, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(314, 322, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(315, 323, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(316, 324, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(317, 325, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(318, 326, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(319, 327, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(320, 328, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(321, 329, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(322, 330, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(323, 331, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(324, 332, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(325, 541, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(326, 190, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(327, 191, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(328, 192, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(329, 193, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(330, 194, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(331, 195, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(332, 196, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(333, 197, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(334, 198, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(335, 199, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(336, 200, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(337, 201, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(338, 202, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(339, 203, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(340, 204, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(341, 205, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(342, 206, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(343, 207, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(344, 208, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(345, 209, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(346, 210, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(347, 211, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(348, 212, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(349, 213, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(350, 214, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(351, 215, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(352, 216, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(353, 217, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(354, 218, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(355, 452, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(356, 453, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(358, 454, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(359, 455, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(360, 456, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(361, 457, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(362, 458, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(363, 459, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(364, 460, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(365, 461, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(366, 462, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(369, 465, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(370, 466, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(373, 470, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(375, 472, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(376, 468, 2, '2021-09-13 19:18:44', '2021-09-13 19:18:44'),
(377, 542, 2, '2021-09-14 11:45:19', '2021-09-14 11:45:19'),
(378, 543, 2, '2021-09-14 11:45:19', '2021-09-14 11:45:19'),
(379, 544, 2, '2021-09-20 09:42:13', '2021-09-20 09:42:13'),
(380, 545, 2, '2021-09-20 09:42:13', '2021-09-20 09:42:13'),
(381, 547, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(382, 548, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(383, 549, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(384, 550, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(385, 551, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(386, 552, 2, '2021-09-23 06:57:20', '2021-09-23 06:57:20'),
(387, 553, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(388, 554, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(389, 555, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(390, 556, 2, '2021-09-23 06:57:41', '2021-09-23 06:57:41'),
(391, 564, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(392, 565, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(393, 566, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(394, 567, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(395, 559, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(396, 562, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(397, 563, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(398, 546, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(399, 560, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(400, 557, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(401, 558, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(402, 561, 2, '2021-10-13 10:19:18', '2021-10-13 10:19:18'),
(403, 568, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(404, 569, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(405, 570, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34'),
(406, 571, 2, '2021-10-13 05:29:34', '2021-10-13 05:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `productions`
--

CREATE TABLE `productions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Approved, 2=Pending,3=Rejevted',
  `production_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending,2=Processing,3=Finished',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productions`
--

INSERT INTO `productions` (`id`, `batch_no`, `warehouse_id`, `start_date`, `end_date`, `item`, `status`, `production_status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(2, '1001', 1, '2021-10-11', '2021-10-11', '1', '1', '3', 'Super Admin', 'Super Admin', '2021-10-11 14:50:15', '2021-10-11 14:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `production_products`
--

CREATE TABLE `production_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `mfg_date` date NOT NULL,
  `exp_date` date NOT NULL,
  `base_unit_qty` double DEFAULT NULL,
  `per_unit_cost` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_products`
--

INSERT INTO `production_products` (`id`, `production_id`, `product_id`, `year`, `mfg_date`, `exp_date`, `base_unit_qty`, `per_unit_cost`, `created_at`, `updated_at`) VALUES
(2, 2, 1, 1, '2021-10-11', '2022-10-11', 195, 12, '2021-10-11 14:50:15', '2021-10-11 14:51:11');

-- --------------------------------------------------------

--
-- Table structure for table `production_product_materials`
--

CREATE TABLE `production_product_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_product_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double(8,2) DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `used_qty` double(8,2) DEFAULT NULL,
  `damaged_qty` double(8,2) DEFAULT NULL,
  `odd_qty` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_product_materials`
--

INSERT INTO `production_product_materials` (`id`, `production_product_id`, `material_id`, `unit_id`, `qty`, `cost`, `total`, `used_qty`, `damaged_qty`, `odd_qty`, `created_at`, `updated_at`) VALUES
(3, 2, 1, 2, 10.00, 210.00, 2100.00, 9.50, 0.50, 0.00, '2021-10-11 14:50:15', '2021-10-11 14:51:11'),
(4, 2, 2, 1, 10.00, 24.00, 240.00, 10.00, 0.00, 0.00, '2021-10-11 14:50:15', '2021-10-11 14:51:11');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `barcode_symbology` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Base Unit wise cost',
  `base_unit_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Base Unit wise Price',
  `unit_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Base Unit wise Price',
  `base_unit_qty` double DEFAULT NULL,
  `unit_qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_method` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Exclusive, 2=Inclusive',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `category_id`, `barcode_symbology`, `base_unit_id`, `unit_id`, `cost`, `base_unit_price`, `unit_price`, `base_unit_qty`, `unit_qty`, `alert_quantity`, `image`, `tax_id`, `tax_method`, `status`, `description`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Turmeric Powder 50gm', '48369503', 7, 'C128', 1, 6, NULL, '20', '120', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, 'Super Admin', NULL, '2021-10-11 11:55:12', '2021-10-11 11:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_material`
--

CREATE TABLE `product_material` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_material`
--

INSERT INTO `product_material` (`id`, `product_id`, `material_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-10-11 11:55:13', '2021-10-11 11:55:13'),
(2, 1, 2, '2021-10-11 11:55:13', '2021-10-11 11:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `item` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_labor_cost` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `due_amount` double NOT NULL,
  `purchase_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Received,2=Partial,3=Pending,4=Ordered',
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `purchase_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `memo_no`, `warehouse_id`, `supplier_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_labor_cost`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `due_amount`, `purchase_status`, `payment_status`, `payment_method`, `document`, `note`, `purchase_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'PINV-1001', 1, 1, 1.00, 100.00, 0, 0, 1000, 19000, 0, 0, NULL, 2000, 21000, 0, 21000, '1', '3', '1', NULL, NULL, '2021-10-11', 'Super Admin', 'Super Admin', '2021-10-11 11:19:11', '2021-10-11 12:37:08'),
(2, 'PINV-1002', 1, 2, 1.00, 100.00, 0, 0, 200, 2200, 0, 0, 0, 200, 2400, 0, 2400, '1', '3', '1', NULL, NULL, '2021-10-11', 'Super Admin', 'Super Admin', '2021-10-11 11:20:10', '2021-10-11 12:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_debit_transaction_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `cheque_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_price` double NOT NULL,
  `total_deduction` double DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `return_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_materials`
--

CREATE TABLE `purchase_return_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `return_qty` double NOT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `material_rate` double NOT NULL,
  `deduction_rate` double DEFAULT NULL,
  `deduction_amount` double DEFAULT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '1', NULL, NULL, NULL, NULL),
(2, 'Admin', '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salary_generates`
--

CREATE TABLE `salary_generates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `salary_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `allowance_amount` double DEFAULT NULL,
  `deduction_amount` double DEFAULT NULL,
  `absent` double DEFAULT NULL,
  `absent_amount` double DEFAULT NULL,
  `late_count` double DEFAULT NULL,
  `leave` double DEFAULT NULL,
  `leave_amount` double DEFAULT NULL,
  `ot_hour` double DEFAULT NULL,
  `ot_day` double DEFAULT NULL,
  `ot_amount` double DEFAULT NULL,
  `gross_salary` double DEFAULT NULL,
  `add_deduct_amount` double DEFAULT NULL,
  `adjusted_advance_amount` double DEFAULT NULL,
  `adjusted_loan_amount` double DEFAULT NULL,
  `net_salary` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `salary_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Received,2=Partial,3=Pending,4=Ordered',
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Cash,2=Cheque,3=Mobile',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_generate_payments`
--

CREATE TABLE `salary_generate_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `salary_generated_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `employee_transaction_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` date DEFAULT NULL,
  `voucher_date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `cheque_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_incements`
--

CREATE TABLE `salary_incements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `inc_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `previous_basic` double NOT NULL,
  `current_basic` double NOT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `upazila_id` bigint(20) UNSIGNED NOT NULL,
  `route_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `salesmen_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `item` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `total_free_qty` double DEFAULT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `labor_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `previous_due` double DEFAULT NULL,
  `net_total` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `due_amount` double DEFAULT NULL,
  `sr_commission_rate` float DEFAULT NULL,
  `total_commission` double DEFAULT NULL,
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Cash,2=Bank,3=Mobile Bank',
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_no` text COLLATE utf8mb4_unicode_ci,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `sale_date` date NOT NULL,
  `delivery_status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending,2=Delivered',
  `delivery_date` date DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `memo_no`, `warehouse_id`, `district_id`, `upazila_id`, `route_id`, `area_id`, `salesmen_id`, `customer_id`, `item`, `total_qty`, `total_free_qty`, `total_discount`, `total_tax`, `total_price`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `labor_cost`, `grand_total`, `previous_due`, `net_total`, `paid_amount`, `due_amount`, `sr_commission_rate`, `total_commission`, `payment_status`, `payment_method`, `account_id`, `reference_no`, `document`, `note`, `sale_date`, `delivery_status`, `delivery_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'SINV-211011121', 1, 1, 70, 573, 583, 1, 1, 1.00, 10.00, 0, 0, 0, 200, 0, 0, 0, 0, 0, 200, 0, 200, 200, 0, 2.5, 5, '1', '1', 23, NULL, NULL, NULL, '2021-10-11', '1', NULL, 'Super Admin', NULL, '2021-10-11 16:22:46', '2021-10-11 16:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `salesmen`
--

CREATE TABLE `salesmen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `upazila_id` bigint(20) UNSIGNED NOT NULL,
  `nid_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_target_value` double DEFAULT NULL,
  `cpr` float DEFAULT NULL COMMENT 'cpr = commission percentage rate',
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesmen`
--

INSERT INTO `salesmen` (`id`, `name`, `username`, `phone`, `additional_phone`, `email`, `avatar`, `password`, `warehouse_id`, `district_id`, `upazila_id`, `nid_no`, `monthly_target_value`, `cpr`, `address`, `status`, `created_by`, `modified_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mohammad Arman', 'arman', '01521225987', NULL, NULL, NULL, '$2y$10$/JTYyx9SUWKX..WCWgWlJuGUJ4qLTQ2b7GY/rL2zhBHZ1TYR.KGzu', 1, 1, 70, NULL, 20000, 2.5, 'Lorem Ipsum Dollar', '1', 'Super Admin', NULL, NULL, '2021-10-11 07:56:35', '2021-10-11 07:56:35'),
(2, 'Md. Shahed', 'shahed', '01521225985', NULL, NULL, NULL, '$2y$10$aOxF3Vwgs0AFx1JDsHISmenswWFQpepXbbCAVYC8q1lUbuH4/SYle', 1, 1, 70, NULL, 20000, 2, NULL, '1', 'Super Admin', 'Super Admin', NULL, '2021-10-11 09:42:17', '2021-10-11 09:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `sales_men_daily_routes`
--

CREATE TABLE `sales_men_daily_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `salesmen_id` bigint(20) UNSIGNED NOT NULL,
  `day` enum('1','2','3','4','5','6') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Sat,2=Sun,3=Mon,4=Tue,5=Wed,6=Thu',
  `route_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_men_daily_routes`
--

INSERT INTO `sales_men_daily_routes` (`id`, `salesmen_id`, `day`, `route_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 573, '2021-10-11 07:56:35', '2021-10-11 07:56:35'),
(2, 1, '2', 574, '2021-10-11 07:56:35', '2021-10-11 07:56:35'),
(3, 1, '3', 575, '2021-10-11 07:56:35', '2021-10-11 07:56:35'),
(4, 1, '4', 576, '2021-10-11 07:56:35', '2021-10-11 07:56:35'),
(5, 1, '5', 577, '2021-10-11 07:56:35', '2021-10-11 07:56:35'),
(6, 1, '6', 578, '2021-10-11 07:56:35', '2021-10-11 07:56:35'),
(7, 2, '1', 573, '2021-10-11 09:42:17', '2021-10-11 09:42:36'),
(8, 2, '2', 574, '2021-10-11 09:42:17', '2021-10-11 09:42:36'),
(9, 2, '3', 575, '2021-10-11 09:42:17', '2021-10-11 09:42:36'),
(10, 2, '4', 576, '2021-10-11 09:42:17', '2021-10-11 09:42:36'),
(11, 2, '5', 577, '2021-10-11 09:42:17', '2021-10-11 09:42:36'),
(12, 2, '6', 578, '2021-10-11 09:42:17', '2021-10-11 09:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `sale_products`
--

CREATE TABLE `sale_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `free_qty` double DEFAULT NULL,
  `sale_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_products`
--

INSERT INTO `sale_products` (`id`, `sale_id`, `product_id`, `qty`, `free_qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 0, 1, 20, 0, 0, 0, 200, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sale_returns`
--

CREATE TABLE `sale_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_price` double NOT NULL,
  `total_deduction` double DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `deducted_sr_commission` float DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `return_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_returns`
--

INSERT INTO `sale_returns` (`id`, `return_no`, `memo_no`, `warehouse_id`, `customer_id`, `total_price`, `total_deduction`, `tax_rate`, `total_tax`, `grand_total`, `deducted_sr_commission`, `reason`, `date`, `return_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(2, 'SRINV-211013798', 'SINV-211011121', 1, 1, 100, 0, NULL, 0, 100, 2.5, NULL, '2021-10-11', '2021-10-13', 'Admin', NULL, '2021-10-13 09:37:14', '2021-10-13 09:37:14');

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_products`
--

CREATE TABLE `sale_return_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `return_qty` double NOT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_rate` double NOT NULL,
  `deduction_rate` double DEFAULT NULL,
  `deduction_amount` double DEFAULT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_return_products`
--

INSERT INTO `sale_return_products` (`id`, `sale_return_id`, `memo_no`, `batch_no`, `product_id`, `return_qty`, `unit_id`, `product_rate`, `deduction_rate`, `deduction_amount`, `total`, `created_at`, `updated_at`) VALUES
(2, 2, 'SINV-211011121', '', 1, 5, 1, 20, NULL, NULL, 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('DJ7WKXFpcBeTTy547DotHoxM2xrJpm9y2pOLWzGs', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiM1Z3aHY4NHl1OExXNXR2clByOGE1V05Vd05TbmZBbm1xUjNFdjJkRiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vYmRzdGFyLnRlc3QvbWVudS9idWlsZGVyLzEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTU6InVzZXJfcGVybWlzc2lvbiI7YTo0MDc6e2k6MDtzOjE2OiJkYXNoYm9hcmQtYWNjZXNzIjtpOjE7czoxMToidXNlci1hY2Nlc3MiO2k6MjtzOjg6InVzZXItYWRkIjtpOjM7czo5OiJ1c2VyLWVkaXQiO2k6NDtzOjk6InVzZXItdmlldyI7aTo1O3M6MTE6InVzZXItZGVsZXRlIjtpOjY7czoxNjoidXNlci1idWxrLWRlbGV0ZSI7aTo3O3M6MTE6InVzZXItcmVwb3J0IjtpOjg7czoxMToicm9sZS1hY2Nlc3MiO2k6OTtzOjg6InJvbGUtYWRkIjtpOjEwO3M6OToicm9sZS1lZGl0IjtpOjExO3M6OToicm9sZS12aWV3IjtpOjEyO3M6MTE6InJvbGUtZGVsZXRlIjtpOjEzO3M6MTY6InJvbGUtYnVsay1kZWxldGUiO2k6MTQ7czoxMToicm9sZS1yZXBvcnQiO2k6MTU7czoxMToibWVudS1hY2Nlc3MiO2k6MTY7czo4OiJtZW51LWFkZCI7aToxNztzOjk6Im1lbnUtZWRpdCI7aToxODtzOjExOiJtZW51LWRlbGV0ZSI7aToxOTtzOjE2OiJtZW51LWJ1bGstZGVsZXRlIjtpOjIwO3M6MTE6Im1lbnUtcmVwb3J0IjtpOjIxO3M6MTk6Im1lbnUtYnVpbGRlci1hY2Nlc3MiO2k6MjI7czoxNToibWVudS1tb2R1bGUtYWRkIjtpOjIzO3M6MTY6Im1lbnUtbW9kdWxlLWVkaXQiO2k6MjQ7czoxODoibWVudS1tb2R1bGUtZGVsZXRlIjtpOjI1O3M6MTc6InBlcm1pc3Npb24tYWNjZXNzIjtpOjI2O3M6MTQ6InBlcm1pc3Npb24tYWRkIjtpOjI3O3M6MTU6InBlcm1pc3Npb24tZWRpdCI7aToyODtzOjE3OiJwZXJtaXNzaW9uLWRlbGV0ZSI7aToyOTtzOjIyOiJwZXJtaXNzaW9uLWJ1bGstZGVsZXRlIjtpOjMwO3M6MTc6InBlcm1pc3Npb24tcmVwb3J0IjtpOjMxO3M6MjI6ImdlbmVyYWwtc2V0dGluZy1hY2Nlc3MiO2k6MzI7czoxNjoid2FyZWhvdXNlLWFjY2VzcyI7aTozMztzOjEzOiJ3YXJlaG91c2UtYWRkIjtpOjM0O3M6MTQ6IndhcmVob3VzZS1lZGl0IjtpOjM1O3M6MTY6IndhcmVob3VzZS1kZWxldGUiO2k6MzY7czoyMToid2FyZWhvdXNlLWJ1bGstZGVsZXRlIjtpOjM3O3M6MTY6IndhcmVob3VzZS1yZXBvcnQiO2k6Mzg7czoyMToiY3VzdG9tZXItZ3JvdXAtYWNjZXNzIjtpOjM5O3M6MTg6ImN1c3RvbWVyLWdyb3VwLWFkZCI7aTo0MDtzOjE5OiJjdXN0b21lci1ncm91cC1lZGl0IjtpOjQxO3M6MjE6ImN1c3RvbWVyLWdyb3VwLWRlbGV0ZSI7aTo0MjtzOjI2OiJjdXN0b21lci1ncm91cC1idWxrLWRlbGV0ZSI7aTo0MztzOjIxOiJjdXN0b21lci1ncm91cC1yZXBvcnQiO2k6NDQ7czoxMToidW5pdC1hY2Nlc3MiO2k6NDU7czo4OiJ1bml0LWFkZCI7aTo0NjtzOjk6InVuaXQtZWRpdCI7aTo0NztzOjExOiJ1bml0LWRlbGV0ZSI7aTo0ODtzOjE2OiJ1bml0LWJ1bGstZGVsZXRlIjtpOjQ5O3M6MTE6InVuaXQtcmVwb3J0IjtpOjUwO3M6MTA6InRheC1hY2Nlc3MiO2k6NTE7czo3OiJ0YXgtYWRkIjtpOjUyO3M6ODoidGF4LWVkaXQiO2k6NTM7czoxMDoidGF4LWRlbGV0ZSI7aTo1NDtzOjE1OiJ0YXgtYnVsay1kZWxldGUiO2k6NTU7czoxMDoidGF4LXJlcG9ydCI7aTo1NjtzOjI0OiJtYXRlcmlhbC1jYXRlZ29yeS1hY2Nlc3MiO2k6NTc7czoyMToibWF0ZXJpYWwtY2F0ZWdvcnktYWRkIjtpOjU4O3M6MjI6Im1hdGVyaWFsLWNhdGVnb3J5LWVkaXQiO2k6NTk7czoyNDoibWF0ZXJpYWwtY2F0ZWdvcnktZGVsZXRlIjtpOjYwO3M6Mjk6Im1hdGVyaWFsLWNhdGVnb3J5LWJ1bGstZGVsZXRlIjtpOjYxO3M6MjQ6Im1hdGVyaWFsLWNhdGVnb3J5LXJlcG9ydCI7aTo2MjtzOjE1OiJtYXRlcmlhbC1hY2Nlc3MiO2k6NjM7czoxMjoibWF0ZXJpYWwtYWRkIjtpOjY0O3M6MTM6Im1hdGVyaWFsLWVkaXQiO2k6NjU7czoxMzoibWF0ZXJpYWwtdmlldyI7aTo2NjtzOjE1OiJtYXRlcmlhbC1kZWxldGUiO2k6Njc7czoyMDoibWF0ZXJpYWwtYnVsay1kZWxldGUiO2k6Njg7czoxNToibWF0ZXJpYWwtcmVwb3J0IjtpOjY5O3M6Mjg6Im1hdGVyaWFsLXN0b2NrLXJlcG9ydC1hY2Nlc3MiO2k6NzA7czoxNToicHVyY2hhc2UtYWNjZXNzIjtpOjcxO3M6MTI6InB1cmNoYXNlLWFkZCI7aTo3MjtzOjEzOiJwdXJjaGFzZS1lZGl0IjtpOjczO3M6MTM6InB1cmNoYXNlLXZpZXciO2k6NzQ7czoxNToicHVyY2hhc2UtZGVsZXRlIjtpOjc1O3M6MjA6InB1cmNoYXNlLWJ1bGstZGVsZXRlIjtpOjc2O3M6MTU6InB1cmNoYXNlLXJlcG9ydCI7aTo3NztzOjIzOiJwcm9kdWN0LWNhdGVnb3J5LWFjY2VzcyI7aTo3ODtzOjIwOiJwcm9kdWN0LWNhdGVnb3J5LWFkZCI7aTo3OTtzOjIxOiJwcm9kdWN0LWNhdGVnb3J5LWVkaXQiO2k6ODA7czoyMzoicHJvZHVjdC1jYXRlZ29yeS1kZWxldGUiO2k6ODE7czoyODoicHJvZHVjdC1jYXRlZ29yeS1idWxrLWRlbGV0ZSI7aTo4MjtzOjIzOiJwcm9kdWN0LWNhdGVnb3J5LXJlcG9ydCI7aTo4MztzOjE0OiJwcm9kdWN0LWFjY2VzcyI7aTo4NDtzOjExOiJwcm9kdWN0LWFkZCI7aTo4NTtzOjEyOiJwcm9kdWN0LWVkaXQiO2k6ODY7czoxMjoicHJvZHVjdC12aWV3IjtpOjg3O3M6MTQ6InByb2R1Y3QtZGVsZXRlIjtpOjg4O3M6MTk6InByb2R1Y3QtYnVsay1kZWxldGUiO2k6ODk7czoxNDoicHJvZHVjdC1yZXBvcnQiO2k6OTA7czoyMDoicHJpbnQtYmFyY29kZS1hY2Nlc3MiO2k6OTE7czoxNzoiYWRqdXN0bWVudC1hY2Nlc3MiO2k6OTI7czoxNDoiYWRqdXN0bWVudC1hZGQiO2k6OTM7czoxNToiYWRqdXN0bWVudC1lZGl0IjtpOjk0O3M6MTU6ImFkanVzdG1lbnQtdmlldyI7aTo5NTtzOjE3OiJhZGp1c3RtZW50LWRlbGV0ZSI7aTo5NjtzOjIyOiJhZGp1c3RtZW50LWJ1bGstZGVsZXRlIjtpOjk3O3M6MTc6ImFkanVzdG1lbnQtcmVwb3J0IjtpOjk4O3M6Mjc6InByb2R1Y3Qtc3RvY2stcmVwb3J0LWFjY2VzcyI7aTo5OTtzOjE3OiJwcm9kdWN0aW9uLWFjY2VzcyI7aToxMDA7czoxNDoicHJvZHVjdGlvbi1hZGQiO2k6MTAxO3M6MTU6InByb2R1Y3Rpb24tZWRpdCI7aToxMDI7czoxNToicHJvZHVjdGlvbi12aWV3IjtpOjEwMztzOjE3OiJwcm9kdWN0aW9uLWRlbGV0ZSI7aToxMDQ7czoxODoicHJvZHVjdGlvbi1hcHByb3ZlIjtpOjEwNTtzOjE3OiJwcm9kdWN0aW9uLXJlcG9ydCI7aToxMDY7czoyMDoicHJvZHVjdGlvbi1vcGVyYXRpb24iO2k6MTA3O3M6MTk6InByb2R1Y3Rpb24tdHJhbnNmZXIiO2k6MTA4O3M6MTU6ImN1c3RvbWVyLWFjY2VzcyI7aToxMDk7czoxMjoiY3VzdG9tZXItYWRkIjtpOjExMDtzOjEzOiJjdXN0b21lci1lZGl0IjtpOjExMTtzOjEzOiJjdXN0b21lci12aWV3IjtpOjExMjtzOjE1OiJjdXN0b21lci1kZWxldGUiO2k6MTEzO3M6MjI6ImN1c3RvbWVyLWxlZGdlci1hY2Nlc3MiO2k6MTE0O3M6MjI6ImNyZWRpdC1jdXN0b21lci1hY2Nlc3MiO2k6MTE1O3M6MjA6InBhaWQtY3VzdG9tZXItYWNjZXNzIjtpOjExNjtzOjIzOiJjdXN0b21lci1hZHZhbmNlLWFjY2VzcyI7aToxMTc7czoyMzoiY3VzdG9tZXItYWR2YW5jZS1yZXBvcnQiO2k6MTE4O3M6MjA6ImN1c3RvbWVyLWFkdmFuY2UtYWRkIjtpOjExOTtzOjIxOiJjdXN0b21lci1hZHZhbmNlLWVkaXQiO2k6MTIwO3M6MjM6ImN1c3RvbWVyLWFkdmFuY2UtZGVsZXRlIjtpOjEyMTtzOjE1OiJzdXBwbGllci1hY2Nlc3MiO2k6MTIyO3M6MTI6InN1cHBsaWVyLWFkZCI7aToxMjM7czoxMzoic3VwcGxpZXItZWRpdCI7aToxMjQ7czoxMzoic3VwcGxpZXItdmlldyI7aToxMjU7czoxNToic3VwcGxpZXItZGVsZXRlIjtpOjEyNjtzOjIwOiJzdXBwbGllci1idWxrLWRlbGV0ZSI7aToxMjc7czoxNToic3VwcGxpZXItcmVwb3J0IjtpOjEyODtzOjIyOiJzdXBwbGllci1sZWRnZXItYWNjZXNzIjtpOjEyOTtzOjIzOiJzdXBwbGllci1hZHZhbmNlLWFjY2VzcyI7aToxMzA7czoyMDoic3VwcGxpZXItYWR2YW5jZS1hZGQiO2k6MTMxO3M6MjE6InN1cHBsaWVyLWFkdmFuY2UtZWRpdCI7aToxMzI7czoyMzoic3VwcGxpZXItYWR2YW5jZS1kZWxldGUiO2k6MTMzO3M6Mjg6InN1cHBsaWVyLWFkdmFuY2UtYnVsay1kZWxldGUiO2k6MTM0O3M6MjQ6InN1cHBsaWVyLWFkdmFuY2UtYXBwcm92ZSI7aToxMzU7czoxMzoicmV0dXJuLWFjY2VzcyI7aToxMzY7czoyMjoicHVyY2hhc2UtcmV0dXJuLWFjY2VzcyI7aToxMzc7czoxOToicHVyY2hhc2UtcmV0dXJuLWFkZCI7aToxMzg7czoyMDoicHVyY2hhc2UtcmV0dXJuLXZpZXciO2k6MTM5O3M6MjI6InB1cmNoYXNlLXJldHVybi1kZWxldGUiO2k6MTQwO3M6MTA6ImFzbS1hY2Nlc3MiO2k6MTQxO3M6NzoiYXNtLWFkZCI7aToxNDI7czo4OiJhc20tZWRpdCI7aToxNDM7czo4OiJhc20tdmlldyI7aToxNDQ7czoxMDoiYXNtLWRlbGV0ZSI7aToxNDU7czoxNToiYXNtLWJ1bGstZGVsZXRlIjtpOjE0NjtzOjEwOiJhc20tcmVwb3J0IjtpOjE0NztzOjk6InNyLWFjY2VzcyI7aToxNDg7czo2OiJzci1hZGQiO2k6MTQ5O3M6Nzoic3ItZWRpdCI7aToxNTA7czo3OiJzci12aWV3IjtpOjE1MTtzOjk6InNyLWRlbGV0ZSI7aToxNTI7czoxNDoic3ItYnVsay1kZWxldGUiO2k6MTUzO3M6OToic3ItcmVwb3J0IjtpOjE1NDtzOjE1OiJkaXN0cmljdC1hY2Nlc3MiO2k6MTU1O3M6MTI6ImRpc3RyaWN0LWFkZCI7aToxNTY7czoxMzoiZGlzdHJpY3QtZWRpdCI7aToxNTc7czoxNToiZGlzdHJpY3QtZGVsZXRlIjtpOjE1ODtzOjIwOiJkaXN0cmljdC1idWxrLWRlbGV0ZSI7aToxNTk7czoxNToiZGlzdHJpY3QtcmVwb3J0IjtpOjE2MDtzOjE0OiJ1cGF6aWxhLWFjY2VzcyI7aToxNjE7czoxMToidXBhemlsYS1hZGQiO2k6MTYyO3M6MTI6InVwYXppbGEtZWRpdCI7aToxNjM7czoxNDoidXBhemlsYS1kZWxldGUiO2k6MTY0O3M6MTk6InVwYXppbGEtYnVsay1kZWxldGUiO2k6MTY1O3M6MTQ6InVwYXppbGEtcmVwb3J0IjtpOjE2NjtzOjEyOiJyb3V0ZS1hY2Nlc3MiO2k6MTY3O3M6OToicm91dGUtYWRkIjtpOjE2ODtzOjEwOiJyb3V0ZS1lZGl0IjtpOjE2OTtzOjEyOiJyb3V0ZS1kZWxldGUiO2k6MTcwO3M6MTc6InJvdXRlLWJ1bGstZGVsZXRlIjtpOjE3MTtzOjEyOiJyb3V0ZS1yZXBvcnQiO2k6MTcyO3M6MTE6ImFyZWEtYWNjZXNzIjtpOjE3MztzOjg6ImFyZWEtYWRkIjtpOjE3NDtzOjk6ImFyZWEtZWRpdCI7aToxNzU7czoxMToiYXJlYS1kZWxldGUiO2k6MTc2O3M6MTY6ImFyZWEtYnVsay1kZWxldGUiO2k6MTc3O3M6MTE6ImFyZWEtcmVwb3J0IjtpOjE3ODtzOjExOiJiYW5rLWFjY2VzcyI7aToxNzk7czo4OiJiYW5rLWFkZCI7aToxODA7czo5OiJiYW5rLWVkaXQiO2k6MTgxO3M6MTE6ImJhbmstZGVsZXRlIjtpOjE4MjtzOjExOiJiYW5rLXJlcG9ydCI7aToxODM7czoyMzoiYmFuay10cmFuc2FjdGlvbi1hY2Nlc3MiO2k6MTg0O3M6MTg6ImJhbmstbGVkZ2VyLWFjY2VzcyI7aToxODU7czoxODoibW9iaWxlLWJhbmstYWNjZXNzIjtpOjE4NjtzOjE1OiJtb2JpbGUtYmFuay1hZGQiO2k6MTg3O3M6MTY6Im1vYmlsZS1iYW5rLWVkaXQiO2k6MTg4O3M6MTg6Im1vYmlsZS1iYW5rLWRlbGV0ZSI7aToxODk7czoyMzoibW9iaWxlLWJhbmstYnVsay1kZWxldGUiO2k6MTkwO3M6MTg6Im1vYmlsZS1iYW5rLXJlcG9ydCI7aToxOTE7czozMDoibW9iaWxlLWJhbmstdHJhbnNhY3Rpb24tYWNjZXNzIjtpOjE5MjtzOjI1OiJtb2JpbGUtYmFuay1sZWRnZXItYWNjZXNzIjtpOjE5MztzOjE5OiJleHBlbnNlLWl0ZW0tYWNjZXNzIjtpOjE5NDtzOjE2OiJleHBlbnNlLWl0ZW0tYWRkIjtpOjE5NTtzOjE3OiJleHBlbnNlLWl0ZW0tZWRpdCI7aToxOTY7czoxOToiZXhwZW5zZS1pdGVtLWRlbGV0ZSI7aToxOTc7czoyNDoiZXhwZW5zZS1pdGVtLWJ1bGstZGVsZXRlIjtpOjE5ODtzOjE5OiJleHBlbnNlLWl0ZW0tcmVwb3J0IjtpOjE5OTtzOjE0OiJleHBlbnNlLWFjY2VzcyI7aToyMDA7czoxMToiZXhwZW5zZS1hZGQiO2k6MjAxO3M6MTI6ImV4cGVuc2UtZWRpdCI7aToyMDI7czoxNDoiZXhwZW5zZS1kZWxldGUiO2k6MjAzO3M6MTk6ImV4cGVuc2UtYnVsay1kZWxldGUiO2k6MjA0O3M6MTQ6ImV4cGVuc2UtcmVwb3J0IjtpOjIwNTtzOjE1OiJleHBlbnNlLWFwcHJvdmUiO2k6MjA2O3M6MjQ6ImV4cGVuc2Utc3RhdGVtZW50LWFjY2VzcyI7aToyMDc7czoxMDoiY29hLWFjY2VzcyI7aToyMDg7czo3OiJjb2EtYWRkIjtpOjIwOTtzOjg6ImNvYS1lZGl0IjtpOjIxMDtzOjEwOiJjb2EtZGVsZXRlIjtpOjIxMTtzOjIyOiJvcGVuaW5nLWJhbGFuY2UtYWNjZXNzIjtpOjIxMjtzOjIzOiJzdXBwbGllci1wYXltZW50LWFjY2VzcyI7aToyMTM7czoyMzoiY3VzdG9tZXItcmVjZWl2ZS1hY2Nlc3MiO2k6MjE0O3M6MjE6ImNvbnRyYS12b3VjaGVyLWFjY2VzcyI7aToyMTU7czoxODoiY29udHJhLXZvdWNoZXItYWRkIjtpOjIxNjtzOjE5OiJjb250cmEtdm91Y2hlci12aWV3IjtpOjIxNztzOjIxOiJjb250cmEtdm91Y2hlci1kZWxldGUiO2k6MjE4O3M6MjI6ImpvdXJuYWwtdm91Y2hlci1hY2Nlc3MiO2k6MjE5O3M6MTk6ImpvdXJuYWwtdm91Y2hlci1hZGQiO2k6MjIwO3M6MjA6ImpvdXJuYWwtdm91Y2hlci12aWV3IjtpOjIyMTtzOjIyOiJqb3VybmFsLXZvdWNoZXItZGVsZXRlIjtpOjIyMjtzOjE0OiJ2b3VjaGVyLWFjY2VzcyI7aToyMjM7czoxNToidm91Y2hlci1hcHByb3ZlIjtpOjIyNDtzOjEyOiJ2b3VjaGVyLWVkaXQiO2k6MjI1O3M6MTQ6InZvdWNoZXItZGVsZXRlIjtpOjIyNjtzOjE2OiJjYXNoLWJvb2stYWNjZXNzIjtpOjIyNztzOjIzOiJpbnZlbnRvcnktbGVkZ2VyLWFjY2VzcyI7aToyMjg7czoxNjoiYmFuay1ib29rLWFjY2VzcyI7aToyMjk7czoyMzoibW9iaWxlLWJhbmstYm9vay1hY2Nlc3MiO2k6MjMwO3M6MjE6ImdlbmVyYWwtbGVkZ2VyLWFjY2VzcyI7aToyMzE7czoyMDoidHJpYWwtYmFsYW5jZS1hY2Nlc3MiO2k6MjMyO3M6MTg6InByb2ZpdC1sb3NzLWFjY2VzcyI7aToyMzM7czoxNjoiY2FzaC1mbG93LWFjY2VzcyI7aToyMzQ7czoxNzoiZGVwYXJ0bWVudC1hY2Nlc3MiO2k6MjM1O3M6MTQ6ImRlcGFydG1lbnQtYWRkIjtpOjIzNjtzOjE1OiJkZXBhcnRtZW50LWVkaXQiO2k6MjM3O3M6MTc6ImRlcGFydG1lbnQtZGVsZXRlIjtpOjIzODtzOjIyOiJkZXBhcnRtZW50LWJ1bGstZGVsZXRlIjtpOjIzOTtzOjE3OiJkZXBhcnRtZW50LXJlcG9ydCI7aToyNDA7czoxNToiZGl2aXNpb24tYWNjZXNzIjtpOjI0MTtzOjEyOiJkaXZpc2lvbi1hZGQiO2k6MjQyO3M6MTM6ImRpdmlzaW9uLWVkaXQiO2k6MjQzO3M6MTU6ImRpdmlzaW9uLWRlbGV0ZSI7aToyNDQ7czoyMDoiZGl2aXNpb24tYnVsay1kZWxldGUiO2k6MjQ1O3M6MTU6ImRpdmlzaW9uLXJlcG9ydCI7aToyNDY7czoxODoiZGVzaWduYXRpb24tYWNjZXNzIjtpOjI0NztzOjE1OiJkZXNpZ25hdGlvbi1hZGQiO2k6MjQ4O3M6MTY6ImRlc2lnbmF0aW9uLWVkaXQiO2k6MjQ5O3M6MTg6ImRlc2lnbmF0aW9uLWRlbGV0ZSI7aToyNTA7czoyMzoiZGVzaWduYXRpb24tYnVsay1kZWxldGUiO2k6MjUxO3M6MTg6ImRlc2lnbmF0aW9uLXJlcG9ydCI7aToyNTI7czoxMjoic2hpZnQtYWNjZXNzIjtpOjI1MztzOjk6InNoaWZ0LWFkZCI7aToyNTQ7czoxMDoic2hpZnQtZWRpdCI7aToyNTU7czoxMjoic2hpZnQtZGVsZXRlIjtpOjI1NjtzOjE3OiJzaGlmdC1idWxrLWRlbGV0ZSI7aToyNTc7czoxMjoic2hpZnQtcmVwb3J0IjtpOjI1ODtzOjE5OiJzaGlmdC1tYW5hZ2UtYWNjZXNzIjtpOjI1OTtzOjE2OiJzaGlmdC1tYW5hZ2UtYWRkIjtpOjI2MDtzOjE3OiJzaGlmdC1tYW5hZ2UtZWRpdCI7aToyNjE7czoxOToic2hpZnQtbWFuYWdlLWRlbGV0ZSI7aToyNjI7czoyNDoic2hpZnQtbWFuYWdlLWJ1bGstZGVsZXRlIjtpOjI2MztzOjE5OiJzaGlmdC1tYW5hZ2UtcmVwb3J0IjtpOjI2NDtzOjIxOiJlbXBsb3llZS1zaGlmdC1jaGFuZ2UiO2k6MjY1O3M6MTU6ImVtcGxveWVlLWFjY2VzcyI7aToyNjY7czoxMjoiZW1wbG95ZWUtYWRkIjtpOjI2NztzOjEzOiJlbXBsb3llZS1lZGl0IjtpOjI2ODtzOjEzOiJlbXBsb3llZS12aWV3IjtpOjI2OTtzOjE1OiJlbXBsb3llZS1kZWxldGUiO2k6MjcwO3M6MjA6ImVtcGxveWVlLWJ1bGstZGVsZXRlIjtpOjI3MTtzOjE1OiJlbXBsb3llZS1yZXBvcnQiO2k6MjcyO3M6MTc6ImF0dGVuZGFuY2UtYWNjZXNzIjtpOjI3MztzOjE0OiJhdHRlbmRhbmNlLWFkZCI7aToyNzQ7czoxNToiYXR0ZW5kYW5jZS1lZGl0IjtpOjI3NTtzOjE3OiJhdHRlbmRhbmNlLWRlbGV0ZSI7aToyNzY7czoyMjoiYXR0ZW5kYW5jZS1idWxrLWRlbGV0ZSI7aToyNzc7czoxNzoiYXR0ZW5kYW5jZS1yZXBvcnQiO2k6Mjc4O3M6MjQ6ImF0dGVuZGFuY2UtcmVwb3J0LWFjY2VzcyI7aToyNzk7czoxNToiYmVuaWZpdHMtYWNjZXNzIjtpOjI4MDtzOjEyOiJiZW5pZml0cy1hZGQiO2k6MjgxO3M6MTM6ImJlbmlmaXRzLWVkaXQiO2k6MjgyO3M6MTU6ImJlbmlmaXRzLWRlbGV0ZSI7aToyODM7czoyMDoiYmVuaWZpdHMtYnVsay1kZWxldGUiO2k6Mjg0O3M6MTU6ImJlbmlmaXRzLXJlcG9ydCI7aToyODU7czoxOToic2FsYXJ5LXNldHVwLWFjY2VzcyI7aToyODY7czoxNjoic2FsYXJ5LXNldHVwLWFkZCI7aToyODc7czoxNzoic2FsYXJ5LXNldHVwLWVkaXQiO2k6Mjg4O3M6MTc6InNhbGFyeS1zZXR1cC12aWV3IjtpOjI4OTtzOjE5OiJzYWxhcnktc2V0dXAtZGVsZXRlIjtpOjI5MDtzOjI0OiJzYWxhcnktc2V0dXAtYnVsay1kZWxldGUiO2k6MjkxO3M6MTk6InNhbGFyeS1zZXR1cC1yZXBvcnQiO2k6MjkyO3M6MjI6InNhbGFyeS1nZW5lcmF0ZS1hY2Nlc3MiO2k6MjkzO3M6MTk6InNhbGFyeS1nZW5lcmF0ZS1hZGQiO2k6Mjk0O3M6MjI6InNhbGFyeS1nZW5lcmF0ZS1kZWxldGUiO2k6Mjk1O3M6Mjc6InNhbGFyeS1nZW5lcmF0ZS1idWxrLWRlbGV0ZSI7aToyOTY7czoyMjoic2FsYXJ5LWdlbmVyYXRlLXJlcG9ydCI7aToyOTc7czoyMToic2FsYXJ5LXBheW1lbnQtYWNjZXNzIjtpOjI5ODtzOjIxOiJ3ZWVrbHktaG9saWRheS1hY2Nlc3MiO2k6Mjk5O3M6MTg6IndlZWtseS1ob2xpZGF5LWFkZCI7aTozMDA7czoxOToid2Vla2x5LWhvbGlkYXktZWRpdCI7aTozMDE7czoyMToid2Vla2x5LWhvbGlkYXktZGVsZXRlIjtpOjMwMjtzOjI2OiJ3ZWVrbHktaG9saWRheS1idWxrLWRlbGV0ZSI7aTozMDM7czoyMToid2Vla2x5LWhvbGlkYXktcmVwb3J0IjtpOjMwNDtzOjE0OiJob2xpZGF5LWFjY2VzcyI7aTozMDU7czoxMToiaG9saWRheS1hZGQiO2k6MzA2O3M6MTI6ImhvbGlkYXktZWRpdCI7aTozMDc7czoxNDoiaG9saWRheS1kZWxldGUiO2k6MzA4O3M6MTk6ImhvbGlkYXktYnVsay1kZWxldGUiO2k6MzA5O3M6MTQ6ImhvbGlkYXktcmVwb3J0IjtpOjMxMDtzOjE3OiJsZWF2ZS10eXBlLWFjY2VzcyI7aTozMTE7czoxNDoibGVhdmUtdHlwZS1hZGQiO2k6MzEyO3M6MTU6ImxlYXZlLXR5cGUtZWRpdCI7aTozMTM7czoxNzoibGVhdmUtdHlwZS1kZWxldGUiO2k6MzE0O3M6MjI6ImxlYXZlLXR5cGUtYnVsay1kZWxldGUiO2k6MzE1O3M6MTc6ImxlYXZlLXR5cGUtcmVwb3J0IjtpOjMxNjtzOjI0OiJsZWF2ZS1hcHBsaWNhdGlvbi1hY2Nlc3MiO2k6MzE3O3M6MjE6ImxlYXZlLWFwcGxpY2F0aW9uLWFkZCI7aTozMTg7czoyMjoibGVhdmUtYXBwbGljYXRpb24tZWRpdCI7aTozMTk7czoyNDoibGVhdmUtYXBwbGljYXRpb24tZGVsZXRlIjtpOjMyMDtzOjI5OiJsZWF2ZS1hcHBsaWNhdGlvbi1idWxrLWRlbGV0ZSI7aTozMjE7czoyNDoibGVhdmUtYXBwbGljYXRpb24tcmVwb3J0IjtpOjMyMjtzOjI1OiJsZWF2ZS1hcHBsaWNhdGlvbi1hcHByb3ZlIjtpOjMyMztzOjE5OiJmaW5pc2gtZ29vZHMtYWNjZXNzIjtpOjMyNDtzOjIxOiJhc20tcGVybWlzc2lvbi1hY2Nlc3MiO2k6MzI1O3M6MTg6ImFzbS1wZXJtaXNzaW9uLWFkZCI7aTozMjY7czoxOToiYXNtLXBlcm1pc3Npb24tZWRpdCI7aTozMjc7czoyMToiYXNtLXBlcm1pc3Npb24tZGVsZXRlIjtpOjMyODtzOjI2OiJhc20tcGVybWlzc2lvbi1idWxrLWRlbGV0ZSI7aTozMjk7czoyMToiYXNtLXBlcm1pc3Npb24tcmVwb3J0IjtpOjMzMDtzOjE0OiJjbG9zaW5nLWFjY2VzcyI7aTozMzE7czoyMToiY2xvc2luZy1yZXBvcnQtYWNjZXNzIjtpOjMzMjtzOjI1OiJ0b2RheS1zYWxlcy1yZXBvcnQtYWNjZXNzIjtpOjMzMztzOjE5OiJzYWxlcy1yZXBvcnQtYWNjZXNzIjtpOjMzNDtzOjIzOiJpbnZlbnRvcnktcmVwb3J0LWFjY2VzcyI7aTozMzU7czozMDoidG9kYXlzLWN1c3RvbWVyLXJlY2VpcHQtYWNjZXNzIjtpOjMzNjtzOjI4OiJjdXN0b21lci1yZWNlaXB0LWxpc3QtYWNjZXNzIjtpOjMzNztzOjMzOiJzYWxlc21hbi13aXNlLXNhbGVzLXJlcG9ydC1hY2Nlc3MiO2k6MzM4O3M6MTc6ImR1ZS1yZXBvcnQtYWNjZXNzIjtpOjMzOTtzOjI3OiJzaGlwcGluZy1jb3N0LXJlcG9ydC1hY2Nlc3MiO2k6MzQwO3M6MzI6InByb2R1Y3Qtd2lzZS1zYWxlcy1yZXBvcnQtYWNjZXNzIjtpOjM0MTtzOjI0OiJjb2xsZWN0aW9uLXJlcG9ydC1hY2Nlc3MiO2k6MzQyO3M6MjQ6IndhcmVob3VzZS1zdW1tYXJ5LWFjY2VzcyI7aTozNDM7czozNDoibWF0ZXJpYWwtc3RvY2stYWxlcnQtcmVwb3J0LWFjY2VzcyI7aTozNDQ7czoyODoibWF0ZXJpYWwtaXNzdWUtcmVwb3J0LWFjY2VzcyI7aTozNDU7czozNjoiZmluaXNoLWdvb2RzLWludmVudG9yeS1yZXBvcnQtYWNjZXNzIjtpOjM0NjtzOjIwOiJkZWJpdC12b3VjaGVyLWFjY2VzcyI7aTozNDc7czoxNzoiZGViaXQtdm91Y2hlci1hZGQiO2k6MzQ4O3M6MTg6ImRlYml0LXZvdWNoZXItdmlldyI7aTozNDk7czoyMDoiZGViaXQtdm91Y2hlci1kZWxldGUiO2k6MzUwO3M6MjE6ImNyZWRpdC12b3VjaGVyLWFjY2VzcyI7aTozNTE7czoxODoiY3JlZGl0LXZvdWNoZXItYWRkIjtpOjM1MjtzOjE5OiJjcmVkaXQtdm91Y2hlci12aWV3IjtpOjM1MztzOjIxOiJjcmVkaXQtdm91Y2hlci1kZWxldGUiO2k6MzU0O3M6MjI6ImNhc2gtYWRqdXN0bWVudC1hY2Nlc3MiO2k6MzU1O3M6MTk6ImNhc2gtYWRqdXN0bWVudC1hZGQiO2k6MzU2O3M6MjA6ImNhc2gtYWRqdXN0bWVudC1lZGl0IjtpOjM1NztzOjIyOiJjYXNoLWFkanVzdG1lbnQtZGVsZXRlIjtpOjM1ODtzOjIzOiJjYXNoLWFkanVzdG1lbnQtYXBwcm92ZSI7aTozNTk7czoyNzoicGVyc29uYWwtbG9hbi1wZXJzb24tYWNjZXNzIjtpOjM2MDtzOjI0OiJwZXJzb25hbC1sb2FuLXBlcnNvbi1hZGQiO2k6MzYxO3M6MjU6InBlcnNvbmFsLWxvYW4tcGVyc29uLWVkaXQiO2k6MzYyO3M6Mjc6InBlcnNvbmFsLWxvYW4tcGVyc29uLWRlbGV0ZSI7aTozNjM7czozMjoicGVyc29uYWwtbG9hbi1wZXJzb24tYnVsay1kZWxldGUiO2k6MzY0O3M6MjA6InBlcnNvbmFsLWxvYW4tYWNjZXNzIjtpOjM2NTtzOjE3OiJwZXJzb25hbC1sb2FuLWFkZCI7aTozNjY7czoxODoicGVyc29uYWwtbG9hbi1lZGl0IjtpOjM2NztzOjIwOiJwZXJzb25hbC1sb2FuLWRlbGV0ZSI7aTozNjg7czoyNToicGVyc29uYWwtbG9hbi1idWxrLWRlbGV0ZSI7aTozNjk7czozMjoicGVyc29uYWwtbG9hbi1pbnN0YWxsbWVudC1hY2Nlc3MiO2k6MzcwO3M6Mjk6InBlcnNvbmFsLWxvYW4taW5zdGFsbG1lbnQtYWRkIjtpOjM3MTtzOjMwOiJwZXJzb25hbC1sb2FuLWluc3RhbGxtZW50LWVkaXQiO2k6MzcyO3M6MzI6InBlcnNvbmFsLWxvYW4taW5zdGFsbG1lbnQtZGVsZXRlIjtpOjM3MztzOjM3OiJwZXJzb25hbC1sb2FuLWluc3RhbGxtZW50LWJ1bGstZGVsZXRlIjtpOjM3NDtzOjIwOiJvZmZpY2lhbC1sb2FuLWFjY2VzcyI7aTozNzU7czoxNzoib2ZmaWNpYWwtbG9hbi1hZGQiO2k6Mzc2O3M6MTg6Im9mZmljaWFsLWxvYW4tZWRpdCI7aTozNzc7czoyMDoib2ZmaWNpYWwtbG9hbi1kZWxldGUiO2k6Mzc4O3M6MjU6Im9mZmljaWFsLWxvYW4tYnVsay1kZWxldGUiO2k6Mzc5O3M6MzI6Im9mZmljaWFsLWxvYW4taW5zdGFsbG1lbnQtYWNjZXNzIjtpOjM4MDtzOjI5OiJvZmZpY2lhbC1sb2FuLWluc3RhbGxtZW50LWFkZCI7aTozODE7czozMDoib2ZmaWNpYWwtbG9hbi1pbnN0YWxsbWVudC1lZGl0IjtpOjM4MjtzOjMyOiJvZmZpY2lhbC1sb2FuLWluc3RhbGxtZW50LWRlbGV0ZSI7aTozODM7czozNzoib2ZmaWNpYWwtbG9hbi1pbnN0YWxsbWVudC1idWxrLWRlbGV0ZSI7aTozODQ7czoxODoibG9hbi1yZXBvcnQtYWNjZXNzIjtpOjM4NTtzOjIwOiJiYWxhbmNlLXNoZWV0LWFjY2VzcyI7aTozODY7czoxMToic2FsZS1hY2Nlc3MiO2k6Mzg3O3M6ODoic2FsZS1hZGQiO2k6Mzg4O3M6OToic2FsZS1lZGl0IjtpOjM4OTtzOjk6InNhbGUtdmlldyI7aTozOTA7czoxMToic2FsZS1kZWxldGUiO2k6MzkxO3M6MTY6InNhbGUtYnVsay1kZWxldGUiO2k6MzkyO3M6MTg6InNhbGUtcmV0dXJuLWFjY2VzcyI7aTozOTM7czoxNToic2FsZS1yZXR1cm4tYWRkIjtpOjM5NDtzOjE2OiJzYWxlLXJldHVybi12aWV3IjtpOjM5NTtzOjE4OiJzYWxlLXJldHVybi1kZWxldGUiO2k6Mzk2O3M6MzM6InByb2R1Y3Qtc3RvY2stYWxlcnQtcmVwb3J0LWFjY2VzcyI7aTozOTc7czoyNzoic3ItY29tbWlzc2lvbi1yZXBvcnQtYWNjZXNzIjtpOjM5ODtzOjIxOiJpbnZvaWNlLXJlcG9ydC1hY2Nlc3MiO2k6Mzk5O3M6MjM6InNhbGVzbWVuLXBheW1lbnQtYWNjZXNzIjtpOjQwMDtzOjIyOiJzYWxlc21lbi1sZWRnZXItYWNjZXNzIjtpOjQwMTtzOjEzOiJkYW1hZ2UtYWNjZXNzIjtpOjQwMjtzOjEwOiJkYW1hZ2UtYWRkIjtpOjQwMztzOjI4OiJtYXRlcmlhbC1zdG9jay1sZWRnZXItYWNjZXNzIjtpOjQwNDtzOjMxOiJtYXRlcmlhbC1zdG9jay1sZWRnZXItY29zdC12aWV3IjtpOjQwNTtzOjIxOiJwcm9kdWN0LWxlZGdlci1hY2Nlc3MiO2k6NDA2O3M6MzE6InByb2R1Y3Qtc3RvY2stbGVkZ2VyLXByaWNlLXZpZXciO31zOjk6InVzZXJfbWVudSI7TzoyNjoiVHlwaUNNU1xOZXN0YWJsZUNvbGxlY3Rpb24iOjc6e3M6ODoiACoAdG90YWwiO2k6Mjk7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjI5OntpOjA7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtp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cHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6NDY7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE2OiJDdXN0b21lciBBZHZhbmNlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTY6ImN1c3RvbWVyLWFkdmFuY2UiO3M6NToib3JkZXIiO2k6NTtzOjk6InBhcmVudF9pZCI7aTo0MTtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDEyOjAxOjIyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDEyOjAxOjQ3Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6NDY7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE2OiJDdXN0b21lciBBZHZhbmNlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTY6ImN1c3RvbWVyLWFkdmFuY2UiO3M6NToib3JkZXIiO2k6NTtzOjk6InBhcmVudF9pZCI7aTo0MTtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDEyOjAxOjIyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDEyOjAxOjQ3Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319fX19czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aTo5O086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo0NztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6ODoiU3VwcGxpZXIiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNToiZmFzIGZhLXVzZXItdGllIjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjEwO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTI6MDI6NDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDYgMTQ6MTc6NDIiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo0NztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6ODoiU3VwcGxpZXIiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNToiZmFzIGZhLXVzZXItdGllIjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjEwO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTI6MDI6NDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDYgMTQ6MTc6NDIiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6ODoiY2hpbGRyZW4iO086MjY6IlR5cGlDTVNcTmVzdGFibGVDb2xsZWN0aW9uIjo3OntzOjg6IgAqAHRvdGFsIjtpOjM7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjM6e2k6MDtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6NDg7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE1OiJNYW5hZ2UgU3VwcGxpZXIiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czo4OiJzdXBwbGllciI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjQ3O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTI6MDM6MTEiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTI6MDQ6MjAiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo0ODtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTU6Ik1hbmFnZSBTdXBwbGllciI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjg6InN1cHBsaWVyIjtzOjU6Im9yZGVyIjtpOjE7czo5OiJwYXJlbnRfaWQiO2k6NDc7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMjowMzoxMSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMjowNDoyMCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MTtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6NDk7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE1OiJTdXBwbGllciBMZWRnZXIiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxNToic3VwcGxpZXItbGVkZ2VyIjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6NDc7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMjowMzo0NCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMjowNDozNyI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjQ5O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNToiU3VwcGxpZXIgTGVkZ2VyIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTU6InN1cHBsaWVyLWxlZGdlciI7czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjQ3O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTI6MDM6NDQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTI6MDQ6MzciO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjI7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjUwO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiU3VwcGxpZXIgQWR2YW5jZSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE2OiJzdXBwbGllci1hZHZhbmNlIjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6NDc7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMjowNDoxMyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMjowNDozNyI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjUwO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiU3VwcGxpZXIgQWR2YW5jZSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE2OiJzdXBwbGllci1hZHZhbmNlIjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6NDc7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMjowNDoxMyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMjowNDozNyI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fX19fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MTA7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjUxO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxMjoiU3RvY2sgUmV0dXJuIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MTU6ImZhcyBmYS11bmRvLWFsdCI7czozOiJ1cmwiO047czo1OiJvcmRlciI7aToxMTtzOjk6InBhcmVudF9pZCI7TjtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDEyOjE0OjQ2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTA2IDE0OjE3OjQyIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6NTE7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjEyOiJTdG9jayBSZXR1cm4iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNToiZmFzIGZhLXVuZG8tYWx0IjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjExO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTI6MTQ6NDYiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDYgMTQ6MTc6NDIiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6ODoiY2hpbGRyZW4iO086MjY6IlR5cGlDTVNcTmVzdGFibGVDb2xsZWN0aW9uIjo3OntzOjg6IgAqAHRvdGFsIjtpOjM7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjM6e2k6MDtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6NTI7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjY6IlJldHVybiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjY6InJldHVybiI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjUxO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDEyOjE1OjMzIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTIzIDEwOjM3OjA0Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6NTI7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjY6IlJldHVybiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjY6InJldHVybiI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjUxO3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDEyOjE1OjMzIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTIzIDEwOjM3OjA0Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo1MztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTU6IlB1cmNoYXNlIFJldHVybiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE1OiJwdXJjaGFzZS1yZXR1cm4iO3M6NToib3JkZXIiO2k6MjtzOjk6InBhcmVudF9pZCI7aTo1MTtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDEyOjE2OjE0IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTIzIDEwOjM3OjE1Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6NTM7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE1OiJQdXJjaGFzZSBSZXR1cm4iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxNToicHVyY2hhc2UtcmV0dXJuIjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6NTE7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxMjoxNjoxNCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wOS0yMyAxMDozNzoxNSI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MjtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6MjM3O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxMToiU2FsZSBSZXR1cm4iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxMToic2FsZS1yZXR1cm4iO3M6NToib3JkZXIiO2k6MztzOjk6InBhcmVudF9pZCI7aTo1MTtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0yMyAxMDozNzozNyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wOS0yMyAxMDozNzo0OSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjIzNztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTE6IlNhbGUgUmV0dXJuIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTE6InNhbGUtcmV0dXJuIjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6NTE7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMjMgMTA6Mzc6MzciO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMjMgMTA6Mzc6NDkiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX19fX1zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjExO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo3NDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6ODoiQWNjb3VudHMiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoyMToiZmFyIGZhLW1vbmV5LWJpbGwtYWx0IjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjEyO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDMtMjcgMDA6NTI6MjciO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDYgMTQ6MTc6NDIiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo3NDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6ODoiQWNjb3VudHMiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoyMToiZmFyIGZhLW1vbmV5LWJpbGwtYWx0IjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjEyO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDMtMjcgMDA6NTI6MjciO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDYgMTQ6MTc6NDIiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6ODoiY2hpbGRyZW4iO086MjY6IlR5cGlDTVNcTmVzdGFibGVDb2xsZWN0aW9uIjo3OntzOjg6IgAqAHRvdGFsIjtpOjE3O3M6MTU6IgAqAHBhcmVudENvbHVtbiI7czo5OiJwYXJlbnRfaWQiO3M6MzM6IgAqAHJlbW92ZUl0ZW1zV2l0aE1pc3NpbmdBbmNlc3RvciI7YjoxO3M6MTQ6IgAqAGluZGVudENoYXJzIjtzOjg6IsKgwqDCoMKgIjtzOjE1OiIAKgBjaGlsZHJlbk5hbWUiO3M6NToiaXRlbXMiO3M6MTc6IgAqAHBhcmVudFJlbGF0aW9uIjtzOjY6InBhcmVudCI7czo4OiIAKgBpdGVtcyI7YToxNzp7aTowO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo3NTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTY6IkNoYXJ0IG9mIEFjY291bnQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czozOiJjb2EiO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTAzLTI3IDAwOjUyOjUzIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA1LTExIDEyOjEwOjM0Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6NzU7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE2OiJDaGFydCBvZiBBY2NvdW50IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MzoiY29hIjtzOjU6Im9yZGVyIjtpOjE7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wMy0yNyAwMDo1Mjo1MyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNS0xMSAxMjoxMDozNCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MTtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6NzY7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE1OiJPcGVuaW5nIEJhbGFuY2UiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxNToib3BlbmluZy1iYWxhbmNlIjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wMy0yNyAwMDo1MzoyMCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNS0xMSAxMjoxMDozNCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjc2O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNToiT3BlbmluZyBCYWxhbmNlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTU6Im9wZW5pbmctYmFsYW5jZSI7czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjc0O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDMtMjcgMDA6NTM6MjAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDUtMTEgMTI6MTA6MzQiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjI7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjc3O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiU3VwcGxpZXIgUGF5bWVudCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE2OiJzdXBwbGllci1wYXltZW50IjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wMy0yNyAwMDo1Mzo0MyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNS0xMSAxMjoxMDozNCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjc3O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiU3VwcGxpZXIgUGF5bWVudCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE2OiJzdXBwbGllci1wYXltZW50IjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wMy0yNyAwMDo1Mzo0MyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNS0xMSAxMjoxMDozNCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MztPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6Nzg7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE2OiJDdXN0b21lciBSZWNlaXZlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTY6ImN1c3RvbWVyLXJlY2VpdmUiO3M6NToib3JkZXIiO2k6NDtzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTAzLTI3IDAwOjU0OjAxIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA1LTExIDEyOjEwOjM0Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6Nzg7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE2OiJDdXN0b21lciBSZWNlaXZlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTY6ImN1c3RvbWVyLXJlY2VpdmUiO3M6NToib3JkZXIiO2k6NDtzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTAzLTI3IDAwOjU0OjAxIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA1LTExIDEyOjEwOjM0Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aTo0O086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aToyNDE7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE2OiJTYWxlc21hbiBQYXltZW50IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTY6InNhbGVzbWVuLXBheW1lbnQiO3M6NToib3JkZXIiO2k6NTtzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTAzIDE1OjU2OjMyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTE3IDE1OjU0OjE1Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6MjQxO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiU2FsZXNtYW4gUGF5bWVudCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE2OiJzYWxlc21lbi1wYXltZW50IjtzOjU6Im9yZGVyIjtpOjU7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wMyAxNTo1NjozMiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0xNyAxNTo1NDoxNSI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6NTtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6Nzk7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE1OiJDYXNoIEFkanVzdG1lbnQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoyMjoiY2FzaC1hZGp1c3RtZW50L2NyZWF0ZSI7czo1OiJvcmRlciI7aTo2O3M6OToicGFyZW50X2lkIjtpOjc0O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDMtMjcgMDA6NTQ6MzAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDMgMTU6NTc6NTIiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo3OTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTU6IkNhc2ggQWRqdXN0bWVudCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjIyOiJjYXNoLWFkanVzdG1lbnQvY3JlYXRlIjtzOjU6Im9yZGVyIjtpOjY7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wMy0yNyAwMDo1NDozMCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wMyAxNTo1Nzo1MiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6NjtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6MjIyO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoyMDoiQ2FzaCBBZGp1c3RtZW50IExpc3QiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxNToiY2FzaC1hZGp1c3RtZW50IjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMTIgMTY6Mzk6MjgiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDMgMTU6NTc6NTIiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aToyMjI7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjIwOiJDYXNoIEFkanVzdG1lbnQgTGlzdCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE1OiJjYXNoLWFkanVzdG1lbnQiO3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0xMiAxNjozOToyOCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wMyAxNTo1Nzo1MiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6NztPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6ODA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjEzOiJEZWJpdCBWb3VjaGVyIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MjA6ImRlYml0LXZvdWNoZXIvY3JlYXRlIjtzOjU6Im9yZGVyIjtpOjg7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDMtMjcgMDA6NTQ6NTIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDMgMTU6NTc6NTIiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo4MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTM6IkRlYml0IFZvdWNoZXIiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoyMDoiZGViaXQtdm91Y2hlci9jcmVhdGUiO3M6NToib3JkZXIiO2k6ODtzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wMy0yNyAwMDo1NDo1MiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wMyAxNTo1Nzo1MiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6ODtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6MjAzO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxODoiRGViaXQgVm91Y2hlciBMaXN0IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTM6ImRlYml0LXZvdWNoZXIiO3M6NToib3JkZXIiO2k6OTtzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0wNyAxNTo1NTozMSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wMyAxNTo1Nzo1MiI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjIwMztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTg6IkRlYml0IFZvdWNoZXIgTGlzdCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjEzOiJkZWJpdC12b3VjaGVyIjtzOjU6Im9yZGVyIjtpOjk7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMDcgMTU6NTU6MzEiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDMgMTU6NTc6NTIiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjk7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjgxO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNDoiQ3JlZGl0IFZvdWNoZXIiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoyMToiY3JlZGl0LXZvdWNoZXIvY3JlYXRlIjtzOjU6Im9yZGVyIjtpOjEwO3M6OToicGFyZW50X2lkIjtpOjc0O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTAzLTI3IDAwOjU1OjEwIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTAzIDE1OjU3OjUyIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6ODE7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE0OiJDcmVkaXQgVm91Y2hlciI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjIxOiJjcmVkaXQtdm91Y2hlci9jcmVhdGUiO3M6NToib3JkZXIiO2k6MTA7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDMtMjcgMDA6NTU6MTAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDMgMTU6NTc6NTIiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjEwO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aToyMDQ7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE5OiJDcmVkaXQgVm91Y2hlciBMaXN0IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTQ6ImNyZWRpdC12b3VjaGVyIjtzOjU6Im9yZGVyIjtpOjExO3M6OToicGFyZW50X2lkIjtpOjc0O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTA3IDE1OjU2OjEzIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTAzIDE1OjU3OjUyIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6MjA0O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxOToiQ3JlZGl0IFZvdWNoZXIgTGlzdCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE0OiJjcmVkaXQtdm91Y2hlciI7czo1OiJvcmRlciI7aToxMTtzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0wNyAxNTo1NjoxMyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wMyAxNTo1Nzo1MiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MTE7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjgyO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNDoiQ29udHJhIFZvdWNoZXIiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoyMToiY29udHJhLXZvdWNoZXIvY3JlYXRlIjtzOjU6Im9yZGVyIjtpOjEyO3M6OToicGFyZW50X2lkIjtpOjc0O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTAzLTI3IDAwOjU1OjMxIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTAzIDE1OjU3OjUyIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6ODI7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE0OiJDb250cmEgVm91Y2hlciI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjIxOiJjb250cmEtdm91Y2hlci9jcmVhdGUiO3M6NToib3JkZXIiO2k6MTI7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDMtMjcgMDA6NTU6MzEiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDMgMTU6NTc6NTIiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjEyO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo4MztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTk6IkNvbnRyYSBWb3VjaGVyIExpc3QiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxNDoiY29udHJhLXZvdWNoZXIiO3M6NToib3JkZXIiO2k6MTM7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0wMyAxMTo1Mzo0MiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wMyAxNTo1Nzo1MiI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjgzO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxOToiQ29udHJhIFZvdWNoZXIgTGlzdCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE0OiJjb250cmEtdm91Y2hlciI7czo1OiJvcmRlciI7aToxMztzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTAzIDExOjUzOjQyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTAzIDE1OjU3OjUyIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxMztPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6ODQ7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE1OiJKb3VybmFsIFZvdWNoZXIiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoyMjoiam91cm5hbC12b3VjaGVyL2NyZWF0ZSI7czo1OiJvcmRlciI7aToxNDtzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wMy0yNyAwMDo1NTo1MCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wMyAxNTo1Nzo1MiI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjg0O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNToiSm91cm5hbCBWb3VjaGVyIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MjI6ImpvdXJuYWwtdm91Y2hlci9jcmVhdGUiO3M6NToib3JkZXIiO2k6MTQ7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDMtMjcgMDA6NTU6NTAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDMgMTU6NTc6NTIiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjE0O086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo4NTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MjA6IkpvdXJuYWwgVm91Y2hlciBMaXN0IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTU6ImpvdXJuYWwtdm91Y2hlciI7czo1OiJvcmRlciI7aToxNTtzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTAzIDExOjU0OjI0IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTAzIDE1OjU3OjUyIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6ODU7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjIwOiJKb3VybmFsIFZvdWNoZXIgTGlzdCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE1OiJqb3VybmFsLXZvdWNoZXIiO3M6NToib3JkZXIiO2k6MTU7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0wMyAxMTo1NDoyNCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wMyAxNTo1Nzo1MiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MTU7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjg2O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiVm91Y2hlciBBcHByb3ZhbCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE2OiJ2b3VjaGVyLWFwcHJvdmFsIjtzOjU6Im9yZGVyIjtpOjE2O3M6OToicGFyZW50X2lkIjtpOjc0O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDMtMjcgMDA6NTY6MjEiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDMgMTU6NTc6NTIiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo4NjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTY6IlZvdWNoZXIgQXBwcm92YWwiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxNjoidm91Y2hlci1hcHByb3ZhbCI7czo1OiJvcmRlciI7aToxNjtzOjk6InBhcmVudF9pZCI7aTo3NDtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTAzLTI3IDAwOjU2OjIxIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTAzIDE1OjU3OjUyIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxNjtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6ODc7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjY6IlJlcG9ydCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjIxOiJmYXMgZmEtZmlsZS1zaWduYXR1cmUiO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTc7czo5OiJwYXJlbnRfaWQiO2k6NzQ7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wMy0yNyAwMDo1ODowMiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wMyAxNTo1Nzo1MiI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjg3O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo2OiJSZXBvcnQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoyMToiZmFzIGZhLWZpbGUtc2lnbmF0dXJlIjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjE3O3M6OToicGFyZW50X2lkIjtpOjc0O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDMtMjcgMDA6NTg6MDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDMgMTU6NTc6NTIiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX19fX1zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjEyO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aToyMjM7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjQ6IkxvYW4iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoyMToiZmFyIGZhLW1vbmV5LWJpbGwtYWx0IjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjEzO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMTMgMTA6MzE6NTYiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDYgMTQ6MTc6NDIiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aToyMjM7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjQ6IkxvYW4iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoyMToiZmFyIGZhLW1vbmV5LWJpbGwtYWx0IjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjEzO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMTMgMTA6MzE6NTYiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDYgMTQ6MTc6NDIiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6ODoiY2hpbGRyZW4iO086MjY6IlR5cGlDTVNcTmVzdGFibGVDb2xsZWN0aW9uIjo3OntzOjg6IgAqAHRvdGFsIjtpOjM7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjM6e2k6MDtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6MjI0O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxMzoiUGVyc29uYWwgTG9hbiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aToyMjM7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0xMyAxMDozMjoxNCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wOS0xMyAxMDozMzoyMyI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjIyNDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTM6IlBlcnNvbmFsIExvYW4iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjE7czo5OiJwYXJlbnRfaWQiO2k6MjIzO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMTMgMTA6MzI6MTQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMTMgMTA6MzM6MjMiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjE7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjIyODtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTM6Ik9mZmljaWFsIExvYW4iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6MjIzO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMTMgMTA6MzQ6MDAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMTcgMTU6NTc6MjIiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aToyMjg7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjEzOiJPZmZpY2lhbCBMb2FuIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO047czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjIyMztzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTEzIDEwOjM0OjAwIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTE3IDE1OjU3OjIyIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToyO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aToyMzE7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjExOiJMb2FuIFJlcG9ydCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MztzOjk6InBhcmVudF9pZCI7aToyMjM7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0xMyAxMDozNToyNSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wOS0xMyAxMDozNTo0NCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjIzMTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTE6IkxvYW4gUmVwb3J0IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO047czo1OiJvcmRlciI7aTozO3M6OToicGFyZW50X2lkIjtpOjIyMztzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTEzIDEwOjM1OjI1IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTEzIDEwOjM1OjQ0Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319fX19czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxMztPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6OTY7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE0OiJIdW1hbiBSZXNvdXJjZSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjEyOiJmYXMgZmEtdXNlcnMiO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTQ7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNC0wMyAxNjo1NDowMiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wNiAxNDoxNzo0MiI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjk2O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNDoiSHVtYW4gUmVzb3VyY2UiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxMjoiZmFzIGZhLXVzZXJzIjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjE0O3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDQtMDMgMTY6NTQ6MDIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDYgMTQ6MTc6NDIiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6ODoiY2hpbGRyZW4iO086MjY6IlR5cGlDTVNcTmVzdGFibGVDb2xsZWN0aW9uIjo3OntzOjg6IgAqAHRvdGFsIjtpOjQ7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjQ6e2k6MDtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6OTc7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjM6IkhSTSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aTo5NjtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA0LTAzIDE2OjU0OjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA0LTI2IDA1OjAyOjU2Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6OTc7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjM6IkhSTSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aTo5NjtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA0LTAzIDE2OjU0OjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA0LTI2IDA1OjAyOjU2Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aToxMDQ7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjEwOiJBdHRlbmRhbmNlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO047czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjk2O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDQtMDMgMTc6MDA6MzQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDQtMjYgMDU6MDY6NTEiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aToxMDQ7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjEwOiJBdHRlbmRhbmNlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO047czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjk2O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDQtMDMgMTc6MDA6MzQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDQtMjYgMDU6MDY6NTEiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjI7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjExMjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6NToiTGVhdmUiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6OTY7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNC0wMyAxODowMjo0MyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNC0yNiAwNTowNjo1MSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjExMjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6NToiTGVhdmUiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6OTY7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNC0wMyAxODowMjo0MyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNC0yNiAwNTowNjo1MSI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MztPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6MTA3O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo3OiJQYXlyb2xsIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO047czo1OiJvcmRlciI7aTo0O3M6OToicGFyZW50X2lkIjtpOjk2O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDQtMDMgMTc6MDg6MTkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDQtMjYgMDU6MDk6MjUiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aToxMDc7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjc6IlBheXJvbGwiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjQ7czo5OiJwYXJlbnRfaWQiO2k6OTY7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNC0wMyAxNzowODoxOSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNC0yNiAwNTowOToyNSI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fX19fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MTQ7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjcwO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo3OiJFeHBlbnNlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MjI6ImZhcyBmYS1tb25leS1jaGVjay1hbHQiO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTU7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNTowMDo1NSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wNiAxNDoxNzo0MiI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjcwO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo3OiJFeHBlbnNlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MjI6ImZhcyBmYS1tb25leS1jaGVjay1hbHQiO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTU7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNTowMDo1NSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wNiAxNDoxNzo0MiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo4OiJjaGlsZHJlbiI7TzoyNjoiVHlwaUNNU1xOZXN0YWJsZUNvbGxlY3Rpb24iOjc6e3M6ODoiACoAdG90YWwiO2k6MztzOjE1OiIAKgBwYXJlbnRDb2x1bW4iO3M6OToicGFyZW50X2lkIjtzOjMzOiIAKgByZW1vdmVJdGVtc1dpdGhNaXNzaW5nQW5jZXN0b3IiO2I6MTtzOjE0OiIAKgBpbmRlbnRDaGFycyI7czo4OiLCoMKgwqDCoCI7czoxNToiACoAY2hpbGRyZW5OYW1lIjtzOjU6Iml0ZW1zIjtzOjE3OiIAKgBwYXJlbnRSZWxhdGlvbiI7czo2OiJwYXJlbnQiO3M6ODoiACoAaXRlbXMiO2E6Mzp7aTowO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo3MTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTk6Ik1hbmFnZSBFeHBlbnNlIEl0ZW0iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxMjoiZXhwZW5zZS1pdGVtIjtzOjU6Im9yZGVyIjtpOjE7czo5OiJwYXJlbnRfaWQiO2k6NzA7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNTowMToyOCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNTowMjoyMyI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjcxO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxOToiTWFuYWdlIEV4cGVuc2UgSXRlbSI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjEyOiJleHBlbnNlLWl0ZW0iO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aTo3MDtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDE1OjAxOjI4IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDE1OjAyOjIzIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo3MjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTQ6Ik1hbmFnZSBFeHBlbnNlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6NzoiZXhwZW5zZSI7czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjcwO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTU6MDE6NTAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTU6MDI6MzEiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo3MjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTQ6Ik1hbmFnZSBFeHBlbnNlIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6NzoiZXhwZW5zZSI7czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjcwO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTU6MDE6NTAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTU6MDI6MzEiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjI7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjczO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNzoiRXhwZW5zZSBTdGF0ZW1lbnQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoxNzoiZXhwZW5zZS1zdGF0ZW1lbnQiO3M6NToib3JkZXIiO2k6MztzOjk6InBhcmVudF9pZCI7aTo3MDtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDE1OjAyOjE5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDE1OjAyOjM2Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6NzM7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE3OiJFeHBlbnNlIFN0YXRlbWVudCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE3OiJleHBlbnNlLXN0YXRlbWVudCI7czo1OiJvcmRlciI7aTozO3M6OToicGFyZW50X2lkIjtpOjcwO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTU6MDI6MTkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTU6MDI6MzYiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX19fX1zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjE1O086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo2MjtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6NDoiQmFuayI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjE3OiJmYXMgZmEtdW5pdmVyc2l0eSI7czozOiJ1cmwiO047czo1OiJvcmRlciI7aToxNjtzOjk6InBhcmVudF9pZCI7TjtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDE0OjE2OjU4IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTEwLTA2IDE0OjE3OjQyIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6NjI7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjQ6IkJhbmsiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNzoiZmFzIGZhLXVuaXZlcnNpdHkiO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTY7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxNjo1OCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wNiAxNDoxNzo0MiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo4OiJjaGlsZHJlbiI7TzoyNjoiVHlwaUNNU1xOZXN0YWJsZUNvbGxlY3Rpb24iOjc6e3M6ODoiACoAdG90YWwiO2k6MztzOjE1OiIAKgBwYXJlbnRDb2x1bW4iO3M6OToicGFyZW50X2lkIjtzOjMzOiIAKgByZW1vdmVJdGVtc1dpdGhNaXNzaW5nQW5jZXN0b3IiO2I6MTtzOjE0OiIAKgBpbmRlbnRDaGFycyI7czo4OiLCoMKgwqDCoCI7czoxNToiACoAY2hpbGRyZW5OYW1lIjtzOjU6Iml0ZW1zIjtzOjE3OiIAKgBwYXJlbnRSZWxhdGlvbiI7czo2OiJwYXJlbnQiO3M6ODoiACoAaXRlbXMiO2E6Mzp7aTowO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo2MztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTE6Ik1hbmFnZSBCYW5rIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6NDoiYmFuayI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjYyO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MTc6MjMiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MTg6MTkiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo2MztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTE6Ik1hbmFnZSBCYW5rIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6NDoiYmFuayI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjYyO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MTc6MjMiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MTg6MTkiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjE7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjY0O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiQmFuayBUcmFuc2FjdGlvbiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE2OiJiYW5rLXRyYW5zYWN0aW9uIjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxNzo1MCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxODoyMyI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjY0O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxNjoiQmFuayBUcmFuc2FjdGlvbiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE2OiJiYW5rLXRyYW5zYWN0aW9uIjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxNzo1MCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxODoyMyI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MjtPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6NjU7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjExOiJCYW5rIExlZGdlciI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjExOiJiYW5rLWxlZGdlciI7czo1OiJvcmRlciI7aTozO3M6OToicGFyZW50X2lkIjtpOjYyO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MTg6MTUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MTg6MjciO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo2NTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTE6IkJhbmsgTGVkZ2VyIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTE6ImJhbmstbGVkZ2VyIjtzOjU6Im9yZGVyIjtpOjM7czo5OiJwYXJlbnRfaWQiO2k6NjI7czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxODoxNSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxODoyNyI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fX19fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MTY7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjY2O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxMToiTW9iaWxlIEJhbmsiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNzoiZmFzIGZhLW1vYmlsZS1hbHQiO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTc7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxOTowNyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wNiAxNDoxNzo0MiI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjY2O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxMToiTW9iaWxlIEJhbmsiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxNzoiZmFzIGZhLW1vYmlsZS1hbHQiO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTc7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNy0xMyAxNDoxOTowNyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wNiAxNDoxNzo0MiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo4OiJjaGlsZHJlbiI7TzoyNjoiVHlwaUNNU1xOZXN0YWJsZUNvbGxlY3Rpb24iOjc6e3M6ODoiACoAdG90YWwiO2k6MztzOjE1OiIAKgBwYXJlbnRDb2x1bW4iO3M6OToicGFyZW50X2lkIjtzOjMzOiIAKgByZW1vdmVJdGVtc1dpdGhNaXNzaW5nQW5jZXN0b3IiO2I6MTtzOjE0OiIAKgBpbmRlbnRDaGFycyI7czo4OiLCoMKgwqDCoCI7czoxNToiACoAY2hpbGRyZW5OYW1lIjtzOjU6Iml0ZW1zIjtzOjE3OiIAKgBwYXJlbnRSZWxhdGlvbiI7czo2OiJwYXJlbnQiO3M6ODoiACoAaXRlbXMiO2E6Mzp7aTowO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aTo2NztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTg6Ik1hbmFnZSBNb2JpbGUgQmFuayI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjExOiJtb2JpbGUtYmFuayI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjY2O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MTk6MzEiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MjA6NDEiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo2NztzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTg6Ik1hbmFnZSBNb2JpbGUgQmFuayI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjExOiJtb2JpbGUtYmFuayI7czo1OiJvcmRlciI7aToxO3M6OToicGFyZW50X2lkIjtpOjY2O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MTk6MzEiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MjA6NDEiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjE7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjY4O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoyMzoiTW9iaWxlIEJhbmsgVHJhbnNhY3Rpb24iO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoyMzoibW9iaWxlLWJhbmstdHJhbnNhY3Rpb24iO3M6NToib3JkZXIiO2k6MjtzOjk6InBhcmVudF9pZCI7aTo2NjtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDE0OjIwOjEwIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTA2IDEwOjE5OjI2Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6Njg7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjIzOiJNb2JpbGUgQmFuayBUcmFuc2FjdGlvbiI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjIzOiJtb2JpbGUtYmFuay10cmFuc2FjdGlvbiI7czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjY2O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MjA6MTAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMDYgMTA6MTk6MjYiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czo4OiIAKgBkYXRlcyI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjI7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjY5O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoxODoiTW9iaWxlIEJhbmsgTGVkZ2VyIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTg6Im1vYmlsZS1iYW5rLWxlZGdlciI7czo1OiJvcmRlciI7aTozO3M6OToicGFyZW50X2lkIjtpOjY2O3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDctMTMgMTQ6MjA6MzciO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMDYgMTA6MTk6NTQiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aTo2OTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTg6Ik1vYmlsZSBCYW5rIExlZGdlciI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE4OiJtb2JpbGUtYmFuay1sZWRnZXIiO3M6NToib3JkZXIiO2k6MztzOjk6InBhcmVudF9pZCI7aTo2NjtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA3LTEzIDE0OjIwOjM3IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTA2IDEwOjE5OjU0Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319fX19czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxNztPOjE3OiJBcHBcTW9kZWxzXE1vZHVsZSI6Mjg6e3M6MTE6IgAqAGZpbGxhYmxlIjthOjk6e2k6MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO2k6MjtzOjExOiJtb2R1bGVfbmFtZSI7aTozO3M6MTM6ImRpdmlkZXJfdGl0bGUiO2k6NDtzOjEwOiJpY29uX2NsYXNzIjtpOjU7czozOiJ1cmwiO2k6NjtzOjU6Im9yZGVyIjtpOjc7czo5OiJwYXJlbnRfaWQiO2k6ODtzOjY6InRhcmdldCI7fXM6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NzoibW9kdWxlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6MTc5O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czo2OiJSZXBvcnQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoyMToiZmFzIGZhLWZpbGUtc2lnbmF0dXJlIjtzOjM6InVybCI7TjtzOjU6Im9yZGVyIjtpOjE4O3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMDYgMTA6MDY6MTMiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMTAtMDYgMTQ6MTc6NDIiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aToxNzk7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjY6IlJlcG9ydCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjIxOiJmYXMgZmEtZmlsZS1zaWduYXR1cmUiO3M6MzoidXJsIjtOO3M6NToib3JkZXIiO2k6MTg7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0wNiAxMDowNjoxMyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0xMC0wNiAxNDoxNzo0MiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjg6IgAqAGRhdGVzIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo4OiJjaGlsZHJlbiI7TzoyNjoiVHlwaUNNU1xOZXN0YWJsZUNvbGxlY3Rpb24iOjc6e3M6ODoiACoAdG90YWwiO2k6MTg7czoxNToiACoAcGFyZW50Q29sdW1uIjtzOjk6InBhcmVudF9pZCI7czozMzoiACoAcmVtb3ZlSXRlbXNXaXRoTWlzc2luZ0FuY2VzdG9yIjtiOjE7czoxNDoiACoAaW5kZW50Q2hhcnMiO3M6ODoiwqDCoMKgwqAiO3M6MTU6IgAqAGNoaWxkcmVuTmFtZSI7czo1OiJpdGVtcyI7czoxNzoiACoAcGFyZW50UmVsYXRpb24iO3M6NjoicGFyZW50IjtzOjg6IgAqAGl0ZW1zIjthOjE4OntpOjA7TzoxNzoiQXBwXE1vZGVsc1xNb2R1bGUiOjI4OntzOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtpOjI7czoxMToibW9kdWxlX25hbWUiO2k6MztzOjEzOiJkaXZpZGVyX3RpdGxlIjtpOjQ7czoxMDoiaWNvbl9jbGFzcyI7aTo1O3M6MzoidXJsIjtpOjY7czo1OiJvcmRlciI7aTo3O3M6OToicGFyZW50X2lkIjtpOjg7czo2OiJ0YXJnZXQiO31zOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjc6Im1vZHVsZXMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjE4MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6NzoiQ2xvc2luZyI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjc6ImNsb3NpbmciO3M6NToib3JkZXIiO2k6MTtzOjk6InBhcmVudF9pZCI7aToxNzk7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMDYgMTA6MDY6MzYiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMDYgMTA6MTU6MjgiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aToxODA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjc6IkNsb3NpbmciO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czo3OiJjbG9zaW5nIjtzOjU6Im9yZGVyIjtpOjE7czo5OiJwYXJlbnRfaWQiO2k6MTc5O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTA2IDEwOjA2OjM2IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTA2IDEwOjE1OjI4Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoxMDoidGltZXN0YW1wcyI7YjoxO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxO086MTc6IkFwcFxNb2RlbHNcTW9kdWxlIjoyODp7czoxMToiACoAZmlsbGFibGUiO2E6OTp7aTowO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7aToyO3M6MTE6Im1vZHVsZV9uYW1lIjtpOjM7czoxMzoiZGl2aWRlcl90aXRsZSI7aTo0O3M6MTA6Imljb25fY2xhc3MiO2k6NTtzOjM6InVybCI7aTo2O3M6NToib3JkZXIiO2k6NztzOjk6InBhcmVudF9pZCI7aTo4O3M6NjoidGFyZ2V0Ijt9czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo3OiJtb2R1bGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aToxODE7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjE0OiJDbG9zaW5nIFJlcG9ydCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjE0OiJjbG9zaW5nLXJlcG9ydCI7czo1OiJvcmRlciI7aToyO3M6OToicGFyZW50X2lkIjtpOjE3OTtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0wNiAxMDowNjo1NyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wOS0wNiAxMDoxNTozMyI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjE4MTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MTQ6IkNsb3NpbmcgUmVwb3J0IjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO047czozOiJ1cmwiO3M6MTQ6ImNsb3NpbmctcmVwb3J0IjtzOjU6Im9yZGVyIjtpOjI7czo5OiJwYXJlbnRfaWQiO2k6MTc5O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTA2IDEwOjA2OjU3IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTA2IDEwOjE1OjMzIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9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O3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjE4NTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MjQ6IlRvZGF5J3MgQ3VzdG9tZXIgUmVjZWlwdCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjIzOiJ0b2RheXMtY3VzdG9tZXItcmVjZWlwdCI7czo1OiJvcmRlciI7aTo2O3M6OToicGFyZW50X2lkIjtpOjE3OTtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0wNiAxMDowOTowOCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyMS0wOS0yMyAxMjo1Nzo0NiI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEyOntzOjI6ImlkIjtpOjE4NTtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6MjQ6IlRvZGF5J3MgQ3VzdG9tZXIgUmVjZWlwdCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjIzOiJ0b2RheXMtY3VzdG9tZXItcmVjZWlwdCI7czo1OiJvcmRlciI7aTo2O3M6OToicGFyZW50X2lkIjtpOjE3OTtzOjY6InRhcmdldCI7czo1OiJfc2VsZiI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wOS0wNiAxMDowOTowOCI7czoxMDoidXBkYXRl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OjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6MTg5O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoyMDoiU2hpcHBpbmcgQ29zdCBSZXBvcnQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoyMDoic2hpcHBpbmctY29zdC1yZXBvcnQiO3M6NToib3JkZXIiO2k6MTE7czo5OiJwYXJlbnRfaWQiO2k6MTc5O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTA2IDEwOjExOjA5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTIzIDE0OjMwOjU1Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6MTg5O3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoyMDoiU2hpcHBpbmcgQ29zdCBSZXBvcnQiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7TjtzOjM6InVybCI7czoyMDoic2hpcHBpbmctY29zdC1yZXBvcnQiO3M6NToib3JkZXIiO2k6MTE7czo5OiJwYXJlbnRfaWQiO2k6MTc5O3M6NjoidGFyZ2V0IjtzOjU6Il9zZWxmIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTA2IDEwOjExOjA5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIxLTA5LTIzIDE0OjMwOjU1Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6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ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxMjp7czoyOiJpZCI7aToxOTk7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjI5OiJGaW5pc2ggR29vZHMgSW52ZW50b3J5IFJlcG9ydCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjI5OiJmaW5pc2gtZ29vZHMtaW52ZW50b3J5LXJlcG9ydCI7czo1OiJvcmRlciI7aToxNTtzOjk6InBhcmVudF9pZCI7aToxNzk7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMDYgMTA6NTE6MjkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjEtMDktMjMgMTQ6MzA6NTUiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aToxOTk7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjI5OiJGaW5pc2ggR29vZHMgSW52ZW50b3J5IFJlcG9ydCI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtOO3M6MzoidXJsIjtzOjI5OiJmaW5pc2gtZ29vZHMtaW52ZW50b3J5LXJlcG9ydCI7czo1OiJvcmRlciI7aToxNTtzOjk6InBhcmVudF9pZCI7aToxNzk7czo2OiJ0YXJnZXQiO3M6NToiX3NlbGYiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEt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', 1634465057);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('UmApBYVn1NuCQzol5DZCLYbKVIZnpJdYGws1wgCL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicEJ1Q0ZBaURTelBTRzk1UEZNWnluMXFWdzZEQnpTVEZKazBTeUp4eiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMDoiaHR0cDovL2Jkc3Rhci50ZXN0L3Byb2R1Y3QvYWRkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9iZHN0YXIudGVzdC9wcm9kdWN0L2FkZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1634460575);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'title', 'BD STAR', NULL, NULL),
(2, 'email', NULL, NULL, NULL),
(3, 'contact_no', '01521225987', NULL, NULL),
(4, 'address', 'Lorem Ipsum Dollar', NULL, NULL),
(5, 'currency_code', 'BDT', NULL, NULL),
(6, 'currency_symbol', 'Tk', NULL, NULL),
(7, 'currency_position', '2', NULL, NULL),
(8, 'timezone', 'Asia/Dhaka', NULL, NULL),
(9, 'date_format', 'd-M-Y', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `night_status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Day, 2=Night',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shift_manages`
--

CREATE TABLE `shift_manages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shift_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `presentstatus` int(11) DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Accepted, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `company_name`, `mobile`, `email`, `city`, `zipcode`, `address`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Ahmed', 'AH', '01521225986', NULL, NULL, NULL, NULL, '1', 'Super Admin', NULL, '2021-10-11 10:09:30', '2021-10-11 10:09:30'),
(2, 'Mr. Akkas', 'AK', '01521225984', NULL, NULL, NULL, NULL, '1', 'Super Admin', NULL, '2021-10-11 10:09:57', '2021-10-11 10:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '@5%', '5', '1', NULL, NULL, NULL, NULL),
(2, '@10%', '10', '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `is_opening` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Yes, 2=No',
  `posted` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No',
  `approve` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No,3=Pending',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `chart_of_account_id`, `warehouse_id`, `voucher_no`, `voucher_type`, `voucher_date`, `description`, `debit`, `credit`, `is_opening`, `posted`, `approve`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 72, 1, 'TO9OMQNJKH', 'PR Balance', '2021-10-11', 'Salesman credit For previous balance Md. Shahed', 0, 250, '2', '1', '1', 'Super Admin', NULL, '2021-10-11 09:42:17', NULL),
(2, 23, 1, 'OP-211011141', 'Opening', '2021-10-11', NULL, 50000, 0, '1', '1', '1', 'Super Admin', NULL, '2021-10-11 10:14:38', '2021-10-11 10:14:38'),
(3, 73, 1, '1', 'Purchase', '2021-10-11', 'Supplier Mr. Ahmed', 0, 21000, '2', '1', '1', 'Super Admin', 'Super Admin', '2021-10-11 11:19:11', '2021-10-11 12:24:29'),
(4, 17, 1, '1', 'Purchase', '2021-10-11', 'Inventory Debit For Supplier Mr. Ahmed', 21000, 0, '2', '1', '1', 'Super Admin', 'Super Admin', '2021-10-11 11:19:11', '2021-10-11 12:24:29'),
(5, 11, 1, '1', 'Purchase', '2021-10-11', 'Company Credit For Supplier Mr. Ahmed', 21000, 0, '2', '1', '1', 'Super Admin', 'Super Admin', '2021-10-11 11:19:11', '2021-10-11 12:24:29'),
(6, 74, 1, '2', 'Purchase', '2021-10-11', 'Supplier Mr. Akkas', 0, 2400, '2', '1', '1', 'Super Admin', 'Super Admin', '2021-10-11 11:20:10', '2021-10-11 12:24:02'),
(7, 17, 1, '2', 'Purchase', '2021-10-11', 'Inventory Debit For Supplier Mr. Akkas', 2400, 0, '2', '1', '1', 'Super Admin', 'Super Admin', '2021-10-11 11:20:10', '2021-10-11 12:24:02'),
(8, 11, 1, '2', 'Purchase', '2021-10-11', 'Company Credit For Supplier Mr. Akkas', 2400, 0, '2', '1', '1', 'Super Admin', 'Super Admin', '2021-10-11 11:20:10', '2021-10-11 12:24:02'),
(9, 17, 1, 'SINV-211011121', 'INVOICE', '2021-10-11', 'Inventory Credit For Invoice No SINV-211011121', 0, 120, '2', '1', '1', 'Super Admin', NULL, '2021-10-11 16:22:46', NULL),
(10, 75, 1, 'SINV-211011121', 'INVOICE', '2021-10-11', 'Customer debit For Invoice No -  SINV-211011121 Customer Mr. Sojol', 200, 0, '2', '1', '1', 'Super Admin', NULL, '2021-10-11 16:22:46', NULL),
(11, 8, 1, 'SINV-211011121', 'INVOICE', '2021-10-11', 'Sale Income For Invoice NO - SINV-211011121 Customer Mr. Sojol', 0, 200, '2', '1', '1', 'Super Admin', NULL, '2021-10-11 16:22:46', NULL),
(12, 71, 1, 'SINV-211011121', 'INVOICE', '2021-10-11', 'Sale Total SR Commission For Invoice NO - SINV-211011121 Sales Men Mohammad Arman', 0, 5, '2', '1', '1', 'Super Admin', NULL, '2021-10-11 16:22:46', '2021-10-11 16:22:46'),
(13, 75, 1, 'SINV-211011121', 'INVOICE', '2021-10-11', 'Customer credit for Paid Amount For Customer Invoice NO- SINV-211011121 Customer- Mr. Sojol', 0, 200, '2', '1', '1', 'Super Admin', NULL, '2021-10-11 16:22:46', NULL),
(14, 23, 1, 'SINV-211011121', 'INVOICE', '2021-10-11', 'Cash in Hand in Sale for Invoice No - SINV-211011121 customer- Mr. Sojol', 200, 0, '2', '1', '1', 'Super Admin', NULL, '2021-10-11 16:22:46', NULL),
(16, 75, 1, 'SINV-211011121', 'Return', '2021-10-13', 'Customer Mr. Sojol credit for Product Return Invoice NO- ', 0, 100, '2', '1', '1', 'Admin', NULL, '2021-10-13 09:37:14', '2021-10-13 09:37:14'),
(17, 71, 1, 'SINV-211011121', 'Return', '2021-10-13', 'Return Total SR Commission For Invoice NO -  Sales Men Mohammad Arman', 2.5, 0, '2', '1', '1', 'Admin', NULL, '2021-10-13 09:37:14', '2021-10-13 09:37:14'),
(18, 75, 1, 'DV-21101324', 'DV', '2021-10-13', 'Lorem Ipsum dollar', 100, 0, '2', '1', '3', 'Admin', NULL, '2021-10-13 09:39:15', NULL),
(19, 23, 1, 'DV-21101324', 'DV', '2021-10-13', 'Debit Voucher From Cash In Hand', 0, 100, '2', '1', '3', 'Admin', NULL, '2021-10-13 09:39:15', NULL),
(20, 77, 1, 'CV-20211013125', 'CV', '2021-10-13', NULL, 0, 5000, '2', '1', '3', 'Admin', NULL, '2021-10-13 09:39:49', NULL),
(21, 23, 1, 'CV-20211013125', 'CV', '2021-10-13', 'Credit Voucher From Cash In Hand', 5000, 0, '2', '1', '3', 'Admin', NULL, '2021-10-13 09:39:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_id` bigint(20) UNSIGNED NOT NULL,
  `chalan_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_unit_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_base_unit_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `labor_cost` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `received_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carried_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_products`
--

CREATE TABLE `transfer_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transfer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_qty` double DEFAULT NULL,
  `base_unit_qty` double DEFAULT NULL,
  `net_unit_price` double DEFAULT NULL,
  `base_unit_price` double DEFAULT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int(10) UNSIGNED DEFAULT NULL,
  `operator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '*',
  `operation_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_name`, `unit_code`, `base_unit`, `operator`, `operation_value`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Piece', 'Pc', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-07-13 19:14:39', '2021-07-13 19:14:39'),
(2, 'Kilogram', 'Kg', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-07-13 19:14:57', '2021-07-13 19:14:57'),
(3, 'Gram', 'gm', 2, '/', '1000', '1', 'Super Admin', NULL, '2021-07-13 19:15:24', '2021-07-13 19:15:24'),
(4, 'CTN900', 'CTN900', 1, '*', '12', '1', 'Super Admin', 'Super Admin', '2021-07-26 09:27:33', '2021-09-07 05:18:35'),
(5, 'MBAG20', 'MBAG20', 1, '*', '324', '1', 'Super Admin', 'Super Admin', '2021-07-26 09:28:57', '2021-09-07 05:17:41'),
(6, 'MBAG50', 'MBAG50', 1, '*', '240', '1', 'Super Admin', 'Super Admin', '2021-07-26 09:29:28', '2021-09-07 05:17:54'),
(7, 'MBAG100', 'MBAG100', 1, '*', '120', '1', 'Super Admin', 'Super Admin', '2021-07-26 09:30:13', '2021-09-07 05:18:08'),
(8, 'MBAG200', 'MBAG200', 1, '*', '60', '1', 'Super Admin', 'Super Admin', '2021-07-26 09:30:38', '2021-09-07 05:18:19'),
(9, 'Drum', 'drum', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-07-31 09:26:42', '2021-07-31 09:26:42'),
(10, 'Liter', 'Ltr', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-07-31 09:27:05', '2021-07-31 09:27:05'),
(11, 'Carton', 'Ctn', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-07-31 09:27:18', '2021-07-31 09:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Male,2=Female,3=Other',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `email`, `phone`, `avatar`, `gender`, `password`, `status`, `deletable`, `created_by`, `modified_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super Admin', 'SuperAdmin', 'superadmin@mail.com', '01521225987', NULL, '1', '$2y$10$oyBQnkvC8WZEQffhpEEsyeZPPqXEHmpaErfi62fsfyAw.UMwIzS/m', '1', '1', NULL, NULL, NULL, '2021-03-26 17:49:24', '2021-03-26 17:49:24'),
(2, 2, 'Admin', 'Admin', 'admin@mail.com', '01711154960', NULL, '1', '$2y$10$KF7BIkSLDeOwTMgh6KtAVOrUOGfKQjWxDqXOO7UmR2Lpdrh1C9IKC', '1', '1', 'Admin', NULL, 'BVb6rzDxXTOfZ3j8o7XYI5SMON0r9Ug7yKOfBIV67nr8yk8j26iQmt0wk0m1', '2021-03-26 17:49:24', '2021-05-04 11:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `asm_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `district_id`, `asm_id`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Main Warehouse', NULL, NULL, NULL, 1, 1, '1', '1', 'Super Admin', NULL, '2021-10-11 06:41:53', '2021-10-11 06:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_material`
--

CREATE TABLE `warehouse_material` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_material`
--

INSERT INTO `warehouse_material` (`id`, `warehouse_id`, `material_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 90.00, '2021-10-11 11:19:11', '2021-10-11 14:50:28'),
(2, 1, 2, 90.00, '2021-10-11 11:20:10', '2021-10-11 14:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_product`
--

CREATE TABLE `warehouse_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_product`
--

INSERT INTO `warehouse_product` (`id`, `warehouse_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 190, '2021-10-11 14:56:07', '2021-10-13 09:37:14');

-- --------------------------------------------------------

--
-- Table structure for table `weekly_holiday_assigns`
--

CREATE TABLE `weekly_holiday_assigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `weekly_holiday_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `adjustments_adjustment_no_unique` (`adjustment_no`),
  ADD KEY `adjustments_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `adjustment_products`
--
ALTER TABLE `adjustment_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_products_adjustment_id_foreign` (`adjustment_id`),
  ADD KEY `adjustment_products_product_id_foreign` (`product_id`),
  ADD KEY `adjustment_products_base_unit_id_foreign` (`base_unit_id`);

--
-- Indexes for table `allowance_deductions`
--
ALTER TABLE `allowance_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowance_deduction_manages`
--
ALTER TABLE `allowance_deduction_manages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `allowance_deduction_manages_allowance_deduction_id_foreign` (`allowance_deduction_id`),
  ADD KEY `allowance_deduction_manages_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `asms`
--
ALTER TABLE `asms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asms_phone_unique` (`phone`),
  ADD KEY `asms_district_id_foreign` (`district_id`);

--
-- Indexes for table `asm_module`
--
ALTER TABLE `asm_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asm_module_module_id_foreign` (`module_id`),
  ADD KEY `asm_module_asm_id_foreign` (`asm_id`);

--
-- Indexes for table `asm_permission`
--
ALTER TABLE `asm_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asm_permission_permission_id_foreign` (`permission_id`),
  ADD KEY `asm_permission_asm_id_foreign` (`asm_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banks_account_number_unique` (`account_number`),
  ADD KEY `banks_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chart_of_accounts_code_unique` (`code`),
  ADD KEY `chart_of_accounts_customer_id_foreign` (`customer_id`),
  ADD KEY `chart_of_accounts_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `customers_district_id_foreign` (`district_id`),
  ADD KEY `customers_upazila_id_foreign` (`upazila_id`),
  ADD KEY `customers_route_id_foreign` (`route_id`),
  ADD KEY `customers_area_id_foreign` (`area_id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_group_name_unique` (`group_name`);

--
-- Indexes for table `daily_closings`
--
ALTER TABLE `daily_closings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_closings_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `damages_damage_no_unique` (`damage_no`),
  ADD KEY `damages_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `damages_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `damage_products`
--
ALTER TABLE `damage_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `damage_products_damage_id_foreign` (`damage_id`),
  ADD KEY `damage_products_product_id_foreign` (`product_id`),
  ADD KEY `damage_products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designations_name_unique` (`name`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `divisions_name_unique` (`name`),
  ADD KEY `divisions_department_id_foreign` (`department_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_phone_unique` (`phone`),
  ADD UNIQUE KEY `employees_employee_id_unique` (`employee_id`),
  ADD UNIQUE KEY `employees_finger_id_unique` (`finger_id`),
  ADD KEY `employees_shift_id_foreign` (`shift_id`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_division_id_foreign` (`division_id`),
  ADD KEY `employees_joining_designation_id_foreign` (`joining_designation_id`),
  ADD KEY `employees_current_designation_id_foreign` (`current_designation_id`);

--
-- Indexes for table `employee_education`
--
ALTER TABLE `employee_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_education_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_professional_information`
--
ALTER TABLE `employee_professional_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_professional_information_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_routes`
--
ALTER TABLE `employee_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expenses_voucher_no_unique` (`voucher_no`),
  ADD KEY `expenses_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `expenses_expense_item_id_foreign` (`expense_item_id`),
  ADD KEY `expenses_account_id_foreign` (`account_id`);

--
-- Indexes for table `expense_items`
--
ALTER TABLE `expense_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expense_items_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_application_manages`
--
ALTER TABLE `leave_application_manages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_application_manages_leave_id_foreign` (`leave_id`),
  ADD KEY `leave_application_manages_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_employee_id_foreign` (`employee_id`),
  ADD KEY `loans_person_id_foreign` (`person_id`),
  ADD KEY `loans_account_id_foreign` (`account_id`);

--
-- Indexes for table `loan_installments`
--
ALTER TABLE `loan_installments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_installments_loan_id_foreign` (`loan_id`),
  ADD KEY `loan_installments_employee_id_foreign` (`employee_id`),
  ADD KEY `loan_installments_person_id_foreign` (`person_id`),
  ADD KEY `loan_installments_account_id_foreign` (`account_id`);

--
-- Indexes for table `loan_people`
--
ALTER TABLE `loan_people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loan_people_name_unique` (`name`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materials_material_code_unique` (`material_code`),
  ADD KEY `materials_category_id_foreign` (`category_id`),
  ADD KEY `materials_unit_id_foreign` (`unit_id`),
  ADD KEY `materials_purchase_unit_id_foreign` (`purchase_unit_id`),
  ADD KEY `materials_tax_id_foreign` (`tax_id`),
  ADD KEY `materials_opening_warehouse_id_foreign` (`opening_warehouse_id`);

--
-- Indexes for table `material_purchase`
--
ALTER TABLE `material_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_purchase_purchase_id_foreign` (`purchase_id`),
  ADD KEY `material_purchase_material_id_foreign` (`material_id`),
  ADD KEY `material_purchase_purchase_unit_id_foreign` (`purchase_unit_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_menu_name_unique` (`menu_name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_banks`
--
ALTER TABLE `mobile_banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_banks_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `module_role`
--
ALTER TABLE `module_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_role_module_id_foreign` (`module_id`),
  ADD KEY `module_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `productions`
--
ALTER TABLE `productions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productions_batch_no_unique` (`batch_no`),
  ADD KEY `productions_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `production_products`
--
ALTER TABLE `production_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_products_production_id_foreign` (`production_id`),
  ADD KEY `production_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `production_product_materials`
--
ALTER TABLE `production_product_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_product_materials_production_product_id_foreign` (`production_product_id`),
  ADD KEY `production_product_materials_material_id_foreign` (`material_id`),
  ADD KEY `production_product_materials_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_base_unit_id_foreign` (`base_unit_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`),
  ADD KEY `products_tax_id_foreign` (`tax_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `product_material`
--
ALTER TABLE `product_material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_material_product_id_foreign` (`product_id`),
  ADD KEY `product_material_material_id_foreign` (`material_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchases_memo_no_unique` (`memo_no`),
  ADD KEY `purchases_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_payments_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_payments_account_id_foreign` (`account_id`),
  ADD KEY `purchase_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_payments_supplier_debit_transaction_id_foreign` (`supplier_debit_transaction_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_returns_return_no_unique` (`return_no`),
  ADD KEY `purchase_returns_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `purchase_returns_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_return_materials`
--
ALTER TABLE `purchase_return_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_materials_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `purchase_return_materials_material_id_foreign` (`material_id`),
  ADD KEY `purchase_return_materials_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_name_unique` (`role_name`);

--
-- Indexes for table `salary_generates`
--
ALTER TABLE `salary_generates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salary_generates_voucher_no_unique` (`voucher_no`),
  ADD KEY `salary_generates_employee_id_foreign` (`employee_id`),
  ADD KEY `salary_generates_designation_id_foreign` (`designation_id`),
  ADD KEY `salary_generates_department_id_foreign` (`department_id`),
  ADD KEY `salary_generates_division_id_foreign` (`division_id`);

--
-- Indexes for table `salary_generate_payments`
--
ALTER TABLE `salary_generate_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_generate_payments_salary_generated_id_foreign` (`salary_generated_id`),
  ADD KEY `salary_generate_payments_account_id_foreign` (`account_id`),
  ADD KEY `salary_generate_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `salary_generate_payments_employee_transaction_id_foreign` (`employee_transaction_id`);

--
-- Indexes for table `salary_incements`
--
ALTER TABLE `salary_incements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_incements_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_memo_no_unique` (`memo_no`),
  ADD KEY `sales_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `sales_district_id_foreign` (`district_id`),
  ADD KEY `sales_upazila_id_foreign` (`upazila_id`),
  ADD KEY `sales_route_id_foreign` (`route_id`),
  ADD KEY `sales_area_id_foreign` (`area_id`),
  ADD KEY `sales_salesmen_id_foreign` (`salesmen_id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`),
  ADD KEY `sales_account_id_foreign` (`account_id`);

--
-- Indexes for table `salesmen`
--
ALTER TABLE `salesmen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salesmen_username_unique` (`username`),
  ADD UNIQUE KEY `salesmen_phone_unique` (`phone`),
  ADD KEY `salesmen_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `salesmen_district_id_foreign` (`district_id`),
  ADD KEY `salesmen_upazila_id_foreign` (`upazila_id`);

--
-- Indexes for table `sales_men_daily_routes`
--
ALTER TABLE `sales_men_daily_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_men_daily_routes_salesmen_id_foreign` (`salesmen_id`),
  ADD KEY `sales_men_daily_routes_route_id_foreign` (`route_id`);

--
-- Indexes for table `sale_products`
--
ALTER TABLE `sale_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_products_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_products_product_id_foreign` (`product_id`),
  ADD KEY `sale_products_sale_unit_id_foreign` (`sale_unit_id`);

--
-- Indexes for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sale_returns_return_no_unique` (`return_no`),
  ADD KEY `sale_returns_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `sale_returns_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `sale_return_products`
--
ALTER TABLE `sale_return_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_products_sale_return_id_foreign` (`sale_return_id`),
  ADD KEY `sale_return_products_product_id_foreign` (`product_id`),
  ADD KEY `sale_return_products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shift_manages`
--
ALTER TABLE `shift_manages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shift_manages_shift_id_foreign` (`shift_id`),
  ADD KEY `shift_manages_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxes_name_unique` (`name`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_chart_of_account_id_foreign` (`chart_of_account_id`),
  ADD KEY `transactions_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_chalan_no_unique` (`chalan_no`),
  ADD KEY `transfers_production_id_foreign` (`production_id`),
  ADD KEY `transfers_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `transfer_products`
--
ALTER TABLE `transfer_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_products_transfer_id_foreign` (`transfer_id`),
  ADD KEY `transfer_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_name_unique` (`name`),
  ADD KEY `warehouses_district_id_foreign` (`district_id`),
  ADD KEY `warehouses_asm_id_foreign` (`asm_id`);

--
-- Indexes for table `warehouse_material`
--
ALTER TABLE `warehouse_material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_material_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `warehouse_material_material_id_foreign` (`material_id`);

--
-- Indexes for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `weekly_holiday_assigns`
--
ALTER TABLE `weekly_holiday_assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weekly_holiday_assigns_employee_id_foreign` (`employee_id`),
  ADD KEY `weekly_holiday_assigns_weekly_holiday_id_foreign` (`weekly_holiday_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adjustment_products`
--
ALTER TABLE `adjustment_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `allowance_deductions`
--
ALTER TABLE `allowance_deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `allowance_deduction_manages`
--
ALTER TABLE `allowance_deduction_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asms`
--
ALTER TABLE `asms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `asm_module`
--
ALTER TABLE `asm_module`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asm_permission`
--
ALTER TABLE `asm_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `daily_closings`
--
ALTER TABLE `daily_closings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damage_products`
--
ALTER TABLE `damage_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_education`
--
ALTER TABLE `employee_education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_professional_information`
--
ALTER TABLE `employee_professional_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_routes`
--
ALTER TABLE `employee_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_items`
--
ALTER TABLE `expense_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_application_manages`
--
ALTER TABLE `leave_application_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_installments`
--
ALTER TABLE `loan_installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_people`
--
ALTER TABLE `loan_people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=584;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `material_purchase`
--
ALTER TABLE `material_purchase`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `mobile_banks`
--
ALTER TABLE `mobile_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `module_role`
--
ALTER TABLE `module_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=572;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT for table `productions`
--
ALTER TABLE `productions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `production_products`
--
ALTER TABLE `production_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `production_product_materials`
--
ALTER TABLE `production_product_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_material`
--
ALTER TABLE `product_material`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_materials`
--
ALTER TABLE `purchase_return_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salary_generates`
--
ALTER TABLE `salary_generates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_generate_payments`
--
ALTER TABLE `salary_generate_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_incements`
--
ALTER TABLE `salary_incements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salesmen`
--
ALTER TABLE `salesmen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_men_daily_routes`
--
ALTER TABLE `sales_men_daily_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sale_products`
--
ALTER TABLE `sale_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sale_returns`
--
ALTER TABLE `sale_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sale_return_products`
--
ALTER TABLE `sale_return_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shift_manages`
--
ALTER TABLE `shift_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_products`
--
ALTER TABLE `transfer_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouse_material`
--
ALTER TABLE `warehouse_material`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `weekly_holiday_assigns`
--
ALTER TABLE `weekly_holiday_assigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD CONSTRAINT `adjustments_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `adjustment_products`
--
ALTER TABLE `adjustment_products`
  ADD CONSTRAINT `adjustment_products_adjustment_id_foreign` FOREIGN KEY (`adjustment_id`) REFERENCES `adjustments` (`id`),
  ADD CONSTRAINT `adjustment_products_base_unit_id_foreign` FOREIGN KEY (`base_unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `adjustment_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `allowance_deduction_manages`
--
ALTER TABLE `allowance_deduction_manages`
  ADD CONSTRAINT `allowance_deduction_manages_allowance_deduction_id_foreign` FOREIGN KEY (`allowance_deduction_id`) REFERENCES `allowance_deductions` (`id`),
  ADD CONSTRAINT `allowance_deduction_manages_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `asms`
--
ALTER TABLE `asms`
  ADD CONSTRAINT `asms_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `asm_module`
--
ALTER TABLE `asm_module`
  ADD CONSTRAINT `asm_module_asm_id_foreign` FOREIGN KEY (`asm_id`) REFERENCES `asms` (`id`),
  ADD CONSTRAINT `asm_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `asm_permission`
--
ALTER TABLE `asm_permission`
  ADD CONSTRAINT `asm_permission_asm_id_foreign` FOREIGN KEY (`asm_id`) REFERENCES `asms` (`id`),
  ADD CONSTRAINT `asm_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`);

--
-- Constraints for table `banks`
--
ALTER TABLE `banks`
  ADD CONSTRAINT `banks_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD CONSTRAINT `chart_of_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `chart_of_accounts_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`),
  ADD CONSTRAINT `customers_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `customers_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `customers_upazila_id_foreign` FOREIGN KEY (`upazila_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `daily_closings`
--
ALTER TABLE `daily_closings`
  ADD CONSTRAINT `daily_closings_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `damages`
--
ALTER TABLE `damages`
  ADD CONSTRAINT `damages_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `damages_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `damage_products`
--
ALTER TABLE `damage_products`
  ADD CONSTRAINT `damage_products_damage_id_foreign` FOREIGN KEY (`damage_id`) REFERENCES `damages` (`id`),
  ADD CONSTRAINT `damage_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `damage_products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `expenses_expense_item_id_foreign` FOREIGN KEY (`expense_item_id`) REFERENCES `expense_items` (`id`),
  ADD CONSTRAINT `expenses_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `loan_installments`
--
ALTER TABLE `loan_installments`
  ADD CONSTRAINT `loan_installments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `loan_installments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `loan_installments_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`),
  ADD CONSTRAINT `loan_installments_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `loan_people` (`id`);

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `materials_opening_warehouse_id_foreign` FOREIGN KEY (`opening_warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `materials_purchase_unit_id_foreign` FOREIGN KEY (`purchase_unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `materials_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`),
  ADD CONSTRAINT `materials_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `material_purchase`
--
ALTER TABLE `material_purchase`
  ADD CONSTRAINT `material_purchase_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `material_purchase_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  ADD CONSTRAINT `material_purchase_purchase_unit_id_foreign` FOREIGN KEY (`purchase_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `mobile_banks`
--
ALTER TABLE `mobile_banks`
  ADD CONSTRAINT `mobile_banks_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Constraints for table `module_role`
--
ALTER TABLE `module_role`
  ADD CONSTRAINT `module_role_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `module_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `productions`
--
ALTER TABLE `productions`
  ADD CONSTRAINT `productions_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `production_products`
--
ALTER TABLE `production_products`
  ADD CONSTRAINT `production_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `production_products_production_id_foreign` FOREIGN KEY (`production_id`) REFERENCES `productions` (`id`);

--
-- Constraints for table `production_product_materials`
--
ALTER TABLE `production_product_materials`
  ADD CONSTRAINT `production_product_materials_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `production_product_materials_production_product_id_foreign` FOREIGN KEY (`production_product_id`) REFERENCES `production_products` (`id`),
  ADD CONSTRAINT `production_product_materials_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_base_unit_id_foreign` FOREIGN KEY (`base_unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `product_material`
--
ALTER TABLE `product_material`
  ADD CONSTRAINT `product_material_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `product_material_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `purchases_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD CONSTRAINT `purchase_payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `purchase_payments_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  ADD CONSTRAINT `purchase_payments_supplier_debit_transaction_id_foreign` FOREIGN KEY (`supplier_debit_transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `purchase_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `purchase_returns_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `purchase_returns_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `purchase_return_materials`
--
ALTER TABLE `purchase_return_materials`
  ADD CONSTRAINT `purchase_return_materials_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `purchase_return_materials_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`),
  ADD CONSTRAINT `purchase_return_materials_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `sales_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `sales_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `sales_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `sales_salesmen_id_foreign` FOREIGN KEY (`salesmen_id`) REFERENCES `salesmen` (`id`),
  ADD CONSTRAINT `sales_upazila_id_foreign` FOREIGN KEY (`upazila_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `sales_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `salesmen`
--
ALTER TABLE `salesmen`
  ADD CONSTRAINT `salesmen_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `salesmen_upazila_id_foreign` FOREIGN KEY (`upazila_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `salesmen_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `sales_men_daily_routes`
--
ALTER TABLE `sales_men_daily_routes`
  ADD CONSTRAINT `sales_men_daily_routes_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `sales_men_daily_routes_salesmen_id_foreign` FOREIGN KEY (`salesmen_id`) REFERENCES `salesmen` (`id`);

--
-- Constraints for table `sale_products`
--
ALTER TABLE `sale_products`
  ADD CONSTRAINT `sale_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sale_products_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `sale_products_sale_unit_id_foreign` FOREIGN KEY (`sale_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD CONSTRAINT `sale_returns_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `sale_returns_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `sale_return_products`
--
ALTER TABLE `sale_return_products`
  ADD CONSTRAINT `sale_return_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sale_return_products_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`),
  ADD CONSTRAINT `sale_return_products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `transactions_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_production_id_foreign` FOREIGN KEY (`production_id`) REFERENCES `productions` (`id`),
  ADD CONSTRAINT `transfers_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `transfer_products`
--
ALTER TABLE `transfer_products`
  ADD CONSTRAINT `transfer_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `transfer_products_transfer_id_foreign` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `warehouses_asm_id_foreign` FOREIGN KEY (`asm_id`) REFERENCES `asms` (`id`),
  ADD CONSTRAINT `warehouses_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `warehouse_material`
--
ALTER TABLE `warehouse_material`
  ADD CONSTRAINT `warehouse_material_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `warehouse_material_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD CONSTRAINT `warehouse_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `warehouse_product_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
