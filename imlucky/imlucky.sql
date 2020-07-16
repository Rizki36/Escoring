/*
 Navicat Premium Data Transfer

 Source Server         : databaseku
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : imlucky

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 01/07/2020 13:55:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `config_nama_unique`(`nama`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'pinalti_umum', '100', NULL, NULL);
INSERT INTO `config` VALUES (2, 'pinalti_utama', '100', NULL, NULL);
INSERT INTO `config` VALUES (3, 'ballot_umum', '100', NULL, NULL);
INSERT INTO `config` VALUES (4, 'ballot_utama', '100', NULL, NULL);
INSERT INTO `config` VALUES (11, 'title_laporan', 'LEMBAR LAPORAN\r\nGARUDA 9.0\r\nGERAK KREATIVITAS GENERASI MUDA PASKIBRA', NULL, NULL);
INSERT INTO `config` VALUES (13, 'title_sortasi', 'LEMBAR SORTASI\r\nGARUDA 9.0\r\nGERAK KREATIVITAS GENERASI MUDA PASKIBRA', NULL, NULL);
INSERT INTO `config` VALUES (15, 'title_juara', 'LEMBAR JUARA\r\nGARUDA 9.0\r\nGERAK KREATIVITAS GENERASI MUDA PASKIBRA', NULL, NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_juri_kategori
-- ----------------------------
DROP TABLE IF EXISTS `group_juri_kategori`;
CREATE TABLE `group_juri_kategori`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_Juri_id` bigint(20) UNSIGNED NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_juri_kategori_kategori_id_foreign`(`kategori_id`) USING BTREE,
  INDEX `group_juri_kategori_group_juri_id_foreign`(`group_Juri_id`) USING BTREE,
  CONSTRAINT `group_juri_kategori_group_juri_id_foreign` FOREIGN KEY (`group_Juri_id`) REFERENCES `group_juris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_juri_kategori_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_juri_kategori
-- ----------------------------
INSERT INTO `group_juri_kategori` VALUES (2, 1, 3, NULL, NULL);
INSERT INTO `group_juri_kategori` VALUES (3, 1, 4, NULL, NULL);
INSERT INTO `group_juri_kategori` VALUES (4, 1, 5, NULL, NULL);
INSERT INTO `group_juri_kategori` VALUES (5, 2, 1, NULL, NULL);
INSERT INTO `group_juri_kategori` VALUES (6, 2, 2, NULL, NULL);
INSERT INTO `group_juri_kategori` VALUES (9, 6, 3, NULL, NULL);
INSERT INTO `group_juri_kategori` VALUES (10, 6, 4, NULL, NULL);
INSERT INTO `group_juri_kategori` VALUES (11, 6, 5, NULL, NULL);
INSERT INTO `group_juri_kategori` VALUES (12, 6, 7, NULL, NULL);

-- ----------------------------
-- Table structure for group_juris
-- ----------------------------
DROP TABLE IF EXISTS `group_juris`;
CREATE TABLE `group_juris`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kategori` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_juris
-- ----------------------------
INSERT INTO `group_juris` VALUES (1, 'VARFORYEL', '2020-03-25 04:29:41', '2020-06-30 01:26:46');
INSERT INTO `group_juris` VALUES (2, 'PBB', '2020-03-25 04:29:48', '2020-03-27 02:30:11');
INSERT INTO `group_juris` VALUES (6, 'VARFORYELKOS', '2020-05-07 01:57:56', '2020-06-30 01:27:21');

-- ----------------------------
-- Table structure for juris
-- ----------------------------
DROP TABLE IF EXISTS `juris`;
CREATE TABLE `juris`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `group_juri_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `juris_group_juri_id_foreign`(`group_juri_id`) USING BTREE,
  CONSTRAINT `juris_group_juri_id_foreign` FOREIGN KEY (`group_juri_id`) REFERENCES `group_juris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of juris
-- ----------------------------
INSERT INTO `juris` VALUES (1, 'farvoryel', 'Supradi', 'test', '2020-03-25 04:30:21', '2020-05-07 02:52:08', 1, NULL);
INSERT INTO `juris` VALUES (3, 'pbb1', 'Suhadi', 'test', '2020-03-25 04:31:02', '2020-05-07 02:52:28', 2, NULL);
INSERT INTO `juris` VALUES (4, 'pbb2', 'amin', 'test', '2020-03-25 04:31:28', '2020-05-07 02:51:15', 2, NULL);
INSERT INTO `juris` VALUES (5, 'farvoryelkos', 'Nanang', 'test', '2020-05-07 01:59:03', '2020-05-07 02:50:58', 6, NULL);
INSERT INTO `juris` VALUES (6, 'pbb3', 'suherman', 'test', '2020-05-07 02:00:17', '2020-05-07 02:51:21', 2, NULL);

-- ----------------------------
-- Table structure for kategoris
-- ----------------------------
DROP TABLE IF EXISTS `kategoris`;
CREATE TABLE `kategoris`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bobot_utama` int(11) NOT NULL DEFAULT 0,
  `bobot_umum` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategoris
-- ----------------------------
INSERT INTO `kategoris` VALUES (1, 'A', 'PBB', 100, 100, '2020-03-25 04:31:59', '2020-06-30 03:03:13');
INSERT INTO `kategoris` VALUES (2, 'B', 'danton', 100, 100, '2020-03-25 04:32:11', '2020-06-30 03:03:20');
INSERT INTO `kategoris` VALUES (3, 'E', 'variasi', 100, 100, '2020-03-25 04:36:17', '2020-06-30 03:03:51');
INSERT INTO `kategoris` VALUES (4, 'D', 'formasi', 100, 100, '2020-03-25 04:36:38', '2020-06-30 03:03:39');
INSERT INTO `kategoris` VALUES (5, 'C', 'yel-yel', 100, 100, '2020-03-25 04:36:51', '2020-06-30 03:03:31');
INSERT INTO `kategoris` VALUES (7, 'F', 'kostum', 100, 100, '2020-05-07 02:28:46', '2020-06-30 03:04:00');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2020_01_26_102024_create_kategoris_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_01_26_102043_create_subs_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_01_26_102053_create_sub2s_table', 1);
INSERT INTO `migrations` VALUES (7, '2020_01_26_102109_create_juris_table', 1);
INSERT INTO `migrations` VALUES (8, '2020_01_30_041425_create_penilaian_table', 1);
INSERT INTO `migrations` VALUES (9, '2020_02_19_060759_create_peletons_table', 1);
INSERT INTO `migrations` VALUES (10, '2020_02_19_065031_create_relation_penilaian_table', 1);
INSERT INTO `migrations` VALUES (11, '2020_03_09_090209_create_relation_kategori', 1);
INSERT INTO `migrations` VALUES (12, '2020_03_24_022236_create_group_juris_table', 1);
INSERT INTO `migrations` VALUES (13, '2020_03_24_040129_create_group_juri_kategori_table', 1);
INSERT INTO `migrations` VALUES (14, '2020_03_24_042626_create_relation_group_juri_juri', 1);
INSERT INTO `migrations` VALUES (15, '2020_03_24_042819_create_relation_group_juri_kategori', 1);
INSERT INTO `migrations` VALUES (18, '2020_04_02_035909_add_column_kategori_table', 2);
INSERT INTO `migrations` VALUES (20, '2020_04_15_022306_create_config_table', 3);
INSERT INTO `migrations` VALUES (28, '2020_05_03_031430_add_column_is_complete_table_penilaian', 4);
INSERT INTO `migrations` VALUES (29, '2020_05_07_030657_add_column_remember_token_table_juris', 4);
INSERT INTO `migrations` VALUES (30, '2020_05_08_022122_update_column_nilai_table_penilaian', 4);
INSERT INTO `migrations` VALUES (32, '2020_06_25_061759_add_data_title_config_table', 5);
INSERT INTO `migrations` VALUES (33, '2020_06_25_081056_add_data_sortasi_config_table', 6);
INSERT INTO `migrations` VALUES (34, '2020_06_29_040943_update_column_no_peletons_table', 7);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for peletons
-- ----------------------------
DROP TABLE IF EXISTS `peletons`;
CREATE TABLE `peletons`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `no` int(11) NOT NULL,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ballot` double(8, 2) NOT NULL,
  `pinalti` double(8, 2) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `peletons_no_unique`(`no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of peletons
-- ----------------------------
INSERT INTO `peletons` VALUES (3, 1, 'SMAN 1 Jombang', 0.00, 0.00, '2020-03-27 02:15:14', '2020-06-29 08:45:42');
INSERT INTO `peletons` VALUES (4, 2, 'SMAN 2 Jombang', 0.00, 0.00, '2020-03-27 02:17:51', '2020-04-16 03:39:03');
INSERT INTO `peletons` VALUES (5, 3, 'SMAN 3 Jombang', 0.00, 0.00, '2020-03-27 02:17:51', '2020-06-30 09:00:22');
INSERT INTO `peletons` VALUES (6, 4, 'SMAN 4 Jombang', 0.00, 0.00, '2021-03-27 00:00:00', '2021-04-16 00:00:00');
INSERT INTO `peletons` VALUES (7, 5, 'SMAN 5 Jombang', 0.00, 0.00, '2021-03-27 00:00:00', '2021-04-16 00:00:00');
INSERT INTO `peletons` VALUES (8, 6, 'SMAN 6 Jombang', 0.00, 0.00, '2021-03-27 00:00:00', '2021-04-16 00:00:00');
INSERT INTO `peletons` VALUES (9, 7, 'SMAN 7 Jombang', 0.00, 0.00, '2022-03-27 00:00:00', '2022-04-16 00:00:00');
INSERT INTO `peletons` VALUES (10, 8, 'SMAN 8 Jombang', 0.00, 0.00, '2022-03-27 00:00:00', '2022-04-16 00:00:00');
INSERT INTO `peletons` VALUES (11, 9, 'SMAN 9 Jombang', 0.00, 0.00, '2022-03-27 00:00:00', '2022-04-16 00:00:00');
INSERT INTO `peletons` VALUES (12, 10, 'SMAN 10 Jombang', 0.00, 0.00, '2023-03-27 00:00:00', '2023-04-16 00:00:00');
INSERT INTO `peletons` VALUES (13, 11, 'SMAN 11 Jombang', 0.00, 0.00, '2023-03-27 00:00:00', '2023-04-16 00:00:00');
INSERT INTO `peletons` VALUES (14, 12, 'SMAN 12 Jombang', 0.00, 0.00, '2023-03-27 00:00:00', '2023-04-16 00:00:00');
INSERT INTO `peletons` VALUES (15, 13, 'SMAN 13 Jombang', 0.00, 0.00, '2024-03-27 00:00:00', '2024-04-16 00:00:00');
INSERT INTO `peletons` VALUES (16, 14, 'SMAN 14 Jombang', 0.00, 0.00, '2024-03-27 00:00:00', '2024-04-16 00:00:00');
INSERT INTO `peletons` VALUES (17, 15, 'SMAN 15 Jombang', 0.00, 0.00, '2024-03-27 00:00:00', '2024-04-16 00:00:00');
INSERT INTO `peletons` VALUES (18, 16, 'SMAN 16 Jombang', 0.00, 0.00, '2025-03-27 00:00:00', '2025-04-16 00:00:00');
INSERT INTO `peletons` VALUES (19, 17, 'SMAN 17 Jombang', 0.00, 0.00, '2025-03-27 00:00:00', '2025-04-16 00:00:00');
INSERT INTO `peletons` VALUES (20, 18, 'SMAN 18 Jombang', 0.00, 0.00, '2025-03-27 00:00:00', '2025-04-16 00:00:00');
INSERT INTO `peletons` VALUES (21, 19, 'SMAN 19 Jombang', 0.00, 0.00, '2026-03-27 00:00:00', '2026-04-16 00:00:00');
INSERT INTO `peletons` VALUES (22, 20, 'SMAN 20 Jombang', 0.00, 0.00, '2026-03-27 00:00:00', '2026-04-16 00:00:00');

-- ----------------------------
-- Table structure for penilaian
-- ----------------------------
DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE `penilaian`  (
  `juri_id` bigint(20) UNSIGNED NOT NULL,
  `peleton_id` bigint(20) UNSIGNED NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `sub_id` bigint(20) UNSIGNED NOT NULL,
  `sub2_id` bigint(20) UNSIGNED NOT NULL,
  `nilai` double NULL DEFAULT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`juri_id`, `peleton_id`, `kategori_id`, `sub_id`, `sub2_id`) USING BTREE,
  INDEX `penilaian_peleton_id_foreign`(`peleton_id`) USING BTREE,
  INDEX `penilaian_kategori_id_foreign`(`kategori_id`) USING BTREE,
  INDEX `penilaian_sub_id_foreign`(`sub_id`) USING BTREE,
  INDEX `penilaian_sub2_id_foreign`(`sub2_id`) USING BTREE,
  CONSTRAINT `penilaian_juri_id_foreign` FOREIGN KEY (`juri_id`) REFERENCES `juris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_peleton_id_foreign` FOREIGN KEY (`peleton_id`) REFERENCES `peletons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_sub2_id_foreign` FOREIGN KEY (`sub2_id`) REFERENCES `sub2s` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_sub_id_foreign` FOREIGN KEY (`sub_id`) REFERENCES `subs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penilaian
-- ----------------------------
INSERT INTO `penilaian` VALUES (1, 3, 3, 11, 55, 65, 0);
INSERT INTO `penilaian` VALUES (1, 3, 3, 11, 56, 12, 0);
INSERT INTO `penilaian` VALUES (1, 3, 3, 11, 57, 64, 0);
INSERT INTO `penilaian` VALUES (1, 3, 3, 11, 58, 85, 0);
INSERT INTO `penilaian` VALUES (1, 3, 3, 11, 59, 35, 0);
INSERT INTO `penilaian` VALUES (1, 3, 4, 13, 50, 19, 0);
INSERT INTO `penilaian` VALUES (1, 3, 4, 13, 51, 92, 0);
INSERT INTO `penilaian` VALUES (1, 3, 4, 13, 52, 3, 0);
INSERT INTO `penilaian` VALUES (1, 3, 4, 13, 53, 39, 0);
INSERT INTO `penilaian` VALUES (1, 3, 4, 13, 54, 85, 0);
INSERT INTO `penilaian` VALUES (1, 3, 5, 12, 46, 11, 0);
INSERT INTO `penilaian` VALUES (1, 3, 5, 12, 47, 1, 0);
INSERT INTO `penilaian` VALUES (1, 3, 5, 12, 48, 71, 0);
INSERT INTO `penilaian` VALUES (1, 3, 5, 12, 49, 55, 0);
INSERT INTO `penilaian` VALUES (1, 4, 3, 11, 55, 61, 0);
INSERT INTO `penilaian` VALUES (1, 4, 3, 11, 56, 40, 0);
INSERT INTO `penilaian` VALUES (1, 4, 3, 11, 57, 18, 0);
INSERT INTO `penilaian` VALUES (1, 4, 3, 11, 58, 70, 0);
INSERT INTO `penilaian` VALUES (1, 4, 3, 11, 59, 98, 0);
INSERT INTO `penilaian` VALUES (1, 4, 4, 13, 50, 80, 0);
INSERT INTO `penilaian` VALUES (1, 4, 4, 13, 51, 6, 0);
INSERT INTO `penilaian` VALUES (1, 4, 4, 13, 52, 92, 0);
INSERT INTO `penilaian` VALUES (1, 4, 4, 13, 53, 43, 0);
INSERT INTO `penilaian` VALUES (1, 4, 4, 13, 54, 39, 0);
INSERT INTO `penilaian` VALUES (1, 4, 5, 12, 46, 67, 0);
INSERT INTO `penilaian` VALUES (1, 4, 5, 12, 47, 18, 0);
INSERT INTO `penilaian` VALUES (1, 4, 5, 12, 48, 89, 0);
INSERT INTO `penilaian` VALUES (1, 4, 5, 12, 49, 90, 0);
INSERT INTO `penilaian` VALUES (1, 5, 3, 11, 55, 85, 0);
INSERT INTO `penilaian` VALUES (1, 5, 3, 11, 56, 55, 0);
INSERT INTO `penilaian` VALUES (1, 5, 3, 11, 57, 22, 0);
INSERT INTO `penilaian` VALUES (1, 5, 3, 11, 58, 45, 0);
INSERT INTO `penilaian` VALUES (1, 5, 3, 11, 59, 59, 0);
INSERT INTO `penilaian` VALUES (1, 5, 4, 13, 50, 62, 0);
INSERT INTO `penilaian` VALUES (1, 5, 4, 13, 51, 31, 0);
INSERT INTO `penilaian` VALUES (1, 5, 4, 13, 52, 73, 0);
INSERT INTO `penilaian` VALUES (1, 5, 4, 13, 53, 69, 0);
INSERT INTO `penilaian` VALUES (1, 5, 4, 13, 54, 28, 0);
INSERT INTO `penilaian` VALUES (1, 5, 5, 12, 46, 34, 0);
INSERT INTO `penilaian` VALUES (1, 5, 5, 12, 47, 88, 0);
INSERT INTO `penilaian` VALUES (1, 5, 5, 12, 48, 37, 0);
INSERT INTO `penilaian` VALUES (1, 5, 5, 12, 49, 21, 0);
INSERT INTO `penilaian` VALUES (1, 6, 3, 11, 55, 93, 0);
INSERT INTO `penilaian` VALUES (1, 6, 3, 11, 56, 3, 0);
INSERT INTO `penilaian` VALUES (1, 6, 3, 11, 57, 37, 0);
INSERT INTO `penilaian` VALUES (1, 6, 3, 11, 58, 75, 0);
INSERT INTO `penilaian` VALUES (1, 6, 3, 11, 59, 67, 0);
INSERT INTO `penilaian` VALUES (1, 6, 4, 13, 50, 9, 0);
INSERT INTO `penilaian` VALUES (1, 6, 4, 13, 51, 46, 0);
INSERT INTO `penilaian` VALUES (1, 6, 4, 13, 52, 1, 0);
INSERT INTO `penilaian` VALUES (1, 6, 4, 13, 53, 69, 0);
INSERT INTO `penilaian` VALUES (1, 6, 4, 13, 54, 44, 0);
INSERT INTO `penilaian` VALUES (1, 6, 5, 12, 46, 13, 0);
INSERT INTO `penilaian` VALUES (1, 6, 5, 12, 47, 33, 0);
INSERT INTO `penilaian` VALUES (1, 6, 5, 12, 48, 24, 0);
INSERT INTO `penilaian` VALUES (1, 6, 5, 12, 49, 25, 0);
INSERT INTO `penilaian` VALUES (1, 7, 3, 11, 55, 54, 0);
INSERT INTO `penilaian` VALUES (1, 7, 3, 11, 56, 93, 0);
INSERT INTO `penilaian` VALUES (1, 7, 3, 11, 57, 4, 0);
INSERT INTO `penilaian` VALUES (1, 7, 3, 11, 58, 43, 0);
INSERT INTO `penilaian` VALUES (1, 7, 3, 11, 59, 3, 0);
INSERT INTO `penilaian` VALUES (1, 7, 4, 13, 50, 87, 0);
INSERT INTO `penilaian` VALUES (1, 7, 4, 13, 51, 28, 0);
INSERT INTO `penilaian` VALUES (1, 7, 4, 13, 52, 78, 0);
INSERT INTO `penilaian` VALUES (1, 7, 4, 13, 53, 5, 0);
INSERT INTO `penilaian` VALUES (1, 7, 4, 13, 54, 92, 0);
INSERT INTO `penilaian` VALUES (1, 7, 5, 12, 46, 46, 0);
INSERT INTO `penilaian` VALUES (1, 7, 5, 12, 47, 54, 0);
INSERT INTO `penilaian` VALUES (1, 7, 5, 12, 48, 33, 0);
INSERT INTO `penilaian` VALUES (1, 7, 5, 12, 49, 4, 0);
INSERT INTO `penilaian` VALUES (1, 8, 3, 11, 55, 23, 0);
INSERT INTO `penilaian` VALUES (1, 8, 3, 11, 56, 1, 0);
INSERT INTO `penilaian` VALUES (1, 8, 3, 11, 57, 38, 0);
INSERT INTO `penilaian` VALUES (1, 8, 3, 11, 58, 88, 0);
INSERT INTO `penilaian` VALUES (1, 8, 3, 11, 59, 24, 0);
INSERT INTO `penilaian` VALUES (1, 8, 4, 13, 50, 60, 0);
INSERT INTO `penilaian` VALUES (1, 8, 4, 13, 51, 27, 0);
INSERT INTO `penilaian` VALUES (1, 8, 4, 13, 52, 53, 0);
INSERT INTO `penilaian` VALUES (1, 8, 4, 13, 53, 88, 0);
INSERT INTO `penilaian` VALUES (1, 8, 4, 13, 54, 80, 0);
INSERT INTO `penilaian` VALUES (1, 8, 5, 12, 46, 38, 0);
INSERT INTO `penilaian` VALUES (1, 8, 5, 12, 47, 51, 0);
INSERT INTO `penilaian` VALUES (1, 8, 5, 12, 48, 41, 0);
INSERT INTO `penilaian` VALUES (1, 8, 5, 12, 49, 52, 0);
INSERT INTO `penilaian` VALUES (1, 9, 3, 11, 55, 38, 0);
INSERT INTO `penilaian` VALUES (1, 9, 3, 11, 56, 34, 0);
INSERT INTO `penilaian` VALUES (1, 9, 3, 11, 57, 58, 0);
INSERT INTO `penilaian` VALUES (1, 9, 3, 11, 58, 90, 0);
INSERT INTO `penilaian` VALUES (1, 9, 3, 11, 59, 73, 0);
INSERT INTO `penilaian` VALUES (1, 9, 4, 13, 50, 97, 0);
INSERT INTO `penilaian` VALUES (1, 9, 4, 13, 51, 67, 0);
INSERT INTO `penilaian` VALUES (1, 9, 4, 13, 52, 44, 0);
INSERT INTO `penilaian` VALUES (1, 9, 4, 13, 53, 21, 0);
INSERT INTO `penilaian` VALUES (1, 9, 4, 13, 54, 74, 0);
INSERT INTO `penilaian` VALUES (1, 9, 5, 12, 46, 8, 0);
INSERT INTO `penilaian` VALUES (1, 9, 5, 12, 47, 19, 0);
INSERT INTO `penilaian` VALUES (1, 9, 5, 12, 48, 69, 0);
INSERT INTO `penilaian` VALUES (1, 9, 5, 12, 49, 91, 0);
INSERT INTO `penilaian` VALUES (1, 10, 3, 11, 55, 46, 0);
INSERT INTO `penilaian` VALUES (1, 10, 3, 11, 56, 60, 0);
INSERT INTO `penilaian` VALUES (1, 10, 3, 11, 57, 61, 0);
INSERT INTO `penilaian` VALUES (1, 10, 3, 11, 58, 25, 0);
INSERT INTO `penilaian` VALUES (1, 10, 3, 11, 59, 43, 0);
INSERT INTO `penilaian` VALUES (1, 10, 4, 13, 50, 38, 0);
INSERT INTO `penilaian` VALUES (1, 10, 4, 13, 51, 65, 0);
INSERT INTO `penilaian` VALUES (1, 10, 4, 13, 52, 12, 0);
INSERT INTO `penilaian` VALUES (1, 10, 4, 13, 53, 64, 0);
INSERT INTO `penilaian` VALUES (1, 10, 4, 13, 54, 86, 0);
INSERT INTO `penilaian` VALUES (1, 10, 5, 12, 46, 38, 0);
INSERT INTO `penilaian` VALUES (1, 10, 5, 12, 47, 34, 0);
INSERT INTO `penilaian` VALUES (1, 10, 5, 12, 48, 54, 0);
INSERT INTO `penilaian` VALUES (1, 10, 5, 12, 49, 68, 0);
INSERT INTO `penilaian` VALUES (1, 11, 3, 11, 55, 77, 0);
INSERT INTO `penilaian` VALUES (1, 11, 3, 11, 56, 85, 0);
INSERT INTO `penilaian` VALUES (1, 11, 3, 11, 57, 93, 0);
INSERT INTO `penilaian` VALUES (1, 11, 3, 11, 58, 12, 0);
INSERT INTO `penilaian` VALUES (1, 11, 3, 11, 59, 80, 0);
INSERT INTO `penilaian` VALUES (1, 11, 4, 13, 50, 64, 0);
INSERT INTO `penilaian` VALUES (1, 11, 4, 13, 51, 80, 0);
INSERT INTO `penilaian` VALUES (1, 11, 4, 13, 52, 11, 0);
INSERT INTO `penilaian` VALUES (1, 11, 4, 13, 53, 14, 0);
INSERT INTO `penilaian` VALUES (1, 11, 4, 13, 54, 39, 0);
INSERT INTO `penilaian` VALUES (1, 11, 5, 12, 46, 51, 0);
INSERT INTO `penilaian` VALUES (1, 11, 5, 12, 47, 38, 0);
INSERT INTO `penilaian` VALUES (1, 11, 5, 12, 48, 41, 0);
INSERT INTO `penilaian` VALUES (1, 11, 5, 12, 49, 89, 0);
INSERT INTO `penilaian` VALUES (1, 12, 3, 11, 55, 22, 0);
INSERT INTO `penilaian` VALUES (1, 12, 3, 11, 56, 43, 0);
INSERT INTO `penilaian` VALUES (1, 12, 3, 11, 57, 51, 0);
INSERT INTO `penilaian` VALUES (1, 12, 3, 11, 58, 24, 0);
INSERT INTO `penilaian` VALUES (1, 12, 3, 11, 59, 70, 0);
INSERT INTO `penilaian` VALUES (1, 12, 4, 13, 50, 78, 0);
INSERT INTO `penilaian` VALUES (1, 12, 4, 13, 51, 79, 0);
INSERT INTO `penilaian` VALUES (1, 12, 4, 13, 52, 63, 0);
INSERT INTO `penilaian` VALUES (1, 12, 4, 13, 53, 78, 0);
INSERT INTO `penilaian` VALUES (1, 12, 4, 13, 54, 1, 0);
INSERT INTO `penilaian` VALUES (1, 12, 5, 12, 46, 71, 0);
INSERT INTO `penilaian` VALUES (1, 12, 5, 12, 47, 54, 0);
INSERT INTO `penilaian` VALUES (1, 12, 5, 12, 48, 58, 0);
INSERT INTO `penilaian` VALUES (1, 12, 5, 12, 49, 26, 0);
INSERT INTO `penilaian` VALUES (1, 13, 3, 11, 55, 59, 0);
INSERT INTO `penilaian` VALUES (1, 13, 3, 11, 56, 17, 0);
INSERT INTO `penilaian` VALUES (1, 13, 3, 11, 57, 9, 0);
INSERT INTO `penilaian` VALUES (1, 13, 3, 11, 58, 94, 0);
INSERT INTO `penilaian` VALUES (1, 13, 3, 11, 59, 43, 0);
INSERT INTO `penilaian` VALUES (1, 13, 4, 13, 50, 34, 0);
INSERT INTO `penilaian` VALUES (1, 13, 4, 13, 51, 43, 0);
INSERT INTO `penilaian` VALUES (1, 13, 4, 13, 52, 13, 0);
INSERT INTO `penilaian` VALUES (1, 13, 4, 13, 53, 35, 0);
INSERT INTO `penilaian` VALUES (1, 13, 4, 13, 54, 36, 0);
INSERT INTO `penilaian` VALUES (1, 13, 5, 12, 46, 76, 0);
INSERT INTO `penilaian` VALUES (1, 13, 5, 12, 47, 73, 0);
INSERT INTO `penilaian` VALUES (1, 13, 5, 12, 48, 36, 0);
INSERT INTO `penilaian` VALUES (1, 13, 5, 12, 49, 60, 0);
INSERT INTO `penilaian` VALUES (1, 14, 3, 11, 55, 95, 0);
INSERT INTO `penilaian` VALUES (1, 14, 3, 11, 56, 97, 0);
INSERT INTO `penilaian` VALUES (1, 14, 3, 11, 57, 97, 0);
INSERT INTO `penilaian` VALUES (1, 14, 3, 11, 58, 98, 0);
INSERT INTO `penilaian` VALUES (1, 14, 3, 11, 59, 97, 0);
INSERT INTO `penilaian` VALUES (1, 14, 4, 13, 50, 93, 0);
INSERT INTO `penilaian` VALUES (1, 14, 4, 13, 51, 74, 0);
INSERT INTO `penilaian` VALUES (1, 14, 4, 13, 52, 91, 0);
INSERT INTO `penilaian` VALUES (1, 14, 4, 13, 53, 33, 0);
INSERT INTO `penilaian` VALUES (1, 14, 4, 13, 54, 91, 0);
INSERT INTO `penilaian` VALUES (1, 14, 5, 12, 46, 59, 0);
INSERT INTO `penilaian` VALUES (1, 14, 5, 12, 47, 23, 0);
INSERT INTO `penilaian` VALUES (1, 14, 5, 12, 48, 38, 0);
INSERT INTO `penilaian` VALUES (1, 14, 5, 12, 49, 22, 0);
INSERT INTO `penilaian` VALUES (1, 15, 3, 11, 55, 96, 0);
INSERT INTO `penilaian` VALUES (1, 15, 3, 11, 56, 15, 0);
INSERT INTO `penilaian` VALUES (1, 15, 3, 11, 57, 89, 0);
INSERT INTO `penilaian` VALUES (1, 15, 3, 11, 58, 97, 0);
INSERT INTO `penilaian` VALUES (1, 15, 3, 11, 59, 21, 0);
INSERT INTO `penilaian` VALUES (1, 15, 4, 13, 50, 13, 0);
INSERT INTO `penilaian` VALUES (1, 15, 4, 13, 51, 4, 0);
INSERT INTO `penilaian` VALUES (1, 15, 4, 13, 52, 81, 0);
INSERT INTO `penilaian` VALUES (1, 15, 4, 13, 53, 95, 0);
INSERT INTO `penilaian` VALUES (1, 15, 4, 13, 54, 30, 0);
INSERT INTO `penilaian` VALUES (1, 15, 5, 12, 46, 65, 0);
INSERT INTO `penilaian` VALUES (1, 15, 5, 12, 47, 37, 0);
INSERT INTO `penilaian` VALUES (1, 15, 5, 12, 48, 91, 0);
INSERT INTO `penilaian` VALUES (1, 15, 5, 12, 49, 46, 0);
INSERT INTO `penilaian` VALUES (1, 16, 3, 11, 55, 56, 0);
INSERT INTO `penilaian` VALUES (1, 16, 3, 11, 56, 44, 0);
INSERT INTO `penilaian` VALUES (1, 16, 3, 11, 57, 51, 0);
INSERT INTO `penilaian` VALUES (1, 16, 3, 11, 58, 23, 0);
INSERT INTO `penilaian` VALUES (1, 16, 3, 11, 59, 65, 0);
INSERT INTO `penilaian` VALUES (1, 16, 4, 13, 50, 53, 0);
INSERT INTO `penilaian` VALUES (1, 16, 4, 13, 51, 73, 0);
INSERT INTO `penilaian` VALUES (1, 16, 4, 13, 52, 4, 0);
INSERT INTO `penilaian` VALUES (1, 16, 4, 13, 53, 3, 0);
INSERT INTO `penilaian` VALUES (1, 16, 4, 13, 54, 1, 0);
INSERT INTO `penilaian` VALUES (1, 16, 5, 12, 46, 0, 0);
INSERT INTO `penilaian` VALUES (1, 16, 5, 12, 47, 96, 0);
INSERT INTO `penilaian` VALUES (1, 16, 5, 12, 48, 83, 0);
INSERT INTO `penilaian` VALUES (1, 16, 5, 12, 49, 24, 0);
INSERT INTO `penilaian` VALUES (1, 17, 3, 11, 55, 72, 0);
INSERT INTO `penilaian` VALUES (1, 17, 3, 11, 56, 89, 0);
INSERT INTO `penilaian` VALUES (1, 17, 3, 11, 57, 29, 0);
INSERT INTO `penilaian` VALUES (1, 17, 3, 11, 58, 79, 0);
INSERT INTO `penilaian` VALUES (1, 17, 3, 11, 59, 10, 0);
INSERT INTO `penilaian` VALUES (1, 17, 4, 13, 50, 13, 0);
INSERT INTO `penilaian` VALUES (1, 17, 4, 13, 51, 35, 0);
INSERT INTO `penilaian` VALUES (1, 17, 4, 13, 52, 36, 0);
INSERT INTO `penilaian` VALUES (1, 17, 4, 13, 53, 75, 0);
INSERT INTO `penilaian` VALUES (1, 17, 4, 13, 54, 67, 0);
INSERT INTO `penilaian` VALUES (1, 17, 5, 12, 46, 11, 0);
INSERT INTO `penilaian` VALUES (1, 17, 5, 12, 47, 54, 0);
INSERT INTO `penilaian` VALUES (1, 17, 5, 12, 48, 40, 0);
INSERT INTO `penilaian` VALUES (1, 17, 5, 12, 49, 37, 0);
INSERT INTO `penilaian` VALUES (1, 18, 3, 11, 55, 64, 0);
INSERT INTO `penilaian` VALUES (1, 18, 3, 11, 56, 10, 0);
INSERT INTO `penilaian` VALUES (1, 18, 3, 11, 57, 57, 0);
INSERT INTO `penilaian` VALUES (1, 18, 3, 11, 58, 57, 0);
INSERT INTO `penilaian` VALUES (1, 18, 3, 11, 59, 12, 0);
INSERT INTO `penilaian` VALUES (1, 18, 4, 13, 50, 92, 0);
INSERT INTO `penilaian` VALUES (1, 18, 4, 13, 51, 25, 0);
INSERT INTO `penilaian` VALUES (1, 18, 4, 13, 52, 50, 0);
INSERT INTO `penilaian` VALUES (1, 18, 4, 13, 53, 75, 0);
INSERT INTO `penilaian` VALUES (1, 18, 4, 13, 54, 26, 0);
INSERT INTO `penilaian` VALUES (1, 18, 5, 12, 46, 6, 0);
INSERT INTO `penilaian` VALUES (1, 18, 5, 12, 47, 53, 0);
INSERT INTO `penilaian` VALUES (1, 18, 5, 12, 48, 47, 0);
INSERT INTO `penilaian` VALUES (1, 18, 5, 12, 49, 78, 0);
INSERT INTO `penilaian` VALUES (1, 19, 3, 11, 55, 46, 0);
INSERT INTO `penilaian` VALUES (1, 19, 3, 11, 56, 99, 0);
INSERT INTO `penilaian` VALUES (1, 19, 3, 11, 57, 59, 0);
INSERT INTO `penilaian` VALUES (1, 19, 3, 11, 58, 97, 0);
INSERT INTO `penilaian` VALUES (1, 19, 3, 11, 59, 7, 0);
INSERT INTO `penilaian` VALUES (1, 19, 4, 13, 50, 45, 0);
INSERT INTO `penilaian` VALUES (1, 19, 4, 13, 51, 6, 0);
INSERT INTO `penilaian` VALUES (1, 19, 4, 13, 52, 95, 0);
INSERT INTO `penilaian` VALUES (1, 19, 4, 13, 53, 59, 0);
INSERT INTO `penilaian` VALUES (1, 19, 4, 13, 54, 8, 0);
INSERT INTO `penilaian` VALUES (1, 19, 5, 12, 46, 65, 0);
INSERT INTO `penilaian` VALUES (1, 19, 5, 12, 47, 2, 0);
INSERT INTO `penilaian` VALUES (1, 19, 5, 12, 48, 15, 0);
INSERT INTO `penilaian` VALUES (1, 19, 5, 12, 49, 71, 0);
INSERT INTO `penilaian` VALUES (1, 20, 3, 11, 55, 10, 0);
INSERT INTO `penilaian` VALUES (1, 20, 3, 11, 56, 36, 0);
INSERT INTO `penilaian` VALUES (1, 20, 3, 11, 57, 52, 0);
INSERT INTO `penilaian` VALUES (1, 20, 3, 11, 58, 54, 0);
INSERT INTO `penilaian` VALUES (1, 20, 3, 11, 59, 12, 0);
INSERT INTO `penilaian` VALUES (1, 20, 4, 13, 50, 98, 0);
INSERT INTO `penilaian` VALUES (1, 20, 4, 13, 51, 58, 0);
INSERT INTO `penilaian` VALUES (1, 20, 4, 13, 52, 93, 0);
INSERT INTO `penilaian` VALUES (1, 20, 4, 13, 53, 91, 0);
INSERT INTO `penilaian` VALUES (1, 20, 4, 13, 54, 77, 0);
INSERT INTO `penilaian` VALUES (1, 20, 5, 12, 46, 15, 0);
INSERT INTO `penilaian` VALUES (1, 20, 5, 12, 47, 42, 0);
INSERT INTO `penilaian` VALUES (1, 20, 5, 12, 48, 64, 0);
INSERT INTO `penilaian` VALUES (1, 20, 5, 12, 49, 97, 0);
INSERT INTO `penilaian` VALUES (1, 21, 3, 11, 55, 91, 0);
INSERT INTO `penilaian` VALUES (1, 21, 3, 11, 56, 65, 0);
INSERT INTO `penilaian` VALUES (1, 21, 3, 11, 57, 54, 0);
INSERT INTO `penilaian` VALUES (1, 21, 3, 11, 58, 75, 0);
INSERT INTO `penilaian` VALUES (1, 21, 3, 11, 59, 13, 0);
INSERT INTO `penilaian` VALUES (1, 21, 4, 13, 50, 42, 0);
INSERT INTO `penilaian` VALUES (1, 21, 4, 13, 51, 71, 0);
INSERT INTO `penilaian` VALUES (1, 21, 4, 13, 52, 27, 0);
INSERT INTO `penilaian` VALUES (1, 21, 4, 13, 53, 26, 0);
INSERT INTO `penilaian` VALUES (1, 21, 4, 13, 54, 48, 0);
INSERT INTO `penilaian` VALUES (1, 21, 5, 12, 46, 62, 0);
INSERT INTO `penilaian` VALUES (1, 21, 5, 12, 47, 67, 0);
INSERT INTO `penilaian` VALUES (1, 21, 5, 12, 48, 49, 0);
INSERT INTO `penilaian` VALUES (1, 21, 5, 12, 49, 45, 0);
INSERT INTO `penilaian` VALUES (1, 22, 3, 11, 55, 76, 0);
INSERT INTO `penilaian` VALUES (1, 22, 3, 11, 56, 49, 0);
INSERT INTO `penilaian` VALUES (1, 22, 3, 11, 57, 16, 0);
INSERT INTO `penilaian` VALUES (1, 22, 3, 11, 58, 35, 0);
INSERT INTO `penilaian` VALUES (1, 22, 3, 11, 59, 26, 0);
INSERT INTO `penilaian` VALUES (1, 22, 4, 13, 50, 27, 0);
INSERT INTO `penilaian` VALUES (1, 22, 4, 13, 51, 57, 0);
INSERT INTO `penilaian` VALUES (1, 22, 4, 13, 52, 2, 0);
INSERT INTO `penilaian` VALUES (1, 22, 4, 13, 53, 42, 0);
INSERT INTO `penilaian` VALUES (1, 22, 4, 13, 54, 5, 0);
INSERT INTO `penilaian` VALUES (1, 22, 5, 12, 46, 0, 0);
INSERT INTO `penilaian` VALUES (1, 22, 5, 12, 47, 83, 0);
INSERT INTO `penilaian` VALUES (1, 22, 5, 12, 48, 17, 0);
INSERT INTO `penilaian` VALUES (1, 22, 5, 12, 49, 34, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 12, 22, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 13, 10, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 14, 82, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 15, 82, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 16, 62, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 17, 65, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 18, 42, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 19, 13, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 20, 40, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 21, 61, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 22, 85, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 23, 45, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 24, 69, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 25, 9, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 26, 38, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 27, 66, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 28, 15, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 29, 77, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 30, 42, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 31, 80, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 32, 74, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 33, 31, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 34, 34, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 35, 77, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 36, 82, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 37, 79, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 38, 52, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 39, 21, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 40, 52, 1);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 41, 97, 1);
INSERT INTO `penilaian` VALUES (3, 3, 2, 10, 42, 27, 1);
INSERT INTO `penilaian` VALUES (3, 3, 2, 10, 43, 46, 1);
INSERT INTO `penilaian` VALUES (3, 3, 2, 10, 44, 50, 1);
INSERT INTO `penilaian` VALUES (3, 3, 2, 10, 45, 10, 1);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 12, 3, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 13, 85, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 14, 17, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 15, 30, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 16, 98, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 17, 3, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 18, 19, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 19, 87, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 20, 80, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 21, 38, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 22, 52, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 23, 48, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 24, 82, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 25, 69, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 26, 99, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 27, 88, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 28, 43, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 29, 52, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 30, 29, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 31, 93, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 32, 77, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 33, 8, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 34, 10, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 35, 25, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 36, 95, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 37, 3, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 38, 27, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 39, 28, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 40, 61, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 41, 21, 0);
INSERT INTO `penilaian` VALUES (3, 4, 2, 10, 42, 24, 0);
INSERT INTO `penilaian` VALUES (3, 4, 2, 10, 43, 57, 0);
INSERT INTO `penilaian` VALUES (3, 4, 2, 10, 44, 13, 0);
INSERT INTO `penilaian` VALUES (3, 4, 2, 10, 45, 95, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 12, 37, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 13, 98, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 14, 82, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 15, 14, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 16, 24, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 17, 80, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 18, 28, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 19, 99, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 20, 13, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 21, 68, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 22, 1, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 23, 3, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 24, 11, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 25, 47, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 26, 4, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 27, 77, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 28, 74, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 29, 39, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 30, 75, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 31, 59, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 32, 70, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 33, 74, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 34, 60, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 35, 79, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 36, 13, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 37, 32, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 38, 21, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 39, 7, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 40, 73, 1);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 41, 47, 1);
INSERT INTO `penilaian` VALUES (3, 5, 2, 10, 42, 14, 0);
INSERT INTO `penilaian` VALUES (3, 5, 2, 10, 43, 31, 0);
INSERT INTO `penilaian` VALUES (3, 5, 2, 10, 44, 12, 0);
INSERT INTO `penilaian` VALUES (3, 5, 2, 10, 45, 69, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 12, 8, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 13, 33, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 14, 43, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 15, 16, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 16, 50, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 17, 2, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 18, 61, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 19, 1, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 20, 21, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 21, 3, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 22, 52, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 23, 53, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 24, 11, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 25, 94, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 26, 38, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 27, 9, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 28, 32, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 29, 31, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 30, 63, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 31, 20, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 32, 12, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 33, 99, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 34, 62, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 35, 12, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 36, 74, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 37, 34, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 38, 48, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 39, 39, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 40, 50, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 41, 36, 0);
INSERT INTO `penilaian` VALUES (3, 6, 2, 10, 42, 30, 0);
INSERT INTO `penilaian` VALUES (3, 6, 2, 10, 43, 44, 0);
INSERT INTO `penilaian` VALUES (3, 6, 2, 10, 44, 30, 0);
INSERT INTO `penilaian` VALUES (3, 6, 2, 10, 45, 19, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 12, 6, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 13, 73, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 14, 48, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 15, 20, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 16, 55, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 17, 19, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 18, 27, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 19, 81, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 20, 24, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 21, 76, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 22, 7, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 23, 11, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 24, 33, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 25, 31, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 26, 58, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 27, 98, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 28, 17, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 29, 91, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 30, 6, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 31, 56, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 32, 64, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 33, 50, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 34, 60, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 35, 50, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 36, 71, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 37, 5, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 38, 14, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 39, 57, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 40, 40, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 41, 32, 0);
INSERT INTO `penilaian` VALUES (3, 7, 2, 10, 42, 39, 0);
INSERT INTO `penilaian` VALUES (3, 7, 2, 10, 43, 0, 0);
INSERT INTO `penilaian` VALUES (3, 7, 2, 10, 44, 85, 0);
INSERT INTO `penilaian` VALUES (3, 7, 2, 10, 45, 24, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 12, 64, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 13, 50, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 14, 60, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 15, 50, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 16, 72, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 17, 9, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 18, 30, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 19, 22, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 20, 19, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 21, 33, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 22, 8, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 23, 40, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 24, 78, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 25, 70, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 26, 15, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 27, 66, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 28, 84, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 29, 25, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 30, 73, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 31, 92, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 32, 39, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 33, 22, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 34, 93, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 35, 99, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 36, 15, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 37, 78, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 38, 47, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 39, 0, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 40, 58, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 41, 94, 0);
INSERT INTO `penilaian` VALUES (3, 8, 2, 10, 42, 95, 0);
INSERT INTO `penilaian` VALUES (3, 8, 2, 10, 43, 94, 0);
INSERT INTO `penilaian` VALUES (3, 8, 2, 10, 44, 85, 0);
INSERT INTO `penilaian` VALUES (3, 8, 2, 10, 45, 42, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 12, 57, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 13, 60, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 14, 31, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 15, 73, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 16, 74, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 17, 52, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 18, 39, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 19, 41, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 20, 86, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 21, 7, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 22, 80, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 23, 77, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 24, 47, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 25, 5, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 26, 84, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 27, 4, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 28, 68, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 29, 31, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 30, 52, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 31, 67, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 32, 80, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 33, 99, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 34, 55, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 35, 79, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 36, 30, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 37, 12, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 38, 73, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 39, 27, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 40, 18, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 41, 10, 0);
INSERT INTO `penilaian` VALUES (3, 9, 2, 10, 42, 97, 0);
INSERT INTO `penilaian` VALUES (3, 9, 2, 10, 43, 53, 0);
INSERT INTO `penilaian` VALUES (3, 9, 2, 10, 44, 78, 0);
INSERT INTO `penilaian` VALUES (3, 9, 2, 10, 45, 29, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 12, 13, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 13, 76, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 14, 45, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 15, 95, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 16, 41, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 17, 22, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 18, 88, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 19, 71, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 20, 95, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 21, 61, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 22, 19, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 23, 13, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 24, 8, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 25, 1, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 26, 81, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 27, 2, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 28, 70, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 29, 44, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 30, 11, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 31, 23, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 32, 81, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 33, 37, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 34, 43, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 35, 2, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 36, 84, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 37, 16, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 38, 27, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 39, 88, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 40, 58, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 41, 28, 0);
INSERT INTO `penilaian` VALUES (3, 10, 2, 10, 42, 68, 0);
INSERT INTO `penilaian` VALUES (3, 10, 2, 10, 43, 56, 0);
INSERT INTO `penilaian` VALUES (3, 10, 2, 10, 44, 75, 0);
INSERT INTO `penilaian` VALUES (3, 10, 2, 10, 45, 8, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 12, 17, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 13, 59, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 14, 46, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 15, 54, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 16, 34, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 17, 7, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 18, 32, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 19, 42, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 20, 12, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 21, 37, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 22, 47, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 23, 26, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 24, 90, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 25, 71, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 26, 85, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 27, 15, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 28, 19, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 29, 51, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 30, 98, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 31, 36, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 32, 89, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 33, 38, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 34, 23, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 35, 99, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 36, 29, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 37, 48, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 38, 51, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 39, 15, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 40, 21, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 41, 62, 0);
INSERT INTO `penilaian` VALUES (3, 11, 2, 10, 42, 46, 0);
INSERT INTO `penilaian` VALUES (3, 11, 2, 10, 43, 45, 0);
INSERT INTO `penilaian` VALUES (3, 11, 2, 10, 44, 87, 0);
INSERT INTO `penilaian` VALUES (3, 11, 2, 10, 45, 0, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 12, 41, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 13, 3, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 14, 94, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 15, 61, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 16, 25, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 17, 42, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 18, 35, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 19, 51, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 20, 50, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 21, 98, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 22, 38, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 23, 0, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 24, 85, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 25, 25, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 26, 69, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 27, 73, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 28, 59, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 29, 74, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 30, 96, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 31, 59, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 32, 7, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 33, 58, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 34, 69, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 35, 70, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 36, 45, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 37, 14, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 38, 38, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 39, 47, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 40, 21, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 41, 66, 0);
INSERT INTO `penilaian` VALUES (3, 12, 2, 10, 42, 68, 0);
INSERT INTO `penilaian` VALUES (3, 12, 2, 10, 43, 41, 0);
INSERT INTO `penilaian` VALUES (3, 12, 2, 10, 44, 0, 0);
INSERT INTO `penilaian` VALUES (3, 12, 2, 10, 45, 80, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 12, 1, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 13, 65, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 14, 22, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 15, 16, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 16, 13, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 17, 18, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 18, 52, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 19, 6, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 20, 74, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 21, 52, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 22, 40, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 23, 45, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 24, 3, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 25, 83, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 26, 7, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 27, 87, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 28, 12, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 29, 99, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 30, 62, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 31, 14, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 32, 83, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 33, 72, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 34, 14, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 35, 55, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 36, 32, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 37, 97, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 38, 89, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 39, 53, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 40, 1, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 41, 44, 0);
INSERT INTO `penilaian` VALUES (3, 13, 2, 10, 42, 18, 0);
INSERT INTO `penilaian` VALUES (3, 13, 2, 10, 43, 57, 0);
INSERT INTO `penilaian` VALUES (3, 13, 2, 10, 44, 34, 0);
INSERT INTO `penilaian` VALUES (3, 13, 2, 10, 45, 99, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 12, 93, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 13, 67, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 14, 58, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 15, 89, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 16, 72, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 17, 95, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 18, 60, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 19, 15, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 20, 94, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 21, 25, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 22, 45, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 23, 50, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 24, 14, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 25, 20, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 26, 59, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 27, 35, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 28, 1, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 29, 0, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 30, 97, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 31, 85, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 32, 37, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 33, 27, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 34, 26, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 35, 51, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 36, 75, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 37, 23, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 38, 92, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 39, 92, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 40, 82, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 41, 35, 0);
INSERT INTO `penilaian` VALUES (3, 14, 2, 10, 42, 29, 0);
INSERT INTO `penilaian` VALUES (3, 14, 2, 10, 43, 43, 0);
INSERT INTO `penilaian` VALUES (3, 14, 2, 10, 44, 25, 0);
INSERT INTO `penilaian` VALUES (3, 14, 2, 10, 45, 99, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 12, 19, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 13, 97, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 14, 31, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 15, 66, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 16, 35, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 17, 80, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 18, 93, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 19, 28, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 20, 60, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 21, 15, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 22, 96, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 23, 35, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 24, 87, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 25, 31, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 26, 95, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 27, 81, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 28, 21, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 29, 63, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 30, 50, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 31, 65, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 32, 73, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 33, 71, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 34, 38, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 35, 75, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 36, 61, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 37, 83, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 38, 32, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 39, 9, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 40, 53, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 41, 37, 0);
INSERT INTO `penilaian` VALUES (3, 15, 2, 10, 42, 28, 0);
INSERT INTO `penilaian` VALUES (3, 15, 2, 10, 43, 27, 0);
INSERT INTO `penilaian` VALUES (3, 15, 2, 10, 44, 54, 0);
INSERT INTO `penilaian` VALUES (3, 15, 2, 10, 45, 87, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 12, 76, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 13, 16, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 14, 56, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 15, 33, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 16, 95, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 17, 77, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 18, 2, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 19, 78, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 20, 86, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 21, 94, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 22, 13, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 23, 84, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 24, 80, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 25, 50, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 26, 10, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 27, 1, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 28, 76, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 29, 77, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 30, 57, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 31, 55, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 32, 6, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 33, 65, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 34, 9, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 35, 48, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 36, 15, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 37, 33, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 38, 19, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 39, 98, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 40, 32, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 41, 67, 0);
INSERT INTO `penilaian` VALUES (3, 16, 2, 10, 42, 38, 0);
INSERT INTO `penilaian` VALUES (3, 16, 2, 10, 43, 92, 0);
INSERT INTO `penilaian` VALUES (3, 16, 2, 10, 44, 47, 0);
INSERT INTO `penilaian` VALUES (3, 16, 2, 10, 45, 59, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 12, 52, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 13, 87, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 14, 77, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 15, 26, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 16, 0, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 17, 24, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 18, 17, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 19, 15, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 20, 24, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 21, 78, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 22, 15, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 23, 44, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 24, 76, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 25, 48, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 26, 12, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 27, 15, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 28, 41, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 29, 60, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 30, 79, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 31, 16, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 32, 43, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 33, 65, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 34, 0, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 35, 2, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 36, 13, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 37, 59, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 38, 56, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 39, 5, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 40, 58, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 41, 75, 0);
INSERT INTO `penilaian` VALUES (3, 17, 2, 10, 42, 1, 0);
INSERT INTO `penilaian` VALUES (3, 17, 2, 10, 43, 81, 0);
INSERT INTO `penilaian` VALUES (3, 17, 2, 10, 44, 4, 0);
INSERT INTO `penilaian` VALUES (3, 17, 2, 10, 45, 75, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 12, 63, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 13, 93, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 14, 77, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 15, 4, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 16, 89, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 17, 33, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 18, 0, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 19, 0, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 20, 1, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 21, 8, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 22, 34, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 23, 47, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 24, 34, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 25, 31, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 26, 52, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 27, 68, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 28, 83, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 29, 13, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 30, 16, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 31, 41, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 32, 57, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 33, 63, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 34, 44, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 35, 31, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 36, 23, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 37, 21, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 38, 40, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 39, 35, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 40, 55, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 41, 72, 0);
INSERT INTO `penilaian` VALUES (3, 18, 2, 10, 42, 95, 0);
INSERT INTO `penilaian` VALUES (3, 18, 2, 10, 43, 58, 0);
INSERT INTO `penilaian` VALUES (3, 18, 2, 10, 44, 8, 0);
INSERT INTO `penilaian` VALUES (3, 18, 2, 10, 45, 66, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 12, 8, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 13, 41, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 14, 83, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 15, 92, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 16, 9, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 17, 72, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 18, 34, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 19, 55, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 20, 74, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 21, 5, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 22, 3, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 23, 2, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 24, 2, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 25, 3, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 26, 8, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 27, 34, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 28, 45, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 29, 22, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 30, 77, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 31, 20, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 32, 71, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 33, 93, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 34, 52, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 35, 82, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 36, 53, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 37, 20, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 38, 41, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 39, 46, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 40, 8, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 41, 1, 0);
INSERT INTO `penilaian` VALUES (3, 19, 2, 10, 42, 84, 0);
INSERT INTO `penilaian` VALUES (3, 19, 2, 10, 43, 17, 0);
INSERT INTO `penilaian` VALUES (3, 19, 2, 10, 44, 34, 0);
INSERT INTO `penilaian` VALUES (3, 19, 2, 10, 45, 20, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 12, 99, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 13, 36, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 14, 82, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 15, 3, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 16, 69, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 17, 36, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 18, 75, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 19, 66, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 20, 6, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 21, 34, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 22, 51, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 23, 55, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 24, 21, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 25, 41, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 26, 42, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 27, 89, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 28, 20, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 29, 32, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 30, 99, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 31, 3, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 32, 16, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 33, 74, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 34, 22, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 35, 87, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 36, 70, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 37, 90, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 38, 41, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 39, 33, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 40, 43, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 41, 18, 0);
INSERT INTO `penilaian` VALUES (3, 20, 2, 10, 42, 60, 0);
INSERT INTO `penilaian` VALUES (3, 20, 2, 10, 43, 47, 0);
INSERT INTO `penilaian` VALUES (3, 20, 2, 10, 44, 55, 0);
INSERT INTO `penilaian` VALUES (3, 20, 2, 10, 45, 35, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 12, 9, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 13, 41, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 14, 81, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 15, 80, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 16, 60, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 17, 59, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 18, 17, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 19, 8, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 20, 89, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 21, 22, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 22, 42, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 23, 45, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 24, 1, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 25, 69, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 26, 43, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 27, 6, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 28, 5, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 29, 7, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 30, 19, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 31, 77, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 32, 28, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 33, 11, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 34, 68, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 35, 11, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 36, 49, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 37, 12, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 38, 14, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 39, 36, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 40, 37, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 41, 78, 0);
INSERT INTO `penilaian` VALUES (3, 21, 2, 10, 42, 79, 0);
INSERT INTO `penilaian` VALUES (3, 21, 2, 10, 43, 63, 0);
INSERT INTO `penilaian` VALUES (3, 21, 2, 10, 44, 76, 0);
INSERT INTO `penilaian` VALUES (3, 21, 2, 10, 45, 95, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 12, 45, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 13, 41, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 14, 71, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 15, 34, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 16, 56, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 17, 79, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 18, 27, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 19, 99, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 20, 16, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 21, 82, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 22, 61, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 23, 61, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 24, 24, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 25, 36, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 26, 8, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 27, 33, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 28, 42, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 29, 11, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 30, 28, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 31, 8, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 32, 59, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 33, 69, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 34, 69, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 35, 40, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 36, 94, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 37, 51, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 38, 73, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 39, 10, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 40, 33, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 41, 37, 0);
INSERT INTO `penilaian` VALUES (3, 22, 2, 10, 42, 84, 0);
INSERT INTO `penilaian` VALUES (3, 22, 2, 10, 43, 12, 0);
INSERT INTO `penilaian` VALUES (3, 22, 2, 10, 44, 9, 0);
INSERT INTO `penilaian` VALUES (3, 22, 2, 10, 45, 8, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 12, 14, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 13, 45, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 14, 86, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 15, 95, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 16, 18, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 17, 3, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 18, 64, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 19, 13, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 20, 70, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 21, 13, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 22, 56, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 23, 39, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 24, 30, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 25, 33, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 26, 74, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 27, 71, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 28, 34, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 29, 56, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 30, 82, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 31, 39, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 32, 53, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 33, 47, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 34, 77, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 35, 43, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 36, 86, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 37, 99, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 38, 41, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 39, 7, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 40, 11, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 41, 36, 0);
INSERT INTO `penilaian` VALUES (4, 3, 2, 10, 42, 47, 0);
INSERT INTO `penilaian` VALUES (4, 3, 2, 10, 43, 27, 0);
INSERT INTO `penilaian` VALUES (4, 3, 2, 10, 44, 97, 0);
INSERT INTO `penilaian` VALUES (4, 3, 2, 10, 45, 3, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 12, 23, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 13, 8, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 14, 71, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 15, 32, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 16, 47, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 17, 42, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 18, 67, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 19, 9, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 20, 47, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 21, 7, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 22, 95, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 23, 56, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 24, 95, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 25, 5, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 26, 43, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 27, 99, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 28, 69, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 29, 47, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 30, 27, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 31, 95, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 32, 96, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 33, 94, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 34, 82, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 35, 30, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 36, 5, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 37, 35, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 38, 59, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 39, 93, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 40, 86, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 41, 52, 0);
INSERT INTO `penilaian` VALUES (4, 4, 2, 10, 42, 2, 0);
INSERT INTO `penilaian` VALUES (4, 4, 2, 10, 43, 54, 0);
INSERT INTO `penilaian` VALUES (4, 4, 2, 10, 44, 64, 0);
INSERT INTO `penilaian` VALUES (4, 4, 2, 10, 45, 60, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 12, 10, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 13, 69, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 14, 15, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 15, 69, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 16, 2, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 17, 2, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 18, 6, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 19, 25, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 20, 6, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 21, 58, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 22, 71, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 23, 80, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 24, 87, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 25, 95, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 26, 15, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 27, 92, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 28, 13, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 29, 91, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 30, 16, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 31, 9, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 32, 96, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 33, 55, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 34, 85, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 35, 63, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 36, 58, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 37, 4, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 38, 44, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 39, 9, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 40, 14, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 41, 44, 0);
INSERT INTO `penilaian` VALUES (4, 5, 2, 10, 42, 76, 0);
INSERT INTO `penilaian` VALUES (4, 5, 2, 10, 43, 51, 0);
INSERT INTO `penilaian` VALUES (4, 5, 2, 10, 44, 28, 0);
INSERT INTO `penilaian` VALUES (4, 5, 2, 10, 45, 88, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 12, 54, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 13, 9, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 14, 84, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 15, 93, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 16, 14, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 17, 89, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 18, 5, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 19, 57, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 20, 73, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 21, 93, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 22, 45, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 23, 49, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 24, 8, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 25, 93, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 26, 41, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 27, 27, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 28, 15, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 29, 91, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 30, 13, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 31, 91, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 32, 15, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 33, 5, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 34, 79, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 35, 80, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 36, 65, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 37, 84, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 38, 24, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 39, 70, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 40, 80, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 41, 89, 0);
INSERT INTO `penilaian` VALUES (4, 6, 2, 10, 42, 4, 0);
INSERT INTO `penilaian` VALUES (4, 6, 2, 10, 43, 55, 0);
INSERT INTO `penilaian` VALUES (4, 6, 2, 10, 44, 64, 0);
INSERT INTO `penilaian` VALUES (4, 6, 2, 10, 45, 57, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 12, 92, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 13, 89, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 14, 70, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 15, 83, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 16, 4, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 17, 71, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 18, 46, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 19, 18, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 20, 50, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 21, 97, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 22, 36, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 23, 92, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 24, 49, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 25, 70, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 26, 4, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 27, 9, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 28, 34, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 29, 42, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 30, 11, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 31, 28, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 32, 8, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 33, 56, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 34, 56, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 35, 15, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 36, 6, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 37, 84, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 38, 5, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 39, 72, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 40, 47, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 41, 18, 0);
INSERT INTO `penilaian` VALUES (4, 7, 2, 10, 42, 50, 0);
INSERT INTO `penilaian` VALUES (4, 7, 2, 10, 43, 96, 0);
INSERT INTO `penilaian` VALUES (4, 7, 2, 10, 44, 29, 0);
INSERT INTO `penilaian` VALUES (4, 7, 2, 10, 45, 60, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 12, 14, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 13, 92, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 14, 15, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 15, 1, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 16, 61, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 17, 2, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 18, 29, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 19, 38, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 20, 3, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 21, 3, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 22, 4, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 23, 12, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 24, 51, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 25, 18, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 26, 35, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 27, 25, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 28, 20, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 29, 27, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 30, 72, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 31, 83, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 32, 98, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 33, 42, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 34, 18, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 35, 64, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 36, 65, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 37, 33, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 38, 71, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 39, 57, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 40, 72, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 41, 88, 0);
INSERT INTO `penilaian` VALUES (4, 8, 2, 10, 42, 26, 0);
INSERT INTO `penilaian` VALUES (4, 8, 2, 10, 43, 67, 0);
INSERT INTO `penilaian` VALUES (4, 8, 2, 10, 44, 57, 0);
INSERT INTO `penilaian` VALUES (4, 8, 2, 10, 45, 83, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 12, 47, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 13, 85, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 14, 87, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 15, 78, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 16, 30, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 17, 18, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 18, 0, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 19, 47, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 20, 36, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 21, 38, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 22, 83, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 23, 1, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 24, 55, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 25, 73, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 26, 1, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 27, 85, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 28, 23, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 29, 61, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 30, 38, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 31, 7, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 32, 21, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 33, 87, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 34, 69, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 35, 87, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 36, 28, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 37, 78, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 38, 7, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 39, 4, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 40, 97, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 41, 72, 0);
INSERT INTO `penilaian` VALUES (4, 9, 2, 10, 42, 72, 0);
INSERT INTO `penilaian` VALUES (4, 9, 2, 10, 43, 43, 0);
INSERT INTO `penilaian` VALUES (4, 9, 2, 10, 44, 99, 0);
INSERT INTO `penilaian` VALUES (4, 9, 2, 10, 45, 66, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 12, 35, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 13, 78, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 14, 84, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 15, 88, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 16, 87, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 17, 71, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 18, 95, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 19, 64, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 20, 35, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 21, 84, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 22, 13, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 23, 16, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 24, 40, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 25, 51, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 26, 39, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 27, 39, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 28, 81, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 29, 89, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 30, 1, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 31, 39, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 32, 91, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 33, 41, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 34, 32, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 35, 35, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 36, 82, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 37, 6, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 38, 83, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 39, 99, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 40, 48, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 41, 40, 0);
INSERT INTO `penilaian` VALUES (4, 10, 2, 10, 42, 59, 0);
INSERT INTO `penilaian` VALUES (4, 10, 2, 10, 43, 76, 0);
INSERT INTO `penilaian` VALUES (4, 10, 2, 10, 44, 4, 0);
INSERT INTO `penilaian` VALUES (4, 10, 2, 10, 45, 91, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 12, 46, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 13, 55, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 14, 38, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 15, 26, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 16, 17, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 17, 6, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 18, 81, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 19, 87, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 20, 93, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 21, 4, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 22, 44, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 23, 5, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 24, 94, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 25, 56, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 26, 98, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 27, 24, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 28, 25, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 29, 52, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 30, 88, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 31, 83, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 32, 53, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 33, 14, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 34, 13, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 35, 24, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 36, 81, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 37, 33, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 38, 21, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 39, 8, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 40, 77, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 41, 63, 0);
INSERT INTO `penilaian` VALUES (4, 11, 2, 10, 42, 84, 0);
INSERT INTO `penilaian` VALUES (4, 11, 2, 10, 43, 32, 0);
INSERT INTO `penilaian` VALUES (4, 11, 2, 10, 44, 10, 0);
INSERT INTO `penilaian` VALUES (4, 11, 2, 10, 45, 51, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 12, 29, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 13, 91, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 14, 67, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 15, 64, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 16, 17, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 17, 97, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 18, 33, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 19, 75, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 20, 76, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 21, 57, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 22, 56, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 23, 9, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 24, 80, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 25, 71, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 26, 15, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 27, 62, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 28, 64, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 29, 38, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 30, 97, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 31, 71, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 32, 65, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 33, 11, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 34, 59, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 35, 66, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 36, 52, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 37, 65, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 38, 67, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 39, 41, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 40, 5, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 41, 1, 0);
INSERT INTO `penilaian` VALUES (4, 12, 2, 10, 42, 93, 0);
INSERT INTO `penilaian` VALUES (4, 12, 2, 10, 43, 62, 0);
INSERT INTO `penilaian` VALUES (4, 12, 2, 10, 44, 31, 0);
INSERT INTO `penilaian` VALUES (4, 12, 2, 10, 45, 70, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 12, 58, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 13, 78, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 14, 19, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 15, 61, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 16, 50, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 17, 66, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 18, 81, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 19, 8, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 20, 97, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 21, 61, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 22, 16, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 23, 95, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 24, 30, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 25, 65, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 26, 36, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 27, 84, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 28, 11, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 29, 6, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 30, 98, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 31, 71, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 32, 63, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 33, 1, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 34, 17, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 35, 84, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 36, 68, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 37, 87, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 38, 34, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 39, 7, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 40, 34, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 41, 52, 0);
INSERT INTO `penilaian` VALUES (4, 13, 2, 10, 42, 55, 0);
INSERT INTO `penilaian` VALUES (4, 13, 2, 10, 43, 23, 0);
INSERT INTO `penilaian` VALUES (4, 13, 2, 10, 44, 49, 0);
INSERT INTO `penilaian` VALUES (4, 13, 2, 10, 45, 76, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 12, 32, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 13, 34, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 14, 75, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 15, 74, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 16, 47, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 17, 11, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 18, 15, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 19, 44, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 20, 73, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 21, 35, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 22, 54, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 23, 69, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 24, 83, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 25, 7, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 26, 86, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 27, 10, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 28, 93, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 29, 33, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 30, 90, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 31, 50, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 32, 80, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 33, 51, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 34, 15, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 35, 22, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 36, 64, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 37, 56, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 38, 90, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 39, 82, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 40, 41, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 41, 59, 0);
INSERT INTO `penilaian` VALUES (4, 14, 2, 10, 42, 71, 0);
INSERT INTO `penilaian` VALUES (4, 14, 2, 10, 43, 80, 0);
INSERT INTO `penilaian` VALUES (4, 14, 2, 10, 44, 88, 0);
INSERT INTO `penilaian` VALUES (4, 14, 2, 10, 45, 0, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 12, 35, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 13, 78, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 14, 84, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 15, 87, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 16, 82, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 17, 50, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 18, 4, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 19, 70, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 20, 40, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 21, 92, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 22, 38, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 23, 17, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 24, 68, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 25, 92, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 26, 57, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 27, 9, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 28, 75, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 29, 48, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 30, 15, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 31, 31, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 32, 10, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 33, 58, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 34, 60, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 35, 28, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 36, 59, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 37, 10, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 38, 77, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 39, 53, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 40, 35, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 41, 17, 0);
INSERT INTO `penilaian` VALUES (4, 15, 2, 10, 42, 81, 0);
INSERT INTO `penilaian` VALUES (4, 15, 2, 10, 43, 55, 0);
INSERT INTO `penilaian` VALUES (4, 15, 2, 10, 44, 30, 0);
INSERT INTO `penilaian` VALUES (4, 15, 2, 10, 45, 86, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 12, 43, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 13, 56, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 14, 53, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 15, 99, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 16, 33, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 17, 69, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 18, 48, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 19, 32, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 20, 18, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 21, 92, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 22, 9, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 23, 71, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 24, 26, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 25, 16, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 26, 6, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 27, 81, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 28, 89, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 29, 0, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 30, 36, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 31, 78, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 32, 82, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 33, 78, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 34, 46, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 35, 96, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 36, 40, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 37, 15, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 38, 53, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 39, 22, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 40, 51, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 41, 91, 0);
INSERT INTO `penilaian` VALUES (4, 16, 2, 10, 42, 0, 0);
INSERT INTO `penilaian` VALUES (4, 16, 2, 10, 43, 29, 0);
INSERT INTO `penilaian` VALUES (4, 16, 2, 10, 44, 44, 0);
INSERT INTO `penilaian` VALUES (4, 16, 2, 10, 45, 33, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 12, 32, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 13, 65, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 14, 29, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 15, 52, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 16, 71, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 17, 1, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 18, 93, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 19, 61, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 20, 26, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 21, 47, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 22, 60, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 23, 58, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 24, 11, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 25, 81, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 26, 73, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 27, 22, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 28, 91, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 29, 89, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 30, 72, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 31, 95, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 32, 61, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 33, 18, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 34, 8, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 35, 86, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 36, 8, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 37, 81, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 38, 80, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 39, 60, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 40, 61, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 41, 26, 0);
INSERT INTO `penilaian` VALUES (4, 17, 2, 10, 42, 48, 0);
INSERT INTO `penilaian` VALUES (4, 17, 2, 10, 43, 60, 0);
INSERT INTO `penilaian` VALUES (4, 17, 2, 10, 44, 60, 0);
INSERT INTO `penilaian` VALUES (4, 17, 2, 10, 45, 17, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 12, 6, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 13, 78, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 14, 76, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 15, 45, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 16, 98, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 17, 53, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 18, 74, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 19, 10, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 20, 31, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 21, 22, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 22, 19, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 23, 31, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 24, 97, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 25, 94, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 26, 77, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 27, 4, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 28, 88, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 29, 32, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 30, 93, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 31, 73, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 32, 84, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 33, 3, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 34, 63, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 35, 5, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 36, 37, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 37, 69, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 38, 36, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 39, 75, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 40, 66, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 41, 6, 0);
INSERT INTO `penilaian` VALUES (4, 18, 2, 10, 42, 31, 0);
INSERT INTO `penilaian` VALUES (4, 18, 2, 10, 43, 39, 0);
INSERT INTO `penilaian` VALUES (4, 18, 2, 10, 44, 3, 0);
INSERT INTO `penilaian` VALUES (4, 18, 2, 10, 45, 96, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 12, 72, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 13, 74, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 14, 56, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 15, 56, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 16, 15, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 17, 6, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 18, 84, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 19, 2, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 20, 59, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 21, 91, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 22, 76, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 23, 8, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 24, 13, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 25, 42, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 26, 70, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 27, 25, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 28, 18, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 29, 12, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 30, 9, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 31, 10, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 32, 23, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 33, 85, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 34, 58, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 35, 34, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 36, 97, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 37, 83, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 38, 25, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 39, 78, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 40, 16, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 41, 44, 0);
INSERT INTO `penilaian` VALUES (4, 19, 2, 10, 42, 74, 0);
INSERT INTO `penilaian` VALUES (4, 19, 2, 10, 43, 37, 0);
INSERT INTO `penilaian` VALUES (4, 19, 2, 10, 44, 66, 0);
INSERT INTO `penilaian` VALUES (4, 19, 2, 10, 45, 16, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 12, 86, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 13, 81, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 14, 46, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 15, 89, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 16, 8, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 17, 74, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 18, 47, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 19, 14, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 20, 28, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 21, 97, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 22, 3, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 23, 23, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 24, 8, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 25, 71, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 26, 31, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 27, 43, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 28, 24, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 29, 88, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 30, 71, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 31, 93, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 32, 51, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 33, 78, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 34, 37, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 35, 51, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 36, 45, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 37, 72, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 38, 25, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 39, 10, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 40, 75, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 41, 46, 0);
INSERT INTO `penilaian` VALUES (4, 20, 2, 10, 42, 7, 0);
INSERT INTO `penilaian` VALUES (4, 20, 2, 10, 43, 96, 0);
INSERT INTO `penilaian` VALUES (4, 20, 2, 10, 44, 59, 0);
INSERT INTO `penilaian` VALUES (4, 20, 2, 10, 45, 10, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 12, 72, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 13, 29, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 14, 30, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 15, 65, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 16, 33, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 17, 71, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 18, 58, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 19, 76, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 20, 9, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 21, 17, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 22, 56, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 23, 31, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 24, 86, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 25, 37, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 26, 28, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 27, 30, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 28, 68, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 29, 51, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 30, 49, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 31, 92, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 32, 14, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 33, 95, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 34, 34, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 35, 84, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 36, 18, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 37, 39, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 38, 42, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 39, 94, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 40, 44, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 41, 37, 0);
INSERT INTO `penilaian` VALUES (4, 21, 2, 10, 42, 53, 0);
INSERT INTO `penilaian` VALUES (4, 21, 2, 10, 43, 54, 0);
INSERT INTO `penilaian` VALUES (4, 21, 2, 10, 44, 11, 0);
INSERT INTO `penilaian` VALUES (4, 21, 2, 10, 45, 93, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 12, 35, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 13, 95, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 14, 70, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 15, 68, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 16, 30, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 17, 46, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 18, 40, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 19, 63, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 20, 97, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 21, 96, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 22, 87, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 23, 49, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 24, 84, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 25, 75, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 26, 23, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 27, 90, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 28, 80, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 29, 32, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 30, 19, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 31, 1, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 32, 48, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 33, 36, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 34, 36, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 35, 73, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 36, 60, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 37, 78, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 38, 13, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 39, 31, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 40, 17, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 41, 92, 0);
INSERT INTO `penilaian` VALUES (4, 22, 2, 10, 42, 9, 0);
INSERT INTO `penilaian` VALUES (4, 22, 2, 10, 43, 69, 0);
INSERT INTO `penilaian` VALUES (4, 22, 2, 10, 44, 20, 0);
INSERT INTO `penilaian` VALUES (4, 22, 2, 10, 45, 93, 0);
INSERT INTO `penilaian` VALUES (5, 3, 3, 11, 55, 6, 0);
INSERT INTO `penilaian` VALUES (5, 3, 3, 11, 56, 50, 0);
INSERT INTO `penilaian` VALUES (5, 3, 3, 11, 57, 31, 0);
INSERT INTO `penilaian` VALUES (5, 3, 3, 11, 58, 8, 0);
INSERT INTO `penilaian` VALUES (5, 3, 3, 11, 59, 49, 0);
INSERT INTO `penilaian` VALUES (5, 3, 4, 13, 50, 19, 0);
INSERT INTO `penilaian` VALUES (5, 3, 4, 13, 51, 51, 0);
INSERT INTO `penilaian` VALUES (5, 3, 4, 13, 52, 99, 0);
INSERT INTO `penilaian` VALUES (5, 3, 4, 13, 53, 40, 0);
INSERT INTO `penilaian` VALUES (5, 3, 4, 13, 54, 3, 0);
INSERT INTO `penilaian` VALUES (5, 3, 5, 12, 46, 94, 0);
INSERT INTO `penilaian` VALUES (5, 3, 5, 12, 47, 65, 0);
INSERT INTO `penilaian` VALUES (5, 3, 5, 12, 48, 42, 0);
INSERT INTO `penilaian` VALUES (5, 3, 5, 12, 49, 17, 0);
INSERT INTO `penilaian` VALUES (5, 3, 7, 14, 60, 60, 0);
INSERT INTO `penilaian` VALUES (5, 3, 7, 14, 61, 49, 0);
INSERT INTO `penilaian` VALUES (5, 3, 7, 14, 62, 67, 0);
INSERT INTO `penilaian` VALUES (5, 3, 7, 14, 63, 86, 0);
INSERT INTO `penilaian` VALUES (5, 4, 3, 11, 55, 29, 0);
INSERT INTO `penilaian` VALUES (5, 4, 3, 11, 56, 88, 0);
INSERT INTO `penilaian` VALUES (5, 4, 3, 11, 57, 54, 0);
INSERT INTO `penilaian` VALUES (5, 4, 3, 11, 58, 8, 0);
INSERT INTO `penilaian` VALUES (5, 4, 3, 11, 59, 78, 0);
INSERT INTO `penilaian` VALUES (5, 4, 4, 13, 50, 67, 0);
INSERT INTO `penilaian` VALUES (5, 4, 4, 13, 51, 3, 0);
INSERT INTO `penilaian` VALUES (5, 4, 4, 13, 52, 13, 0);
INSERT INTO `penilaian` VALUES (5, 4, 4, 13, 53, 56, 0);
INSERT INTO `penilaian` VALUES (5, 4, 4, 13, 54, 41, 0);
INSERT INTO `penilaian` VALUES (5, 4, 5, 12, 46, 40, 0);
INSERT INTO `penilaian` VALUES (5, 4, 5, 12, 47, 75, 0);
INSERT INTO `penilaian` VALUES (5, 4, 5, 12, 48, 55, 0);
INSERT INTO `penilaian` VALUES (5, 4, 5, 12, 49, 53, 0);
INSERT INTO `penilaian` VALUES (5, 4, 7, 14, 60, 0, 0);
INSERT INTO `penilaian` VALUES (5, 4, 7, 14, 61, 40, 0);
INSERT INTO `penilaian` VALUES (5, 4, 7, 14, 62, 2, 0);
INSERT INTO `penilaian` VALUES (5, 4, 7, 14, 63, 91, 0);
INSERT INTO `penilaian` VALUES (5, 5, 3, 11, 55, 47, 0);
INSERT INTO `penilaian` VALUES (5, 5, 3, 11, 56, 66, 0);
INSERT INTO `penilaian` VALUES (5, 5, 3, 11, 57, 86, 0);
INSERT INTO `penilaian` VALUES (5, 5, 3, 11, 58, 34, 0);
INSERT INTO `penilaian` VALUES (5, 5, 3, 11, 59, 11, 0);
INSERT INTO `penilaian` VALUES (5, 5, 4, 13, 50, 56, 0);
INSERT INTO `penilaian` VALUES (5, 5, 4, 13, 51, 45, 0);
INSERT INTO `penilaian` VALUES (5, 5, 4, 13, 52, 60, 0);
INSERT INTO `penilaian` VALUES (5, 5, 4, 13, 53, 62, 0);
INSERT INTO `penilaian` VALUES (5, 5, 4, 13, 54, 34, 0);
INSERT INTO `penilaian` VALUES (5, 5, 5, 12, 46, 82, 0);
INSERT INTO `penilaian` VALUES (5, 5, 5, 12, 47, 9, 0);
INSERT INTO `penilaian` VALUES (5, 5, 5, 12, 48, 1, 0);
INSERT INTO `penilaian` VALUES (5, 5, 5, 12, 49, 78, 0);
INSERT INTO `penilaian` VALUES (5, 5, 7, 14, 60, 89, 0);
INSERT INTO `penilaian` VALUES (5, 5, 7, 14, 61, 10, 0);
INSERT INTO `penilaian` VALUES (5, 5, 7, 14, 62, 83, 0);
INSERT INTO `penilaian` VALUES (5, 5, 7, 14, 63, 85, 0);
INSERT INTO `penilaian` VALUES (5, 6, 3, 11, 55, 75, 0);
INSERT INTO `penilaian` VALUES (5, 6, 3, 11, 56, 23, 0);
INSERT INTO `penilaian` VALUES (5, 6, 3, 11, 57, 90, 0);
INSERT INTO `penilaian` VALUES (5, 6, 3, 11, 58, 81, 0);
INSERT INTO `penilaian` VALUES (5, 6, 3, 11, 59, 35, 0);
INSERT INTO `penilaian` VALUES (5, 6, 4, 13, 50, 32, 0);
INSERT INTO `penilaian` VALUES (5, 6, 4, 13, 51, 57, 0);
INSERT INTO `penilaian` VALUES (5, 6, 4, 13, 52, 88, 0);
INSERT INTO `penilaian` VALUES (5, 6, 4, 13, 53, 69, 0);
INSERT INTO `penilaian` VALUES (5, 6, 4, 13, 54, 81, 0);
INSERT INTO `penilaian` VALUES (5, 6, 5, 12, 46, 99, 0);
INSERT INTO `penilaian` VALUES (5, 6, 5, 12, 47, 54, 0);
INSERT INTO `penilaian` VALUES (5, 6, 5, 12, 48, 74, 0);
INSERT INTO `penilaian` VALUES (5, 6, 5, 12, 49, 6, 0);
INSERT INTO `penilaian` VALUES (5, 6, 7, 14, 60, 12, 0);
INSERT INTO `penilaian` VALUES (5, 6, 7, 14, 61, 39, 0);
INSERT INTO `penilaian` VALUES (5, 6, 7, 14, 62, 63, 0);
INSERT INTO `penilaian` VALUES (5, 6, 7, 14, 63, 96, 0);
INSERT INTO `penilaian` VALUES (5, 7, 3, 11, 55, 92, 0);
INSERT INTO `penilaian` VALUES (5, 7, 3, 11, 56, 74, 0);
INSERT INTO `penilaian` VALUES (5, 7, 3, 11, 57, 96, 0);
INSERT INTO `penilaian` VALUES (5, 7, 3, 11, 58, 55, 0);
INSERT INTO `penilaian` VALUES (5, 7, 3, 11, 59, 89, 0);
INSERT INTO `penilaian` VALUES (5, 7, 4, 13, 50, 82, 0);
INSERT INTO `penilaian` VALUES (5, 7, 4, 13, 51, 42, 0);
INSERT INTO `penilaian` VALUES (5, 7, 4, 13, 52, 63, 0);
INSERT INTO `penilaian` VALUES (5, 7, 4, 13, 53, 92, 0);
INSERT INTO `penilaian` VALUES (5, 7, 4, 13, 54, 73, 0);
INSERT INTO `penilaian` VALUES (5, 7, 5, 12, 46, 86, 0);
INSERT INTO `penilaian` VALUES (5, 7, 5, 12, 47, 15, 0);
INSERT INTO `penilaian` VALUES (5, 7, 5, 12, 48, 14, 0);
INSERT INTO `penilaian` VALUES (5, 7, 5, 12, 49, 29, 0);
INSERT INTO `penilaian` VALUES (5, 7, 7, 14, 60, 1, 0);
INSERT INTO `penilaian` VALUES (5, 7, 7, 14, 61, 20, 0);
INSERT INTO `penilaian` VALUES (5, 7, 7, 14, 62, 97, 0);
INSERT INTO `penilaian` VALUES (5, 7, 7, 14, 63, 26, 0);
INSERT INTO `penilaian` VALUES (5, 8, 3, 11, 55, 39, 0);
INSERT INTO `penilaian` VALUES (5, 8, 3, 11, 56, 19, 0);
INSERT INTO `penilaian` VALUES (5, 8, 3, 11, 57, 79, 0);
INSERT INTO `penilaian` VALUES (5, 8, 3, 11, 58, 36, 0);
INSERT INTO `penilaian` VALUES (5, 8, 3, 11, 59, 45, 0);
INSERT INTO `penilaian` VALUES (5, 8, 4, 13, 50, 15, 0);
INSERT INTO `penilaian` VALUES (5, 8, 4, 13, 51, 44, 0);
INSERT INTO `penilaian` VALUES (5, 8, 4, 13, 52, 73, 0);
INSERT INTO `penilaian` VALUES (5, 8, 4, 13, 53, 36, 0);
INSERT INTO `penilaian` VALUES (5, 8, 4, 13, 54, 60, 0);
INSERT INTO `penilaian` VALUES (5, 8, 5, 12, 46, 92, 0);
INSERT INTO `penilaian` VALUES (5, 8, 5, 12, 47, 82, 0);
INSERT INTO `penilaian` VALUES (5, 8, 5, 12, 48, 33, 0);
INSERT INTO `penilaian` VALUES (5, 8, 5, 12, 49, 22, 0);
INSERT INTO `penilaian` VALUES (5, 8, 7, 14, 60, 10, 0);
INSERT INTO `penilaian` VALUES (5, 8, 7, 14, 61, 83, 0);
INSERT INTO `penilaian` VALUES (5, 8, 7, 14, 62, 89, 0);
INSERT INTO `penilaian` VALUES (5, 8, 7, 14, 63, 93, 0);
INSERT INTO `penilaian` VALUES (5, 9, 3, 11, 55, 0, 0);
INSERT INTO `penilaian` VALUES (5, 9, 3, 11, 56, 23, 0);
INSERT INTO `penilaian` VALUES (5, 9, 3, 11, 57, 16, 0);
INSERT INTO `penilaian` VALUES (5, 9, 3, 11, 58, 11, 0);
INSERT INTO `penilaian` VALUES (5, 9, 3, 11, 59, 8, 0);
INSERT INTO `penilaian` VALUES (5, 9, 4, 13, 50, 5, 0);
INSERT INTO `penilaian` VALUES (5, 9, 4, 13, 51, 2, 0);
INSERT INTO `penilaian` VALUES (5, 9, 4, 13, 52, 97, 0);
INSERT INTO `penilaian` VALUES (5, 9, 4, 13, 53, 77, 0);
INSERT INTO `penilaian` VALUES (5, 9, 4, 13, 54, 96, 0);
INSERT INTO `penilaian` VALUES (5, 9, 5, 12, 46, 48, 0);
INSERT INTO `penilaian` VALUES (5, 9, 5, 12, 47, 55, 0);
INSERT INTO `penilaian` VALUES (5, 9, 5, 12, 48, 32, 0);
INSERT INTO `penilaian` VALUES (5, 9, 5, 12, 49, 94, 0);
INSERT INTO `penilaian` VALUES (5, 9, 7, 14, 60, 74, 0);
INSERT INTO `penilaian` VALUES (5, 9, 7, 14, 61, 91, 0);
INSERT INTO `penilaian` VALUES (5, 9, 7, 14, 62, 31, 0);
INSERT INTO `penilaian` VALUES (5, 9, 7, 14, 63, 83, 0);
INSERT INTO `penilaian` VALUES (5, 10, 3, 11, 55, 23, 0);
INSERT INTO `penilaian` VALUES (5, 10, 3, 11, 56, 66, 0);
INSERT INTO `penilaian` VALUES (5, 10, 3, 11, 57, 61, 0);
INSERT INTO `penilaian` VALUES (5, 10, 3, 11, 58, 10, 0);
INSERT INTO `penilaian` VALUES (5, 10, 3, 11, 59, 67, 0);
INSERT INTO `penilaian` VALUES (5, 10, 4, 13, 50, 3, 0);
INSERT INTO `penilaian` VALUES (5, 10, 4, 13, 51, 17, 0);
INSERT INTO `penilaian` VALUES (5, 10, 4, 13, 52, 74, 0);
INSERT INTO `penilaian` VALUES (5, 10, 4, 13, 53, 20, 0);
INSERT INTO `penilaian` VALUES (5, 10, 4, 13, 54, 78, 0);
INSERT INTO `penilaian` VALUES (5, 10, 5, 12, 46, 30, 0);
INSERT INTO `penilaian` VALUES (5, 10, 5, 12, 47, 17, 0);
INSERT INTO `penilaian` VALUES (5, 10, 5, 12, 48, 97, 0);
INSERT INTO `penilaian` VALUES (5, 10, 5, 12, 49, 36, 0);
INSERT INTO `penilaian` VALUES (5, 10, 7, 14, 60, 86, 0);
INSERT INTO `penilaian` VALUES (5, 10, 7, 14, 61, 24, 0);
INSERT INTO `penilaian` VALUES (5, 10, 7, 14, 62, 61, 0);
INSERT INTO `penilaian` VALUES (5, 10, 7, 14, 63, 36, 0);
INSERT INTO `penilaian` VALUES (5, 11, 3, 11, 55, 96, 0);
INSERT INTO `penilaian` VALUES (5, 11, 3, 11, 56, 74, 0);
INSERT INTO `penilaian` VALUES (5, 11, 3, 11, 57, 80, 0);
INSERT INTO `penilaian` VALUES (5, 11, 3, 11, 58, 81, 0);
INSERT INTO `penilaian` VALUES (5, 11, 3, 11, 59, 66, 0);
INSERT INTO `penilaian` VALUES (5, 11, 4, 13, 50, 85, 0);
INSERT INTO `penilaian` VALUES (5, 11, 4, 13, 51, 30, 0);
INSERT INTO `penilaian` VALUES (5, 11, 4, 13, 52, 96, 0);
INSERT INTO `penilaian` VALUES (5, 11, 4, 13, 53, 89, 0);
INSERT INTO `penilaian` VALUES (5, 11, 4, 13, 54, 59, 0);
INSERT INTO `penilaian` VALUES (5, 11, 5, 12, 46, 29, 0);
INSERT INTO `penilaian` VALUES (5, 11, 5, 12, 47, 67, 0);
INSERT INTO `penilaian` VALUES (5, 11, 5, 12, 48, 50, 0);
INSERT INTO `penilaian` VALUES (5, 11, 5, 12, 49, 48, 0);
INSERT INTO `penilaian` VALUES (5, 11, 7, 14, 60, 92, 0);
INSERT INTO `penilaian` VALUES (5, 11, 7, 14, 61, 18, 0);
INSERT INTO `penilaian` VALUES (5, 11, 7, 14, 62, 12, 0);
INSERT INTO `penilaian` VALUES (5, 11, 7, 14, 63, 6, 0);
INSERT INTO `penilaian` VALUES (5, 12, 3, 11, 55, 95, 0);
INSERT INTO `penilaian` VALUES (5, 12, 3, 11, 56, 57, 0);
INSERT INTO `penilaian` VALUES (5, 12, 3, 11, 57, 99, 0);
INSERT INTO `penilaian` VALUES (5, 12, 3, 11, 58, 26, 0);
INSERT INTO `penilaian` VALUES (5, 12, 3, 11, 59, 32, 0);
INSERT INTO `penilaian` VALUES (5, 12, 4, 13, 50, 83, 0);
INSERT INTO `penilaian` VALUES (5, 12, 4, 13, 51, 18, 0);
INSERT INTO `penilaian` VALUES (5, 12, 4, 13, 52, 45, 0);
INSERT INTO `penilaian` VALUES (5, 12, 4, 13, 53, 69, 0);
INSERT INTO `penilaian` VALUES (5, 12, 4, 13, 54, 13, 0);
INSERT INTO `penilaian` VALUES (5, 12, 5, 12, 46, 56, 0);
INSERT INTO `penilaian` VALUES (5, 12, 5, 12, 47, 42, 0);
INSERT INTO `penilaian` VALUES (5, 12, 5, 12, 48, 44, 0);
INSERT INTO `penilaian` VALUES (5, 12, 5, 12, 49, 92, 0);
INSERT INTO `penilaian` VALUES (5, 12, 7, 14, 60, 31, 0);
INSERT INTO `penilaian` VALUES (5, 12, 7, 14, 61, 77, 0);
INSERT INTO `penilaian` VALUES (5, 12, 7, 14, 62, 93, 0);
INSERT INTO `penilaian` VALUES (5, 12, 7, 14, 63, 33, 0);
INSERT INTO `penilaian` VALUES (5, 13, 3, 11, 55, 89, 0);
INSERT INTO `penilaian` VALUES (5, 13, 3, 11, 56, 45, 0);
INSERT INTO `penilaian` VALUES (5, 13, 3, 11, 57, 58, 0);
INSERT INTO `penilaian` VALUES (5, 13, 3, 11, 58, 56, 0);
INSERT INTO `penilaian` VALUES (5, 13, 3, 11, 59, 8, 0);
INSERT INTO `penilaian` VALUES (5, 13, 4, 13, 50, 71, 0);
INSERT INTO `penilaian` VALUES (5, 13, 4, 13, 51, 30, 0);
INSERT INTO `penilaian` VALUES (5, 13, 4, 13, 52, 39, 0);
INSERT INTO `penilaian` VALUES (5, 13, 4, 13, 53, 6, 0);
INSERT INTO `penilaian` VALUES (5, 13, 4, 13, 54, 14, 0);
INSERT INTO `penilaian` VALUES (5, 13, 5, 12, 46, 53, 0);
INSERT INTO `penilaian` VALUES (5, 13, 5, 12, 47, 24, 0);
INSERT INTO `penilaian` VALUES (5, 13, 5, 12, 48, 59, 0);
INSERT INTO `penilaian` VALUES (5, 13, 5, 12, 49, 23, 0);
INSERT INTO `penilaian` VALUES (5, 13, 7, 14, 60, 39, 0);
INSERT INTO `penilaian` VALUES (5, 13, 7, 14, 61, 26, 0);
INSERT INTO `penilaian` VALUES (5, 13, 7, 14, 62, 15, 0);
INSERT INTO `penilaian` VALUES (5, 13, 7, 14, 63, 99, 0);
INSERT INTO `penilaian` VALUES (5, 14, 3, 11, 55, 48, 0);
INSERT INTO `penilaian` VALUES (5, 14, 3, 11, 56, 43, 0);
INSERT INTO `penilaian` VALUES (5, 14, 3, 11, 57, 70, 0);
INSERT INTO `penilaian` VALUES (5, 14, 3, 11, 58, 25, 0);
INSERT INTO `penilaian` VALUES (5, 14, 3, 11, 59, 14, 0);
INSERT INTO `penilaian` VALUES (5, 14, 4, 13, 50, 94, 0);
INSERT INTO `penilaian` VALUES (5, 14, 4, 13, 51, 30, 0);
INSERT INTO `penilaian` VALUES (5, 14, 4, 13, 52, 69, 0);
INSERT INTO `penilaian` VALUES (5, 14, 4, 13, 53, 54, 0);
INSERT INTO `penilaian` VALUES (5, 14, 4, 13, 54, 63, 0);
INSERT INTO `penilaian` VALUES (5, 14, 5, 12, 46, 52, 0);
INSERT INTO `penilaian` VALUES (5, 14, 5, 12, 47, 74, 0);
INSERT INTO `penilaian` VALUES (5, 14, 5, 12, 48, 16, 0);
INSERT INTO `penilaian` VALUES (5, 14, 5, 12, 49, 57, 0);
INSERT INTO `penilaian` VALUES (5, 14, 7, 14, 60, 36, 0);
INSERT INTO `penilaian` VALUES (5, 14, 7, 14, 61, 12, 0);
INSERT INTO `penilaian` VALUES (5, 14, 7, 14, 62, 52, 0);
INSERT INTO `penilaian` VALUES (5, 14, 7, 14, 63, 25, 0);
INSERT INTO `penilaian` VALUES (5, 15, 3, 11, 55, 69, 0);
INSERT INTO `penilaian` VALUES (5, 15, 3, 11, 56, 71, 0);
INSERT INTO `penilaian` VALUES (5, 15, 3, 11, 57, 48, 0);
INSERT INTO `penilaian` VALUES (5, 15, 3, 11, 58, 27, 0);
INSERT INTO `penilaian` VALUES (5, 15, 3, 11, 59, 91, 0);
INSERT INTO `penilaian` VALUES (5, 15, 4, 13, 50, 75, 0);
INSERT INTO `penilaian` VALUES (5, 15, 4, 13, 51, 2, 0);
INSERT INTO `penilaian` VALUES (5, 15, 4, 13, 52, 86, 0);
INSERT INTO `penilaian` VALUES (5, 15, 4, 13, 53, 26, 0);
INSERT INTO `penilaian` VALUES (5, 15, 4, 13, 54, 70, 0);
INSERT INTO `penilaian` VALUES (5, 15, 5, 12, 46, 73, 0);
INSERT INTO `penilaian` VALUES (5, 15, 5, 12, 47, 56, 0);
INSERT INTO `penilaian` VALUES (5, 15, 5, 12, 48, 63, 0);
INSERT INTO `penilaian` VALUES (5, 15, 5, 12, 49, 48, 0);
INSERT INTO `penilaian` VALUES (5, 15, 7, 14, 60, 50, 0);
INSERT INTO `penilaian` VALUES (5, 15, 7, 14, 61, 7, 0);
INSERT INTO `penilaian` VALUES (5, 15, 7, 14, 62, 84, 0);
INSERT INTO `penilaian` VALUES (5, 15, 7, 14, 63, 99, 0);
INSERT INTO `penilaian` VALUES (5, 16, 3, 11, 55, 46, 0);
INSERT INTO `penilaian` VALUES (5, 16, 3, 11, 56, 33, 0);
INSERT INTO `penilaian` VALUES (5, 16, 3, 11, 57, 27, 0);
INSERT INTO `penilaian` VALUES (5, 16, 3, 11, 58, 35, 0);
INSERT INTO `penilaian` VALUES (5, 16, 3, 11, 59, 96, 0);
INSERT INTO `penilaian` VALUES (5, 16, 4, 13, 50, 74, 0);
INSERT INTO `penilaian` VALUES (5, 16, 4, 13, 51, 83, 0);
INSERT INTO `penilaian` VALUES (5, 16, 4, 13, 52, 94, 0);
INSERT INTO `penilaian` VALUES (5, 16, 4, 13, 53, 20, 0);
INSERT INTO `penilaian` VALUES (5, 16, 4, 13, 54, 21, 0);
INSERT INTO `penilaian` VALUES (5, 16, 5, 12, 46, 46, 0);
INSERT INTO `penilaian` VALUES (5, 16, 5, 12, 47, 69, 0);
INSERT INTO `penilaian` VALUES (5, 16, 5, 12, 48, 4, 0);
INSERT INTO `penilaian` VALUES (5, 16, 5, 12, 49, 13, 0);
INSERT INTO `penilaian` VALUES (5, 16, 7, 14, 60, 55, 0);
INSERT INTO `penilaian` VALUES (5, 16, 7, 14, 61, 37, 0);
INSERT INTO `penilaian` VALUES (5, 16, 7, 14, 62, 21, 0);
INSERT INTO `penilaian` VALUES (5, 16, 7, 14, 63, 92, 0);
INSERT INTO `penilaian` VALUES (5, 17, 3, 11, 55, 0, 0);
INSERT INTO `penilaian` VALUES (5, 17, 3, 11, 56, 25, 0);
INSERT INTO `penilaian` VALUES (5, 17, 3, 11, 57, 24, 0);
INSERT INTO `penilaian` VALUES (5, 17, 3, 11, 58, 46, 0);
INSERT INTO `penilaian` VALUES (5, 17, 3, 11, 59, 59, 0);
INSERT INTO `penilaian` VALUES (5, 17, 4, 13, 50, 57, 0);
INSERT INTO `penilaian` VALUES (5, 17, 4, 13, 51, 8, 0);
INSERT INTO `penilaian` VALUES (5, 17, 4, 13, 52, 70, 0);
INSERT INTO `penilaian` VALUES (5, 17, 4, 13, 53, 26, 0);
INSERT INTO `penilaian` VALUES (5, 17, 4, 13, 54, 20, 0);
INSERT INTO `penilaian` VALUES (5, 17, 5, 12, 46, 21, 0);
INSERT INTO `penilaian` VALUES (5, 17, 5, 12, 47, 47, 0);
INSERT INTO `penilaian` VALUES (5, 17, 5, 12, 48, 72, 0);
INSERT INTO `penilaian` VALUES (5, 17, 5, 12, 49, 21, 0);
INSERT INTO `penilaian` VALUES (5, 17, 7, 14, 60, 87, 0);
INSERT INTO `penilaian` VALUES (5, 17, 7, 14, 61, 75, 0);
INSERT INTO `penilaian` VALUES (5, 17, 7, 14, 62, 15, 0);
INSERT INTO `penilaian` VALUES (5, 17, 7, 14, 63, 50, 0);
INSERT INTO `penilaian` VALUES (5, 18, 3, 11, 55, 6, 0);
INSERT INTO `penilaian` VALUES (5, 18, 3, 11, 56, 78, 0);
INSERT INTO `penilaian` VALUES (5, 18, 3, 11, 57, 73, 0);
INSERT INTO `penilaian` VALUES (5, 18, 3, 11, 58, 34, 0);
INSERT INTO `penilaian` VALUES (5, 18, 3, 11, 59, 49, 0);
INSERT INTO `penilaian` VALUES (5, 18, 4, 13, 50, 44, 0);
INSERT INTO `penilaian` VALUES (5, 18, 4, 13, 51, 75, 0);
INSERT INTO `penilaian` VALUES (5, 18, 4, 13, 52, 44, 0);
INSERT INTO `penilaian` VALUES (5, 18, 4, 13, 53, 97, 0);
INSERT INTO `penilaian` VALUES (5, 18, 4, 13, 54, 50, 0);
INSERT INTO `penilaian` VALUES (5, 18, 5, 12, 46, 61, 0);
INSERT INTO `penilaian` VALUES (5, 18, 5, 12, 47, 57, 0);
INSERT INTO `penilaian` VALUES (5, 18, 5, 12, 48, 2, 0);
INSERT INTO `penilaian` VALUES (5, 18, 5, 12, 49, 37, 0);
INSERT INTO `penilaian` VALUES (5, 18, 7, 14, 60, 83, 0);
INSERT INTO `penilaian` VALUES (5, 18, 7, 14, 61, 2, 0);
INSERT INTO `penilaian` VALUES (5, 18, 7, 14, 62, 62, 0);
INSERT INTO `penilaian` VALUES (5, 18, 7, 14, 63, 6, 0);
INSERT INTO `penilaian` VALUES (5, 19, 3, 11, 55, 43, 0);
INSERT INTO `penilaian` VALUES (5, 19, 3, 11, 56, 98, 0);
INSERT INTO `penilaian` VALUES (5, 19, 3, 11, 57, 60, 0);
INSERT INTO `penilaian` VALUES (5, 19, 3, 11, 58, 7, 0);
INSERT INTO `penilaian` VALUES (5, 19, 3, 11, 59, 57, 0);
INSERT INTO `penilaian` VALUES (5, 19, 4, 13, 50, 64, 0);
INSERT INTO `penilaian` VALUES (5, 19, 4, 13, 51, 47, 0);
INSERT INTO `penilaian` VALUES (5, 19, 4, 13, 52, 46, 0);
INSERT INTO `penilaian` VALUES (5, 19, 4, 13, 53, 89, 0);
INSERT INTO `penilaian` VALUES (5, 19, 4, 13, 54, 9, 0);
INSERT INTO `penilaian` VALUES (5, 19, 5, 12, 46, 80, 0);
INSERT INTO `penilaian` VALUES (5, 19, 5, 12, 47, 70, 0);
INSERT INTO `penilaian` VALUES (5, 19, 5, 12, 48, 10, 0);
INSERT INTO `penilaian` VALUES (5, 19, 5, 12, 49, 43, 0);
INSERT INTO `penilaian` VALUES (5, 19, 7, 14, 60, 83, 0);
INSERT INTO `penilaian` VALUES (5, 19, 7, 14, 61, 89, 0);
INSERT INTO `penilaian` VALUES (5, 19, 7, 14, 62, 96, 0);
INSERT INTO `penilaian` VALUES (5, 19, 7, 14, 63, 13, 0);
INSERT INTO `penilaian` VALUES (5, 20, 3, 11, 55, 77, 0);
INSERT INTO `penilaian` VALUES (5, 20, 3, 11, 56, 48, 0);
INSERT INTO `penilaian` VALUES (5, 20, 3, 11, 57, 10, 0);
INSERT INTO `penilaian` VALUES (5, 20, 3, 11, 58, 6, 0);
INSERT INTO `penilaian` VALUES (5, 20, 3, 11, 59, 0, 0);
INSERT INTO `penilaian` VALUES (5, 20, 4, 13, 50, 84, 0);
INSERT INTO `penilaian` VALUES (5, 20, 4, 13, 51, 18, 0);
INSERT INTO `penilaian` VALUES (5, 20, 4, 13, 52, 38, 0);
INSERT INTO `penilaian` VALUES (5, 20, 4, 13, 53, 38, 0);
INSERT INTO `penilaian` VALUES (5, 20, 4, 13, 54, 74, 0);
INSERT INTO `penilaian` VALUES (5, 20, 5, 12, 46, 59, 0);
INSERT INTO `penilaian` VALUES (5, 20, 5, 12, 47, 71, 0);
INSERT INTO `penilaian` VALUES (5, 20, 5, 12, 48, 82, 0);
INSERT INTO `penilaian` VALUES (5, 20, 5, 12, 49, 95, 0);
INSERT INTO `penilaian` VALUES (5, 20, 7, 14, 60, 30, 0);
INSERT INTO `penilaian` VALUES (5, 20, 7, 14, 61, 67, 0);
INSERT INTO `penilaian` VALUES (5, 20, 7, 14, 62, 47, 0);
INSERT INTO `penilaian` VALUES (5, 20, 7, 14, 63, 31, 0);
INSERT INTO `penilaian` VALUES (5, 21, 3, 11, 55, 17, 0);
INSERT INTO `penilaian` VALUES (5, 21, 3, 11, 56, 93, 0);
INSERT INTO `penilaian` VALUES (5, 21, 3, 11, 57, 12, 0);
INSERT INTO `penilaian` VALUES (5, 21, 3, 11, 58, 82, 0);
INSERT INTO `penilaian` VALUES (5, 21, 3, 11, 59, 76, 0);
INSERT INTO `penilaian` VALUES (5, 21, 4, 13, 50, 34, 0);
INSERT INTO `penilaian` VALUES (5, 21, 4, 13, 51, 42, 0);
INSERT INTO `penilaian` VALUES (5, 21, 4, 13, 52, 8, 0);
INSERT INTO `penilaian` VALUES (5, 21, 4, 13, 53, 16, 0);
INSERT INTO `penilaian` VALUES (5, 21, 4, 13, 54, 54, 0);
INSERT INTO `penilaian` VALUES (5, 21, 5, 12, 46, 23, 0);
INSERT INTO `penilaian` VALUES (5, 21, 5, 12, 47, 54, 0);
INSERT INTO `penilaian` VALUES (5, 21, 5, 12, 48, 3, 0);
INSERT INTO `penilaian` VALUES (5, 21, 5, 12, 49, 53, 0);
INSERT INTO `penilaian` VALUES (5, 21, 7, 14, 60, 57, 0);
INSERT INTO `penilaian` VALUES (5, 21, 7, 14, 61, 26, 0);
INSERT INTO `penilaian` VALUES (5, 21, 7, 14, 62, 59, 0);
INSERT INTO `penilaian` VALUES (5, 21, 7, 14, 63, 16, 0);
INSERT INTO `penilaian` VALUES (5, 22, 3, 11, 55, 5, 0);
INSERT INTO `penilaian` VALUES (5, 22, 3, 11, 56, 78, 0);
INSERT INTO `penilaian` VALUES (5, 22, 3, 11, 57, 74, 0);
INSERT INTO `penilaian` VALUES (5, 22, 3, 11, 58, 36, 0);
INSERT INTO `penilaian` VALUES (5, 22, 3, 11, 59, 60, 0);
INSERT INTO `penilaian` VALUES (5, 22, 4, 13, 50, 90, 0);
INSERT INTO `penilaian` VALUES (5, 22, 4, 13, 51, 72, 0);
INSERT INTO `penilaian` VALUES (5, 22, 4, 13, 52, 89, 0);
INSERT INTO `penilaian` VALUES (5, 22, 4, 13, 53, 30, 0);
INSERT INTO `penilaian` VALUES (5, 22, 4, 13, 54, 84, 0);
INSERT INTO `penilaian` VALUES (5, 22, 5, 12, 46, 30, 0);
INSERT INTO `penilaian` VALUES (5, 22, 5, 12, 47, 0, 0);
INSERT INTO `penilaian` VALUES (5, 22, 5, 12, 48, 11, 0);
INSERT INTO `penilaian` VALUES (5, 22, 5, 12, 49, 54, 0);
INSERT INTO `penilaian` VALUES (5, 22, 7, 14, 60, 39, 0);
INSERT INTO `penilaian` VALUES (5, 22, 7, 14, 61, 34, 0);
INSERT INTO `penilaian` VALUES (5, 22, 7, 14, 62, 53, 0);
INSERT INTO `penilaian` VALUES (5, 22, 7, 14, 63, 62, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 12, 52, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 13, 73, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 14, 12, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 15, 39, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 16, 62, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 17, 94, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 18, 82, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 19, 31, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 20, 7, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 21, 44, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 22, 0, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 23, 67, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 24, 36, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 25, 78, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 26, 83, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 27, 84, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 28, 69, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 29, 95, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 30, 68, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 31, 55, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 32, 71, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 33, 92, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 34, 46, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 35, 55, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 36, 36, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 37, 16, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 38, 71, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 39, 9, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 40, 34, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 41, 42, 0);
INSERT INTO `penilaian` VALUES (6, 3, 2, 10, 42, 11, 0);
INSERT INTO `penilaian` VALUES (6, 3, 2, 10, 43, 27, 0);
INSERT INTO `penilaian` VALUES (6, 3, 2, 10, 44, 3, 0);
INSERT INTO `penilaian` VALUES (6, 3, 2, 10, 45, 37, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 12, 73, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 13, 56, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 14, 61, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 15, 37, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 16, 5, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 17, 12, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 18, 44, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 19, 87, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 20, 2, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 21, 52, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 22, 51, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 23, 3, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 24, 59, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 25, 90, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 26, 71, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 27, 85, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 28, 12, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 29, 4, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 30, 88, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 31, 28, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 32, 78, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 33, 5, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 34, 91, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 35, 41, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 36, 33, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 37, 43, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 38, 18, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 39, 60, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 40, 45, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 41, 45, 0);
INSERT INTO `penilaian` VALUES (6, 4, 2, 10, 42, 93, 0);
INSERT INTO `penilaian` VALUES (6, 4, 2, 10, 43, 31, 0);
INSERT INTO `penilaian` VALUES (6, 4, 2, 10, 44, 74, 0);
INSERT INTO `penilaian` VALUES (6, 4, 2, 10, 45, 79, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 12, 71, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 13, 20, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 14, 89, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 15, 86, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 16, 64, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 17, 61, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 18, 12, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 19, 80, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 20, 62, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 21, 72, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 22, 74, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 23, 56, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 24, 59, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 25, 27, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 26, 58, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 27, 9, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 28, 73, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 29, 37, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 30, 67, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 31, 25, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 32, 23, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 33, 40, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 34, 34, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 35, 51, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 36, 52, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 37, 9, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 38, 90, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 39, 22, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 40, 42, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 41, 43, 0);
INSERT INTO `penilaian` VALUES (6, 5, 2, 10, 42, 92, 0);
INSERT INTO `penilaian` VALUES (6, 5, 2, 10, 43, 31, 0);
INSERT INTO `penilaian` VALUES (6, 5, 2, 10, 44, 77, 0);
INSERT INTO `penilaian` VALUES (6, 5, 2, 10, 45, 93, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 12, 34, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 13, 90, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 14, 51, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 15, 86, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 16, 79, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 17, 35, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 18, 38, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 19, 87, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 20, 23, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 21, 51, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 22, 89, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 23, 93, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 24, 98, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 25, 10, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 26, 56, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 27, 52, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 28, 92, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 29, 6, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 30, 52, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 31, 43, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 32, 58, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 33, 62, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 34, 38, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 35, 2, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 36, 0, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 37, 92, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 38, 61, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 39, 31, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 40, 73, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 41, 73, 0);
INSERT INTO `penilaian` VALUES (6, 6, 2, 10, 42, 46, 0);
INSERT INTO `penilaian` VALUES (6, 6, 2, 10, 43, 13, 0);
INSERT INTO `penilaian` VALUES (6, 6, 2, 10, 44, 27, 0);
INSERT INTO `penilaian` VALUES (6, 6, 2, 10, 45, 94, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 12, 93, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 13, 80, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 14, 25, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 15, 83, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 16, 41, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 17, 59, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 18, 69, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 19, 70, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 20, 43, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 21, 8, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 22, 9, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 23, 20, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 24, 77, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 25, 23, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 26, 84, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 27, 53, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 28, 12, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 29, 1, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 30, 68, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 31, 41, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 32, 99, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 33, 73, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 34, 69, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 35, 28, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 36, 33, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 37, 80, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 38, 3, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 39, 73, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 40, 58, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 41, 71, 0);
INSERT INTO `penilaian` VALUES (6, 7, 2, 10, 42, 84, 0);
INSERT INTO `penilaian` VALUES (6, 7, 2, 10, 43, 5, 0);
INSERT INTO `penilaian` VALUES (6, 7, 2, 10, 44, 72, 0);
INSERT INTO `penilaian` VALUES (6, 7, 2, 10, 45, 48, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 12, 24, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 13, 79, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 14, 20, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 15, 63, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 16, 56, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 17, 93, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 18, 97, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 19, 6, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 20, 39, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 21, 79, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 22, 79, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 23, 57, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 24, 50, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 25, 79, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 26, 44, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 27, 86, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 28, 96, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 29, 24, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 30, 32, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 31, 87, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 32, 42, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 33, 48, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 34, 14, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 35, 29, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 36, 3, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 37, 26, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 38, 23, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 39, 38, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 40, 20, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 41, 87, 0);
INSERT INTO `penilaian` VALUES (6, 8, 2, 10, 42, 75, 0);
INSERT INTO `penilaian` VALUES (6, 8, 2, 10, 43, 15, 0);
INSERT INTO `penilaian` VALUES (6, 8, 2, 10, 44, 50, 0);
INSERT INTO `penilaian` VALUES (6, 8, 2, 10, 45, 7, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 12, 84, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 13, 0, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 14, 47, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 15, 37, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 16, 46, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 17, 17, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 18, 50, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 19, 99, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 20, 44, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 21, 23, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 22, 83, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 23, 46, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 24, 82, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 25, 74, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 26, 22, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 27, 90, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 28, 84, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 29, 52, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 30, 9, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 31, 86, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 32, 7, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 33, 77, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 34, 64, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 35, 90, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 36, 58, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 37, 22, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 38, 37, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 39, 17, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 40, 75, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 41, 24, 0);
INSERT INTO `penilaian` VALUES (6, 9, 2, 10, 42, 98, 0);
INSERT INTO `penilaian` VALUES (6, 9, 2, 10, 43, 16, 0);
INSERT INTO `penilaian` VALUES (6, 9, 2, 10, 44, 88, 0);
INSERT INTO `penilaian` VALUES (6, 9, 2, 10, 45, 92, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 12, 96, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 13, 5, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 14, 37, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 15, 69, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 16, 34, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 17, 66, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 18, 29, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 19, 45, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 20, 38, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 21, 55, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 22, 61, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 23, 41, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 24, 24, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 25, 98, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 26, 17, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 27, 93, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 28, 12, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 29, 83, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 30, 81, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 31, 53, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 32, 25, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 33, 67, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 34, 60, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 35, 1, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 36, 24, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 37, 19, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 38, 23, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 39, 58, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 40, 23, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 41, 39, 0);
INSERT INTO `penilaian` VALUES (6, 10, 2, 10, 42, 26, 0);
INSERT INTO `penilaian` VALUES (6, 10, 2, 10, 43, 14, 0);
INSERT INTO `penilaian` VALUES (6, 10, 2, 10, 44, 95, 0);
INSERT INTO `penilaian` VALUES (6, 10, 2, 10, 45, 31, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 12, 71, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 13, 61, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 14, 95, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 15, 92, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 16, 77, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 17, 10, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 18, 16, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 19, 54, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 20, 20, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 21, 40, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 22, 39, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 23, 75, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 24, 58, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 25, 65, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 26, 51, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 27, 62, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 28, 56, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 29, 96, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 30, 11, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 31, 67, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 32, 3, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 33, 15, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 34, 68, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 35, 96, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 36, 73, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 37, 80, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 38, 82, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 39, 68, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 40, 95, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 41, 74, 0);
INSERT INTO `penilaian` VALUES (6, 11, 2, 10, 42, 82, 0);
INSERT INTO `penilaian` VALUES (6, 11, 2, 10, 43, 90, 0);
INSERT INTO `penilaian` VALUES (6, 11, 2, 10, 44, 5, 0);
INSERT INTO `penilaian` VALUES (6, 11, 2, 10, 45, 53, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 12, 52, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 13, 2, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 14, 53, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 15, 59, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 16, 37, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 17, 10, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 18, 38, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 19, 62, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 20, 95, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 21, 92, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 22, 73, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 23, 88, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 24, 24, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 25, 56, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 26, 9, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 27, 77, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 28, 60, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 29, 68, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 30, 62, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 31, 4, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 32, 35, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 33, 64, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 34, 15, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 35, 85, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 36, 80, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 37, 45, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 38, 88, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 39, 2, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 40, 48, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 41, 33, 0);
INSERT INTO `penilaian` VALUES (6, 12, 2, 10, 42, 24, 0);
INSERT INTO `penilaian` VALUES (6, 12, 2, 10, 43, 23, 0);
INSERT INTO `penilaian` VALUES (6, 12, 2, 10, 44, 40, 0);
INSERT INTO `penilaian` VALUES (6, 12, 2, 10, 45, 31, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 12, 36, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 13, 89, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 14, 38, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 15, 22, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 16, 96, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 17, 15, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 18, 86, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 19, 85, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 20, 71, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 21, 97, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 22, 76, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 23, 87, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 24, 9, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 25, 85, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 26, 97, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 27, 30, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 28, 62, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 29, 17, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 30, 2, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 31, 57, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 32, 80, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 33, 30, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 34, 11, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 35, 64, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 36, 87, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 37, 46, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 38, 66, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 39, 96, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 40, 82, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 41, 22, 0);
INSERT INTO `penilaian` VALUES (6, 13, 2, 10, 42, 63, 0);
INSERT INTO `penilaian` VALUES (6, 13, 2, 10, 43, 52, 0);
INSERT INTO `penilaian` VALUES (6, 13, 2, 10, 44, 71, 0);
INSERT INTO `penilaian` VALUES (6, 13, 2, 10, 45, 98, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 12, 78, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 13, 99, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 14, 58, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 15, 96, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 16, 5, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 17, 37, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 18, 69, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 19, 37, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 20, 78, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 21, 80, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 22, 65, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 23, 85, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 24, 33, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 25, 9, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 26, 49, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 27, 16, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 28, 33, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 29, 19, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 30, 97, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 31, 28, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 32, 48, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 33, 59, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 34, 50, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 35, 74, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 36, 19, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 37, 76, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 38, 23, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 39, 89, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 40, 76, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 41, 13, 0);
INSERT INTO `penilaian` VALUES (6, 14, 2, 10, 42, 38, 0);
INSERT INTO `penilaian` VALUES (6, 14, 2, 10, 43, 52, 0);
INSERT INTO `penilaian` VALUES (6, 14, 2, 10, 44, 47, 0);
INSERT INTO `penilaian` VALUES (6, 14, 2, 10, 45, 78, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 12, 50, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 13, 16, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 14, 29, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 15, 98, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 16, 3, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 17, 23, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 18, 7, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 19, 67, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 20, 15, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 21, 73, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 22, 21, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 23, 87, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 24, 73, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 25, 3, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 26, 96, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 27, 74, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 28, 80, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 29, 78, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 30, 54, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 31, 33, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 32, 4, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 33, 22, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 34, 0, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 35, 35, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 36, 75, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 37, 71, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 38, 30, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 39, 39, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 40, 5, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 41, 9, 0);
INSERT INTO `penilaian` VALUES (6, 15, 2, 10, 42, 28, 0);
INSERT INTO `penilaian` VALUES (6, 15, 2, 10, 43, 15, 0);
INSERT INTO `penilaian` VALUES (6, 15, 2, 10, 44, 93, 0);
INSERT INTO `penilaian` VALUES (6, 15, 2, 10, 45, 21, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 12, 27, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 13, 72, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 14, 81, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 15, 88, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 16, 98, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 17, 28, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 18, 46, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 19, 46, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 20, 94, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 21, 33, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 22, 82, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 23, 11, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 24, 10, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 25, 18, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 26, 61, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 27, 50, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 28, 67, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 29, 88, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 30, 36, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 31, 19, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 32, 88, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 33, 84, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 34, 55, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 35, 25, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 36, 60, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 37, 27, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 38, 54, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 39, 88, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 40, 79, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 41, 30, 0);
INSERT INTO `penilaian` VALUES (6, 16, 2, 10, 42, 15, 0);
INSERT INTO `penilaian` VALUES (6, 16, 2, 10, 43, 87, 0);
INSERT INTO `penilaian` VALUES (6, 16, 2, 10, 44, 91, 0);
INSERT INTO `penilaian` VALUES (6, 16, 2, 10, 45, 93, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 12, 95, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 13, 94, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 14, 87, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 15, 54, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 16, 9, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 17, 83, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 18, 88, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 19, 93, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 20, 0, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 21, 22, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 22, 11, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 23, 88, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 24, 7, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 25, 72, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 26, 38, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 27, 76, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 28, 67, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 29, 7, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 30, 32, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 31, 43, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 32, 20, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 33, 70, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 34, 89, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 35, 35, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 36, 9, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 37, 43, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 38, 86, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 39, 3, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 40, 56, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 41, 71, 0);
INSERT INTO `penilaian` VALUES (6, 17, 2, 10, 42, 90, 0);
INSERT INTO `penilaian` VALUES (6, 17, 2, 10, 43, 35, 0);
INSERT INTO `penilaian` VALUES (6, 17, 2, 10, 44, 5, 0);
INSERT INTO `penilaian` VALUES (6, 17, 2, 10, 45, 22, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 12, 95, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 13, 9, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 14, 60, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 15, 73, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 16, 88, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 17, 19, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 18, 31, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 19, 0, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 20, 8, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 21, 40, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 22, 76, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 23, 63, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 24, 85, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 25, 37, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 26, 32, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 27, 47, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 28, 43, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 29, 71, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 30, 29, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 31, 32, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 32, 71, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 33, 63, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 34, 99, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 35, 10, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 36, 52, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 37, 32, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 38, 1, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 39, 13, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 40, 62, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 41, 70, 0);
INSERT INTO `penilaian` VALUES (6, 18, 2, 10, 42, 67, 0);
INSERT INTO `penilaian` VALUES (6, 18, 2, 10, 43, 23, 0);
INSERT INTO `penilaian` VALUES (6, 18, 2, 10, 44, 17, 0);
INSERT INTO `penilaian` VALUES (6, 18, 2, 10, 45, 14, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 12, 22, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 13, 66, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 14, 64, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 15, 26, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 16, 35, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 17, 98, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 18, 84, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 19, 29, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 20, 91, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 21, 72, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 22, 84, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 23, 5, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 24, 76, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 25, 65, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 26, 96, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 27, 87, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 28, 46, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 29, 71, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 30, 16, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 31, 68, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 32, 93, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 33, 61, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 34, 28, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 35, 56, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 36, 95, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 37, 10, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 38, 64, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 39, 90, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 40, 60, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 41, 31, 0);
INSERT INTO `penilaian` VALUES (6, 19, 2, 10, 42, 76, 0);
INSERT INTO `penilaian` VALUES (6, 19, 2, 10, 43, 86, 0);
INSERT INTO `penilaian` VALUES (6, 19, 2, 10, 44, 2, 0);
INSERT INTO `penilaian` VALUES (6, 19, 2, 10, 45, 53, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 12, 61, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 13, 45, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 14, 43, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 15, 82, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 16, 79, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 17, 50, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 18, 12, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 19, 12, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 20, 24, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 21, 84, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 22, 48, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 23, 91, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 24, 10, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 25, 76, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 26, 52, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 27, 32, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 28, 3, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 29, 22, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 30, 0, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 31, 36, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 32, 78, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 33, 84, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 34, 85, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 35, 73, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 36, 13, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 37, 48, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 38, 98, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 39, 47, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 40, 41, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 41, 63, 0);
INSERT INTO `penilaian` VALUES (6, 20, 2, 10, 42, 95, 0);
INSERT INTO `penilaian` VALUES (6, 20, 2, 10, 43, 84, 0);
INSERT INTO `penilaian` VALUES (6, 20, 2, 10, 44, 37, 0);
INSERT INTO `penilaian` VALUES (6, 20, 2, 10, 45, 32, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 12, 50, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 13, 54, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 14, 23, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 15, 52, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 16, 90, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 17, 94, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 18, 0, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 19, 19, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 20, 95, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 21, 19, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 22, 12, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 23, 1, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 24, 70, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 25, 48, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 26, 32, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 27, 15, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 28, 81, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 29, 60, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 30, 58, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 31, 9, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 32, 73, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 33, 39, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 34, 76, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 35, 64, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 36, 93, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 37, 72, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 38, 83, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 39, 97, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 40, 39, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 41, 5, 0);
INSERT INTO `penilaian` VALUES (6, 21, 2, 10, 42, 9, 0);
INSERT INTO `penilaian` VALUES (6, 21, 2, 10, 43, 30, 0);
INSERT INTO `penilaian` VALUES (6, 21, 2, 10, 44, 23, 0);
INSERT INTO `penilaian` VALUES (6, 21, 2, 10, 45, 26, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 12, 62, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 13, 32, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 14, 73, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 15, 72, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 16, 40, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 17, 83, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 18, 98, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 19, 39, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 20, 2, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 21, 92, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 22, 58, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 23, 12, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 24, 87, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 25, 0, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 26, 40, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 27, 1, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 28, 86, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 29, 27, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 30, 77, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 31, 4, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 32, 88, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 33, 32, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 34, 94, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 35, 77, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 36, 0, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 37, 73, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 38, 64, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 39, 2, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 40, 17, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 41, 81, 0);
INSERT INTO `penilaian` VALUES (6, 22, 2, 10, 42, 54, 0);
INSERT INTO `penilaian` VALUES (6, 22, 2, 10, 43, 28, 0);
INSERT INTO `penilaian` VALUES (6, 22, 2, 10, 44, 77, 0);
INSERT INTO `penilaian` VALUES (6, 22, 2, 10, 45, 3, 0);

-- ----------------------------
-- Table structure for sub2s
-- ----------------------------
DROP TABLE IF EXISTS `sub2s`;
CREATE TABLE `sub2s`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sub2s_sub_id_foreign`(`sub_id`) USING BTREE,
  CONSTRAINT `sub2s_sub_id_foreign` FOREIGN KEY (`sub_id`) REFERENCES `subs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sub2s
-- ----------------------------
INSERT INTO `sub2s` VALUES (12, '01', 'Sikap Hormat', 7, '2020-05-07 02:04:33', '2020-05-07 02:04:33');
INSERT INTO `sub2s` VALUES (13, '02', 'Istirahat Ditempat', 7, '2020-05-07 02:04:53', '2020-05-07 02:05:19');
INSERT INTO `sub2s` VALUES (14, '03', 'Periksa Kerapihan', 7, '2020-05-07 02:05:41', '2020-05-07 02:05:41');
INSERT INTO `sub2s` VALUES (15, '04', 'Sikap Siap Sempurna', 7, '2020-05-07 02:06:05', '2020-05-07 02:06:05');
INSERT INTO `sub2s` VALUES (16, '05', 'Hitung', 7, '2020-05-07 02:06:16', '2020-05-07 02:06:16');
INSERT INTO `sub2s` VALUES (17, '06', 'Setengah Lencang Kanan/Kiri', 7, '2020-05-07 02:06:44', '2020-05-07 02:06:44');
INSERT INTO `sub2s` VALUES (18, '07', 'Lencang Kanan/Kiri', 7, '2020-05-07 02:07:09', '2020-05-07 02:07:09');
INSERT INTO `sub2s` VALUES (19, '08', 'Hadap Kanan', 7, '2020-05-07 02:07:23', '2020-05-07 02:07:23');
INSERT INTO `sub2s` VALUES (20, '09', 'Hadap Kiri', 7, '2020-05-07 02:07:36', '2020-05-07 02:07:36');
INSERT INTO `sub2s` VALUES (21, '10', 'Hadap Serong Kanan', 7, '2020-05-07 02:07:54', '2020-05-07 02:07:54');
INSERT INTO `sub2s` VALUES (22, '11', 'Hadap Serong Kiri', 7, '2020-05-07 02:08:12', '2020-05-07 02:08:12');
INSERT INTO `sub2s` VALUES (23, '12', 'Balik Kanan', 7, '2020-05-07 02:08:26', '2020-05-07 02:08:26');
INSERT INTO `sub2s` VALUES (24, '13', 'Jalan Ditempat', 7, '2020-05-07 02:08:44', '2020-05-07 02:08:44');
INSERT INTO `sub2s` VALUES (25, '14', 'Lencang Depan', 7, '2020-05-07 02:09:03', '2020-05-07 02:09:03');
INSERT INTO `sub2s` VALUES (26, '01', 'Buka Tutup Barisan', 8, '2020-05-07 02:09:46', '2020-05-07 02:09:46');
INSERT INTO `sub2s` VALUES (27, '02', '2 Langkah Ke Belakang', 8, '2020-05-07 02:10:08', '2020-05-07 02:10:08');
INSERT INTO `sub2s` VALUES (28, '03', 'Dua Langkah Kekanan', 8, '2020-05-07 02:10:32', '2020-05-07 02:10:32');
INSERT INTO `sub2s` VALUES (29, '04', 'Dua Langkah Kedepan', 8, '2020-05-07 02:10:56', '2020-05-07 02:10:56');
INSERT INTO `sub2s` VALUES (30, '05', 'Dua Langkah Kekiri', 8, '2020-05-07 02:11:26', '2020-05-07 02:11:26');
INSERT INTO `sub2s` VALUES (31, '06', 'Melintang Kanan/Kiri', 8, '2020-05-07 02:11:46', '2020-05-07 02:11:46');
INSERT INTO `sub2s` VALUES (32, '07', 'Haluan Kanan/Kiri', 8, '2020-05-07 02:12:02', '2020-05-07 02:12:02');
INSERT INTO `sub2s` VALUES (33, '01', 'Langkah Biasa Ke Langkah Tegap', 9, '2020-05-07 02:13:17', '2020-05-07 02:13:17');
INSERT INTO `sub2s` VALUES (34, '02', 'Hormat Kanan', 9, '2020-05-07 02:13:38', '2020-05-07 02:13:38');
INSERT INTO `sub2s` VALUES (35, '03', 'Tiap-Tiap Banjar 2x Belok Kanan', 9, '2020-05-07 02:14:14', '2020-05-07 02:14:14');
INSERT INTO `sub2s` VALUES (36, '04', 'Langkah Biasa Ke Langkah Perlahan', 9, '2020-05-07 02:14:47', '2020-05-07 02:14:47');
INSERT INTO `sub2s` VALUES (37, '05', 'Langkah Biasa Ke Langkah Lari', 9, '2020-05-07 02:15:02', '2020-05-07 02:15:02');
INSERT INTO `sub2s` VALUES (38, '06', 'Belok Kanan/Kiri', 9, '2020-05-07 02:15:52', '2020-05-07 02:15:52');
INSERT INTO `sub2s` VALUES (39, '07', 'Ganti Langkah', 9, '2020-05-07 02:16:04', '2020-05-07 02:16:04');
INSERT INTO `sub2s` VALUES (40, '08', '2X Belok Kanan/Kiri', 9, '2020-05-07 02:16:28', '2020-05-07 02:16:28');
INSERT INTO `sub2s` VALUES (41, '09', 'Bubar Kumpul', 9, '2020-05-07 02:16:43', '2020-05-07 02:16:43');
INSERT INTO `sub2s` VALUES (42, '01', 'Suara', 10, '2020-05-07 02:19:24', '2020-05-07 02:19:24');
INSERT INTO `sub2s` VALUES (43, '02', 'Sikap', 10, '2020-05-07 02:19:37', '2020-05-07 02:19:37');
INSERT INTO `sub2s` VALUES (44, '03', 'Penguasaan Materi', 10, '2020-05-07 02:19:56', '2020-05-07 02:19:56');
INSERT INTO `sub2s` VALUES (45, '04', 'Penguasaan Lapangan', 10, '2020-05-07 02:20:15', '2020-05-07 02:20:15');
INSERT INTO `sub2s` VALUES (46, '01', 'Kekompakan', 12, '2020-05-07 02:22:30', '2020-05-07 02:22:30');
INSERT INTO `sub2s` VALUES (47, '02', 'Kreatifitas', 12, '2020-05-07 02:22:52', '2020-05-07 02:22:52');
INSERT INTO `sub2s` VALUES (48, '03', 'Mengandung Unsur Garuda \'18 dan Tema', 12, '2020-05-07 02:23:33', '2020-05-07 02:23:33');
INSERT INTO `sub2s` VALUES (49, '04', 'Semangat', 12, '2020-05-07 02:23:46', '2020-05-07 02:23:46');
INSERT INTO `sub2s` VALUES (50, '01', 'Proses Buka', 13, '2020-05-07 02:25:08', '2020-05-07 02:25:08');
INSERT INTO `sub2s` VALUES (51, '02', 'Keindahan Jadi', 13, '2020-05-07 02:25:25', '2020-05-07 02:25:25');
INSERT INTO `sub2s` VALUES (52, '03', 'Kreatifitas', 13, '2020-05-07 02:25:39', '2020-05-07 02:25:39');
INSERT INTO `sub2s` VALUES (53, '04', 'Penguasaan Lapangan', 13, '2020-05-07 02:25:57', '2020-05-07 02:25:57');
INSERT INTO `sub2s` VALUES (54, '05', 'Kerapian', 13, '2020-05-07 02:26:12', '2020-05-07 02:26:12');
INSERT INTO `sub2s` VALUES (55, '01', 'Kekompakan', 11, '2020-05-07 02:26:51', '2020-05-07 02:26:51');
INSERT INTO `sub2s` VALUES (56, '02', 'Kesesuaian Dengan Musik', 11, '2020-05-07 02:27:11', '2020-05-07 02:27:11');
INSERT INTO `sub2s` VALUES (57, '03', 'Kerumitan', 11, '2020-05-07 02:27:25', '2020-05-07 02:27:25');
INSERT INTO `sub2s` VALUES (58, '04', 'Ketegasan', 11, '2020-05-07 02:27:46', '2020-05-07 02:27:46');
INSERT INTO `sub2s` VALUES (59, '05', 'Kerapian', 11, '2020-05-07 02:28:02', '2020-05-07 02:28:02');
INSERT INTO `sub2s` VALUES (60, '01', 'Kesesuaian', 14, '2020-05-07 02:29:43', '2020-05-07 02:29:43');
INSERT INTO `sub2s` VALUES (61, '02', 'Keseragaman', 14, '2020-05-07 02:29:55', '2020-05-07 02:29:55');
INSERT INTO `sub2s` VALUES (62, '03', 'Keindahan', 14, '2020-05-07 02:30:12', '2020-05-07 02:30:12');
INSERT INTO `sub2s` VALUES (63, '04', 'Keunikan', 14, '2020-05-07 02:30:22', '2020-05-07 02:30:22');

-- ----------------------------
-- Table structure for subs
-- ----------------------------
DROP TABLE IF EXISTS `subs`;
CREATE TABLE `subs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kisaran_nilai` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subs_kategori_id_foreign`(`kategori_id`) USING BTREE,
  CONSTRAINT `subs_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subs
-- ----------------------------
INSERT INTO `subs` VALUES (7, 'A', 'Gerakan Ditempat', '0,5,10,20,40', 1, '2020-05-07 02:02:49', '2020-05-07 02:03:24');
INSERT INTO `subs` VALUES (8, 'B', 'Gerakan Pindah Tempat', '0,5,10,20,40', 1, '2020-05-07 02:03:48', '2020-05-07 02:03:48');
INSERT INTO `subs` VALUES (9, 'C', 'Gerakan Berjalan', '0,5,10,20,40', 1, '2020-05-07 02:04:04', '2020-05-07 02:04:04');
INSERT INTO `subs` VALUES (10, 'A', NULL, '0,5,10,20,40', 2, '2020-05-07 02:18:13', '2020-05-07 02:18:13');
INSERT INTO `subs` VALUES (11, 'A', NULL, '0,5,10,20,40', 3, '2020-05-07 02:20:30', '2020-05-07 02:20:30');
INSERT INTO `subs` VALUES (12, 'A', NULL, '0,5,10,20,40', 5, '2020-05-07 02:22:09', '2020-05-07 02:22:09');
INSERT INTO `subs` VALUES (13, 'A', NULL, '0,5,10,20,40', 4, '2020-05-07 02:24:47', '2020-05-07 02:24:47');
INSERT INTO `subs` VALUES (14, 'A', NULL, '0,5,10,20,40', 7, '2020-05-07 02:29:23', '2020-05-07 02:29:23');

-- ----------------------------
-- Table structure for tb_ballot
-- ----------------------------
DROP TABLE IF EXISTS `tb_ballot`;
CREATE TABLE `tb_ballot`  (
  `id` tinyint(1) NOT NULL,
  `persen` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'hanya digunakan dirow pertama' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_ballot
-- ----------------------------
INSERT INTO `tb_ballot` VALUES (1, 10);
INSERT INTO `tb_ballot` VALUES (2, 0);

-- ----------------------------
-- Table structure for tb_juri
-- ----------------------------
DROP TABLE IF EXISTS `tb_juri`;
CREATE TABLE `tb_juri`  (
  `id_juri` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `juri` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `passwd` varchar(24) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_juri`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_juri
-- ----------------------------
INSERT INTO `tb_juri` VALUES ('1', 'juri 1', 'juri');

-- ----------------------------
-- Table structure for tb_kategori
-- ----------------------------
DROP TABLE IF EXISTS `tb_kategori`;
CREATE TABLE `tb_kategori`  (
  `id_kategori` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kategori` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bobot_umum` int(3) NULL DEFAULT NULL,
  `bobot_utama` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kategori`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_kategori
-- ----------------------------
INSERT INTO `tb_kategori` VALUES ('1', 'pbb', 70, 70);
INSERT INTO `tb_kategori` VALUES ('2', 'danton', 20, 20);

-- ----------------------------
-- Table structure for tb_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `tb_penilaian`;
CREATE TABLE `tb_penilaian`  (
  `id_penilaian` int(4) NOT NULL AUTO_INCREMENT,
  `id_juri` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_sub2` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_sekolah` int(4) NOT NULL,
  `nilai` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id_penilaian`) USING BTREE,
  INDEX `tb_juri_to_tb_penilaian`(`id_juri`) USING BTREE,
  INDEX `tb_sekolah_to_tb_penilaian`(`id_sekolah`) USING BTREE,
  INDEX `tb_sub2_to_tb_penilaian`(`id_sub2`) USING BTREE,
  CONSTRAINT `tb_juri_to_tb_penilaian` FOREIGN KEY (`id_juri`) REFERENCES `tb_juri` (`id_juri`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tb_sekolah_to_tb_penilaian` FOREIGN KEY (`id_sekolah`) REFERENCES `tb_sekolah` (`id_sekolah`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tb_sub2_to_tb_penilaian` FOREIGN KEY (`id_sub2`) REFERENCES `tb_sub2` (`id_sub2`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_penilaian
-- ----------------------------
INSERT INTO `tb_penilaian` VALUES (1, '1', '111', 1, 0);
INSERT INTO `tb_penilaian` VALUES (2, '1', '121', 1, 0);
INSERT INTO `tb_penilaian` VALUES (3, '1', '211', 1, 0);
INSERT INTO `tb_penilaian` VALUES (4, '1', '212', 1, 0);
INSERT INTO `tb_penilaian` VALUES (5, '1', '111', 2, 0);
INSERT INTO `tb_penilaian` VALUES (6, '1', '121', 2, 0);
INSERT INTO `tb_penilaian` VALUES (7, '1', '211', 2, 0);
INSERT INTO `tb_penilaian` VALUES (8, '1', '212', 2, 0);
INSERT INTO `tb_penilaian` VALUES (9, '1', '111', 3, 0);
INSERT INTO `tb_penilaian` VALUES (10, '1', '121', 3, 0);
INSERT INTO `tb_penilaian` VALUES (11, '1', '211', 3, 0);
INSERT INTO `tb_penilaian` VALUES (12, '1', '212', 3, 0);
INSERT INTO `tb_penilaian` VALUES (13, '1', '111', 4, 0);
INSERT INTO `tb_penilaian` VALUES (14, '1', '121', 4, 0);
INSERT INTO `tb_penilaian` VALUES (15, '1', '211', 4, 0);
INSERT INTO `tb_penilaian` VALUES (16, '1', '212', 4, 0);
INSERT INTO `tb_penilaian` VALUES (17, '1', '111', 5, 0);
INSERT INTO `tb_penilaian` VALUES (18, '1', '121', 5, 0);
INSERT INTO `tb_penilaian` VALUES (19, '1', '211', 5, 0);
INSERT INTO `tb_penilaian` VALUES (20, '1', '212', 5, 0);
INSERT INTO `tb_penilaian` VALUES (21, '1', '111', 6, 0);
INSERT INTO `tb_penilaian` VALUES (22, '1', '121', 6, 0);
INSERT INTO `tb_penilaian` VALUES (23, '1', '211', 6, 0);
INSERT INTO `tb_penilaian` VALUES (24, '1', '212', 6, 0);
INSERT INTO `tb_penilaian` VALUES (25, '1', '111', 7, 0);
INSERT INTO `tb_penilaian` VALUES (26, '1', '121', 7, 0);
INSERT INTO `tb_penilaian` VALUES (27, '1', '211', 7, 0);
INSERT INTO `tb_penilaian` VALUES (28, '1', '212', 7, 0);
INSERT INTO `tb_penilaian` VALUES (29, '1', '111', 8, 0);
INSERT INTO `tb_penilaian` VALUES (30, '1', '121', 8, 0);
INSERT INTO `tb_penilaian` VALUES (31, '1', '211', 8, 0);
INSERT INTO `tb_penilaian` VALUES (32, '1', '212', 8, 0);
INSERT INTO `tb_penilaian` VALUES (33, '1', '111', 9, 0);
INSERT INTO `tb_penilaian` VALUES (34, '1', '121', 9, 0);
INSERT INTO `tb_penilaian` VALUES (35, '1', '211', 9, 0);
INSERT INTO `tb_penilaian` VALUES (36, '1', '212', 9, 0);
INSERT INTO `tb_penilaian` VALUES (37, '1', '111', 10, 0);
INSERT INTO `tb_penilaian` VALUES (38, '1', '121', 10, 0);
INSERT INTO `tb_penilaian` VALUES (39, '1', '211', 10, 0);
INSERT INTO `tb_penilaian` VALUES (40, '1', '212', 10, 0);
INSERT INTO `tb_penilaian` VALUES (41, '1', '111', 11, 0);
INSERT INTO `tb_penilaian` VALUES (42, '1', '121', 11, 0);
INSERT INTO `tb_penilaian` VALUES (43, '1', '211', 11, 0);
INSERT INTO `tb_penilaian` VALUES (44, '1', '212', 11, 0);
INSERT INTO `tb_penilaian` VALUES (45, '1', '111', 12, 0);
INSERT INTO `tb_penilaian` VALUES (46, '1', '121', 12, 0);
INSERT INTO `tb_penilaian` VALUES (47, '1', '211', 12, 0);
INSERT INTO `tb_penilaian` VALUES (48, '1', '212', 12, 0);
INSERT INTO `tb_penilaian` VALUES (49, '1', '111', 13, 0);
INSERT INTO `tb_penilaian` VALUES (50, '1', '121', 13, 0);
INSERT INTO `tb_penilaian` VALUES (51, '1', '211', 13, 0);
INSERT INTO `tb_penilaian` VALUES (52, '1', '212', 13, 0);
INSERT INTO `tb_penilaian` VALUES (53, '1', '111', 14, 0);
INSERT INTO `tb_penilaian` VALUES (54, '1', '121', 14, 0);
INSERT INTO `tb_penilaian` VALUES (55, '1', '211', 14, 0);
INSERT INTO `tb_penilaian` VALUES (56, '1', '212', 14, 0);
INSERT INTO `tb_penilaian` VALUES (57, '1', '111', 15, 0);
INSERT INTO `tb_penilaian` VALUES (58, '1', '121', 15, 0);
INSERT INTO `tb_penilaian` VALUES (59, '1', '211', 15, 0);
INSERT INTO `tb_penilaian` VALUES (60, '1', '212', 15, 0);

-- ----------------------------
-- Table structure for tb_sekolah
-- ----------------------------
DROP TABLE IF EXISTS `tb_sekolah`;
CREATE TABLE `tb_sekolah`  (
  `id_sekolah` int(4) NOT NULL,
  `sekolah` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ballot` int(11) NULL DEFAULT 0,
  `pinalti` int(4) NULL DEFAULT 0,
  PRIMARY KEY (`id_sekolah`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sekolah
-- ----------------------------
INSERT INTO `tb_sekolah` VALUES (1, 'sman 1', 10, 0);
INSERT INTO `tb_sekolah` VALUES (2, 'sman 2', 50, 0);
INSERT INTO `tb_sekolah` VALUES (3, 'sman 3', 40, 0);
INSERT INTO `tb_sekolah` VALUES (4, 'sman 4', 20, NULL);
INSERT INTO `tb_sekolah` VALUES (5, 'sman 5', 0, 0);
INSERT INTO `tb_sekolah` VALUES (6, 'sman 6', 0, 0);
INSERT INTO `tb_sekolah` VALUES (7, 'sman 7', 0, 10);
INSERT INTO `tb_sekolah` VALUES (8, 'sman 8', 0, 0);
INSERT INTO `tb_sekolah` VALUES (9, 'sman 9', 0, 0);
INSERT INTO `tb_sekolah` VALUES (10, 'sman 10', 0, 0);
INSERT INTO `tb_sekolah` VALUES (11, 'sman 11', 0, 0);
INSERT INTO `tb_sekolah` VALUES (12, 'sman 12', 0, 0);
INSERT INTO `tb_sekolah` VALUES (13, 'sman 13', 0, 0);
INSERT INTO `tb_sekolah` VALUES (14, 'sman 14', 0, 0);
INSERT INTO `tb_sekolah` VALUES (15, 'sman 15', 0, 0);

-- ----------------------------
-- Table structure for tb_sub
-- ----------------------------
DROP TABLE IF EXISTS `tb_sub`;
CREATE TABLE `tb_sub`  (
  `id_sub` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sub` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_kategori` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rentang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_sub`) USING BTREE,
  INDEX `tb_kategori_to_tb_sub`(`id_kategori`) USING BTREE,
  CONSTRAINT `tb_kategori_to_tb_sub` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id_kategori`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sub
-- ----------------------------
INSERT INTO `tb_sub` VALUES ('11', 'ditempat', '1', '0,15,20,25,50');
INSERT INTO `tb_sub` VALUES ('12', 'berjalan', '1', '1,2,3,4,5');
INSERT INTO `tb_sub` VALUES ('21', NULL, '2', '15,16,17,18');

-- ----------------------------
-- Table structure for tb_sub2
-- ----------------------------
DROP TABLE IF EXISTS `tb_sub2`;
CREATE TABLE `tb_sub2`  (
  `id_sub2` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sub2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_sub` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_sub2`) USING BTREE,
  INDEX `tb_sub_to_tb_sub2`(`id_sub`) USING BTREE,
  CONSTRAINT `tb_sub_to_tb_sub2` FOREIGN KEY (`id_sub`) REFERENCES `tb_sub` (`id_sub`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sub2
-- ----------------------------
INSERT INTO `tb_sub2` VALUES ('111', '2 langkah ke kanan', '11');
INSERT INTO `tb_sub2` VALUES ('121', 'hormat', '12');
INSERT INTO `tb_sub2` VALUES ('211', 'sikap', '21');
INSERT INTO `tb_sub2` VALUES ('212', 'Kelantangan', '21');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
