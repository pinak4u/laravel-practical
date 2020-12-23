-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2020 at 11:56 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_practical`
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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_22_113344_create_permission_tables', 1),
(5, '2020_12_22_115540_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 3),
(1, 'App\\User', 5),
(1, 'App\\User', 6),
(1, 'App\\User', 8),
(1, 'App\\User', 9),
(1, 'App\\User', 10),
(1, 'App\\User', 13),
(2, 'App\\User', 1),
(2, 'App\\User', 4),
(2, 'App\\User', 5),
(2, 'App\\User', 7),
(2, 'App\\User', 10),
(2, 'App\\User', 13),
(3, 'App\\User', 1),
(3, 'App\\User', 2),
(3, 'App\\User', 3),
(3, 'App\\User', 4),
(3, 'App\\User', 5),
(3, 'App\\User', 6),
(3, 'App\\User', 7),
(3, 'App\\User', 8),
(3, 'App\\User', 9),
(3, 'App\\User', 13),
(4, 'App\\User', 1),
(4, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 13);

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'post-create', 'web', '2020-12-22 06:52:49', '2020-12-22 06:52:49'),
(2, 'post-view', 'web', '2020-12-22 06:52:55', '2020-12-22 06:52:55'),
(3, 'post-edit', 'web', '2020-12-22 06:53:05', '2020-12-22 06:53:05'),
(4, 'post-delete', 'web', '2020-12-22 06:53:10', '2020-12-22 06:53:10');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `image`, `description`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(31, 'Neque et vel praesentium totam id ut.', 'https://source.unsplash.com/random/640x480', 'Est repellat dolor ab a. Labore recusandae nulla et tenetur. Quas deleniti et rem porro voluptatem. Aut et officiis aperiam eum sunt quibusdam nostrum voluptas. Eaque laborum aut quas nihil aut facere debitis. Aliquam ab omnis qui et. Ex quo omnis numquam vitae maxime deserunt mollitia. Eum repellendus et occaecati quo ab. Possimus omnis enim vel. Et voluptatem voluptas in. Non non molestiae temporibus illo iusto aut sit recusandae.', 10, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(32, 'Ipsum commodi vel ex.', 'https://source.unsplash.com/random/640x480', 'Aspernatur consequuntur ipsam maxime vitae unde. Occaecati alias itaque laborum et. Illo fugit necessitatibus totam qui. Eveniet ut consequuntur incidunt fugiat voluptatibus. Sed aut quos unde quia aut tenetur sit. Dolor rerum labore dolor voluptates maiores ratione. Dolor aut rerum sapiente. Atque facilis porro molestias nemo. Minima magni occaecati veritatis est eligendi. Eaque repudiandae eveniet doloremque unde dolore natus ratione. Et ea eos ipsam aliquam molestias.', 1, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(33, 'Minima mollitia aut esse iusto magni magni.', 'https://source.unsplash.com/random/640x480', 'Nihil possimus quia eius voluptate sunt. Ducimus ut aut dolore eum. Omnis quia quis vitae suscipit. Iusto in rerum reprehenderit id quaerat. Minima quae quia et sunt. Quia qui accusantium expedita non ut. Fugiat est enim voluptatibus voluptas iure aliquam. In consequuntur assumenda ex deserunt ipsam in. Optio ut aut possimus velit quia sunt id. Ut nulla nostrum possimus. Soluta doloremque sint et consequatur. Aut est aut et sint.', 3, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(34, 'Esse facere est atque aliquam est.', 'https://source.unsplash.com/random/640x480', 'Repellat et natus consequatur repellendus. Quia tempora error placeat. Officiis non itaque cumque totam ea veniam. Dolor beatae suscipit rem vel voluptatum. Architecto voluptas modi aperiam et consequatur commodi labore. Temporibus vero voluptates et dignissimos adipisci dolorem ab. Hic magni est nemo distinctio corrupti quidem repellendus. Qui debitis nihil neque beatae vel. Reiciendis ratione et vel odio maiores eum. Quaerat tempora distinctio consectetur molestias vel sed enim vero.', 1, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(35, 'Eaque eum veniam qui ab nihil ut rem maxime.', 'https://source.unsplash.com/random/640x480', 'Et placeat tempora sed error cupiditate dolor aut. At consequuntur libero ratione dolorem. Doloremque ex sit totam quis necessitatibus ea et. Incidunt molestias itaque magnam quibusdam. Consequuntur quo minus vitae odit aut odio rerum. Cupiditate voluptate eius ipsa quo officiis vel. Qui suscipit porro necessitatibus quos pariatur iste deleniti. Quasi consectetur provident voluptate. Omnis eius aut nam sit. Velit minus fugit eum doloribus.', 5, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(36, 'Dolorum et omnis iusto delectus nihil cupiditate rerum ullam.', 'https://source.unsplash.com/random/640x480', 'Magnam sed cupiditate libero voluptas officia debitis sint. Quasi ut id consectetur repellat error aperiam. Praesentium modi rerum aut aliquid numquam dolorem. Deleniti sapiente doloribus est molestias natus. Consequuntur magnam tempora nostrum rerum cumque assumenda recusandae eos. Aliquam perferendis qui vitae omnis. Porro provident dolorem non atque cum sint. Facere praesentium quidem quaerat. Similique incidunt est est et ipsam. Eveniet est assumenda rem tempore nulla doloremque.', 8, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(37, 'Ut labore delectus quod qui repellat.', 'https://source.unsplash.com/random/640x480', 'Debitis minima suscipit dignissimos temporibus saepe. In a deserunt impedit. Voluptatum dolorem et fugiat ipsam voluptatibus. Dolores architecto et vel asperiores sit. Tenetur sequi dolores sed saepe omnis dolores aut rerum. Quia rem dolor aut consectetur. Sunt dolorem molestiae aliquid et libero alias maxime. Cum esse earum voluptatum blanditiis aspernatur. Eum enim distinctio nesciunt.', 9, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(38, 'Animi architecto et qui nihil nesciunt eum non.', 'https://source.unsplash.com/random/640x480', 'Voluptate sed quia ratione occaecati minima eaque. Dignissimos excepturi ad repellendus. Ut vel id libero at aperiam id. Quibusdam sed ad sunt. Veritatis quasi qui veritatis explicabo qui corrupti odio. Veritatis hic facilis eveniet qui ut. Nihil magnam dignissimos ipsam perferendis velit deserunt placeat vel. Beatae dolor sit quia non molestiae. Qui voluptatem officia sed et id. Beatae ut ipsum facilis itaque pariatur consequuntur. Ea quia aspernatur nihil et soluta temporibus.', 10, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(39, 'Aspernatur aliquam dignissimos perspiciatis esse nemo.', 'https://source.unsplash.com/random/640x480', 'Ipsum deleniti ex alias et quod. Asperiores necessitatibus sit distinctio aut. Fuga qui quibusdam illo eveniet blanditiis. At eius laborum voluptate aut vel minima inventore. Quod fuga nesciunt corrupti labore delectus voluptatibus labore. Fuga neque repellat nostrum eveniet. Modi rem et alias pariatur rerum voluptas. Eum doloribus ducimus corporis quasi dolor aut fugiat. Veniam sunt hic non porro rerum et qui. Voluptatem enim neque qui est. Et aut illo eius.', 7, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(40, 'Quod doloribus neque aut in.', 'https://source.unsplash.com/random/640x480', 'Et perspiciatis quia voluptate ut minima sunt qui soluta. Mollitia deleniti et quasi rerum a. Quia et necessitatibus repellat ex eaque dolor eaque. Iusto cum corporis accusamus ut unde vel possimus corporis. Corrupti nobis placeat dolores et voluptas quisquam. Soluta explicabo sit ut et ut quis exercitationem temporibus. Facilis ducimus iusto laborum sed.', 4, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(41, 'Esse ipsa ut commodi.', 'https://source.unsplash.com/random/640x480', 'Rerum dicta voluptate at est vel aut. Id libero voluptatibus laudantium et. Quaerat quidem quia praesentium. Illo dicta iste quaerat sint. Consequatur ea dolorum deserunt dolor quia doloremque consequuntur. Sed quia sint nam qui. Vero occaecati dolorem et sed sit est. Enim sed rerum tempora est est id. Expedita maxime nemo omnis et. Omnis voluptatem ut corporis vel error sed. Dolor omnis facere ut voluptas. Maiores qui molestiae officia quidem non nihil vitae.', 5, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(42, 'Est alias rerum ut soluta saepe.', 'https://source.unsplash.com/random/640x480', 'Deserunt dolores molestiae quo enim aut doloribus. Facere vitae repellendus eveniet omnis laudantium quis. Autem occaecati reprehenderit sit. Odit totam autem eius ut sapiente error nobis. Fugiat quia dolor modi itaque. Doloribus eum animi enim aut sapiente. Magnam adipisci accusamus consequatur esse quo quod aut quos. Distinctio dolorem quas explicabo vero aut incidunt.', 3, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(43, 'Voluptas qui velit id atque.', 'https://source.unsplash.com/random/640x480', 'Ea sit error sapiente quia. Ut itaque commodi quia cupiditate et eius. Qui voluptatem iusto earum id qui et. Porro et expedita sit debitis facere molestiae. Cum quam dolor et. Voluptates voluptas velit mollitia mollitia dolorem nostrum. Voluptatibus et asperiores iusto dolorem. Sit voluptatibus omnis beatae aperiam. Ea fugiat voluptas minus omnis non enim.', 5, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(44, 'Debitis repudiandae perspiciatis qui et quisquam.', 'https://source.unsplash.com/random/640x480', 'Dicta culpa molestiae tenetur. Eos dolorem dolor reiciendis deleniti. Pariatur eum mollitia qui omnis sed. Atque doloremque eius magni nostrum voluptatem qui reiciendis. Suscipit sunt officiis quidem error fugiat eligendi. Est officiis dolores occaecati possimus esse rerum est. Autem beatae qui molestiae illum nulla. Recusandae labore dolor nobis repudiandae ut sint.', 8, NULL, '2020-12-22 15:51:08', '2020-12-22 15:51:08'),
(45, 'Exercitationem qui at magnam veniam eos.', 'https://source.unsplash.com/random/640x480', 'Veritatis quisquam blanditiis dolor iste impedit. Repudiandae similique tenetur sapiente dolor nulla et non. Recusandae recusandae impedit aut rerum quisquam vero. Et delectus dolore modi amet. Aspernatur error possimus enim ea. Ut porro quia rerum.', 5, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(46, 'Et illum aliquid consequatur velit asperiores.', 'https://source.unsplash.com/random/640x480', 'Impedit vero illum cumque aperiam sed. Nesciunt nisi sit aperiam qui recusandae error nemo. Alias debitis eius ratione quia. Architecto veritatis inventore enim et autem qui molestias. Aliquam itaque eligendi nulla dolor enim. Quam explicabo quisquam aut facere aut. Nemo aperiam voluptatum harum eos laboriosam quam optio. Rerum culpa doloribus et et praesentium a. Sint provident alias repudiandae.', 3, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(47, 'Odio illum aut voluptatibus ut quos sed velit.', 'https://source.unsplash.com/random/640x480', 'Deleniti aut velit nesciunt mollitia nihil distinctio non veniam. Rerum ducimus laudantium dolorem ab at. Rerum non non est omnis eius et. Cum alias est quasi incidunt cumque similique. Non et non enim architecto sequi totam. Ut nobis dolor voluptatem. Qui qui iste corrupti inventore eos ipsam. Et perspiciatis autem quos nihil laudantium quia tempore eos. Fugit ea sit et ex dolorem natus accusamus.', 8, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(48, 'Officia eligendi earum sit et nam nihil ea velit.', 'https://source.unsplash.com/random/640x480', 'Distinctio ut maxime unde in accusamus eos. Voluptatibus optio nemo id tenetur rerum harum. Aperiam dolore quam inventore incidunt. Iste non itaque quas non quia doloribus molestiae suscipit. Consequatur maxime natus voluptas cumque a. Aliquid et nihil sint maxime non. Quia ab quia quis. Itaque omnis deleniti quaerat tempore numquam non. Repellat eos ullam et est quia.', 3, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(49, 'Dicta qui odit a delectus quia et distinctio.', 'https://source.unsplash.com/random/640x480', 'Quos non fugiat ut tenetur nobis. Voluptatem corrupti et voluptatem iusto facilis tenetur earum. Quam laudantium voluptatem quia at natus. Soluta ut repudiandae illo incidunt perspiciatis. Voluptas odio et vitae qui. Autem natus ea aperiam asperiores maiores repudiandae ut. Voluptatem asperiores quis aliquid in sed veniam. Voluptatibus odit ullam fugit illum.', 8, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(50, 'Nobis quo sed possimus sed provident ut.', 'https://source.unsplash.com/random/640x480', 'Sed ipsam consequatur voluptatem qui. Dolor nihil commodi quo. Et aut quia laudantium harum. Ut est sit sint. Velit delectus ut eum laborum. Magni molestiae aut veritatis dignissimos ducimus. Provident a deserunt provident qui necessitatibus. Veritatis dolor aliquam et earum. Accusantium nostrum sint aliquid fugit.', 3, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(51, 'Nemo eaque tenetur corrupti eum est ut.', 'https://source.unsplash.com/random/640x480', 'Qui dolorem ea quod magnam iure. Ratione similique recusandae sed sint aut. Quasi cumque ipsam libero officia et modi cumque. Ratione molestiae quia similique neque voluptatem. Doloremque labore eveniet aut esse facilis earum. Ab cupiditate optio nulla voluptas consequatur. Excepturi est saepe fugiat cupiditate dicta sint. Voluptas veniam eos a enim possimus veritatis. Officia quia reiciendis corporis animi et repudiandae voluptatem. Voluptate minus quae maiores unde iusto in.', 10, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(52, 'Quia dolor quae inventore.', 'post/image/quia_dolor_quae_inventore.png', 'Similique et nihil eum quia illo atque et. Aut animi suscipit sunt error itaque omnis. Nulla veniam aut ducimus minima ut id culpa. Adipisci tempora aut ut dolore atque sapiente. Omnis non quidem amet explicabo molestias illo odit. Adipisci voluptate et fuga veniam. Voluptatem porro eius corrupti neque. Reiciendis consequatur rerum mollitia provident ipsa voluptatibus in.', 6, NULL, '2020-12-22 15:51:09', '2020-12-22 17:25:30'),
(53, 'Iste et non vitae iste impedit.', 'https://source.unsplash.com/random/640x480', 'Eos et non iusto tenetur id facere. Qui consequatur neque et laboriosam aut qui nobis neque. Ipsa id autem aut velit tempora. Sit et molestiae ratione ducimus et aut numquam. Optio recusandae enim autem veritatis tempore laboriosam. Asperiores occaecati libero et voluptas perferendis sed adipisci. Ipsum sed tempore est voluptatem quasi.', 5, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(54, 'Nihil iusto magnam mollitia reprehenderit.', 'https://source.unsplash.com/random/640x480', 'Id autem consequatur in eveniet. Voluptas ea a voluptas enim aut fuga sit. Fuga enim consectetur atque voluptatem debitis veniam voluptas. Numquam hic reprehenderit dolores rerum voluptatem. Vel qui doloremque veritatis iusto enim illo. Sit modi voluptatem nihil. Minima eos omnis magni et vitae et dicta. Dolor eaque autem quod rerum fuga nostrum dicta. Sapiente officiis vel aut consequatur. Quis porro fuga ratione praesentium.', 4, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(55, 'Suscipit excepturi et fuga odit.', 'https://source.unsplash.com/random/640x480', 'Quia autem et neque. Voluptate quia itaque praesentium quia. Sit nulla expedita voluptas voluptas possimus. Qui nesciunt fuga et voluptate. Deserunt tempora dolores nulla minima modi est. Recusandae est nihil natus. Ut non soluta possimus expedita in quas. Hic aut ut quia veniam cumque distinctio totam. Iure quas ut dicta culpa natus dolorem nulla. Dolor deleniti omnis et iste tempora tenetur blanditiis.', 2, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(56, 'Error enim ut voluptates tempore atque voluptatem voluptatum eum.', 'https://source.unsplash.com/random/640x480', 'Et provident perspiciatis iste accusantium eius at. Eaque unde debitis possimus. Enim iusto aut debitis earum ipsum vitae et. Ab nostrum nihil iste ullam. Et non odit eum nam labore ab. Nulla quidem sequi itaque. Et facilis voluptates voluptatibus laudantium temporibus quis dignissimos. Nam sunt nobis ducimus aliquam qui magni non iusto. Qui dolorem cupiditate aspernatur ut. Animi pariatur reprehenderit autem voluptate. Dicta qui vitae expedita placeat deleniti sit.', 10, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(57, 'Facilis est magnam tenetur accusantium.', 'https://source.unsplash.com/random/640x480', 'Quis culpa asperiores quasi iusto. Optio perferendis ipsa assumenda necessitatibus tenetur adipisci et. Modi est qui deleniti provident. Minus quibusdam ut ducimus et a autem. Optio ducimus qui iusto fugiat dignissimos in. Autem mollitia ut ullam dolores eum qui corporis. Cum aliquam nihil incidunt. Culpa autem veritatis reprehenderit vitae. Qui deserunt hic vel. Asperiores quidem quidem odit est laudantium voluptatibus atque beatae.', 7, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(58, 'Recusandae possimus eos explicabo aut voluptatem architecto corporis.', 'https://source.unsplash.com/random/640x480', 'Id harum aperiam omnis eius. Enim exercitationem fugit dignissimos molestiae ea hic non et. Eligendi officiis ipsum voluptas vel. Officia est aut et est non aspernatur veritatis. Nisi aperiam est harum. Dolor eum aut at deleniti vero ad. Recusandae voluptas numquam maxime quidem ad aperiam eveniet. Porro adipisci accusamus consectetur voluptatem. Ipsum ab qui et ipsum nobis blanditiis sed. Quam cupiditate quos debitis id. Ipsa doloremque tempore quam mollitia consequuntur harum voluptas.', 2, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(59, 'Rem aspernatur ex quia earum in sequi quo.', 'https://source.unsplash.com/random/640x480', 'Ad a temporibus quia dolores quasi neque esse. Temporibus qui quis quia non sed voluptates. Officiis non itaque et omnis cum iure laboriosam. Voluptatibus dolores sequi laboriosam est provident mollitia. Voluptatem consequatur deleniti est ipsum iusto. Culpa autem dolores magnam doloribus. Voluptas deleniti vel fugit voluptas et illum. Inventore veniam necessitatibus quaerat cumque. Omnis rerum veniam quia ut esse ipsum. Quis cumque eaque error sed corporis laborum et.', 9, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(60, 'Ea accusantium sit reprehenderit in autem et.', 'https://source.unsplash.com/random/640x480', 'Aut aut blanditiis aut. Itaque beatae natus sapiente et corporis labore. Velit eligendi laboriosam consequatur dolorem iure et et. Non assumenda enim quibusdam nemo. Quae deserunt qui error debitis explicabo aut ut ipsam. Fugiat asperiores aut omnis aut. Libero accusantium asperiores et. Minima occaecati voluptas quibusdam quo ut quia veniam. Enim blanditiis et officiis voluptatem ipsum. Natus cumque et fugiat sed. Esse sed quibusdam voluptatem. Veritatis et aut accusamus fugiat voluptatum.', 1, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(61, 'Voluptatem dolores ratione voluptatem delectus veniam doloremque qui.', 'https://source.unsplash.com/random/640x480', 'Tempora quia dolor porro id. Nobis voluptate ab delectus reiciendis quia temporibus aut enim. Mollitia sit impedit sit omnis atque quae. Eum at nesciunt vel inventore rerum possimus ad qui. Et modi sed quaerat nulla ex aspernatur sit. Veritatis eligendi omnis minus sequi qui corporis omnis. Veniam iusto impedit recusandae harum.', 3, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(62, 'Aspernatur iste sunt quibusdam ut cum.', 'https://source.unsplash.com/random/640x480', 'Impedit nisi iure tempora autem velit enim. Fugiat quis sunt ratione molestiae quaerat. Officiis accusamus explicabo est qui ex labore. Vel aspernatur eos voluptatum explicabo eum quibusdam. Autem aut corrupti eius quis quo. Asperiores reiciendis minima tempora recusandae consequuntur sapiente. Non sed voluptatibus alias officiis maiores sunt voluptas. Nihil impedit consequatur eaque necessitatibus. Corporis autem blanditiis quis ea.', 2, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(63, 'Ut odio quia dicta odit.', 'https://source.unsplash.com/random/640x480', 'Pariatur quaerat sint ullam alias explicabo officiis quis. Voluptas mollitia dicta aut libero culpa aut. Enim consequatur sapiente ut quae mollitia asperiores eos. Reiciendis ab fuga aut quod voluptatem quaerat ipsa. Illum nemo sed vero accusantium et aut ut. Expedita rerum et rerum ad. Sit autem consequatur commodi. Non enim aut est et qui inventore quos nihil.', 1, NULL, '2020-12-22 15:51:09', '2020-12-22 15:51:09'),
(64, 'Facere incidunt ut error quod mollitia quia.', 'https://source.unsplash.com/random/640x480', 'Accusantium corporis officiis quos sequi fuga. Reprehenderit minus cum voluptatem doloribus voluptatum porro. Numquam itaque dolores recusandae. Ducimus quae natus deserunt architecto quaerat non. Eos non et et eligendi. Eum est voluptatibus illum et velit harum. Sint similique officiis ex ratione tempore qui qui. Quo libero molestiae ut magni qui. Voluptate velit distinctio fugit laboriosam eaque maxime. Excepturi porro cum at ipsum aut maiores consequatur. A est assumenda non.', 9, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(65, 'Numquam vitae cumque repellat pariatur modi nisi.', 'https://source.unsplash.com/random/640x480', 'Modi repellendus facilis officia non nesciunt. Vero sit maiores rerum consectetur itaque consequatur. Sunt provident voluptatem atque tempora ratione autem. Earum ratione saepe rem debitis sint. Qui quidem architecto voluptatem aut ullam dicta. Enim quia voluptates sit et. Odit sit animi distinctio sed adipisci aut ab. Minus nemo hic est velit earum. Et incidunt beatae nihil qui dolorem ipsa ut repellat. Architecto eveniet eaque rerum qui. Voluptas enim exercitationem iste voluptatem voluptas.', 8, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(67, 'Sed sint commodi sed consequatur sit qui.', 'https://source.unsplash.com/random/640x480', 'Nulla rerum quaerat eveniet aut. Unde suscipit saepe est quo eligendi non. Quisquam cum qui repudiandae id. Architecto voluptatem dolores culpa non quaerat. Qui consequatur numquam laudantium. Accusantium nisi dolores eligendi pariatur. Placeat veritatis in inventore ut officiis aut provident. Soluta est voluptatem unde quia animi dolor. Odit quaerat magnam quia. Ab eos incidunt aut dolorem.', 10, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(68, 'Quidem ut ipsa consectetur provident nobis excepturi.', 'https://source.unsplash.com/random/640x480', 'Quas expedita nihil sed quisquam debitis commodi quo. Necessitatibus nam laudantium quia nemo at sint dolor. Omnis quae molestiae beatae ut adipisci. Quas enim quo est voluptatem voluptate et magni. Dolores et nemo quia repudiandae cumque. Est qui nulla dolorem dolor expedita optio eum. Officiis qui delectus officiis officiis ut. Deleniti voluptatem fugiat expedita vero id necessitatibus. Pariatur totam est nihil facere laborum.', 7, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(69, 'Nulla nobis atque recusandae et labore.', 'https://source.unsplash.com/random/640x480', 'Earum porro dolorem nobis cum ut aut. Nisi quisquam aliquam enim quibusdam quis architecto tempora eligendi. Et pariatur accusamus sint reiciendis. Impedit optio culpa mollitia quis soluta alias. Laborum nihil qui saepe dolor soluta et sit doloremque. Ut veritatis odit necessitatibus non enim dolorum vero. Itaque dolor deserunt alias.', 7, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(70, 'Temporibus animi dicta qui est quas et dolorum natus.', 'https://source.unsplash.com/random/640x480', 'Hic assumenda qui alias nam delectus. Soluta aut aut voluptatem dolor cum. Exercitationem quisquam quia corrupti maiores. Voluptatibus rerum voluptas quae ad asperiores iusto. Aut hic recusandae omnis corrupti enim reprehenderit molestiae. Natus assumenda optio quasi est commodi tempora perspiciatis enim. Possimus corporis assumenda magnam sed quibusdam quod nostrum. Ab recusandae sit voluptatem et nisi.', 4, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(71, 'Neque aut at et amet.', 'https://source.unsplash.com/random/640x480', 'Quia quo non nemo maxime ut ad quod consequatur. Velit id eos debitis iure assumenda quos. Minima debitis rerum et autem cum earum voluptatem. Voluptas officia aut beatae et. At laboriosam quos sunt. Dolorem esse neque laborum corporis natus possimus. Dolor architecto quas rerum nesciunt vitae deserunt quas. Minus voluptas et est perferendis.', 8, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(72, 'Ex provident tempore incidunt aut amet.', 'https://source.unsplash.com/random/640x480', 'Eum aut dolorem ex maxime. Rerum illo consequuntur eveniet aliquam aut tempora. Nulla excepturi incidunt similique maiores. Molestias maiores beatae excepturi tenetur soluta. Eos tempore dolores eveniet expedita. Dolore et placeat deserunt nisi exercitationem. Cum soluta maxime consectetur accusantium aut ullam deleniti occaecati. Temporibus dolor molestiae qui nam. Sit aut facere tenetur et.', 5, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(73, 'Voluptas magni cum ut ut eius.', 'https://source.unsplash.com/random/640x480', 'Quia quia repellat placeat consequatur enim ducimus dolorem. Expedita assumenda voluptas et quaerat aliquid eius. Alias non iusto quis assumenda. Iusto rem neque hic consectetur cupiditate. Eius quis cupiditate repellat quasi iusto consequuntur. Velit quasi totam error esse eos tempore. Et a labore voluptas est iusto libero incidunt ratione.', 2, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(74, 'Nihil doloremque laudantium perspiciatis dicta dolor.', 'https://source.unsplash.com/random/640x480', 'Eos nulla dolores nisi illo est dolor enim. Aut aut repellendus molestias ea. Ut non eaque est nam sunt. Magnam earum illo distinctio. Dignissimos alias cupiditate neque nostrum rerum quis sequi. Rerum dicta placeat enim quo labore quia accusamus. Exercitationem vitae aut tempora sit modi quas. Id voluptatibus harum officiis. Ut quaerat quo quisquam sed dolores recusandae. Autem est in soluta tempore provident laudantium voluptas.', 2, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(75, 'Voluptatibus sint alias qui recusandae fugit.', 'https://source.unsplash.com/random/640x480', 'Explicabo pariatur unde ut tempore pariatur et aperiam. Quae nisi et quisquam saepe amet optio provident. Qui maiores dignissimos et molestias. Iure aut vitae provident sit veritatis quia. Itaque quisquam quis veniam ab. Quia consequatur occaecati ducimus labore sint. Occaecati ipsam culpa hic expedita blanditiis commodi voluptatem magni. Veniam quia officiis debitis. Voluptatem explicabo excepturi dolores occaecati deserunt.', 3, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(76, 'Perspiciatis aut delectus ratione ad suscipit mollitia.', 'https://source.unsplash.com/random/640x480', 'Pariatur inventore voluptas maxime ut dolores sint. Labore porro facilis voluptas tenetur sed. Esse ut voluptas in vel. Consectetur suscipit odio ut eaque aut quos odio. Omnis dignissimos necessitatibus amet nihil distinctio enim. Nulla sequi et corrupti explicabo in suscipit. Est commodi exercitationem vel dignissimos reprehenderit fuga. Aut nobis qui dolor. Laboriosam culpa sed culpa dolor provident.', 9, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(77, 'Expedita exercitationem officia incidunt facilis ad ad.', 'https://source.unsplash.com/random/640x480', 'Dolorem minima quam optio necessitatibus facilis cum ut. Repellat tempora quia voluptatem a ad. Quas maiores ratione deserunt praesentium odit officiis voluptatem. Rerum sint aut quia est. Nemo nisi doloremque consequuntur voluptate id quis. In aliquid et aliquid dolore maiores repellendus. Eos ab est quis consequatur. Et qui odio illum rerum est natus doloremque.', 2, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(78, 'Inventore labore possimus earum vel dolorum id praesentium laboriosam.', 'https://source.unsplash.com/random/640x480', 'Sunt nostrum porro ut unde occaecati vitae ut. Et porro voluptatem et esse eveniet repellat quo. Et officia fugit sint aut consequuntur. Ullam vel non voluptate asperiores dolorum modi magnam. Nesciunt fugiat nisi vero quam nostrum cum laboriosam. Aut ipsum non sint doloribus. Ea veritatis optio eligendi non temporibus vitae. Deleniti pariatur quod et sapiente excepturi.', 9, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(79, 'Dolor cum ex illum natus magnam saepe eum laudantium.', 'https://source.unsplash.com/random/640x480', 'Ut dicta fugiat distinctio quisquam in ducimus. Dolor explicabo ea vel dolor consequatur accusantium. Aspernatur nihil tempora blanditiis aut velit totam. Officiis ratione assumenda quia saepe. Consequatur animi consequuntur dolore earum. Qui dolor omnis cumque provident ullam qui magnam sed. Ea aut beatae pariatur molestias alias voluptas saepe. Voluptate natus ea soluta incidunt. Ut rerum ipsam ullam earum autem non.', 5, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(80, 'Mollitia nostrum quisquam magni et magni sed.', 'https://source.unsplash.com/random/640x480', 'Consequatur labore nisi rem ipsa dolores dignissimos fugiat ex. Similique voluptas nesciunt accusantium itaque. Et porro minus tempora corporis voluptatibus voluptatem aut. At temporibus et blanditiis quo quia accusamus sapiente. Ea veniam cumque est sint et aut. Iusto nostrum suscipit molestias ab. Ut alias sapiente alias sed ab. Incidunt dignissimos voluptates odio sit quos in. Quidem est tenetur et. Repellendus sequi et consequatur laudantium harum.', 8, NULL, '2020-12-22 15:51:10', '2020-12-22 15:51:10'),
(81, 'New Post for Testing', 'post/image/new_post_for_testing.jpg', 'Testing text for Post Creation', 6, NULL, '2020-12-22 17:47:52', '2020-12-22 17:47:52');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2020-12-22 08:49:06', '2020-12-22 08:49:06'),
(2, 'User', 'web', '2020-12-22 08:49:32', '2020-12-22 08:49:32');

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
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `gender`, `profile_picture`, `status`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Eleanora Altenwerth I', 'admin@admin.com', '2020-12-22 06:47:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', 'https://source.unsplash.com/random/150x150', 'active', NULL, 'N4ALlISYqylsj9ao8cM5T6lGFosB3eypBCBzEsUDqOuhO0cbpNYLF8sNPMZJ', '2020-12-22 06:47:20', '2020-12-23 01:48:49'),
(2, 'Mckenzie Nolan', 'xlindgren@example.com', '2020-12-22 06:47:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', 'user/profile/mckenzie_nolan.png', 'active', '2020-12-23 01:54:39', 'nncNEeGFnbIoMZntt6ZjhPoH208IbCgH0IMCSaYG1tTz1041TJA9Va2GBCE2', '2020-12-22 06:47:20', '2020-12-23 01:54:39'),
(3, 'Otto Fay II', 'mohr.leonora@example.net', '2020-12-22 06:47:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', 'https://source.unsplash.com/random/150x150', 'active', NULL, 'tSARQbZnEnF6pXOCUFM4a5PPbQBvuxUzjCTIsR93fvVA5bg3CZUfhrwIlo5k', '2020-12-22 06:47:21', '2020-12-23 01:40:54'),
(4, 'Brain Dooley', 'ayla.kuvalis@example.com', '2020-12-22 06:47:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', 'https://source.unsplash.com/random/150x150', 'active', NULL, 'sZQSyj4yII', '2020-12-22 06:47:21', '2020-12-23 01:34:12'),
(5, 'Bernardo Gorczany', 'hbauch@example.org', '2020-12-22 06:47:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', 'https://source.unsplash.com/random/150x150', 'active', NULL, 'FPlXaADZMmTJkQeEKhvWNgmjWGgT4VaoUnYZgswYHn1BGYTTYPEuETHGwYkq', '2020-12-22 06:47:21', '2020-12-23 01:34:36'),
(6, 'Gloria Purdy Third', 'reina07@example.com', '2020-12-22 06:47:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', 'user/profile/gloria_purdy_third.jpg', 'active', NULL, 'ABwih91eGXftTvnxm4sdQ8ruAZTEAm8V8s05c7nieWy7ha1B8NbexhfcOGZA', '2020-12-22 06:47:21', '2020-12-22 14:59:57'),
(7, 'Providenci Ferry', 'marquardt.helena@example.net', '2020-12-22 06:47:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', 'https://source.unsplash.com/random/150x150', 'active', NULL, 'pkb8Y4Z26S', '2020-12-22 06:47:21', '2020-12-22 06:47:21'),
(8, 'Prof. Laisha Bode', 'merlin42@example.net', '2020-12-22 06:47:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', 'https://source.unsplash.com/random/150x150', 'active', NULL, 'PQGwKOPKki02PSibhVRTNLVWOT9Ea7WSWw22jr83Zz3zu8p00xIk1ozMSGjZ', '2020-12-22 06:47:21', '2020-12-22 06:47:21'),
(9, 'Julien Metz', 'winnifred80@example.net', '2020-12-22 06:47:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', 'https://source.unsplash.com/random/150x150', 'active', NULL, 'y6qJejXY30', '2020-12-22 06:47:21', '2020-12-22 06:47:21'),
(10, 'Cory Kertzmann', 'macy.parisian@example.net', '2020-12-22 06:47:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', 'https://source.unsplash.com/random/150x150', 'active', '2020-12-23 01:55:51', 'guiTUVDv1X', '2020-12-22 06:47:21', '2020-12-23 01:55:51'),
(13, 'Pinak Patel', 'pinak@gmail.com', NULL, '$2y$10$4zjB1XhnlCVpzBmIOykSfe2gjbIpsTNsC3RxxWBZH5kneFscoTsZa', 'male', 'user/profile/pinak_patel.png', 'active', NULL, NULL, '2020-12-23 02:19:13', '2020-12-23 02:19:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
