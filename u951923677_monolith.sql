-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 15, 2025 at 05:49 AM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u951923677_monolith`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_pages`
--

CREATE TABLE `auth_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `section` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_pages`
--

INSERT INTO `auth_pages` (`id`, `title`, `description`, `section`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, '[\"Secure Access, Seamless Experience.\",\"Your Trusted Gateway to Digital Security.\",\"Fast, Safe & Effortless Login.\"]', '[\"Securely access your account with ease. Whether you\'re logging in, signing up, or resetting your password, we ensure a seamless and protected experience. Your data, your security, our priority.\",\"Fast, secure, and hassle-free authentication. Sign in with confidence and experience a seamless way to access your account\\u2014because your security matters.\",\"A seamless and secure way to access your account. Whether you\'re logging in, signing up, or recovering your password, we ensure your data stays protected at every step.\"]', '1', 'upload/images/auth_page.svg', 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_number` varchar(191) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `contact_number`, `subject`, `message`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'test Contact', 'testcontact4@gmail.com', '911110111114', 'For Verification', 'Check All The Docs', 1, '2025-03-07 10:32:39', '2025-03-07 10:32:39'),
(2, 'Test Assistance', 'testassistance@gmail.com', '0123123123', 'For Maintience', 'Test', 7, '2025-03-10 17:47:57', '2025-03-10 17:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `rate` double(8,2) NOT NULL DEFAULT 0.00,
  `applicable_packages` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `valid_for` date DEFAULT NULL,
  `use_limit` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `type`, `rate`, `applicable_packages`, `code`, `valid_for`, `use_limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test Coupan', 'fixed', 10.00, '1', 'ABC123', '2025-03-08', 10, 1, '2025-03-07 11:13:06', '2025-03-07 11:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_histories`
--

CREATE TABLE `coupon_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon` int(11) NOT NULL DEFAULT 0,
  `package` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `expense_id` int(11) NOT NULL DEFAULT 0,
  `property_id` int(11) NOT NULL DEFAULT 0,
  `unit_id` int(11) NOT NULL DEFAULT 0,
  `expense_type` int(11) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `receipt` varchar(191) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `title`, `expense_id`, `property_id`, `unit_id`, `expense_type`, `date`, `amount`, `receipt`, `notes`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Test', 1, 3, 2, 4, '2025-03-07', 12500.00, 'searce_result_1741628752.png', 'Test', 7, '2025-03-10 17:45:52', '2025-03-10 17:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `f_a_q_s`
--

CREATE TABLE `f_a_q_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `enabled` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `f_a_q_s`
--

INSERT INTO `f_a_q_s` (`id`, `question`, `description`, `enabled`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'What features does your software offer?', 'Our software provides a range of features including automation tools, real-time analytics, cloud-based access, secure data storage, seamless integrations, and customizable solutions tailored to your business needs.', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(2, 'Is your software easy to use?', 'Yes! Our platform is designed to be user-friendly and intuitive, so your team can get started quickly without a steep learning curve.', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(3, 'Can I integrate your software with my existing systems?', 'Absolutely! Our software is built to easily integrate with your current tools and systems, making the transition seamless and efficient.', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(4, 'Is customer support available?', 'Yes! We offer 24/7 customer support. Our dedicated team is ready to assist you with any questions or issues you may have.', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(5, 'Is my data secure with your software?', 'Yes. We use advanced encryption and data protection protocols to ensure your data is secure and private at all times.', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(6, 'Can I customize the software to fit my business needs?', 'Yes! Our software is highly customizable to adapt to your unique workflows and requirements.', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(7, 'What types of businesses can benefit from your software?', 'Our solutions are suitable for a wide range of industries, including retail, healthcare, finance, marketing, and more. We tailor our offerings to meet the specific needs of each business.', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(8, 'Is there a free trial available?', 'Yes! We offer a free trial so you can explore the features and capabilities of our software before committing.', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(9, 'Do I need technical expertise to use the software?', 'Not at all. Our software is designed for users of all skill levels. Plus, our support team is available to guide you through any setup or usage questions.', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(10, 'How often is the software updated?', 'We regularly release updates to improve features, security, and overall performance, ensuring that you always have access to the latest technology.', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `home_pages`
--

CREATE TABLE `home_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `section` varchar(191) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `content_value` text DEFAULT NULL,
  `enabled` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_pages`
--

INSERT INTO `home_pages` (`id`, `title`, `section`, `content`, `content_value`, `enabled`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Header Menu', 'Section 0', '', '{\"name\":\"Header Menu\",\"menu_pages\":[\"1\",\"2\"]}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(2, 'Banner', 'Section 1', '\n                <header id=\"home\">\n                    <div class=\"container\">\n                        <div class=\"row align-items-center justify-content-between\">\n                            <div class=\"col-lg-5 col-xl-4\">\n                                <h1 class=\"mt-sm-3 mb-sm-4 f-w-600 wow fadeInUp\" data-wow-delay=\"0.2s\">\n\n                                    <span class=\"text-primary\">Smart Tenant - Property Management System</span>\n                                </h1>\n                                <h4 class=\"mb-sm-4 text-muted wow fadeInUp\" data-wow-delay=\"0.4s\">\n                                    Property management refers to the administration, operation, and oversight of real estate properties on behalf of property owners. It involves various tasks such as marketing rental properties, finding tenants, collecting rent and ensuring legal compliance.\n                                </h4>\n                                <div class=\"my-3 my-xl-5 wow fadeInUp\" data-wow-delay=\"0.6s\">\n                                    <a href=\"dashboard/index.html\" class=\"btn btn-secondary me-2\">Get Started</a>\n\n                                </div>\n                                <div class=\"mb-4 mb-lg-0 d-inline-flex align-items-center wow fadeInUp\" data-wow-delay=\"0.8s\">\n                                    <div class=\"flex-shrink-0\">\n                                        <div class=\"avtar avtar-l bg-light-secondary text-secondary\">\n                                            <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"40\" height=\"32\"\n                                                class=\"d-block\" viewBox=\"0 0 118 94\" role=\"img\">\n                                                <path fill-rule=\"evenodd\" clip-rule=\"evenodd\"\n                                                    d=\"M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z\"\n                                                    fill=\"currentColor\"></path>\n                                            </svg>\n                                        </div>\n                                    </div>\n                                    <div class=\"flex-grow-1 ms-3\">\n                                        <h5 class=\"mb-0 text-start\">\n                                            Manage your business efficiently with our all-in-one solution designed for performance, security, and scalability.\n                                        </h5>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-lg-7\">\n                                <div class=\"hero-image\">\n                                    <img src=\"assets/images/landing/img-header-main.svg\" alt=\"image\"\n                                        class=\"img-fluid img-bg wow fadeInUp\" data-wow-delay=\"0.5s\" />\n                                    <div class=\"img-widget-1\">\n                                        <img src=\"assets/images/landing/img-widget-1.svg\" alt=\"image\"\n                                            class=\"img-fluid wow fadeInDown\" data-wow-delay=\"0.6s\" />\n                                    </div>\n                                    <div class=\"img-widget-2\">\n                                        <img src=\"assets/images/landing/img-widget-2.svg\" alt=\"image\"\n                                            class=\"img-fluid wow fadeInDown\" data-wow-delay=\"0.7s\" />\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </header>', '{\"name\":\"Banner\",\"section_enabled\":\"active\",\"title\":\"Smart Tenant - Property Management System\",\"sub_title\":\"Property management refers to the administration, operation, and oversight of real estate properties on behalf of property owners. It involves various tasks such as marketing rental properties, finding tenants, collecting rent and ensuring legal compliance.\",\"btn_name\":\"Get Started\",\"btn_link\":\"#\",\"section_footer_text\":\"Manage your business efficiently with our all-in-one solution designed for performance, security, and scalability.\",\"section_footer_image\":{},\"section_main_image\":{},\"section_footer_image_path\":\"upload\\/homepage\\/banner_2_section_footer_image_20250211110333am.png\",\"section_main_image_path\":\"upload\\/homepage\\/banner_1_section_main_image_20250211110333am.png\",\"box_image_1_path\":\"\",\"box_image_2_path\":\"\",\"box_image_3_path\":\"\",\"Box1_image_path\":\"\",\"Box2_image_path\":\"\",\"Sec4_box1_image_path\":\"\",\"Sec4_box2_image_path\":\"\",\"Sec4_box3_image_path\":\"\",\"Sec4_box4_image_path\":\"\",\"Sec4_box5_image_path\":\"\",\"Sec4_box6_image_path\":\"\",\"Sec7_box1_image_path\":\"\",\"Sec7_box2_image_path\":\"\",\"Sec7_box3_image_path\":\"\",\"Sec7_box4_image_path\":\"\",\"Sec7_box5_image_path\":\"\",\"Sec7_box6_image_path\":\"\",\"Sec7_box7_image_path\":\"\",\"Sec7_box8_image_path\":\"\"}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(3, 'OverView', 'Section 2', '<section>\n                    <div class=\"container\">\n                        <div class=\"row g-4\">\n                            <div class=\"col-md-6 col-lg-4\">\n                                <div class=\"card feature-card mb-0 bg-yellow-200\">\n                                    <div class=\"card-body\">\n                                        <div class=\"d-flex align-items-center\">\n                                            <div class=\"flex-shrink-0\">\n                                                <div class=\"avtar avtar-l\">\n                                                    <img src=\"assets/images/landing/img-feature-1.svg\" alt=\"img\"\n                                                        class=\"img-fluid\" />\n                                                </div>\n                                            </div>\n                                            <div class=\"flex-grow-1 ms-3 text-end\">\n                                                <span class=\"h1 mb-0 d-block fw-semibold\">150+</span>\n                                                <span class=\"h5 mb-0 d-block\">Components</span>\n                                            </div>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-md-6 col-lg-4\">\n                                <div class=\"card feature-card mb-0 bg-blue-200\">\n                                    <div class=\"card-body\">\n                                        <div class=\"d-flex align-items-center\">\n                                            <div class=\"flex-shrink-0\">\n                                                <div class=\"avtar avtar-l\">\n                                                    <img src=\"assets/images/landing/img-feature-2.svg\" alt=\"img\"\n                                                        class=\"img-fluid\" />\n                                                </div>\n                                            </div>\n                                            <div class=\"flex-grow-1 ms-3 text-end\">\n                                                <span class=\"h1 mb-0 d-block fw-semibold\">8+</span>\n                                                <span class=\"h5 mb-0 d-block\">Application</span>\n                                            </div>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-md-12 col-lg-4\">\n                                <div class=\"card feature-card mb-0 bg-purple-200\">\n                                    <div class=\"card-body\">\n                                        <div class=\"d-flex align-items-center\">\n                                            <div class=\"flex-shrink-0\">\n                                                <div class=\"avtar avtar-l\">\n                                                    <img src=\"assets/images/landing/img-feature-3.svg\" alt=\"img\"\n                                                        class=\"img-fluid\" />\n                                                </div>\n                                            </div>\n                                            <div class=\"flex-grow-1 ms-3 text-end\">\n                                                <span class=\"h1 mb-0 d-block fw-semibold\">100+</span>\n                                                <span class=\"h5 mb-0 d-block\">Pages</span>\n                                            </div>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </section>', '{\"name\":\"OverView\",\"section_enabled\":\"active\",\"Box1_title\":\"Customers\",\"Box1_number\":\"500+\",\"Box2_title\":\"Subscription Plan\",\"Box2_number\":\"4+\",\"Box3_title\":\"Language\",\"Box3_number\":\"11+\",\"box1_number_image\":{},\"box2_number_image\":{},\"box3_number_image\":{},\"section_footer_image_path\":\"\",\"section_main_image_path\":\"\",\"box_image_1_path\":\"upload\\/homepage\\/OverView_1_box_image_path_120250211110400am.svg\",\"box_image_2_path\":\"upload\\/homepage\\/OverView_2_box_image_path_220250211110400am.svg\",\"box_image_3_path\":\"upload\\/homepage\\/OverView_3_box_image_path_320250211110400am.svg\",\"Box1_image_path\":\"\",\"Box2_image_path\":\"\",\"Sec4_box1_image_path\":\"\",\"Sec4_box2_image_path\":\"\",\"Sec4_box3_image_path\":\"\",\"Sec4_box4_image_path\":\"\",\"Sec4_box5_image_path\":\"\",\"Sec4_box6_image_path\":\"\",\"Sec7_box1_image_path\":\"\",\"Sec7_box2_image_path\":\"\",\"Sec7_box3_image_path\":\"\",\"Sec7_box4_image_path\":\"\",\"Sec7_box5_image_path\":\"\",\"Sec7_box6_image_path\":\"\",\"Sec7_box7_image_path\":\"\",\"Sec7_box8_image_path\":\"\"}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(4, 'AboutUs', 'Section 3', '<section class=\"bg-body\">\n                        <div class=\"container\">\n                            <div class=\"row align-items-center g-4\">\n                                <div class=\"col-md-6 text-center mb-md-5\">\n                                    <img src=\"assets/images/landing/img-customize-1.svg\" alt=\"img\" class=\"img-fluid w-75\" />\n                                </div>\n                                <div class=\"col-md-6\">\n                                    <h2 class=\"h1\">Easy Developer Experience</h2>\n                                    <p class=\"text-lg w-75 my-3 my-md-4\">Berry has made it easy for developers of any skill level to\n                                        use their product.</p>\n                                    <ul class=\"list-unstyled customize-list\">\n                                        <li>\n                                            <i class=\"ti ti-circle-check f-20 text-secondary\"></i>\n                                            A straightforward and simple folder structure.\n                                        </li>\n                                        <li>\n                                            <i class=\"ti ti-circle-check f-20 text-secondary\"></i>\n                                            Code that is organized in a clear and logical manner.\n                                        </li>\n                                        <li>\n                                            <i class=\"ti ti-circle-check f-20 text-secondary\"></i>\n                                            Setting up Typography and Color schemes is easy and effortless.\n                                        </li>\n                                        <li>\n                                            <i class=\"ti ti-circle-check f-20 text-secondary\"></i>\n                                            Multiple layout options that can be easily adjusted.\n                                        </li>\n                                        <li>\n                                            <i class=\"ti ti-circle-check f-20 text-secondary\"></i>\n                                            A theme that can be easily configured on a single page.\n                                        </li>\n                                    </ul>\n                                </div>\n                            </div>\n                            <div class=\"row align-items-center g-4\">\n                                <div class=\"col-md-6\">\n                                    <h2 class=\"h1\">Figma Design System</h2>\n                                    <p class=\"text-lg w-75 my-3 my-md-4\">\n                                        Streamlining the development process and saving you time and effort in the initial design phase.\n                                    </p>\n                                    <ul class=\"list-unstyled customize-list\">\n                                        <li>\n                                            <i class=\"ti ti-circle-check f-20 text-secondary\"></i>\n                                            Professional Kit for Designer\n                                        </li>\n                                        <li>\n                                            <i class=\"ti ti-circle-check f-20 text-secondary\"></i>\n                                            Properly Organised Pages\n                                        </li>\n                                        <li>\n                                            <i class=\"ti ti-circle-check f-20 text-secondary\"></i>\n                                            Dark/Light Design\n                                        </li>\n                                        <li>\n                                            <i class=\"ti ti-circle-check f-20 text-secondary\"></i>\n                                            *Figma file included only in Plus & Extended Licenses.\n                                        </li>\n                                        <li>\n                                            <i class=\"ti ti-circle-check f-20 text-secondary\"></i>\n                                            A theme that can be easily configured on a single page.\n                                        </li>\n                                    </ul>\n                                </div>\n                                <div class=\"col-md-6 text-center mb-md-5\">\n                                    <img src=\"assets/images/landing/img-customize-2.svg\" alt=\"img\" class=\"img-fluid w-75\" />\n                                </div>\n                            </div>\n                        </div>\n                    </section>', '{\"name\":\"AboutUs\",\"section_enabled\":\"active\",\"Box1_title\":\"Empower Your Business to Thrive with Us\",\"Box1_info\":\"Unlock growth, streamline operations, and achieve success with our innovative solutions.\",\"Box1_list\":[\"Simplify and automate your business processes for maximum efficiency.\",\"Receive tailored strategies to meet business needs and unlock potential.\",\"Grow confidently with flexible solutions that adapt to your business needs.\",\"Make smarter decisions with real-time analytics and performance tracking.\",\"Rely on 24\\/7 expert assistance to keep your business running smoothly.\"],\"Box2_title\":\"Eliminate Paperwork, Elevate Productivity\",\"Box2_info\":\"Simplify your operations with seamless digital solutions and focus on what truly matters.\",\"Box2_list\":[\"Replace manual paperwork with automated workflows.\",\"Secure cloud storage lets you manage documents on the go.\",\"Streamlined processes save time and reduce errors.\",\"Keep your information safe with encrypted storage.\",\"Reduce printing, storage, and administrative expenses.\",\"Go green by minimizing paper use and waste.\"],\"section_footer_image_path\":\"\",\"section_main_image_path\":\"\",\"box_image_1_path\":\"\",\"box_image_2_path\":\"\",\"box_image_3_path\":\"\",\"Box1_image_path\":\"upload\\/homepage\\/img-customize-1_Section 33_image_120250113052054am.png\",\"Box2_image_path\":\"upload\\/homepage\\/img-customize-2_Section 33_image_220250113052054am.png\",\"Sec4_box1_image_path\":\"\",\"Sec4_box2_image_path\":\"\",\"Sec4_box3_image_path\":\"\",\"Sec4_box4_image_path\":\"\",\"Sec4_box5_image_path\":\"\",\"Sec4_box6_image_path\":\"\",\"Sec7_box1_image_path\":\"\",\"Sec7_box2_image_path\":\"\",\"Sec7_box3_image_path\":\"\",\"Sec7_box4_image_path\":\"\",\"Sec7_box5_image_path\":\"\",\"Sec7_box6_image_path\":\"\",\"Sec7_box7_image_path\":\"\",\"Sec7_box8_image_path\":\"\"}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(5, 'Offer', 'Section 4', '\n                <section>\n                    <div class=\"container\">\n                        <div class=\"row justify-content-center title\">\n                            <div class=\"col-md-9 col-lg-6 text-center\">\n                                <h2 class=\"h1\">What does Berry offer?</h2>\n                                <p class=\"text-lg\">\n                                    Berry is a reliable choice for your admin panel needs, offering a wide range of features to\n                                    easily manage your backend panel\n                                </p>\n                            </div>\n                        </div>\n                        <div class=\"row g-4 text-center\">\n                            <div class=\"col-md-6 col-xl-4\">\n                                <img src=\"assets/images/landing/img-design-1.svg\" alt=\"img\" class=\"img-fluid\" />\n                                <h3 class=\"my-4 fw-semibold\">Beautiful User Interface</h3>\n                                <p>\n                                    Berry can improve the user experience of your web application by providing a clear and intuitive\n                                    layout, and consistent look\n                                    and feel.\n                                </p>\n                            </div>\n                            <div class=\"col-md-6 col-xl-4\">\n                                <img src=\"assets/images/landing/img-design-2.svg\" alt=\"img\" class=\"img-fluid\" />\n                                <h3 class=\"my-4 fw-semibold\">Time and Cost Savings</h3>\n                                <p>\n                                    Berry can save developers time and effort by providing a pre-built user interface, allowing them\n                                    to focus on other aspects of\n                                    the project.\n                                </p>\n                            </div>\n                            <div class=\"col-md-6 col-xl-4\">\n                                <img src=\"assets/images/landing/img-design-3.svg\" alt=\"img\" class=\"img-fluid\" />\n                                <h3 class=\"my-4 fw-semibold\">Reduce Development Complexity</h3>\n                                <p>Berry simplifies admin panel development with easy theme setup and clear code with flexible\n                                    layouts options.</p>\n                            </div>\n                            <div class=\"col-md-6 col-xl-4\">\n                                <img src=\"assets/images/landing/img-design-4.svg\" alt=\"img\" class=\"img-fluid\" />\n                                <h3 class=\"my-4 fw-semibold\">Improved Scalability</h3>\n                                <p>\n                                    Berry uses scalable technologies and resources to ensure that your admin panel remains efficient\n                                    and effective as your needs\n                                    evolve.\n                                </p>\n                            </div>\n                            <div class=\"col-md-6 col-xl-4\">\n                                <img src=\"assets/images/landing/img-design-5.svg\" alt=\"img\" class=\"img-fluid\" />\n                                <h3 class=\"my-4 fw-semibold\">Well-Documented and Supported</h3>\n                                <p>\n                                    With a range of resources including user guides, tutorials, and FAQs to help users understand\n                                    and effectively use the Berry.\n                                </p>\n                            </div>\n                            <div class=\"col-md-6 col-xl-4\">\n                                <img src=\"assets/images/landing/img-design-6.svg\" alt=\"img\" class=\"img-fluid\" />\n                                <h3 class=\"my-4 fw-semibold\">Performance Centric</h3>\n                                <p>Berry is a performance-centric dashboard template that is designed to deliver optimal performance\n                                    for your admin panel.</p>\n                            </div>\n                        </div>\n                    </div>\n                </section>\n                ', '{\"name\":\"Offer\",\"section_enabled\":\"active\",\"Sec4_title\":\"What Our Software Offers\",\"Sec4_info\":\"Our software provides powerful, scalable solutions designed to streamline your business operations.\",\"Sec4_box1_title\":\"User-Friendly Interface\",\"Sec4_box1_enabled\":\"active\",\"Sec4_box1_info\":\"Simplify operations with an intuitive and easy-to-use platform.\",\"Sec4_box2_title\":\"End-to-End Automation\",\"Sec4_box2_enabled\":\"active\",\"Sec4_box2_info\":\"Automate repetitive tasks to save time and increase efficiency.\",\"Sec4_box3_title\":\"Customizable Solutions\",\"Sec4_box3_enabled\":\"active\",\"Sec4_box3_info\":\"Tailor features to fit your unique business needs and workflows.\",\"Sec4_box4_title\":\"Scalable Features\",\"Sec4_box4_enabled\":\"active\",\"Sec4_box4_info\":\"Grow your business with flexible solutions that scale with you.\",\"Sec4_box5_title\":\"Enhanced Security\",\"Sec4_box5_enabled\":\"active\",\"Sec4_box5_info\":\"Protect your data with advanced encryption and security protocols.\",\"Sec4_box6_title\":\"Real-Time Analytics\",\"Sec4_box6_enabled\":\"active\",\"Sec4_box6_info\":\"Gain actionable insights with live data tracking and reporting.\",\"Sec4_box1_image\":{},\"section_footer_image_path\":\"\",\"section_main_image_path\":\"\",\"box_image_1_path\":\"\",\"box_image_2_path\":\"\",\"box_image_3_path\":\"\",\"Box1_image_path\":\"\",\"Box2_image_path\":\"\",\"Sec4_box1_image_path\":\"upload\\/homepage\\/offers_1_Section_4_image_120250212034631am.svg\",\"Sec4_box2_image_path\":\"upload\\/homepage\\/offers_2_Section_4_image_220250113052245am.svg\",\"Sec4_box3_image_path\":\"upload\\/homepage\\/offers_3_Section_4_image_320250113052245am.svg\",\"Sec4_box4_image_path\":\"upload\\/homepage\\/offers_4_Section_4_image_420250113052245am.svg\",\"Sec4_box5_image_path\":\"upload\\/homepage\\/offers_5_Section_4_image_520250113052245am.svg\",\"Sec4_box6_image_path\":\"upload\\/homepage\\/offers_6_Section_4_image_620250113052245am.svg\",\"Sec7_box1_image_path\":\"\",\"Sec7_box2_image_path\":\"\",\"Sec7_box3_image_path\":\"\",\"Sec7_box4_image_path\":\"\",\"Sec7_box5_image_path\":\"\",\"Sec7_box6_image_path\":\"\",\"Sec7_box7_image_path\":\"\",\"Sec7_box8_image_path\":\"\"}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(6, 'Pricing', 'Section 5', '\n                <section class=\"bg-body\" id=\"pricing\">\n                    <div class=\"container\">\n                        <div class=\"row justify-content-center title\">\n                            <div class=\"col-md-9 col-lg-6 text-center\">\n                                <h2 class=\"h1\">Affordable Pricing Based On Your Needs</h2>\n                                <p class=\"text-lg\">Berry has conceptul working apps like Chat, Inbox, E-commerce, Invoice,\n                                    Kanban,and Calendar</p>\n                            </div>\n                        </div>\n                        <div class=\"row text-center justify-content-center\">\n                            <!-- [ sample-page ] start -->\n                            <div class=\"col-md-6 col-lg-4\">\n                                <div class=\"card price-card\">\n                                    <div class=\"card-body\">\n                                        <div class=\"price-icon\">\n                                            <i class=\"ti ti-motorbike bg-light-primary text-primary\"></i>\n                                        </div>\n                                        <h2 class=\"mt-4\">Standard</h2>\n                                        <p class=\"mt-5\">\n                                            Create one end product for a client, transfer that end product to your client, charge\n                                            them for your\n                                            services. The license\n                                            is then transferred to the client.\n                                        </p>\n                                        <div class=\"price-price\">\n                                            <sup>$</sup>\n                                            69\n                                            <span>/Lifetime</span>\n                                        </div>\n                                        <ul class=\"list-group list-group-flush product-list\">\n                                            <li class=\"list-group-item enable\">One End Product</li>\n                                            <li class=\"list-group-item enable\">No attribution required</li>\n                                            <li class=\"list-group-item\">TypeScript</li>\n                                            <li class=\"list-group-item\">Figma Design Resources</li>\n                                            <li class=\"list-group-item\">Create Multiple Products</li>\n                                            <li class=\"list-group-item\">Create a SaaS Project</li>\n                                            <li class=\"list-group-item\">Resale Product</li>\n                                            <li class=\"list-group-item\">Separate sale of our UI Elements?</li>\n                                        </ul>\n                                        <a class=\"btn btn-outline-primary bg-light text-primary mt-4\" href=\"#\"\n                                            role=\"button\">Order Now</a>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-md-6 col-lg-4\">\n                                <div class=\"card price-card \">\n                                    <div class=\"card-body\">\n                                        <div class=\"price-icon\">\n                                            <i class=\"ti ti-bus bg-light-primary text-primary\"></i>\n                                        </div>\n                                        <h2 class=\"mt-4\">Standard Plus</h2>\n                                        <p class=\"mt-5\">\n                                            Create one end product for a client, transfer that end product to your client, charge\n                                            them for your\n                                            services. The license\n                                            is then transferred to the client.\n                                        </p>\n                                        <div class=\"price-price\">\n                                            <sup>$</sup>\n                                            129\n                                            <span>/Lifetime</span>\n                                        </div>\n                                        <ul class=\"list-group list-group-flush product-list\">\n                                            <li class=\"list-group-item enable\">One End Product</li>\n                                            <li class=\"list-group-item enable\">No attribution required</li>\n                                            <li class=\"list-group-item enable\">TypeScript</li>\n                                            <li class=\"list-group-item enable\">Figma Design Resources</li>\n                                            <li class=\"list-group-item\">Create Multiple Products</li>\n                                            <li class=\"list-group-item\">Create a SaaS Project</li>\n                                            <li class=\"list-group-item\">Resale Product</li>\n                                            <li class=\"list-group-item\">Separate sale of our UI Elements?</li>\n                                        </ul>\n                                        <a class=\"btn btn-outline-primary bg-light text-primary mt-4\" href=\"#\"\n                                            role=\"button\">Order Now</a>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-md-6 col-lg-4\">\n                                <div class=\"card price-card\">\n                                    <div class=\"card-body\">\n                                        <div class=\"price-icon\">\n                                            <i class=\"ti ti-sailboat bg-light-primary text-primary\"></i>\n                                        </div>\n                                        <h2 class=\"mt-4\">Extended</h2>\n                                        <p class=\"mt-5\">\n                                            You are licensed to use the CONTENT to create one end product for yourself or for one\n                                            client (a “single\n                                            application”), and\n                                            the end product may be sold or distributed for free.\n                                        </p>\n                                        <div class=\"price-price\">\n                                            <sup>$</sup>\n                                            599\n                                            <span>/Lifetime</span>\n                                        </div>\n                                        <ul class=\"list-group list-group-flush product-list\">\n                                            <li class=\"list-group-item enable\">One End Product</li>\n                                            <li class=\"list-group-item enable\">No attribution required</li>\n                                            <li class=\"list-group-item enable\">TypeScript</li>\n                                            <li class=\"list-group-item enable\">Figma Design Resources</li>\n                                            <li class=\"list-group-item\">Create Multiple Products</li>\n                                            <li class=\"list-group-item enable\">Create a SaaS Project</li>\n                                            <li class=\"list-group-item\">Resale Product</li>\n                                            <li class=\"list-group-item\">Separate sale of our UI Elements?</li>\n                                        </ul>\n                                        <a class=\"btn btn-outline-primary bg-light text-primary mt-4\" href=\"#\"\n                                            role=\"button\">Order Now</a>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n\n                    </div>\n                </section>\n                ', '{\"name\":\"Pricing\",\"section_enabled\":\"active\",\"Sec5_title\":\"Flexible Pricing\",\"Sec5_info\":\"Get started for free, upgrade later in our application.\",\"section_footer_image_path\":\"\",\"section_main_image_path\":\"\",\"box_image_1_path\":\"\",\"box_image_2_path\":\"\",\"box_image_3_path\":\"\",\"Box1_image_path\":\"\",\"Box2_image_path\":\"\",\"Sec4_box1_image_path\":\"\",\"Sec4_box2_image_path\":\"\",\"Sec4_box3_image_path\":\"\",\"Sec4_box4_image_path\":\"\",\"Sec4_box5_image_path\":\"\",\"Sec4_box6_image_path\":\"\",\"Sec7_box1_image_path\":\"\",\"Sec7_box2_image_path\":\"\",\"Sec7_box3_image_path\":\"\",\"Sec7_box4_image_path\":\"\",\"Sec7_box5_image_path\":\"\",\"Sec7_box6_image_path\":\"\",\"Sec7_box7_image_path\":\"\",\"Sec7_box8_image_path\":\"\"}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(7, 'Core Features', 'Section 6', '\n                <section class=\"bg-primary application-slider\" id=\"features\">\n                    <div class=\"container\">\n                        <div class=\"row justify-content-center title\">\n                            <div class=\"col-md-9 col-lg-6 text-center\">\n                                <h2 class=\"h1\">Explore Concenputal Apps</h2>\n                                <p class=\"text-lg\">Berry has conceptul working apps like Chat, Inbox, E-commerce, Invoice, Kanban,\n                                    and Calendar</p>\n                            </div>\n                        </div>\n                        <div class=\"row text-center justify-content-center\">\n                            <div class=\"col-11 col-md-9 col-lg-7 position-relative\">\n                                <div class=\"swiper app-slider\">\n                                    <div class=\"swiper-wrapper\">\n                                        <div class=\"swiper-slide\">\n                                            <img src=\"assets/images/landing/slider-light-1.png\" alt=\"images\"\n                                                class=\"img-fluid\" />\n                                            <h3>\n                                                Social Profile\n                                                <i class=\"ti ti-link\"></i>\n                                            </h3>\n                                            <p>Complete Social profile with all possible option</p>\n                                        </div>\n                                        <div class=\"swiper-slide\">\n                                            <img src=\"assets/images/landing/slider-light-2.png\" alt=\"images\"\n                                                class=\"img-fluid\" />\n                                            <h3>\n                                                Mail/Message App\n                                                <i class=\"ti ti-link\"></i>\n                                            </h3>\n                                            <p>Complete Mail/Message App with all possible option</p>\n                                        </div>\n                                        <div class=\"swiper-slide\">\n                                            <img src=\"assets/images/landing/slider-light-3.png\" alt=\"images\"\n                                                class=\"img-fluid\" />\n                                            <h3>\n                                                Mail/Message App\n                                                <i class=\"ti ti-link\"></i>\n                                            </h3>\n                                            <p>Complete Chat App with all possible option</p>\n                                        </div>\n                                        <div class=\"swiper-slide\">\n                                            <img src=\"assets/images/landing/slider-light-4.png\" alt=\"images\"\n                                                class=\"img-fluid\" />\n                                            <h3>\n                                                Kanban App\n                                                <i class=\"ti ti-link\"></i>\n                                            </h3>\n                                            <p>Complete Kanban App with all possible option</p>\n                                        </div>\n                                        <div class=\"swiper-slide\">\n                                            <img src=\"assets/images/landing/slider-light-5.png\" alt=\"images\"\n                                                class=\"img-fluid\" />\n                                            <h3>\n                                                Calendar App\n                                                <i class=\"ti ti-link\"></i>\n                                            </h3>\n                                            <p>Complete Calendar App with all possible option</p>\n                                        </div>\n                                        <div class=\"swiper-slide\">\n                                            <img src=\"assets/images/landing/slider-light-6.png\" alt=\"images\"\n                                                class=\"img-fluid\" />\n                                            <h3>\n                                                Ecommerce App\n                                                <i class=\"ti ti-link\"></i>\n                                            </h3>\n                                            <p>Complete Ecommerce App with all possible option</p>\n                                        </div>\n                                    </div>\n                                    <div class=\"swiper-button-next avtar\">\n                                        <i class=\"ti ti-chevron-right\"></i>\n                                    </div>\n                                    <div class=\"swiper-button-prev avtar\">\n                                        <i class=\"ti ti-chevron-left\"></i>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </section>\n                ', '{\"name\":\"Core Features\",\"section_enabled\":\"active\",\"Sec6_title\":\"Core Features\",\"Sec6_info\":\"Core Modules For Your Business\",\"Sec6_Box_title\":[\"Dashboard\",\"Property\",\"Tenant\",\"Invoice detail\",\"Expenses\",\"Uer Roles & Permissions\"],\"Sec6_Box_subtitle\":[\"Property management refers to the administration, operation, and oversight of real estate properties on behalf of property owners.\",\"Property management refers to the administration, operation, and oversight of real estate properties on behalf of property owners.\",\"Property management refers to the administration, operation, and oversight of real estate properties on behalf of property owners.\",\"Property management refers to the administration, operation, and oversight of real estate properties on behalf of property owners.\",\"Property management refers to the administration, operation, and oversight of real estate properties on behalf of property owners.\",\"Property management refers to the administration, operation, and oversight of real estate properties on behalf of property owners.\"],\"Sec6_box_image\":[{},{},{},{},{},{}],\"section_footer_image_path\":\"\",\"section_main_image_path\":\"\",\"box_image_1_path\":\"\",\"box_image_2_path\":\"\",\"box_image_3_path\":\"\",\"Box1_image_path\":\"\",\"Box2_image_path\":\"\",\"Sec4_box1_image_path\":\"\",\"Sec4_box2_image_path\":\"\",\"Sec4_box3_image_path\":\"\",\"Sec4_box4_image_path\":\"\",\"Sec4_box5_image_path\":\"\",\"Sec4_box6_image_path\":\"\",\"Sec6_box0_image_path\":\"upload\\/homepage\\/1_Section_6_image_020250212054554am.png\",\"Sec6_box1_image_path\":\"upload\\/homepage\\/4_Section_6_image_120250212054554am.png\",\"Sec6_box2_image_path\":\"upload\\/homepage\\/3_Section_6_image_220250212054554am.png\",\"Sec6_box3_image_path\":\"upload\\/homepage\\/5_Section_6_image_320250212054554am.png\",\"Sec6_box4_image_path\":\"upload\\/homepage\\/6_Section_6_image_420250212054554am.png\",\"Sec6_box5_image_path\":\"upload\\/homepage\\/2_Section_6_image_520250212054554am.png\",\"Sec6_box6_image_path\":\"\",\"Sec7_box1_image_path\":\"\",\"Sec7_box2_image_path\":\"\",\"Sec7_box3_image_path\":\"\",\"Sec7_box4_image_path\":\"\",\"Sec7_box5_image_path\":\"\",\"Sec7_box6_image_path\":\"\",\"Sec7_box7_image_path\":\"\",\"Sec7_box8_image_path\":\"\"}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21');
INSERT INTO `home_pages` (`id`, `title`, `section`, `content`, `content_value`, `enabled`, `parent_id`, `created_at`, `updated_at`) VALUES
(8, 'Testimonials', 'Section 7', '\n                <section>\n                    <div class=\"container\">\n                        <div class=\"row justify-content-center title\">\n                            <div class=\"col-md-9 col-lg-6 text-center\">\n                                <h2 class=\"h1\">Testaments</h2>\n                                <p class=\"text-lg\">We are so grateful for your positive review and appreciate your support of our\n                                    product</p>\n                            </div>\n                        </div>\n                        <div class=\"testaments-cards\">\n                            <div class=\"card\">\n                                <div class=\"card-body\">\n                                    <div class=\"d-flex align-items-center mb-3\">\n                                        <div class=\"flex-shrink-0\">\n                                            <div class=\"avtar avtar-l\">\n                                                <img src=\"assets/images/user/avatar-1.jpg\" alt=\"img\"\n                                                    class=\"img-fluid rounded-circle wid-40\" />\n                                            </div>\n                                        </div>\n                                        <div class=\"flex-grow-1 ms-2\">\n                                            <h4 class=\"mb-0\">Nelu</h4>\n                                            <h6 class=\"mb-0 text-primary\">@Quality Support</h6>\n                                        </div>\n                                    </div>\n                                    <p class=\"mb-0\">\n                                        This is a quality team with quality support. Number of available modules is incredible.\n                                        Anytime I thought \"oh I wish it had\n                                        this\" I was able to find exactly that already pre-made in the template.\n                                    </p>\n                                </div>\n                            </div>\n                            <div class=\"card\">\n                                <div class=\"card-body\">\n                                    <div class=\"d-flex align-items-center mb-3\">\n                                        <div class=\"flex-shrink-0\">\n                                            <div class=\"avtar avtar-l\">\n                                                <img src=\"assets/images/user/avatar-2.jpg\" alt=\"img\"\n                                                    class=\"img-fluid rounded-circle wid-40\" />\n                                            </div>\n                                        </div>\n                                        <div class=\"flex-grow-1 ms-2\">\n                                            <h4 class=\"mb-0\">Bente</h4>\n                                            <h6 class=\"mb-0 text-primary\">@Customer Support</h6>\n                                        </div>\n                                    </div>\n                                    <p class=\"mb-0\">\n                                        Very good customer service! I liked the design and there was nothing wrong, but found out\n                                        after testing that it did not\n                                        quite match the functionality and overall design that I needed for my type of software. I\n                                        therefore contacted customer\n                                        service and it was no problem even though the deadline for refund had actually expired.\n                                    </p>\n                                </div>\n                            </div>\n                            <div class=\"card\">\n                                <div class=\"card-body\">\n                                    <div class=\"d-flex align-items-center mb-3\">\n                                        <div class=\"flex-shrink-0\">\n                                            <div class=\"avtar avtar-l\">\n                                                <img src=\"assets/images/user/avatar-3.jpg\" alt=\"img\"\n                                                    class=\"img-fluid rounded-circle wid-40\" />\n                                            </div>\n                                        </div>\n                                        <div class=\"flex-grow-1 ms-2\">\n                                            <h4 class=\"mb-0\">William</h4>\n                                            <h6 class=\"mb-0 text-primary\">@Code Quality</h6>\n                                        </div>\n                                    </div>\n                                    <p class=\"mb-0\">\n                                        One of the better themes I have used. Beautiful and clean design. Also included a NextJS\n                                        project. Ultimately it didnt work\n                                        out for my specific use case, but this is a well organized theme. Definitely keeping it in\n                                        mind for future projects.\n                                    </p>\n                                </div>\n                            </div>\n                            <div class=\"card\">\n                                <div class=\"card-body\">\n                                    <div class=\"d-flex align-items-center mb-3\">\n                                        <div class=\"flex-shrink-0\">\n                                            <div class=\"avtar avtar-l\">\n                                                <img src=\"assets/images/user/avatar-4.jpg\" alt=\"img\"\n                                                    class=\"img-fluid rounded-circle wid-40\" />\n                                            </div>\n                                        </div>\n                                        <div class=\"flex-grow-1 ms-2\">\n                                            <h4 class=\"mb-0\">Besart</h4>\n                                            <h6 class=\"mb-0 text-primary\">@Customizability</h6>\n                                        </div>\n                                    </div>\n                                    <p class=\"mb-0\">\n                                        Very well written code and good structure. Very customizable and tons of nice components.\n                                        Good documentation. Team is very\n                                        responsive too\n                                    </p>\n                                </div>\n                            </div>\n                            <div class=\"card\">\n                                <div class=\"card-body\">\n                                    <div class=\"d-flex align-items-center mb-3\">\n                                        <div class=\"flex-shrink-0\">\n                                            <div class=\"avtar avtar-l\">\n                                                <img src=\"assets/images/user/avatar-5.jpg\" alt=\"img\"\n                                                    class=\"img-fluid rounded-circle wid-40\" />\n                                            </div>\n                                        </div>\n                                        <div class=\"flex-grow-1 ms-2\">\n                                            <h4 class=\"mb-0\">Dillon</h4>\n                                            <h6 class=\"mb-0 text-primary\">@Codebase</h6>\n                                        </div>\n                                    </div>\n                                    <p class=\"mb-0\">\n                                        The project template is great, as well as the codebase. I am a backend developer, new to\n                                        frontend and learning. So this\n                                        template is turning out to be a great foundation...\n                                    </p>\n                                </div>\n                            </div>\n\n                            <div class=\"card\">\n                                <div class=\"card-body\">\n                                    <div class=\"d-flex align-items-center mb-3\">\n                                        <div class=\"flex-shrink-0\">\n                                            <div class=\"avtar avtar-l\">\n                                                <img src=\"assets/images/user/avatar-1.jpg\" alt=\"img\"\n                                                    class=\"img-fluid rounded-circle wid-40\" />\n                                            </div>\n                                        </div>\n                                        <div class=\"flex-grow-1 ms-2\">\n                                            <h4 class=\"mb-0\">Nelu</h4>\n                                            <h6 class=\"mb-0 text-primary\">@Quality Support</h6>\n                                        </div>\n                                    </div>\n                                    <p class=\"mb-0\">\n                                        This is a quality team with quality support. Number of available modules is incredible.\n                                        Anytime I thought \"oh I wish it had\n                                        this\" I was able to find exactly that already pre-made in the template.\n                                    </p>\n                                </div>\n                            </div>\n                            <div class=\"card\">\n                                <div class=\"card-body\">\n                                    <div class=\"d-flex align-items-center mb-3\">\n                                        <div class=\"flex-shrink-0\">\n                                            <div class=\"avtar avtar-l\">\n                                                <img src=\"assets/images/user/avatar-2.jpg\" alt=\"img\"\n                                                    class=\"img-fluid rounded-circle wid-40\" />\n                                            </div>\n                                        </div>\n                                        <div class=\"flex-grow-1 ms-2\">\n                                            <h4 class=\"mb-0\">Bente</h4>\n                                            <h6 class=\"mb-0 text-primary\">@Customer Support</h6>\n                                        </div>\n                                    </div>\n                                    <p class=\"mb-0\">\n                                        Very good customer service! I liked the design and there was nothing wrong, but found out\n                                        after testing that it did not\n                                        quite match the functionality and overall design that I needed for my type of software. I\n                                        therefore contacted customer\n                                        service and it was no problem even though the deadline for refund had actually expired.\n                                    </p>\n                                </div>\n                            </div>\n                            <div class=\"card\">\n                                <div class=\"card-body\">\n                                    <div class=\"d-flex align-items-center mb-3\">\n                                        <div class=\"flex-shrink-0\">\n                                            <div class=\"avtar avtar-l\">\n                                                <img src=\"assets/images/user/avatar-3.jpg\" alt=\"img\"\n                                                    class=\"img-fluid rounded-circle wid-40\" />\n                                            </div>\n                                        </div>\n                                        <div class=\"flex-grow-1 ms-2\">\n                                            <h4 class=\"mb-0\">William</h4>\n                                            <h6 class=\"mb-0 text-primary\">@Code Quality</h6>\n                                        </div>\n                                    </div>\n                                    <p class=\"mb-0\">\n                                        One of the better themes I have used. Beautiful and clean design. Also included a NextJS\n                                        project. Ultimately it didnt work\n                                        out for my specific use case, but this is a well organized theme. Definitely keeping it in\n                                        mind for future projects.\n                                    </p>\n                                </div>\n                            </div>\n                        </div>\n\n                    </div>\n                </section>\n                ', '{\"name\":\"Testimonials\",\"section_enabled\":\"active\",\"Sec7_title\":\"What Our Customers Say About Us\",\"Sec7_info\":\"We\\u2019re proud of the impact our software has had on businesses just like yours. Hear directly from our customers about how our solutions have made a difference in their day-to-day operations\",\"Sec7_box1_name\":\"Lenore Becker\",\"Sec7_box1_tag\":null,\"Sec7_box1_Enabled\":\"active\",\"Sec7_box1_review\":\"Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Vestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi. Quisque ut nisi. Nulla porta dolor. Aenean tellus metus, bibendum sed, posuere ac, mattis non, nunc.\",\"Sec7_box2_name\":\"Damian Morales\",\"Sec7_box2_tag\":\"New\",\"Sec7_box2_Enabled\":\"active\",\"Sec7_box2_review\":\"Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Vestibulum rutrum.\",\"Sec7_box3_name\":\"Oleg Lucas\",\"Sec7_box3_tag\":null,\"Sec7_box3_Enabled\":\"active\",\"Sec7_box3_review\":\"Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Vestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi. Quisque ut nisi. Nulla porta dolor. Aenean tellus metus, bibendum sed, posuere ac, mattis non, nunc.\",\"Sec7_box4_name\":\"Jerome Mccoy\",\"Sec7_box4_tag\":null,\"Sec7_box4_Enabled\":\"active\",\"Sec7_box4_review\":\"Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Vestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi. Quisque ut nisi. Nulla porta dolor. Aenean tellus metus, bibendum sed, posuere ac, mattis non, nunc.\",\"Sec7_box5_name\":\"Rafael Carver\",\"Sec7_box5_tag\":null,\"Sec7_box5_Enabled\":\"active\",\"Sec7_box5_review\":\"Aenean leo ligula, porttitor eu, consequat vitae, eleifend.\",\"Sec7_box6_name\":\"Edan Rodriguez\",\"Sec7_box6_tag\":null,\"Sec7_box6_Enabled\":\"active\",\"Sec7_box6_review\":\"Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Vestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi. Quisque ut nisi. Nulla porta dolor. Aenean tellus metus, bibendum sed, posuere ac, mattis non, nunc.\",\"Sec7_box7_name\":\"Kalia Middleton\",\"Sec7_box7_tag\":null,\"Sec7_box7_Enabled\":\"active\",\"Sec7_box7_review\":\"Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Vestibulum rutrum, mi nec elementum.\",\"Sec7_box8_name\":\"Zenaida Chandler\",\"Sec7_box8_tag\":null,\"Sec7_box8_Enabled\":\"active\",\"Sec7_box8_review\":\"Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Vestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi. Quisque ut nisi. Nulla porta dolor. Aenean tellus metus, bibendum sed, posuere ac, mattis non, nunc.\",\"Sec7_box1_image\":{},\"Sec7_box2_image\":{},\"Sec7_box3_image\":{},\"Sec7_box4_image\":{},\"Sec7_box5_image\":{},\"Sec7_box6_image\":{},\"Sec7_box7_image\":{},\"Sec7_box8_image\":{},\"section_footer_image_path\":\"\",\"section_main_image_path\":\"\",\"box_image_1_path\":\"\",\"box_image_2_path\":\"\",\"box_image_3_path\":\"\",\"Box1_image_path\":\"\",\"Box2_image_path\":\"\",\"Sec4_box1_image_path\":\"\",\"Sec4_box2_image_path\":\"\",\"Sec4_box3_image_path\":\"\",\"Sec4_box4_image_path\":\"\",\"Sec4_box5_image_path\":\"\",\"Sec4_box6_image_path\":\"\",\"Sec7_box1_image_path\":\"upload\\/homepage\\/review_1_Section_7_image_120250212034500am.png\",\"Sec7_box2_image_path\":\"upload\\/homepage\\/review_2_Section_7_image_220250212034500am.png\",\"Sec7_box3_image_path\":\"upload\\/homepage\\/review_3_Section_7_image_320250212034500am.png\",\"Sec7_box4_image_path\":\"upload\\/homepage\\/review_4_Section_7_image_420250212034500am.png\",\"Sec7_box5_image_path\":\"upload\\/homepage\\/review_5_Section_7_image_520250212034500am.png\",\"Sec7_box6_image_path\":\"upload\\/homepage\\/review_6_Section_7_image_620250212034500am.png\",\"Sec7_box7_image_path\":\"upload\\/homepage\\/review_7_Section_7_image_720250212034500am.png\",\"Sec7_box8_image_path\":\"upload\\/homepage\\/review_8_Section_7_image_820250212034500am.png\"}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(9, 'Choose US', 'Section 8', '\n                <section class=\"bg-dark choose-section\">\n                    <div class=\"container\">\n                        <div class=\"row align-items-center\">\n                            <div class=\"col-md-9\">\n                                <div class=\"d-flex align-items-center\">\n                                    <div class=\"flex-shrink-0\">\n                                        <h2 class=\"mb-0 text-white\">Choose Berry for</h2>\n                                    </div>\n                                    <div class=\"flex-grow-1 ms-3\">\n                                        <div class=\"swiper choose-slider\">\n                                            <div class=\"swiper-wrapper\">\n                                                <div class=\"swiper-slide\">\n                                                    <h2>Highly Responsive</h2>\n                                                </div>\n                                                <div class=\"swiper-slide\">\n                                                    <h2>Design Consistency</h2>\n                                                </div>\n                                                <div class=\"swiper-slide\">\n                                                    <h2>Effective Support</h2>\n                                                </div>\n                                                <div class=\"swiper-slide\">\n                                                    <h2>Standardization</h2>\n                                                </div>\n                                                <div class=\"swiper-slide\">\n                                                    <h2>Compatibility</h2>\n                                                </div>\n                                                <div class=\"swiper-slide\">\n                                                    <h2>Easy Customizability</h2>\n                                                </div>\n                                            </div>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-md-3 d-none d-md-block\">\n                                <img src=\"assets/images/landing/img-bg-hand.png\" alt=\"img\" class=\"img-fluid hand-img\" />\n                            </div>\n                        </div>\n                    </div>\n                </section>\n                ', '{\"name\":\"Choose US\",\"section_enabled\":\"active\",\"Sec8_title\":\"Reason to Choose US\",\"Sec8_box1_info\":\"Proven Expertise\",\"Sec8_box2_info\":\"Customizable Solutions\",\"Sec8_box3_info\":\"Seamless Integration\",\"Sec8_box4_info\":\"Exceptional Support\",\"Sec8_box5_info\":\"Scalable and Future-Proof\",\"Sec8_box6_info\":\"Security You Can Trust\",\"Sec8_box7_info\":\"User-Friendly Interface\",\"Sec8_box8_info\":\"Innovation at Its Core\",\"section_footer_image_path\":\"\",\"section_main_image_path\":\"\",\"box_image_1_path\":\"\",\"box_image_2_path\":\"\",\"box_image_3_path\":\"\",\"Box1_image_path\":\"\",\"Box2_image_path\":\"\",\"Sec4_box1_image_path\":\"\",\"Sec4_box2_image_path\":\"\",\"Sec4_box3_image_path\":\"\",\"Sec4_box4_image_path\":\"\",\"Sec4_box5_image_path\":\"\",\"Sec4_box6_image_path\":\"\",\"Sec7_box1_image_path\":\"\",\"Sec7_box2_image_path\":\"\",\"Sec7_box3_image_path\":\"\",\"Sec7_box4_image_path\":\"\",\"Sec7_box5_image_path\":\"\",\"Sec7_box6_image_path\":\"\",\"Sec7_box7_image_path\":\"\",\"Sec7_box8_image_path\":\"\"}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(10, 'FAQ', 'Section 9', '\n                <section class=\"frameworks-section\" id=\"faqs\">\n                    <div class=\"container\">\n                        <div class=\"row justify-content-center title\">\n                            <div class=\"col-md-9 col-lg-6 text-center\">\n                                <h2 class=\"h1\">FAQ</h2>\n                                <p class=\"text-lg\">Please refer the Frequently ask question for your quick help\n                                </p>\n                            </div>\n                        </div>\n                        <div class=\"row\">\n                            <div class=\"col-12\">\n                                <div class=\"accordion accordion-flush\" id=\"accordionFlushExample\">\n                                    <div class=\"accordion-item\">\n                                    <h2 class=\"accordion-header\" id=\"flush-headingOne\">\n                                        <button class=\"accordion-button text-muted\" type=\"button\" data-bs-toggle=\"collapse\"\n                                        data-bs-target=\"#flush-collapseOne\" aria-expanded=\"false\">\n                                        <b>when do I need Extended License?</b>\n                                        </button>\n                                    </h2>\n                                    <div id=\"flush-collapseOne\" class=\"accordion-collapse collapse show\"\n                                        aria-labelledby=\"flush-headingOne\" data-bs-parent=\"#accordionFlushExample\">\n                                        <div class=\"accordion-body text-muted\">\n                                        If your End Product which is sold - Then only your required Extended License. i.e. If you take\n                                        subscription charges\n                                        (monthly, yearly, etc...) from your end users in this case you required Extended License.\n                                        </div>\n                                    </div>\n                                    </div>\n                                    <div class=\"accordion-item\">\n                                    <h2 class=\"accordion-header\" id=\"flush-headingTwo\">\n                                        <button class=\"accordion-button collapsed text-muted\" type=\"button\" data-bs-toggle=\"collapse\"\n                                        data-bs-target=\"#flush-collapseTwo\" aria-expanded=\"false\" aria-controls=\"flush-collapseTwo\">\n                                        <b>What Support Includes?</b>\n                                        </button>\n                                    </h2>\n                                    <div id=\"flush-collapseTwo\" class=\"accordion-collapse collapse\" aria-labelledby=\"flush-headingTwo\"\n                                        data-bs-parent=\"#accordionFlushExample\">\n                                        <div class=\"accordion-body text-muted\">\n                                        6 Months of Support Includes with 1 year of free updates. We are happy to solve your bugs, issue.\n                                        </div>\n                                    </div>\n                                    </div>\n                                    <div class=\"accordion-item\">\n                                    <h2 class=\"accordion-header\" id=\"flush-headingThree\">\n                                        <button class=\"accordion-button collapsed text-muted\" type=\"button\" data-bs-toggle=\"collapse\"\n                                        data-bs-target=\"#flush-collapseThree\" aria-expanded=\"false\" aria-controls=\"flush-collapseThree\">\n                                        <b>Is Berry Support Typescript?</b>\n                                        </button>\n                                    </h2>\n                                    <div id=\"flush-collapseThree\" class=\"accordion-collapse collapse\" aria-labelledby=\"flush-headingThree\"\n                                        data-bs-parent=\"#accordionFlushExample\">\n                                        <div class=\"accordion-body text-muted\">\n                                        Yes, Berry Support the TypeScript and it is only available in Plus and Extended License.\n                                        </div>\n                                    </div>\n                                    </div>\n                                    <div class=\"accordion-item\">\n                                    <h2 class=\"accordion-header\" id=\"flush-headingfour\">\n                                        <button class=\"accordion-button collapsed text-muted\" type=\"button\" data-bs-toggle=\"collapse\"\n                                        data-bs-target=\"#flush-collapse-four\" aria-expanded=\"false\" aria-controls=\"flush-collapseThree\">\n                                        <b>Is there any Road map for Berry?</b>\n                                        </button>\n                                    </h2>\n                                    <div id=\"flush-collapse-four\" class=\"accordion-collapse collapse\" aria-labelledby=\"flush-headingfour\"\n                                        data-bs-parent=\"#accordionFlushExample\">\n                                        <div class=\"accordion-body text-muted\">\n                                        Berry is our flagship React Dashboard Template and we always add the new features for the long\n                                        run. You can check\n                                        the Road map in Documentation.\n                                        </div>\n                                    </div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </section>\n                ', '{\"name\":\"FAQ\",\"section_enabled\":\"active\",\"Sec9_title\":\"Frequently Asked Questions (FAQ)\",\"Sec9_info\":\"Please refer the Frequently ask question for your quick help\",\"section_footer_image_path\":\"\",\"section_main_image_path\":\"\",\"box_image_1_path\":\"\",\"box_image_2_path\":\"\",\"box_image_3_path\":\"\",\"Box1_image_path\":\"\",\"Box2_image_path\":\"\",\"Sec4_box1_image_path\":\"\",\"Sec4_box2_image_path\":\"\",\"Sec4_box3_image_path\":\"\",\"Sec4_box4_image_path\":\"\",\"Sec4_box5_image_path\":\"\",\"Sec4_box6_image_path\":\"\",\"Sec7_box1_image_path\":\"\",\"Sec7_box2_image_path\":\"\",\"Sec7_box3_image_path\":\"\",\"Sec7_box4_image_path\":\"\",\"Sec7_box5_image_path\":\"\",\"Sec7_box6_image_path\":\"\",\"Sec7_box7_image_path\":\"\",\"Sec7_box8_image_path\":\"\"}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(11, 'AboutUS - Footer', 'Section 10', '\n                <footer class=\"bg-dark footer\">\n                    <div class=\"container\">\n                        <div class=\"row\">\n                            <div class=\"col-md-4 wow fadeInUp\" data-wow-delay=\"0.2s\">\n                                <img src=\"assets/images/logo-white.svg\" alt=\"image\" class=\"img-fluid\" />\n                                <h4 class=\"my-3 text-white\">About Smart Tenant</h4>\n                                <p class=\"mb-4 text-white text-opacity-75\">\n                                    Property management refers to the administration, operation, and oversight of real estate properties on behalf of property owners. It involves various tasks such as marketing rental properties, finding tenants, collecting rent and ensuring legal compliance.\n                                </p>\n                            </div>\n                            <div class=\"col-md-8\">\n                                <div class=\"row g-4\">\n                                    <div class=\"col-6 col-md-3 wow fadeInUp\" data-wow-delay=\"0.6s\">\n                                        <h5 class=\"mb-3 mb-sm-4 text-white\">Help</h5>\n                                        <ul class=\"list-unstyled footer-link\">\n                                            <li><a href=\"#\" target=\"_blank\">Blog</a></li>\n                                            <li><a href=\"#\" target=\"_blank\">Documentation</a>\n                                            </li>\n                                            <li><a href=\"#\" target=\"_blank\">Change\n                                                    Log</a></li>\n                                            <li><a href=\"#\" target=\"_blank\">Support</a></li>\n                                        </ul>\n                                    </div>\n                                    <div class=\"col-6 col-md-3 wow fadeInUp\" data-wow-delay=\"0.6s\">\n                                        <h5 class=\"mb-3 mb-sm-4 text-white\">Store Help</h5>\n                                        <ul class=\"list-unstyled footer-link\">\n                                            <li><a href=\"https://mui.com/store/license/\" target=\"_blank\">License</a></li>\n                                            <li><a href=\"https://mui.com/store/customer-refund-policy/\" target=\"_blank\">Refund\n                                                    Policy</a></li>\n                                            <li>\n                                                <a href=\"https://support.mui.com/hc/en-us/sections/360002564979-For-customers\"\n                                                    target=\"_blank\">Submit a Request</a>\n                                            </li>\n                                        </ul>\n                                    </div>\n                                    <div class=\"col-6 col-md-3 wow fadeInUp\" data-wow-delay=\"0.6s\">\n                                        <h5 class=\"mb-3 mb-sm-4 text-white\">Berry Eco-System</h5>\n                                        <ul class=\"list-unstyled footer-link\">\n                                            <li><a href=\"#\" target=\"_blank\">Bootstrap 5</a></li>\n                                            <li><a href=\"#\" target=\"_blank\">Angular</a></li>\n                                            <li><a href=\"#\" target=\"_blank\">CodeIgniter</a></li>\n                                            <li><a href=\"#\" target=\"_blank\">.Net</a></li>\n                                            <li>\n                                                <a href=\"/\" target=\"_blank\">\n                                                    Shopify\n                                                    <div><span class=\"badge bg-light-primary ms-2\">Upcoming</span></div>\n                                                </a>\n                                            </li>\n                                            <li><a href=\"#\" target=\"_blank\">Vuetify 3</a></li>\n                                            <li><a href=\"#\" target=\"_blank\">Full Stack</a></li>\n                                            <li><a href=\"#\" target=\"_blank\">Django</a></li>\n                                            <li><a href=\"#\" target=\"_blank\">Flask</a></li>\n                                        </ul>\n                                    </div>\n                                    <div class=\"col-6 col-md-3 wow fadeInUp\" data-wow-delay=\"0.6s\">\n                                        <h5 class=\"mb-3 mb-sm-4 text-white\">Free Versions</h5>\n                                        <ul class=\"list-unstyled footer-link\">\n                                            <li><a href=\"#\" target=\"_blank\">Free React MUI</a>\n                                            </li>\n                                            <li><a href=\"#\" target=\"_blank\">Free Bootstrap 5</a>\n                                            </li>\n                                            <li><a href=\"#\" target=\"_blank\">Free Angular</a>\n                                            </li>\n                                            <li><a href=\"#\" target=\"_blank\">Free Django</a></li>\n                                        </ul>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                    <div class=\"sub-footer\">\n                        <div class=\"container\">\n                            <div class=\"row align-items-center\">\n                                <div class=\"col my-1 wow fadeInUp\" data-wow-delay=\"0.4s\">\n                                    <p class=\"mb-0 text-white text-opacity-75\">\n                                        Copyright 2025 Monolith\n                                    </p>\n                                </div>\n                                <div class=\"col-auto my-1\">\n                                    <ul class=\"list-inline footer-sos-link mb-0\">\n                                        <li class=\"list-inline-item wow fadeInUp\" data-wow-delay=\"0.4s\">\n                                            <a href=\"#\" class=\"link-primary\">\n                                                <svg class=\"pc-icon\">\n                                                    <use xlink:href=\"#custom-facebook\"></use>\n                                                </svg>\n                                            </a>\n                                        </li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </footer>\n                ', '{\"name\":\"AboutUS - Footer\",\"section_enabled\":\"active\",\"Sec10_title\":\"About Smart Tenant\",\"Sec10_info\":\"Property management refers to the administration, operation, and oversight of real estate properties on behalf of property owners. It involves various tasks such as marketing rental properties, finding tenants, collecting rent and ensuring legal compliance.\",\"section_footer_image_path\":\"\",\"section_main_image_path\":\"\",\"box_image_1_path\":\"\",\"box_image_2_path\":\"\",\"box_image_3_path\":\"\",\"Box1_image_path\":\"\",\"Box2_image_path\":\"\",\"Sec4_box1_image_path\":\"\",\"Sec4_box2_image_path\":\"\",\"Sec4_box3_image_path\":\"\",\"Sec4_box4_image_path\":\"\",\"Sec4_box5_image_path\":\"\",\"Sec4_box6_image_path\":\"\",\"Sec7_box1_image_path\":\"\",\"Sec7_box2_image_path\":\"\",\"Sec7_box3_image_path\":\"\",\"Sec7_box4_image_path\":\"\",\"Sec7_box5_image_path\":\"\",\"Sec7_box6_image_path\":\"\",\"Sec7_box7_image_path\":\"\",\"Sec7_box8_image_path\":\"\"}', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL DEFAULT 0,
  `property_id` int(11) NOT NULL DEFAULT 0,
  `unit_id` int(11) NOT NULL DEFAULT 0,
  `invoice_month` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_id`, `property_id`, `unit_id`, `invoice_month`, `end_date`, `status`, `notes`, `parent_id`, `created_at`, `updated_at`) VALUES
(2, 1, 3, 2, '2025-03-01', '2025-03-31', 'open', 'Test', 7, '2025-03-10 17:43:11', '2025-03-10 17:43:11'),
(3, 1, 1, 1, '2025-03-01', '2025-03-13', 'open', 'Rent', 2, '2025-03-12 16:09:47', '2025-03-12 16:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL DEFAULT 0,
  `invoice_type` int(11) NOT NULL DEFAULT 0,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `invoice_type`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(2, 2, 3, 12000.00, 'Test', '2025-03-10 17:43:11', '2025-03-10 17:43:11'),
(3, 3, 5, 48000.00, 'Rent due', '2025-03-12 16:09:47', '2025-03-12 16:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL DEFAULT 0,
  `transaction_id` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_date` date DEFAULT NULL,
  `receipt` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logged_histories`
--

CREATE TABLE `logged_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(191) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logged_histories`
--

INSERT INTO `logged_histories` (`id`, `user_id`, `ip`, `date`, `details`, `type`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, '103.157.169.101', '2025-03-03 07:25:15', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Techno Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.169.101\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-03 07:25:15', '2025-03-03 07:25:15'),
(2, 2, '103.157.169.101', '2025-03-03 07:34:38', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Techno Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.169.101\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2025-03-03 07:34:38', '2025-03-03 07:34:38'),
(3, 1, '91.72.159.218', '2025-03-03 11:01:14', '{\"status\":\"success\",\"country\":\"United Arab Emirates\",\"countryCode\":\"AE\",\"region\":\"DU\",\"regionName\":\"Dubai\",\"city\":\"Dubai\",\"zip\":\"\",\"lat\":25.0734,\"lon\":55.2979,\"timezone\":\"Asia\\/Dubai\",\"isp\":\"Emirates Integrated Telecommunications Company PJSC\",\"org\":\"Emirates Integrated Telecommunications Company\",\"as\":\"AS15802 Emirates Integrated Telecommunications Company PJSC\",\"query\":\"91.72.159.218\",\"browser\":\"Chrome\",\"os\":\"Android\",\"language\":\"en\",\"device\":\"mobile\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-03 11:01:14', '2025-03-03 11:01:14'),
(4, 1, '103.157.169.101', '2025-03-03 11:03:37', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Techno Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.169.101\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-03 11:03:37', '2025-03-03 11:03:37'),
(5, 1, '192.177.62.195', '2025-03-03 11:03:49', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.35208,\"lon\":103.82,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Amazon.com, Inc\",\"org\":\"EGIHosting\",\"as\":\"AS16509 Amazon.com, Inc.\",\"query\":\"192.177.62.195\",\"browser\":\"Chrome\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-03 11:03:49', '2025-03-03 11:03:49'),
(6, 2, '192.177.62.195', '2025-03-04 10:32:12', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.35208,\"lon\":103.82,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Amazon.com, Inc\",\"org\":\"EGIHosting\",\"as\":\"AS16509 Amazon.com, Inc.\",\"query\":\"192.177.62.195\",\"browser\":\"Chrome\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2025-03-04 10:32:12', '2025-03-04 10:32:12'),
(7, 2, '176.227.240.53', '2025-03-04 17:35:31', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cyberzone S.A.\",\"org\":\"Cyberzone S.A\",\"as\":\"AS209854 Cyberzone S.A.\",\"query\":\"176.227.240.53\",\"browser\":\"Chrome\",\"os\":\"Android\",\"language\":\"en\",\"device\":\"mobile\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2025-03-04 17:35:31', '2025-03-04 17:35:31'),
(8, 4, '176.227.240.31', '2025-03-04 17:38:44', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cyberzone S.A.\",\"org\":\"Cyberzone S.A\",\"as\":\"AS209854 Cyberzone S.A.\",\"query\":\"176.227.240.31\",\"browser\":\"Chrome\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'tenant', 2, '2025-03-04 17:38:44', '2025-03-04 17:38:44'),
(9, 5, '176.227.240.31', '2025-03-04 17:42:32', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cyberzone S.A.\",\"org\":\"Cyberzone S.A\",\"as\":\"AS209854 Cyberzone S.A.\",\"query\":\"176.227.240.31\",\"browser\":\"Chrome\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'maintainer', 2, '2025-03-04 17:42:32', '2025-03-04 17:42:32'),
(10, 2, '176.227.240.31', '2025-03-04 17:42:59', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cyberzone S.A.\",\"org\":\"Cyberzone S.A\",\"as\":\"AS209854 Cyberzone S.A.\",\"query\":\"176.227.240.31\",\"browser\":\"Chrome\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2025-03-04 17:42:59', '2025-03-04 17:42:59'),
(11, 6, '176.227.240.31', '2025-03-04 18:36:53', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cyberzone S.A.\",\"org\":\"Cyberzone S.A\",\"as\":\"AS209854 Cyberzone S.A.\",\"query\":\"176.227.240.31\",\"browser\":\"Safari\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'HR', 2, '2025-03-04 18:36:53', '2025-03-04 18:36:53'),
(12, 1, '103.157.168.177', '2025-03-06 09:46:09', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Networks Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.168.177\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-06 09:46:09', '2025-03-06 09:46:09'),
(13, 1, '103.157.168.177', '2025-03-07 10:21:07', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Networks Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.168.177\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-07 10:21:07', '2025-03-07 10:21:07'),
(14, 1, '103.157.168.177', '2025-03-07 10:59:33', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Networks Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.168.177\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-07 10:59:33', '2025-03-07 10:59:33'),
(15, 1, '103.157.168.177', '2025-03-07 11:00:15', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Networks Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.168.177\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-07 11:00:15', '2025-03-07 11:00:15'),
(16, 1, '192.177.62.195', '2025-03-07 15:42:37', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.35208,\"lon\":103.82,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Amazon.com, Inc\",\"org\":\"EGIHosting\",\"as\":\"AS16509 Amazon.com, Inc.\",\"query\":\"192.177.62.195\",\"browser\":\"Chrome\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-07 15:42:37', '2025-03-07 15:42:37'),
(17, 1, '2001:8f8:2d66:c34b:7511:e180:4091:d8ff', '2025-03-07 15:43:25', '{\"status\":\"success\",\"country\":\"United Arab Emirates\",\"countryCode\":\"AE\",\"region\":\"AZ\",\"regionName\":\"Abu Dhabi\",\"city\":\"Abu Dhabi\",\"zip\":\"\",\"lat\":24.4542,\"lon\":54.406,\"timezone\":\"Asia\\/Dubai\",\"isp\":\"Emirates Telecommunications Corporation\",\"org\":\"EMIRATES TELECOMMUNICATIONS GROUP COMPANY (ETISALAT GROUP) PJSC\",\"as\":\"AS8966 EMIRATES TELECOMMUNICATIONS GROUP COMPANY (ETISALAT GROUP) PJSC\",\"query\":\"2001:8f8:2d66:c34b:7511:e180:4091:d8ff\",\"browser\":\"Chrome\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-07 15:43:25', '2025-03-07 15:43:25'),
(18, 2, '2001:8f8:2d66:c34b:7511:e180:4091:d8ff', '2025-03-07 15:45:51', '{\"status\":\"success\",\"country\":\"United Arab Emirates\",\"countryCode\":\"AE\",\"region\":\"AZ\",\"regionName\":\"Abu Dhabi\",\"city\":\"Abu Dhabi\",\"zip\":\"\",\"lat\":24.4542,\"lon\":54.406,\"timezone\":\"Asia\\/Dubai\",\"isp\":\"Emirates Telecommunications Corporation\",\"org\":\"EMIRATES TELECOMMUNICATIONS GROUP COMPANY (ETISALAT GROUP) PJSC\",\"as\":\"AS8966 EMIRATES TELECOMMUNICATIONS GROUP COMPANY (ETISALAT GROUP) PJSC\",\"query\":\"2001:8f8:2d66:c34b:7511:e180:4091:d8ff\",\"browser\":\"Chrome\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2025-03-07 15:45:51', '2025-03-07 15:45:51'),
(19, 1, '103.157.169.96', '2025-03-10 08:57:49', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Techno Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.169.96\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-10 08:57:49', '2025-03-10 08:57:49'),
(20, 1, '103.157.169.96', '2025-03-10 17:27:25', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Techno Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.169.96\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-10 17:27:25', '2025-03-10 17:27:25'),
(21, 8, '103.157.169.96', '2025-03-10 18:03:59', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Techno Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.169.96\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'Manager', 7, '2025-03-10 18:03:59', '2025-03-10 18:03:59'),
(22, 1, '103.157.169.96', '2025-03-10 18:05:16', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Techno Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.169.96\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-10 18:05:16', '2025-03-10 18:05:16'),
(23, 10, '103.157.169.96', '2025-03-10 18:20:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Techno Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.169.96\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'tenant', 7, '2025-03-10 18:20:36', '2025-03-10 18:20:36'),
(24, 10, '103.157.169.96', '2025-03-11 06:17:16', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Techno Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.169.96\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'tenant', 7, '2025-03-11 06:17:16', '2025-03-11 06:17:16'),
(25, 1, '103.157.169.96', '2025-03-11 06:25:25', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"RJ\",\"regionName\":\"Rajasthan\",\"city\":\"Jaipur\",\"zip\":\"302012\",\"lat\":26.9136,\"lon\":75.7858,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Spiderlink Techno Pvt Ltd\",\"org\":\"Spiderlink Techno Pvt Ltd\",\"as\":\"AS134928 Spiderlink Networks Pvt Ltd\",\"query\":\"103.157.169.96\",\"browser\":\"Chrome\",\"os\":\"Windows\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'super admin', 1, '2025-03-11 06:25:25', '2025-03-11 06:25:25'),
(26, 2, '176.227.240.79', '2025-03-11 16:25:07', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cyberzone S.A.\",\"org\":\"Cyberzone S.A\",\"as\":\"AS209854 Cyberzone S.A.\",\"query\":\"176.227.240.79\",\"browser\":\"Chrome\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2025-03-11 16:25:07', '2025-03-11 16:25:07'),
(27, 2, '176.227.240.79', '2025-03-12 15:47:16', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cyberzone S.A.\",\"org\":\"Cyberzone S.A\",\"as\":\"AS209854 Cyberzone S.A.\",\"query\":\"176.227.240.79\",\"browser\":\"Chrome\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2025-03-12 15:47:16', '2025-03-12 15:47:16'),
(28, 4, '2001:8f8:1339:1be8:41dc:f1c:f8d9:577a', '2025-03-12 16:05:58', '{\"status\":\"success\",\"country\":\"United Arab Emirates\",\"countryCode\":\"AE\",\"region\":\"DU\",\"regionName\":\"Dubai\",\"city\":\"Dubai\",\"zip\":\"\",\"lat\":25.0734,\"lon\":55.2979,\"timezone\":\"Asia\\/Dubai\",\"isp\":\"Emirates Telecommunications Corporation\",\"org\":\"EMIRATES TELECOMMUNICATIONS GROUP COMPANY (ETISALAT GROUP) PJSC\",\"as\":\"AS8966 EMIRATES TELECOMMUNICATIONS GROUP COMPANY (ETISALAT GROUP) PJSC\",\"query\":\"2001:8f8:1339:1be8:41dc:f1c:f8d9:577a\",\"browser\":\"Safari\",\"os\":\"OS X\",\"language\":\"en\",\"device\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'tenant', 2, '2025-03-12 16:05:58', '2025-03-12 16:05:58');

-- --------------------------------------------------------

--
-- Table structure for table `maintainers`
--

CREATE TABLE `maintainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `property_id` varchar(191) DEFAULT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintainers`
--

INSERT INTO `maintainers` (`id`, `user_id`, `property_id`, `type_id`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 5, NULL, 0, 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(2, 9, '3', 1, 7, '2025-03-10 17:28:25', '2025-03-10 17:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_requests`
--

CREATE TABLE `maintenance_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL DEFAULT 0,
  `unit_id` int(11) NOT NULL DEFAULT 0,
  `issue_type` int(11) NOT NULL DEFAULT 0,
  `maintainer_id` int(11) NOT NULL DEFAULT 0,
  `status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `issue_attachment` varchar(191) DEFAULT NULL,
  `invoice` varchar(191) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `fixed_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_requests`
--

INSERT INTO `maintenance_requests` (`id`, `property_id`, `unit_id`, `issue_type`, `maintainer_id`, `status`, `amount`, `issue_attachment`, `invoice`, `request_date`, `fixed_date`, `notes`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 2, 9, 'pending', 0.00, 'searce_result_1741627918.png', NULL, '2025-03-07', NULL, 'Test', 7, '2025-03-10 17:31:58', '2025-03-10 17:31:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_05_21_065337_create_permission_tables', 1),
(5, '2021_05_08_100002_create_subscriptions_table', 1),
(6, '2021_05_08_124950_create_settings_table', 1),
(7, '2021_05_29_180034_create_notice_boards_table', 1),
(8, '2021_05_29_183858_create_contacts_table', 1),
(9, '2023_06_19_150313_create_properties_table', 1),
(10, '2023_06_19_160357_create_property_units_table', 1),
(11, '2023_06_19_161534_create_property_images_table', 1),
(12, '2023_06_20_154547_create_tenants_table', 1),
(13, '2023_06_20_161541_create_tenant_documents_table', 1),
(14, '2023_06_20_162422_create_invoices_table', 1),
(15, '2023_06_20_162715_create_invoice_items_table', 1),
(16, '2023_06_20_163134_create_expenses_table', 1),
(17, '2023_06_20_164503_create_types_table', 1),
(18, '2023_07_01_125146_create_invoice_payments_table', 1),
(19, '2023_07_13_164842_create_maintainers_table', 1),
(20, '2023_07_14_020859_create_maintenance_requests_table', 1),
(21, '2023_08_04_164513_create_logged_histories_table', 1),
(22, '2024_01_12_141909_create_coupons_table', 1),
(23, '2024_01_12_171136_create_coupon_histories_table', 1),
(24, '2024_02_17_052552_create_package_transactions_table', 1),
(25, '2024_10_08_091941_create_notifications_table', 1),
(26, '2024_11_29_061023_add_email_verification_token_to_users_table', 1),
(27, '2025_01_01_032920_create_f_a_q_s_table', 1),
(28, '2025_01_01_052842_create_pages_table', 1),
(29, '2025_01_01_115236_create_home_pages_table', 1),
(30, '2025_01_30_090542_create_auth_pages_table', 1),
(31, '2025_02_05_065605_add_twofa_secret_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(6, 'App\\Models\\User', 6),
(7, 'App\\Models\\User', 10),
(8, 'App\\Models\\User', 9),
(9, 'App\\Models\\User', 8);

-- --------------------------------------------------------

--
-- Table structure for table `notice_boards`
--

CREATE TABLE `notice_boards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notice_boards`
--

INSERT INTO `notice_boards` (`id`, `title`, `description`, `attachment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Test Notice 3', 'Test Descreption', 'download_1741343833.jpg', 1, '2025-03-07 10:37:13', '2025-03-07 10:37:13'),
(2, 'Please Pay you rent', 'Test', 'searce_result_1741628901.png', 7, '2025-03-10 17:48:21', '2025-03-10 17:48:21'),
(3, 'Water shortage', 'No water tomorrow', '', 2, '2025-03-12 16:17:32', '2025-03-12 16:17:32');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `short_code` text DEFAULT NULL,
  `enabled_email` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `module`, `name`, `subject`, `message`, `short_code`, `enabled_email`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'user_create', 'New User', 'Welcome to {company_name}!', '\n                            <p><strong>Dear {new_user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Your account details are as follows:</p><p><strong>App Link:</strong> <a href=\"{app_link}\">{app_link}</a></p><p><strong>Username:</strong> {username}</p><p><strong>Password:</strong> {password}</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote>', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{new_user_name}\",\"{username}\",\"{password}\",\"{app_link}\"]', 0, 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(2, 'tenant_create', 'New Tenant', 'Welcome to {company_name}!', '\n                  <p><strong>Dear {user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Your account details are as follows:</p><p><strong>App Link:</strong> <a href=\"{app_link}\">{app_link}</a></p><p><strong>Username:</strong> {username}</p><p><strong>Password:</strong> {password}</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote>', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{username}\",\"{password}\",\"{app_link}\"]', 0, 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(3, 'maintainer_create', 'New Maintainer', 'Welcome to {company_name}!', '\n                  <p><strong>Dear {user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Your account details are as follows:</p><p><strong>App Link:</strong> <a href=\"{app_link}\">{app_link}</a></p><p><strong>Username:</strong> {username}</p><p><strong>Password:</strong> {password}</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote>', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{username}\",\"{password}\",\"{app_link}\"]', 0, 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(4, 'maintenance_request_create', 'New Maintenance Request', 'New Maintenance Request Created', '\n                    <p><strong class=\"ql-size-huge\">Dear Owner,</strong></p><p>We would like to inform you that a new maintenance request has been created for your property. Below are the details of the request:</p><p><strong>Request Details:</strong></p><ul><li>	Submitted By: {tenant_name}</li><li>	Submitted On: {created_at}</li><li>	Category: {issue_type}</li><li>	Description: {issue_description}</li></ul><p><br></p><p><strong>Tenant Contact Information:</strong></p><ul><li>	Name: {tenant_name}</li><li>	Phone: {tenant_number}</li><li>	Email: {tenant_mail}</li></ul><p>Thank you for your attention to this matter.</p><p><strong>Best regards,</strong></p><p><strong>{tenant_name}</strong></p><p><strong>{tenant_mail}</strong></p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{tenant_name}\",\"{created_at}\",\"{issue_type}\",\"{issue_description}\",\"{tenant_number}\",\"{tenant_mail}\"]', 0, 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(5, 'maintenance_request_complete', 'Maintenance Request Complete', 'Maintenance Request Completed!', '\n                    <p><strong>Dear {tenant_name},</strong></p><p><br></p><p>We are pleased to inform you that your maintenance request has been successfully completed.</p><p><br></p><p> <strong>Request Details:</strong></p><ul><li>Submitted By: {tenant_name}</li><li>Submitted On: {submitted_at}</li><li>Category: {issue_type}</li><li>Description: {issue_description}</li></ul><p><br></p><p><strong>Completion Details:</strong></p><ul><li> Completed On: {completed_at}</li> </ul><p><br></p><p><strong>Feedback:</strong></p><p>We value your feedback to improve our services. Please let us know if you are satisfied with the maintenance performed or if there are any further issues that need attention.</p><p><br></p><p><strong>Contact Information:</strong></p><p> If you have any questions or need further assistance, please contact us at {maintainer_email} or {maintainer_number}.</p><p>Thank you for your cooperation and patience.</p><p><br></p><p><strong>Best regards,</strong></p><p>{maintainer_name}</p><p>{maintainer_email}</p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{tenant_name}\",\"{submitted_at}\",\"{issue_type}\",\"{issue_description}\",\"{completed_at}\",\"{maintainer_email}\",\"{maintainer_number}\",\"{maintainer_name}\"]', 0, 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(6, 'invoice_create', 'New Invoice', 'Invoice Created', '\n                        <p><strong>Dear {user_name},</strong></p><p><br></p><p> We are pleased to inform you that an invoice has been created  with {company_name}.</p><p><br></p><p><strong> Invoice Details:</strong></p><ul><li>Invoice Number: {invoice_number}</li><li>Date Issued: {invoice_date}</li><li>Due Date: {invoice_due_date}</li><li>Amount Due: {amount}</li><li>Description: {invoice_description}</li></ul><p><br></p><p><strong>Contact Information:</strong></p><p>If you have any questions or need further assistance, please contact our billing department at {company_email} or {company_number}.</p><p><br></p><p>Thank you for your prompt attention to this matter.</p><p><br></p><p><strong>Best regards,</strong></p><p><strong>{company_name}</strong></p><p><strong>{company_email}</strong></p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{invoice_number}\",\"{invoice_date}\",\"{invoice_due_date}\",\"{invoice_description}\",\"{amount}\"]', 0, 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(7, 'payment_reminder', 'Payment Reminder', 'Friendly Reminder: Payment Due Soon', '\n                    <p><strong>Dear {user_name},</strong></p><p><br></p><p> This is a friendly reminder that your payment for the following invoice is due soon:</p><p><br></p><p><strong>Invoice Details:</strong></p><ul><li>Invoice Number: {invoice_number}</li><li>Date Issued: {invoice_date}</li><li>Due Date: {invoice_due_date}</li><li>Amount Due: {amount}</li><li>Description: {invoice_description}</li></ul><p><br></p><p><br></p><p>If you have already made your payment, please disregard this notice. Otherwise, we appreciate your prompt attention to this matter.</p><p><br></p><p><strong>Contact Information:</strong></p><p>If you have any questions or need assistance, feel free to contact our billing department at {company_email} or {company_number}.</p><p><br></p><p>Thank you for your cooperation!</p><p><br></p><p><strong>Best regards,</strong></p><p><strong>{company_name}</strong></p><p><strong>{company_email}</strong></p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{invoice_number}\",\"{invoice_date}\",\"{invoice_due_date}\",\"{amount}\",\"{invoice_description}\"]', 0, 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(8, 'user_create', 'New User', 'Welcome to {company_name}!', '\n                            <p><strong>Dear {new_user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Your account details are as follows:</p><p><strong>App Link:</strong> <a href=\"{app_link}\">{app_link}</a></p><p><strong>Username:</strong> {username}</p><p><strong>Password:</strong> {password}</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote>', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{new_user_name}\",\"{username}\",\"{password}\",\"{app_link}\"]', 0, 7, '2025-03-07 10:25:00', '2025-03-07 10:25:00'),
(9, 'tenant_create', 'New Tenant', 'Welcome to {company_name}!', '\n                  <p><strong>Dear {user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Your account details are as follows:</p><p><strong>App Link:</strong> <a href=\"{app_link}\">{app_link}</a></p><p><strong>Username:</strong> {username}</p><p><strong>Password:</strong> {password}</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote>', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{username}\",\"{password}\",\"{app_link}\"]', 0, 7, '2025-03-07 10:25:00', '2025-03-07 10:25:00'),
(10, 'maintainer_create', 'New Maintainer', 'Welcome to {company_name}!', '\n                  <p><strong>Dear {user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Your account details are as follows:</p><p><strong>App Link:</strong> <a href=\"{app_link}\">{app_link}</a></p><p><strong>Username:</strong> {username}</p><p><strong>Password:</strong> {password}</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote>', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{username}\",\"{password}\",\"{app_link}\"]', 0, 7, '2025-03-07 10:25:00', '2025-03-07 10:25:00'),
(11, 'maintenance_request_create', 'New Maintenance Request', 'New Maintenance Request Created', '\n                    <p><strong class=\"ql-size-huge\">Dear Owner,</strong></p><p>We would like to inform you that a new maintenance request has been created for your property. Below are the details of the request:</p><p><strong>Request Details:</strong></p><ul><li>	Submitted By: {tenant_name}</li><li>	Submitted On: {created_at}</li><li>	Category: {issue_type}</li><li>	Description: {issue_description}</li></ul><p><br></p><p><strong>Tenant Contact Information:</strong></p><ul><li>	Name: {tenant_name}</li><li>	Phone: {tenant_number}</li><li>	Email: {tenant_mail}</li></ul><p>Thank you for your attention to this matter.</p><p><strong>Best regards,</strong></p><p><strong>{tenant_name}</strong></p><p><strong>{tenant_mail}</strong></p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{tenant_name}\",\"{created_at}\",\"{issue_type}\",\"{issue_description}\",\"{tenant_number}\",\"{tenant_mail}\"]', 0, 7, '2025-03-07 10:25:00', '2025-03-07 10:25:00'),
(12, 'maintenance_request_complete', 'Maintenance Request Complete', 'Maintenance Request Completed!', '\n                    <p><strong>Dear {tenant_name},</strong></p><p><br></p><p>We are pleased to inform you that your maintenance request has been successfully completed.</p><p><br></p><p> <strong>Request Details:</strong></p><ul><li>Submitted By: {tenant_name}</li><li>Submitted On: {submitted_at}</li><li>Category: {issue_type}</li><li>Description: {issue_description}</li></ul><p><br></p><p><strong>Completion Details:</strong></p><ul><li> Completed On: {completed_at}</li> </ul><p><br></p><p><strong>Feedback:</strong></p><p>We value your feedback to improve our services. Please let us know if you are satisfied with the maintenance performed or if there are any further issues that need attention.</p><p><br></p><p><strong>Contact Information:</strong></p><p> If you have any questions or need further assistance, please contact us at {maintainer_email} or {maintainer_number}.</p><p>Thank you for your cooperation and patience.</p><p><br></p><p><strong>Best regards,</strong></p><p>{maintainer_name}</p><p>{maintainer_email}</p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{tenant_name}\",\"{submitted_at}\",\"{issue_type}\",\"{issue_description}\",\"{completed_at}\",\"{maintainer_email}\",\"{maintainer_number}\",\"{maintainer_name}\"]', 0, 7, '2025-03-07 10:25:00', '2025-03-07 10:25:00'),
(13, 'invoice_create', 'New Invoice', 'Invoice Created', '\n                        <p><strong>Dear {user_name},</strong></p><p><br></p><p> We are pleased to inform you that an invoice has been created  with {company_name}.</p><p><br></p><p><strong> Invoice Details:</strong></p><ul><li>Invoice Number: {invoice_number}</li><li>Date Issued: {invoice_date}</li><li>Due Date: {invoice_due_date}</li><li>Amount Due: {amount}</li><li>Description: {invoice_description}</li></ul><p><br></p><p><strong>Contact Information:</strong></p><p>If you have any questions or need further assistance, please contact our billing department at {company_email} or {company_number}.</p><p><br></p><p>Thank you for your prompt attention to this matter.</p><p><br></p><p><strong>Best regards,</strong></p><p><strong>{company_name}</strong></p><p><strong>{company_email}</strong></p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{invoice_number}\",\"{invoice_date}\",\"{invoice_due_date}\",\"{invoice_description}\",\"{amount}\"]', 0, 7, '2025-03-07 10:25:00', '2025-03-07 10:25:00'),
(14, 'payment_reminder', 'Payment Reminder', 'Friendly Reminder: Payment Due Soon', '\n                    <p><strong>Dear {user_name},</strong></p><p><br></p><p> This is a friendly reminder that your payment for the following invoice is due soon:</p><p><br></p><p><strong>Invoice Details:</strong></p><ul><li>Invoice Number: {invoice_number}</li><li>Date Issued: {invoice_date}</li><li>Due Date: {invoice_due_date}</li><li>Amount Due: {amount}</li><li>Description: {invoice_description}</li></ul><p><br></p><p><br></p><p>If you have already made your payment, please disregard this notice. Otherwise, we appreciate your prompt attention to this matter.</p><p><br></p><p><strong>Contact Information:</strong></p><p>If you have any questions or need assistance, feel free to contact our billing department at {company_email} or {company_number}.</p><p><br></p><p>Thank you for your cooperation!</p><p><br></p><p><strong>Best regards,</strong></p><p><strong>{company_name}</strong></p><p><strong>{company_email}</strong></p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{invoice_number}\",\"{invoice_date}\",\"{invoice_due_date}\",\"{amount}\",\"{invoice_description}\"]', 0, 7, '2025-03-07 10:25:00', '2025-03-07 10:25:00'),
(15, 'user_create', 'New User', 'Welcome to {company_name}!', '\n                            <p><strong>Dear {new_user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Your account details are as follows:</p><p><strong>App Link:</strong> <a href=\"{app_link}\">{app_link}</a></p><p><strong>Username:</strong> {username}</p><p><strong>Password:</strong> {password}</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote>', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{new_user_name}\",\"{username}\",\"{password}\",\"{app_link}\"]', 0, 11, '2025-03-10 18:27:16', '2025-03-10 18:27:16'),
(16, 'tenant_create', 'New Tenant', 'Welcome to {company_name}!', '\n                  <p><strong>Dear {user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Your account details are as follows:</p><p><strong>App Link:</strong> <a href=\"{app_link}\">{app_link}</a></p><p><strong>Username:</strong> {username}</p><p><strong>Password:</strong> {password}</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote>', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{username}\",\"{password}\",\"{app_link}\"]', 0, 11, '2025-03-10 18:27:16', '2025-03-10 18:27:16'),
(17, 'maintainer_create', 'New Maintainer', 'Welcome to {company_name}!', '\n                  <p><strong>Dear {user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Your account details are as follows:</p><p><strong>App Link:</strong> <a href=\"{app_link}\">{app_link}</a></p><p><strong>Username:</strong> {username}</p><p><strong>Password:</strong> {password}</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote>', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{username}\",\"{password}\",\"{app_link}\"]', 0, 11, '2025-03-10 18:27:16', '2025-03-10 18:27:16'),
(18, 'maintenance_request_create', 'New Maintenance Request', 'New Maintenance Request Created', '\n                    <p><strong class=\"ql-size-huge\">Dear Owner,</strong></p><p>We would like to inform you that a new maintenance request has been created for your property. Below are the details of the request:</p><p><strong>Request Details:</strong></p><ul><li>	Submitted By: {tenant_name}</li><li>	Submitted On: {created_at}</li><li>	Category: {issue_type}</li><li>	Description: {issue_description}</li></ul><p><br></p><p><strong>Tenant Contact Information:</strong></p><ul><li>	Name: {tenant_name}</li><li>	Phone: {tenant_number}</li><li>	Email: {tenant_mail}</li></ul><p>Thank you for your attention to this matter.</p><p><strong>Best regards,</strong></p><p><strong>{tenant_name}</strong></p><p><strong>{tenant_mail}</strong></p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{tenant_name}\",\"{created_at}\",\"{issue_type}\",\"{issue_description}\",\"{tenant_number}\",\"{tenant_mail}\"]', 0, 11, '2025-03-10 18:27:16', '2025-03-10 18:27:16'),
(19, 'maintenance_request_complete', 'Maintenance Request Complete', 'Maintenance Request Completed!', '\n                    <p><strong>Dear {tenant_name},</strong></p><p><br></p><p>We are pleased to inform you that your maintenance request has been successfully completed.</p><p><br></p><p> <strong>Request Details:</strong></p><ul><li>Submitted By: {tenant_name}</li><li>Submitted On: {submitted_at}</li><li>Category: {issue_type}</li><li>Description: {issue_description}</li></ul><p><br></p><p><strong>Completion Details:</strong></p><ul><li> Completed On: {completed_at}</li> </ul><p><br></p><p><strong>Feedback:</strong></p><p>We value your feedback to improve our services. Please let us know if you are satisfied with the maintenance performed or if there are any further issues that need attention.</p><p><br></p><p><strong>Contact Information:</strong></p><p> If you have any questions or need further assistance, please contact us at {maintainer_email} or {maintainer_number}.</p><p>Thank you for your cooperation and patience.</p><p><br></p><p><strong>Best regards,</strong></p><p>{maintainer_name}</p><p>{maintainer_email}</p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{tenant_name}\",\"{submitted_at}\",\"{issue_type}\",\"{issue_description}\",\"{completed_at}\",\"{maintainer_email}\",\"{maintainer_number}\",\"{maintainer_name}\"]', 0, 11, '2025-03-10 18:27:16', '2025-03-10 18:27:16'),
(20, 'invoice_create', 'New Invoice', 'Invoice Created', '\n                        <p><strong>Dear {user_name},</strong></p><p><br></p><p> We are pleased to inform you that an invoice has been created  with {company_name}.</p><p><br></p><p><strong> Invoice Details:</strong></p><ul><li>Invoice Number: {invoice_number}</li><li>Date Issued: {invoice_date}</li><li>Due Date: {invoice_due_date}</li><li>Amount Due: {amount}</li><li>Description: {invoice_description}</li></ul><p><br></p><p><strong>Contact Information:</strong></p><p>If you have any questions or need further assistance, please contact our billing department at {company_email} or {company_number}.</p><p><br></p><p>Thank you for your prompt attention to this matter.</p><p><br></p><p><strong>Best regards,</strong></p><p><strong>{company_name}</strong></p><p><strong>{company_email}</strong></p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{invoice_number}\",\"{invoice_date}\",\"{invoice_due_date}\",\"{invoice_description}\",\"{amount}\"]', 0, 11, '2025-03-10 18:27:16', '2025-03-10 18:27:16'),
(21, 'payment_reminder', 'Payment Reminder', 'Friendly Reminder: Payment Due Soon', '\n                    <p><strong>Dear {user_name},</strong></p><p><br></p><p> This is a friendly reminder that your payment for the following invoice is due soon:</p><p><br></p><p><strong>Invoice Details:</strong></p><ul><li>Invoice Number: {invoice_number}</li><li>Date Issued: {invoice_date}</li><li>Due Date: {invoice_due_date}</li><li>Amount Due: {amount}</li><li>Description: {invoice_description}</li></ul><p><br></p><p><br></p><p>If you have already made your payment, please disregard this notice. Otherwise, we appreciate your prompt attention to this matter.</p><p><br></p><p><strong>Contact Information:</strong></p><p>If you have any questions or need assistance, feel free to contact our billing department at {company_email} or {company_number}.</p><p><br></p><p>Thank you for your cooperation!</p><p><br></p><p><strong>Best regards,</strong></p><p><strong>{company_name}</strong></p><p><strong>{company_email}</strong></p>\n                ', '[\"{company_name}\",\"{company_email}\",\"{company_phone_number}\",\"{company_address}\",\"{company_currency}\",\"{user_name}\",\"{invoice_number}\",\"{invoice_date}\",\"{invoice_due_date}\",\"{amount}\",\"{invoice_description}\"]', 0, 11, '2025-03-10 18:27:16', '2025-03-10 18:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `package_transactions`
--

CREATE TABLE `package_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `subscription_id` int(11) NOT NULL DEFAULT 0,
  `subscription_transactions_id` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_id` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `holder_name` varchar(100) DEFAULT NULL,
  `card_number` varchar(10) DEFAULT NULL,
  `card_expiry_month` varchar(10) DEFAULT NULL,
  `card_expiry_year` varchar(10) DEFAULT NULL,
  `receipt` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_transactions`
--

INSERT INTO `package_transactions` (`id`, `user_id`, `subscription_id`, `subscription_transactions_id`, `amount`, `transaction_id`, `payment_status`, `payment_type`, `holder_name`, `card_number`, `card_expiry_month`, `card_expiry_year`, `receipt`, `created_at`, `updated_at`) VALUES
(1, 7, 2, '67cad1b1d9ab35.10535479', 10000.00, NULL, 'Success', 'Bank Transfer', NULL, '', '', '', 'download_1741345201.jpg', '2025-03-07 11:00:01', '2025-03-07 11:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `enabled` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `enabled`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', 'privacy_policy', '<h3><strong>1. Information We Collect</strong></h3><p>We may collect the following types of information from you:</p><h4><strong>a. Personal Information</strong></h4><ul><li>Name, email address, phone number, and other contact details.</li><li>Payment information (if applicable).</li></ul><h4><strong>b. Non-Personal Information</strong></h4><ul><li>Browser type, operating system, and device information.</li><li>Usage data, including pages visited, time spent, and other analytical data.</li></ul><h4><strong>c. Information You Provide</strong></h4><ul><li>Information you voluntarily provide when contacting us, signing up, or completing forms.</li></ul><h4><strong>d. Cookies and Tracking Technologies</strong></h4><ul><li>We use cookies, web beacons, and other tracking tools to enhance your experience and analyze usage patterns.</li></ul><h3><strong>2. How We Use Your Information</strong></h3><p>We use the information collected for the following purposes:</p><ul><li>To provide, maintain, and improve our Services.</li><li>To process transactions and send you confirmations.</li><li>To communicate with you, including responding to inquiries or providing updates.</li><li>To personalize your experience and deliver tailored content.</li><li>To comply with legal obligations and protect against fraud or misuse.</li></ul><h3><strong>3. How We Share Your Information</strong></h3><p>We do not sell your personal information. However, we may share your information with:</p><ul><li><strong>Service Providers:</strong> Third-party vendors who assist in providing our Services.</li><li><strong>Legal Authorities:</strong> When required to comply with legal obligations or protect our rights.</li><li><strong>Business Transfers:</strong> In the event of a merger, acquisition, or sale of assets, your information may be transferred.</li></ul><h3><strong>4. Data Security</strong></h3><p>We implement appropriate technical and organizational measures to protect your data against unauthorized access, disclosure, alteration, or destruction. However, no method of transmission or storage is 100% secure, and we cannot guarantee absolute security.</p><h3><strong>5. Your Rights</strong></h3><p>You have the right to:</p><ul><li>Access, correct, or delete your personal data.</li><li>Opt-out of certain data processing activities, including marketing communications.</li><li>Withdraw consent where processing is based on consent.</li></ul><p>To exercise your rights, please contact us at [contact email].</p><h3><strong>6. Third-Party Links</strong></h3><p>Our Services may contain links to third-party websites. We are not responsible for the privacy practices or content of these websites. Please review their privacy policies before engaging with them.</p><h3><strong>7. Children\'s Privacy</strong></h3><p>Our Services are not intended for children under the age of [13/16], and we do not knowingly collect personal information from them. If we become aware that a child has provided us with personal data, we will take steps to delete it.</p><h3><strong>8. Changes to This Privacy Policy</strong></h3><p>We may update this Privacy Policy from time to time. Any changes will be posted on this page with a revised \'Last Updated\' date. Your continued use of the Services after such changes constitutes your acceptance of the new terms.</p><h3>&nbsp;</h3>', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(2, 'Terms & Conditions', 'terms_conditions', '<h3><strong>1. Acceptance of Terms</strong></h3><p>By using our Services, you confirm that you are at least [18 years old or the legal age in your jurisdiction] and capable of entering into a binding agreement. If you are using our Services on behalf of an organization, you represent that you have the authority to bind that organization to these Terms.</p><h3><strong>2. Use of Services</strong></h3><p>You agree to use our Services only for lawful purposes and in accordance with these Terms. You must not:</p><ul><li>Violate any applicable laws or regulations.</li><li>Use our Services in a manner that could harm, disable, overburden, or impair them.</li><li>Attempt to gain unauthorized access to our systems or networks.</li><li>Transmit any harmful code, viruses, or malicious software.</li></ul><h3><strong>3. User Accounts</strong></h3><p>If you create an account with us, you are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account or breach of security.</p><h3><strong>4. Intellectual Property</strong></h3><p>All content, trademarks, logos, and intellectual property associated with our Services are owned by [Your Company Name] or our licensors. You are granted a limited, non-exclusive, non-transferable license to access and use the Services for personal or authorized business purposes. Any unauthorized use, reproduction, or distribution is prohibited.</p><h3><strong>5. Payment and Billing</strong> (if applicable)</h3><p>If our Services involve payments:</p><ul><li>All fees are due at the time of purchase unless otherwise agreed.</li><li>We reserve the right to change pricing or introduce new fees with prior notice.</li><li>Refunds, if applicable, will be handled according to our [Refund Policy].</li></ul><h3><strong>6. Termination of Services</strong></h3><p>We reserve the right to suspend or terminate your access to our Services at our discretion, without prior notice, if:</p><ul><li>You breach these Terms.</li><li>We are required to do so by law.</li><li>Our Services are discontinued or altered.</li></ul><h3><strong>7. Limitation of Liability</strong></h3><p>To the fullest extent permitted by law:</p><ul><li>[Your Company Name] and its affiliates shall not be liable for any direct, indirect, incidental, or consequential damages resulting from your use of our Services.</li><li>Our liability is limited to the amount you paid, if any, for accessing our Services.</li></ul><h3><strong>8. Indemnification</strong></h3><p>You agree to indemnify and hold [Your Company Name], its affiliates, employees, and partners harmless from any claims, liabilities, damages, losses, or expenses arising from your use of the Services or violation of these Terms.</p><h3><strong>9. Modifications to Terms</strong></h3><p>We may update these Terms from time to time. Any changes will be effective immediately upon posting, and your continued use of the Services constitutes your acceptance of the revised Terms.</p>', 1, 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage user', 'web', NULL, NULL),
(2, 'create user', 'web', NULL, NULL),
(3, 'edit user', 'web', NULL, NULL),
(4, 'delete user', 'web', NULL, NULL),
(5, 'manage role', 'web', NULL, NULL),
(6, 'create role', 'web', NULL, NULL),
(7, 'edit role', 'web', NULL, NULL),
(8, 'delete role', 'web', NULL, NULL),
(9, 'manage contact', 'web', NULL, NULL),
(10, 'create contact', 'web', NULL, NULL),
(11, 'edit contact', 'web', NULL, NULL),
(12, 'delete contact', 'web', NULL, NULL),
(13, 'manage note', 'web', NULL, NULL),
(14, 'create note', 'web', NULL, NULL),
(15, 'edit note', 'web', NULL, NULL),
(16, 'delete note', 'web', NULL, NULL),
(17, 'manage logged history', 'web', NULL, NULL),
(18, 'delete logged history', 'web', NULL, NULL),
(19, 'manage pricing packages', 'web', NULL, NULL),
(20, 'create pricing packages', 'web', NULL, NULL),
(21, 'edit pricing packages', 'web', NULL, NULL),
(22, 'delete pricing packages', 'web', NULL, NULL),
(23, 'buy pricing packages', 'web', NULL, NULL),
(24, 'manage coupon', 'web', NULL, NULL),
(25, 'create coupon', 'web', NULL, NULL),
(26, 'edit coupon', 'web', NULL, NULL),
(27, 'delete coupon', 'web', NULL, NULL),
(28, 'manage coupon history', 'web', NULL, NULL),
(29, 'delete coupon history', 'web', NULL, NULL),
(30, 'manage pricing transation', 'web', NULL, NULL),
(31, 'manage account settings', 'web', NULL, NULL),
(32, 'manage password settings', 'web', NULL, NULL),
(33, 'manage general settings', 'web', NULL, NULL),
(34, 'manage company settings', 'web', NULL, NULL),
(35, 'manage email settings', 'web', NULL, NULL),
(36, 'manage payment settings', 'web', NULL, NULL),
(37, 'manage seo settings', 'web', NULL, NULL),
(38, 'manage google recaptcha settings', 'web', NULL, NULL),
(39, 'manage property', 'web', NULL, NULL),
(40, 'create property', 'web', NULL, NULL),
(41, 'edit property', 'web', NULL, NULL),
(42, 'delete property', 'web', NULL, NULL),
(43, 'show property', 'web', NULL, NULL),
(44, 'manage unit', 'web', NULL, NULL),
(45, 'create unit', 'web', NULL, NULL),
(46, 'edit unit', 'web', NULL, NULL),
(47, 'delete unit', 'web', NULL, NULL),
(48, 'manage tenant', 'web', NULL, NULL),
(49, 'create tenant', 'web', NULL, NULL),
(50, 'edit tenant', 'web', NULL, NULL),
(51, 'delete tenant', 'web', NULL, NULL),
(52, 'show tenant', 'web', NULL, NULL),
(53, 'manage invoice', 'web', NULL, NULL),
(54, 'create invoice', 'web', NULL, NULL),
(55, 'edit invoice', 'web', NULL, NULL),
(56, 'delete invoice', 'web', NULL, NULL),
(57, 'show invoice', 'web', NULL, NULL),
(58, 'manage maintainer', 'web', NULL, NULL),
(59, 'create maintainer', 'web', NULL, NULL),
(60, 'edit maintainer', 'web', NULL, NULL),
(61, 'delete maintainer', 'web', NULL, NULL),
(62, 'manage maintenance request', 'web', NULL, NULL),
(63, 'create maintenance request', 'web', NULL, NULL),
(64, 'edit maintenance request', 'web', NULL, NULL),
(65, 'delete maintenance request', 'web', NULL, NULL),
(66, 'show maintenance request', 'web', NULL, NULL),
(67, 'delete invoice type', 'web', NULL, NULL),
(68, 'create invoice payment', 'web', NULL, NULL),
(69, 'delete invoice payment', 'web', NULL, NULL),
(70, 'manage expense', 'web', NULL, NULL),
(71, 'create expense', 'web', NULL, NULL),
(72, 'edit expense', 'web', NULL, NULL),
(73, 'delete expense', 'web', NULL, NULL),
(74, 'show expense', 'web', NULL, NULL),
(75, 'manage types', 'web', NULL, NULL),
(76, 'create types', 'web', NULL, NULL),
(77, 'edit types', 'web', NULL, NULL),
(78, 'delete types', 'web', NULL, NULL),
(79, 'manage notification', 'web', NULL, NULL),
(80, 'edit notification', 'web', NULL, NULL),
(81, 'manage FAQ', 'web', NULL, NULL),
(82, 'create FAQ', 'web', NULL, NULL),
(83, 'edit FAQ', 'web', NULL, NULL),
(84, 'delete FAQ', 'web', NULL, NULL),
(85, 'manage Page', 'web', NULL, NULL),
(86, 'create Page', 'web', NULL, NULL),
(87, 'edit Page', 'web', NULL, NULL),
(88, 'delete Page', 'web', NULL, NULL),
(89, 'show Page', 'web', NULL, NULL),
(90, 'manage home page', 'web', NULL, NULL),
(91, 'edit home page', 'web', NULL, NULL),
(92, 'manage footer', 'web', NULL, NULL),
(93, 'edit footer', 'web', NULL, NULL),
(94, 'manage 2FA settings', 'web', NULL, NULL),
(95, 'manage auth page', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `map_link` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `description`, `type`, `country`, `state`, `city`, `zip_code`, `address`, `map_link`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Al Saleem Tower 2', 'Prime property near nesto supermarket', 'own_property', 'United Arab Emirates', 'Dubai', 'Dubai', '000000', 'Al saleem tower 2, Al nahda 1', NULL, 2, 1, '2025-03-04 18:41:54', '2025-03-04 18:41:54'),
(3, 'Helix', 'Test', 'own_property', 'India', 'Rajasthan', 'Jaipur', '302001', 'Near Hawa mahal', NULL, 7, 1, '2025-03-10 09:51:07', '2025-03-10 09:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `image`, `type`, `created_at`, `updated_at`) VALUES
(1, 2, 'confirm_otp_1741600220.png', 'thumbnail', '2025-03-10 09:50:20', '2025-03-10 09:50:20'),
(2, 2, 'confirm_otp_1741600220.png', 'extra', '2025-03-10 09:50:20', '2025-03-10 09:50:20'),
(3, 2, 'empty_cart_1741600220.png', 'extra', '2025-03-10 09:50:20', '2025-03-10 09:50:20'),
(4, 2, 'whatsapp_1741600220.png', 'extra', '2025-03-10 09:50:20', '2025-03-10 09:50:20'),
(5, 3, 'confirm_otp_1741600267.png', 'thumbnail', '2025-03-10 09:51:07', '2025-03-10 09:51:07'),
(6, 3, 'confirm_otp_1741600267.png', 'extra', '2025-03-10 09:51:07', '2025-03-10 09:51:07'),
(7, 3, 'empty_cart_1741600267.png', 'extra', '2025-03-10 09:51:07', '2025-03-10 09:51:07'),
(8, 3, 'whatsapp_1741600267.png', 'extra', '2025-03-10 09:51:07', '2025-03-10 09:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `property_units`
--

CREATE TABLE `property_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `bedroom` int(11) NOT NULL DEFAULT 0,
  `property_id` int(11) NOT NULL DEFAULT 0,
  `baths` int(11) NOT NULL DEFAULT 0,
  `kitchen` int(11) NOT NULL DEFAULT 0,
  `rent` double(8,2) NOT NULL DEFAULT 0.00,
  `deposit_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `deposit_type` varchar(191) DEFAULT NULL,
  `late_fee_type` varchar(191) DEFAULT NULL,
  `late_fee_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `incident_receipt_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `rent_type` varchar(191) NOT NULL DEFAULT '0',
  `rent_duration` int(11) NOT NULL DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `payment_due_date` date DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_units`
--

INSERT INTO `property_units` (`id`, `name`, `bedroom`, `property_id`, `baths`, `kitchen`, `rent`, `deposit_amount`, `deposit_type`, `late_fee_type`, `late_fee_amount`, `incident_receipt_amount`, `rent_type`, `rent_duration`, `start_date`, `end_date`, `payment_due_date`, `parent_id`, `notes`, `created_at`, `updated_at`) VALUES
(1, '101', 2, 1, 2, 1, 48000.00, 2500.00, 'fixed', 'fixed', 100.00, 122.00, 'yearly', 3, NULL, NULL, NULL, 2, 'Note', '2025-03-04 18:43:41', '2025-03-04 18:43:41'),
(2, 'Helix', 12, 3, 12, 1, 12.00, 20000.00, 'lease_property', 'own_property', 1000.00, 1200.00, 'monthly', 30, NULL, NULL, NULL, 7, 'sdfsdf sdf s dfsd f', '2025-03-10 09:51:07', '2025-03-10 09:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'web', 0, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(2, 'owner', 'web', 1, '2025-03-03 07:24:21', '2025-03-03 07:24:21'),
(3, 'manager', 'web', 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(4, 'tenant', 'web', 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(5, 'maintainer', 'web', 2, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(6, 'HR', 'web', 2, '2025-03-04 18:35:07', '2025-03-04 18:35:07'),
(7, 'tenant', 'web', 7, '2025-03-07 10:24:59', '2025-03-07 10:24:59'),
(8, 'maintainer', 'web', 7, '2025-03-07 10:25:00', '2025-03-07 10:25:00'),
(9, 'Manager', 'web', 7, '2025-03-10 09:17:58', '2025-03-10 09:17:58'),
(10, 'tenant', 'web', 11, '2025-03-10 18:27:16', '2025-03-10 18:27:16'),
(11, 'maintainer', 'web', 11, '2025-03-10 18:27:16', '2025-03-10 18:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 6),
(1, 8),
(1, 9),
(2, 1),
(2, 2),
(2, 3),
(2, 6),
(2, 8),
(2, 9),
(3, 1),
(3, 2),
(3, 3),
(3, 6),
(3, 8),
(3, 9),
(4, 1),
(4, 2),
(4, 3),
(4, 6),
(4, 8),
(4, 9),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 7),
(11, 8),
(11, 9),
(11, 10),
(11, 11),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 7),
(12, 8),
(12, 9),
(12, 10),
(12, 11),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 7),
(13, 8),
(13, 9),
(13, 10),
(13, 11),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 5),
(14, 7),
(14, 8),
(14, 9),
(14, 10),
(14, 11),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(15, 5),
(15, 7),
(15, 8),
(15, 9),
(15, 10),
(15, 11),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(16, 5),
(16, 7),
(16, 8),
(16, 9),
(16, 10),
(16, 11),
(17, 2),
(17, 8),
(17, 9),
(18, 2),
(18, 8),
(18, 9),
(19, 1),
(19, 2),
(20, 1),
(21, 1),
(22, 1),
(23, 2),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(30, 2),
(30, 8),
(30, 9),
(31, 1),
(31, 2),
(31, 9),
(32, 1),
(32, 2),
(32, 9),
(33, 1),
(33, 2),
(33, 9),
(34, 2),
(34, 9),
(35, 1),
(35, 2),
(35, 9),
(36, 1),
(36, 2),
(36, 9),
(37, 1),
(38, 1),
(39, 2),
(39, 3),
(39, 8),
(39, 9),
(40, 2),
(40, 3),
(40, 8),
(40, 9),
(41, 2),
(41, 3),
(41, 8),
(41, 9),
(42, 2),
(42, 3),
(42, 8),
(42, 9),
(43, 2),
(43, 3),
(43, 8),
(43, 9),
(44, 2),
(44, 3),
(44, 8),
(44, 9),
(45, 2),
(45, 3),
(45, 8),
(45, 9),
(46, 2),
(46, 3),
(46, 8),
(46, 9),
(47, 2),
(47, 3),
(47, 8),
(47, 9),
(48, 2),
(48, 3),
(48, 8),
(48, 9),
(49, 2),
(49, 3),
(49, 8),
(49, 9),
(50, 2),
(50, 3),
(50, 8),
(50, 9),
(51, 2),
(51, 3),
(51, 8),
(51, 9),
(52, 2),
(52, 3),
(52, 8),
(52, 9),
(53, 2),
(53, 3),
(53, 4),
(53, 7),
(53, 8),
(53, 9),
(53, 10),
(54, 2),
(54, 3),
(54, 8),
(54, 9),
(55, 2),
(55, 3),
(55, 8),
(55, 9),
(56, 2),
(56, 3),
(56, 8),
(56, 9),
(57, 2),
(57, 3),
(57, 4),
(57, 7),
(57, 8),
(57, 9),
(57, 10),
(58, 2),
(58, 3),
(58, 8),
(58, 9),
(59, 2),
(59, 3),
(59, 8),
(59, 9),
(60, 2),
(60, 3),
(60, 8),
(60, 9),
(61, 2),
(61, 3),
(61, 8),
(61, 9),
(62, 2),
(62, 3),
(62, 4),
(62, 5),
(62, 7),
(62, 8),
(62, 9),
(62, 10),
(62, 11),
(63, 2),
(63, 3),
(63, 4),
(63, 7),
(63, 8),
(63, 9),
(63, 10),
(64, 2),
(64, 3),
(64, 4),
(64, 7),
(64, 8),
(64, 9),
(64, 10),
(65, 2),
(65, 3),
(65, 4),
(65, 7),
(65, 8),
(65, 9),
(65, 10),
(66, 2),
(66, 3),
(66, 4),
(66, 5),
(66, 7),
(66, 8),
(66, 9),
(66, 10),
(66, 11),
(67, 2),
(67, 3),
(67, 8),
(67, 9),
(68, 2),
(68, 3),
(68, 4),
(68, 7),
(68, 8),
(68, 9),
(68, 10),
(69, 2),
(69, 3),
(69, 8),
(69, 9),
(70, 2),
(70, 3),
(70, 8),
(70, 9),
(71, 2),
(71, 3),
(71, 8),
(71, 9),
(72, 2),
(72, 3),
(72, 8),
(72, 9),
(73, 2),
(73, 3),
(73, 8),
(73, 9),
(74, 2),
(74, 3),
(74, 8),
(74, 9),
(75, 2),
(75, 3),
(75, 8),
(75, 9),
(76, 2),
(76, 3),
(76, 8),
(76, 9),
(77, 2),
(77, 3),
(77, 8),
(77, 9),
(78, 2),
(78, 3),
(78, 8),
(78, 9),
(79, 2),
(80, 2),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(94, 2),
(94, 3),
(94, 9),
(95, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `type`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'bank_transfer_payment', 'on', 'payment', 1, NULL, NULL),
(2, 'bank_name', 'Bank of America', 'payment', 1, NULL, NULL),
(3, 'bank_holder_name', 'SmartWeb Infotech', 'payment', 1, NULL, NULL),
(4, 'bank_account_number', '4242 4242 4242 4242', 'payment', 1, NULL, NULL),
(5, 'bank_ifsc_code', 'BOA45678', 'payment', 1, NULL, NULL),
(6, 'bank_other_details', '', 'payment', 1, NULL, NULL),
(7, 'theme_mode', 'light', 'common', 2, NULL, NULL),
(8, 'layout_font', 'Inter', 'common', 2, NULL, NULL),
(9, 'accent_color', 'preset-3', 'common', 2, NULL, NULL),
(10, 'sidebar_caption', 'true', 'common', 2, NULL, NULL),
(11, 'theme_layout', 'ltr', 'common', 2, NULL, NULL),
(12, 'layout_width', 'false', 'common', 2, NULL, NULL),
(19, 'CURRENCY', 'AED', 'payment', 2, NULL, NULL),
(20, 'CURRENCY_SYMBOL', 'AED', 'payment', 2, NULL, NULL),
(21, 'bank_transfer_payment', 'on', 'payment', 2, NULL, NULL),
(22, 'STRIPE_PAYMENT', 'on', 'payment', 2, NULL, NULL),
(23, 'paypal_payment', 'off', 'payment', 2, NULL, NULL),
(25, 'bank_name', '123123', 'payment', 2, NULL, NULL),
(26, 'bank_holder_name', '123123', 'payment', 2, NULL, NULL),
(27, 'bank_account_number', '123123', 'payment', 2, NULL, NULL),
(28, 'bank_ifsc_code', '123123', 'payment', 2, NULL, NULL),
(29, 'bank_other_details', '123123', 'payment', 2, NULL, NULL),
(42, 'STRIPE_KEY', '213213123123123123123', 'payment', 2, NULL, NULL),
(43, 'STRIPE_SECRET', '3123213123123123132', 'payment', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `package_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `interval` varchar(191) DEFAULT NULL,
  `user_limit` int(11) DEFAULT NULL,
  `property_limit` int(11) DEFAULT NULL,
  `tenant_limit` int(11) DEFAULT NULL,
  `enabled_logged_history` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `package_amount`, `interval`, `user_limit`, `property_limit`, `tenant_limit`, `enabled_logged_history`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 0.00, 'Unlimited', 10, 10, 10, 1, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(2, 'Test', 10000.00, 'Monthly', 200, 200, 2000, 1, '2025-03-07 10:50:59', '2025-03-07 10:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `family_member` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `property` int(11) NOT NULL DEFAULT 0,
  `unit` int(11) NOT NULL DEFAULT 0,
  `lease_start_date` date DEFAULT NULL,
  `lease_end_date` date DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `user_id`, `family_member`, `address`, `country`, `state`, `city`, `zip_code`, `property`, `unit`, `lease_start_date`, `lease_end_date`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 4, 3, 'asdad', '21', '12', '12', '121212', 1, 1, '2025-03-04', '2026-11-04', 2, '2025-03-03 07:24:22', '2025-03-04 18:45:36'),
(2, 10, 5, 'Near Hawa mahal', 'India', 'Rajasthan', 'Jaipur', '302001', 3, 2, '2025-03-07', '2025-06-21', 7, '2025-03-10 18:20:08', '2025-03-10 18:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_documents`
--

CREATE TABLE `tenant_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `property_id` int(11) NOT NULL DEFAULT 0,
  `tenant_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenant_documents`
--

INSERT INTO `tenant_documents` (`id`, `document`, `property_id`, `tenant_id`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'searce_result_1741630808.png', 3, 2, 7, '2025-03-10 18:20:08', '2025-03-10 18:20:08'),
(2, 'splash_logo_1741630808.png', 3, 2, 7, '2025-03-10 18:20:08', '2025-03-10 18:20:08'),
(3, 'whatsapp_1741630808.png', 3, 2, 7, '2025-03-10 18:20:08', '2025-03-10 18:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `title`, `type`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Test Property Maintainer', 'maintainer_type', 7, '2025-03-10 11:37:39', '2025-03-10 11:37:39'),
(2, 'Repairing', 'issue', 7, '2025-03-10 17:31:23', '2025-03-10 17:31:23'),
(3, 'Rent', 'invoice', 7, '2025-03-10 17:42:38', '2025-03-10 17:42:38'),
(4, 'Maintenance', 'expense', 7, '2025-03-10 17:45:22', '2025-03-10 17:45:22'),
(5, 'Rent', 'invoice', 2, '2025-03-12 16:08:35', '2025-03-12 16:08:35'),
(6, 'Maintenance', 'invoice', 2, '2025-03-12 16:08:50', '2025-03-12 16:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `profile` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) DEFAULT NULL,
  `lang` varchar(191) DEFAULT NULL,
  `subscription` int(11) DEFAULT NULL,
  `subscription_expire_date` date DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `email_verification_token` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `twofa_secret` text DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `type`, `profile`, `phone_number`, `lang`, `subscription`, `subscription_expire_date`, `parent_id`, `email_verified_at`, `email_verification_token`, `password`, `twofa_secret`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', NULL, 'superadmin@gmail.com', 'super admin', 'avatar.png', NULL, 'english', NULL, NULL, 0, '2025-03-03 07:24:21', NULL, '$2y$10$drfv4.OOi3w/LNKq11RBvefLYFBeAa1nBpRVdJ/JiQcqWLHKG7u1y', NULL, 1, NULL, '2025-03-03 07:24:21', '2025-03-07 11:24:19'),
(2, 'Owner', NULL, 'owner@gmail.com', 'owner', 'avatar.png', NULL, 'english', 1, NULL, 1, '2025-03-03 07:24:22', NULL, '$2y$10$QwZy5hj9K3Cypvoy390edeDsOOCuQfyHVwIOX7ZixSO1pUec0MaNe', NULL, 1, NULL, '2025-03-03 07:24:22', '2025-03-04 18:33:36'),
(3, 'Manager', NULL, 'manager@gmail.com', 'manager', 'avatar.png', NULL, 'english', 0, NULL, 2, '2025-03-03 07:24:22', NULL, '$2y$10$wUm3Eb9UzNfvqmcXICW9H.gFg21sm5QY05RZYrTLgjczN9gKdyKKy', NULL, 1, NULL, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(4, 'Tenant', 'Surname', 'tenant@gmail.com', 'tenant', 'avatar.png', '12123123', 'english', NULL, NULL, 2, '2025-03-03 07:24:22', NULL, '$2y$10$n/DhkFr68V7.3ZM3AHacmeIDa0WHAUbtL4p3A9ybMlhmSqVoDSMkK', NULL, 1, NULL, '2025-03-03 07:24:22', '2025-03-04 18:45:36'),
(5, 'Maintainer', NULL, 'maintainer@gmail.com', 'maintainer', 'avatar.png', NULL, 'english', NULL, NULL, 2, '2025-03-03 07:24:22', NULL, '$2y$10$eODV6nklHARANWv937SScOZO5o9sT6bELQV2rWJtSDS.Ggk4VLgZ2', NULL, 1, NULL, '2025-03-03 07:24:22', '2025-03-03 07:24:22'),
(6, 'HR', 'role', 'hr@gmail.com', 'HR', 'avatar.png', '0000000000', 'english', NULL, NULL, 2, '2025-03-04 18:36:06', NULL, '$2y$10$2gP8P2Gli0cvOTz4NqWjieYJcHZZJ.7oknyIL6DXCPoWh.TTTAH3.', NULL, 1, NULL, '2025-03-04 18:36:06', '2025-03-04 18:36:06'),
(8, 'test', 'Manager', 'testmanager@gmail.com', 'Manager', 'avatar.png', '123456789', 'english', NULL, NULL, 7, '2025-03-10 09:18:21', NULL, '$2y$10$VAMiG7xhKIhXEa9eZvyH5OV5aGZAzIuV4N8213lV1bO.jK3BNJ0I.', NULL, 1, NULL, '2025-03-10 09:18:21', '2025-03-10 09:18:21'),
(9, 'Test', 'Maintainer', 'testmaintainer@gmail.com', 'maintainer', 'confirm_otp_1741627705.png', '0123451234', 'english', NULL, NULL, 7, '2025-03-10 17:28:25', NULL, '$2y$10$RxB2gIMoRCbnw3lvNBZ2TOgrvO6KpCtRzN/dV9hmRsZKuU1.ibJku', NULL, 1, NULL, '2025-03-10 17:28:25', '2025-03-10 17:28:25'),
(10, 'test', 'tenant', 'testtenant@gmail.com', 'tenant', 'onboarding_two_1741630808.png', '0123456787', 'english', NULL, NULL, 7, '2025-03-10 18:20:08', NULL, '$2y$10$KuiRurf2aKDn8pd2PFfZlO9tYG2Oh2os5TplJFSuEFj4eDDS1TDD6', NULL, 1, NULL, '2025-03-10 18:20:08', '2025-03-10 18:20:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_pages`
--
ALTER TABLE `auth_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_histories`
--
ALTER TABLE `coupon_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_pages`
--
ALTER TABLE `home_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logged_histories`
--
ALTER TABLE `logged_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintainers`
--
ALTER TABLE `maintainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notice_boards`
--
ALTER TABLE `notice_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_transactions`
--
ALTER TABLE `package_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `package_transactions_subscription_transactions_id_unique` (`subscription_transactions_id`);

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
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_units`
--
ALTER TABLE `property_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_parent_id_unique` (`name`,`parent_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_title_unique` (`title`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenant_documents`
--
ALTER TABLE `tenant_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_pages`
--
ALTER TABLE `auth_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupon_histories`
--
ALTER TABLE `coupon_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `home_pages`
--
ALTER TABLE `home_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logged_histories`
--
ALTER TABLE `logged_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `maintainers`
--
ALTER TABLE `maintainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `notice_boards`
--
ALTER TABLE `notice_boards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `package_transactions`
--
ALTER TABLE `package_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `property_units`
--
ALTER TABLE `property_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tenant_documents`
--
ALTER TABLE `tenant_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
