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

 Date: 25/06/2020 14:50:57
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'pinalti_umum', '100', NULL, NULL);
INSERT INTO `config` VALUES (2, 'pinalti_utama', '100', NULL, NULL);
INSERT INTO `config` VALUES (3, 'ballot_umum', '100', NULL, NULL);
INSERT INTO `config` VALUES (4, 'ballot_utama', '0', NULL, NULL);
INSERT INTO `config` VALUES (10, 'title_default', 'LEMBAR PENILAIAN <br> GARUDA 9.0 <br> GERAK KREATIVITAS GENERASI MUDA PASKIBRA', NULL, NULL);
INSERT INTO `config` VALUES (11, 'title', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `group_juris` VALUES (1, 'FARVORYEL', '2020-03-24 21:29:41', '2020-05-06 18:57:20');
INSERT INTO `group_juris` VALUES (2, 'PBB', '2020-03-24 21:29:48', '2020-03-26 19:30:11');
INSERT INTO `group_juris` VALUES (6, 'FARVORYELKOS', '2020-05-06 18:57:56', '2020-05-06 18:57:56');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of juris
-- ----------------------------
INSERT INTO `juris` VALUES (1, 'farvoryel', 'Supradi', 'test', '2020-03-24 21:30:21', '2020-05-06 19:52:08', 1, NULL);
INSERT INTO `juris` VALUES (3, 'pbb1', 'Suhadi', 'test', '2020-03-24 21:31:02', '2020-05-06 19:52:28', 2, NULL);
INSERT INTO `juris` VALUES (4, 'pbb2', 'amin', 'test', '2020-03-24 21:31:28', '2020-05-06 19:51:15', 2, NULL);
INSERT INTO `juris` VALUES (5, 'farvoryelkos', 'Nanang', 'test', '2020-05-06 18:59:03', '2020-05-06 19:50:58', 6, NULL);
INSERT INTO `juris` VALUES (6, 'pbb3', 'suherman', 'test', '2020-05-06 19:00:17', '2020-05-06 19:51:21', 2, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategoris
-- ----------------------------
INSERT INTO `kategoris` VALUES (1, 'A', 'PBB', 100, 100, '2020-03-24 21:31:59', '2020-04-14 22:31:35');
INSERT INTO `kategoris` VALUES (2, 'B', 'danton', 100, 100, '2020-03-24 21:32:11', '2020-04-14 22:31:46');
INSERT INTO `kategoris` VALUES (3, 'E', 'variasi', 100, 100, '2020-03-24 21:36:17', '2020-05-06 19:21:22');
INSERT INTO `kategoris` VALUES (4, 'D', 'formasi', 100, 100, '2020-03-24 21:36:38', '2020-04-14 22:32:04');
INSERT INTO `kategoris` VALUES (5, 'C', 'yel-yel', 100, 100, '2020-03-24 21:36:51', '2020-05-06 19:21:40');
INSERT INTO `kategoris` VALUES (7, 'F', 'kostum', 100, 100, '2020-05-06 19:28:46', '2020-05-06 19:28:46');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of peletons
-- ----------------------------
INSERT INTO `peletons` VALUES (3, 1, 'SMAN 1 Jombang', 0.00, 0.00, '2020-03-26 19:15:14', '2020-04-15 20:39:20');
INSERT INTO `peletons` VALUES (4, 2, 'SMAN 2 Jombang', 0.00, 0.00, '2020-03-26 19:17:51', '2020-04-15 20:39:03');
INSERT INTO `peletons` VALUES (5, 3, 'SMAN 3 Jombang', 0.00, 0.00, '2020-03-26 19:17:51', '2020-04-15 20:39:03');
INSERT INTO `peletons` VALUES (6, 4, 'SMAN 4 Jombang', 0.00, 0.00, '2021-03-26 17:00:00', '2021-04-15 17:00:00');
INSERT INTO `peletons` VALUES (7, 5, 'SMAN 5 Jombang', 0.00, 0.00, '2021-03-26 17:00:00', '2021-04-15 17:00:00');
INSERT INTO `peletons` VALUES (8, 6, 'SMAN 6 Jombang', 0.00, 0.00, '2021-03-26 17:00:00', '2021-04-15 17:00:00');
INSERT INTO `peletons` VALUES (9, 7, 'SMAN 7 Jombang', 0.00, 0.00, '2022-03-26 17:00:00', '2022-04-15 17:00:00');
INSERT INTO `peletons` VALUES (10, 8, 'SMAN 8 Jombang', 0.00, 0.00, '2022-03-26 17:00:00', '2022-04-15 17:00:00');
INSERT INTO `peletons` VALUES (11, 9, 'SMAN 9 Jombang', 0.00, 0.00, '2022-03-26 17:00:00', '2022-04-15 17:00:00');
INSERT INTO `peletons` VALUES (12, 10, 'SMAN 10 Jombang', 0.00, 0.00, '2023-03-26 17:00:00', '2023-04-15 17:00:00');
INSERT INTO `peletons` VALUES (13, 11, 'SMAN 11 Jombang', 0.00, 0.00, '2023-03-26 17:00:00', '2023-04-15 17:00:00');
INSERT INTO `peletons` VALUES (14, 12, 'SMAN 12 Jombang', 0.00, 0.00, '2023-03-26 17:00:00', '2023-04-15 17:00:00');
INSERT INTO `peletons` VALUES (15, 13, 'SMAN 13 Jombang', 0.00, 0.00, '2024-03-26 17:00:00', '2024-04-15 17:00:00');
INSERT INTO `peletons` VALUES (16, 14, 'SMAN 14 Jombang', 0.00, 0.00, '2024-03-26 17:00:00', '2024-04-15 17:00:00');
INSERT INTO `peletons` VALUES (17, 15, 'SMAN 15 Jombang', 0.00, 0.00, '2024-03-26 17:00:00', '2024-04-15 17:00:00');
INSERT INTO `peletons` VALUES (18, 16, 'SMAN 16 Jombang', 0.00, 0.00, '2025-03-26 17:00:00', '2025-04-15 17:00:00');
INSERT INTO `peletons` VALUES (19, 17, 'SMAN 17 Jombang', 0.00, 0.00, '2025-03-26 17:00:00', '2025-04-15 17:00:00');
INSERT INTO `peletons` VALUES (20, 18, 'SMAN 18 Jombang', 0.00, 0.00, '2025-03-26 17:00:00', '2025-04-15 17:00:00');
INSERT INTO `peletons` VALUES (21, 19, 'SMAN 19 Jombang', 0.00, 0.00, '2026-03-26 17:00:00', '2026-04-15 17:00:00');
INSERT INTO `peletons` VALUES (22, 20, 'SMAN 20 Jombang', 0.00, 0.00, '2026-03-26 17:00:00', '2026-04-15 17:00:00');

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
INSERT INTO `penilaian` VALUES (1, 3, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 3, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 4, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 5, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 6, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 7, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 8, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 9, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 10, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 11, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 12, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 13, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 14, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 15, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 16, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 17, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 18, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 19, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 20, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 21, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (1, 22, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 3, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 4, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 5, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 6, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 7, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 8, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 9, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 10, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 11, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 12, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 13, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 14, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 15, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 16, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 17, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 18, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 19, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 20, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 21, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (3, 22, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 12, 0, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 13, 40, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 14, 0, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 15, 10, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 16, 5, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 17, 40, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 18, 10, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 19, 5, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 20, 20, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 21, 5, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 22, 5, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 23, 0, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 24, 40, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 7, 25, 10, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 26, 5, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 27, 20, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 28, 5, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 29, 10, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 30, 5, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 31, 20, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 8, 32, 10, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 33, 0, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 34, 40, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 35, 10, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 36, 10, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 37, 10, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 38, 5, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 39, 40, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 40, 40, 1);
INSERT INTO `penilaian` VALUES (4, 3, 1, 9, 41, 40, 1);
INSERT INTO `penilaian` VALUES (4, 3, 2, 10, 42, 10, 1);
INSERT INTO `penilaian` VALUES (4, 3, 2, 10, 43, 20, 1);
INSERT INTO `penilaian` VALUES (4, 3, 2, 10, 44, 40, 1);
INSERT INTO `penilaian` VALUES (4, 3, 2, 10, 45, 10, 1);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 4, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 5, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 6, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 7, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 8, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 9, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 10, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 11, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 12, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 13, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 14, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 15, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 16, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 17, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 18, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 19, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 20, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 21, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (4, 22, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 4, 13, 50, 40, 1);
INSERT INTO `penilaian` VALUES (5, 3, 4, 13, 51, 40, 1);
INSERT INTO `penilaian` VALUES (5, 3, 4, 13, 52, 40, 1);
INSERT INTO `penilaian` VALUES (5, 3, 4, 13, 53, 40, 1);
INSERT INTO `penilaian` VALUES (5, 3, 4, 13, 54, 40, 1);
INSERT INTO `penilaian` VALUES (5, 3, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 3, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 4, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 5, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 6, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 7, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 8, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 9, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 10, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 11, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 12, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 13, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 14, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 15, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 16, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 17, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 18, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 19, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 20, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 21, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 3, 11, 55, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 3, 11, 56, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 3, 11, 57, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 3, 11, 58, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 3, 11, 59, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 4, 13, 50, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 4, 13, 51, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 4, 13, 52, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 4, 13, 53, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 4, 13, 54, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 5, 12, 46, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 5, 12, 47, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 5, 12, 48, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 5, 12, 49, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 7, 14, 60, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 7, 14, 61, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 7, 14, 62, NULL, 0);
INSERT INTO `penilaian` VALUES (5, 22, 7, 14, 63, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 3, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 4, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 5, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 6, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 7, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 8, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 9, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 10, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 11, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 12, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 13, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 14, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 15, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 16, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 17, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 18, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 19, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 20, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 21, 2, 10, 45, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 12, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 13, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 14, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 15, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 16, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 17, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 18, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 19, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 20, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 21, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 22, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 23, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 24, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 7, 25, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 26, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 27, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 28, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 29, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 30, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 31, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 8, 32, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 33, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 34, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 35, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 36, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 37, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 38, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 39, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 40, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 1, 9, 41, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 2, 10, 42, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 2, 10, 43, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 2, 10, 44, NULL, 0);
INSERT INTO `penilaian` VALUES (6, 22, 2, 10, 45, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sub2s
-- ----------------------------
INSERT INTO `sub2s` VALUES (12, '01', 'Sikap Hormat', 7, '2020-05-06 19:04:33', '2020-05-06 19:04:33');
INSERT INTO `sub2s` VALUES (13, '02', 'Istirahat Ditempat', 7, '2020-05-06 19:04:53', '2020-05-06 19:05:19');
INSERT INTO `sub2s` VALUES (14, '03', 'Periksa Kerapihan', 7, '2020-05-06 19:05:41', '2020-05-06 19:05:41');
INSERT INTO `sub2s` VALUES (15, '04', 'Sikap Siap Sempurna', 7, '2020-05-06 19:06:05', '2020-05-06 19:06:05');
INSERT INTO `sub2s` VALUES (16, '05', 'Hitung', 7, '2020-05-06 19:06:16', '2020-05-06 19:06:16');
INSERT INTO `sub2s` VALUES (17, '06', 'Setengah Lencang Kanan/Kiri', 7, '2020-05-06 19:06:44', '2020-05-06 19:06:44');
INSERT INTO `sub2s` VALUES (18, '07', 'Lencang Kanan/Kiri', 7, '2020-05-06 19:07:09', '2020-05-06 19:07:09');
INSERT INTO `sub2s` VALUES (19, '08', 'Hadap Kanan', 7, '2020-05-06 19:07:23', '2020-05-06 19:07:23');
INSERT INTO `sub2s` VALUES (20, '09', 'Hadap Kiri', 7, '2020-05-06 19:07:36', '2020-05-06 19:07:36');
INSERT INTO `sub2s` VALUES (21, '10', 'Hadap Serong Kanan', 7, '2020-05-06 19:07:54', '2020-05-06 19:07:54');
INSERT INTO `sub2s` VALUES (22, '11', 'Hadap Serong Kiri', 7, '2020-05-06 19:08:12', '2020-05-06 19:08:12');
INSERT INTO `sub2s` VALUES (23, '12', 'Balik Kanan', 7, '2020-05-06 19:08:26', '2020-05-06 19:08:26');
INSERT INTO `sub2s` VALUES (24, '13', 'Jalan Ditempat', 7, '2020-05-06 19:08:44', '2020-05-06 19:08:44');
INSERT INTO `sub2s` VALUES (25, '14', 'Lencang Depan', 7, '2020-05-06 19:09:03', '2020-05-06 19:09:03');
INSERT INTO `sub2s` VALUES (26, '01', 'Buka Tutup Barisan', 8, '2020-05-06 19:09:46', '2020-05-06 19:09:46');
INSERT INTO `sub2s` VALUES (27, '02', '2 Langkah Ke Belakang', 8, '2020-05-06 19:10:08', '2020-05-06 19:10:08');
INSERT INTO `sub2s` VALUES (28, '03', 'Dua Langkah Kekanan', 8, '2020-05-06 19:10:32', '2020-05-06 19:10:32');
INSERT INTO `sub2s` VALUES (29, '04', 'Dua Langkah Kedepan', 8, '2020-05-06 19:10:56', '2020-05-06 19:10:56');
INSERT INTO `sub2s` VALUES (30, '05', 'Dua Langkah Kekiri', 8, '2020-05-06 19:11:26', '2020-05-06 19:11:26');
INSERT INTO `sub2s` VALUES (31, '06', 'Melintang Kanan/Kiri', 8, '2020-05-06 19:11:46', '2020-05-06 19:11:46');
INSERT INTO `sub2s` VALUES (32, '07', 'Haluan Kanan/Kiri', 8, '2020-05-06 19:12:02', '2020-05-06 19:12:02');
INSERT INTO `sub2s` VALUES (33, '01', 'Langkah Biasa Ke Langkah Tegap', 9, '2020-05-06 19:13:17', '2020-05-06 19:13:17');
INSERT INTO `sub2s` VALUES (34, '02', 'Hormat Kanan', 9, '2020-05-06 19:13:38', '2020-05-06 19:13:38');
INSERT INTO `sub2s` VALUES (35, '03', 'Tiap-Tiap Banjar 2x Belok Kanan', 9, '2020-05-06 19:14:14', '2020-05-06 19:14:14');
INSERT INTO `sub2s` VALUES (36, '04', 'Langkah Biasa Ke Langkah Perlahan', 9, '2020-05-06 19:14:47', '2020-05-06 19:14:47');
INSERT INTO `sub2s` VALUES (37, '05', 'Langkah Biasa Ke Langkah Lari', 9, '2020-05-06 19:15:02', '2020-05-06 19:15:02');
INSERT INTO `sub2s` VALUES (38, '06', 'Belok Kanan/Kiri', 9, '2020-05-06 19:15:52', '2020-05-06 19:15:52');
INSERT INTO `sub2s` VALUES (39, '07', 'Ganti Langkah', 9, '2020-05-06 19:16:04', '2020-05-06 19:16:04');
INSERT INTO `sub2s` VALUES (40, '08', '2X Belok Kanan/Kiri', 9, '2020-05-06 19:16:28', '2020-05-06 19:16:28');
INSERT INTO `sub2s` VALUES (41, '09', 'Bubar Kumpul', 9, '2020-05-06 19:16:43', '2020-05-06 19:16:43');
INSERT INTO `sub2s` VALUES (42, '01', 'Suara', 10, '2020-05-06 19:19:24', '2020-05-06 19:19:24');
INSERT INTO `sub2s` VALUES (43, '02', 'Sikap', 10, '2020-05-06 19:19:37', '2020-05-06 19:19:37');
INSERT INTO `sub2s` VALUES (44, '03', 'Penguasaan Materi', 10, '2020-05-06 19:19:56', '2020-05-06 19:19:56');
INSERT INTO `sub2s` VALUES (45, '04', 'Penguasaan Lapangan', 10, '2020-05-06 19:20:15', '2020-05-06 19:20:15');
INSERT INTO `sub2s` VALUES (46, '01', 'Kekompakan', 12, '2020-05-06 19:22:30', '2020-05-06 19:22:30');
INSERT INTO `sub2s` VALUES (47, '02', 'Kreatifitas', 12, '2020-05-06 19:22:52', '2020-05-06 19:22:52');
INSERT INTO `sub2s` VALUES (48, '03', 'Mengandung Unsur Garuda \'18 dan Tema', 12, '2020-05-06 19:23:33', '2020-05-06 19:23:33');
INSERT INTO `sub2s` VALUES (49, '04', 'Semangat', 12, '2020-05-06 19:23:46', '2020-05-06 19:23:46');
INSERT INTO `sub2s` VALUES (50, '01', 'Proses Buka', 13, '2020-05-06 19:25:08', '2020-05-06 19:25:08');
INSERT INTO `sub2s` VALUES (51, '02', 'Keindahan Jadi', 13, '2020-05-06 19:25:25', '2020-05-06 19:25:25');
INSERT INTO `sub2s` VALUES (52, '03', 'Kreatifitas', 13, '2020-05-06 19:25:39', '2020-05-06 19:25:39');
INSERT INTO `sub2s` VALUES (53, '04', 'Penguasaan Lapangan', 13, '2020-05-06 19:25:57', '2020-05-06 19:25:57');
INSERT INTO `sub2s` VALUES (54, '05', 'Kerapian', 13, '2020-05-06 19:26:12', '2020-05-06 19:26:12');
INSERT INTO `sub2s` VALUES (55, '01', 'Kekompakan', 11, '2020-05-06 19:26:51', '2020-05-06 19:26:51');
INSERT INTO `sub2s` VALUES (56, '02', 'Kesesuaian Dengan Musik', 11, '2020-05-06 19:27:11', '2020-05-06 19:27:11');
INSERT INTO `sub2s` VALUES (57, '03', 'Kerumitan', 11, '2020-05-06 19:27:25', '2020-05-06 19:27:25');
INSERT INTO `sub2s` VALUES (58, '04', 'Ketegasan', 11, '2020-05-06 19:27:46', '2020-05-06 19:27:46');
INSERT INTO `sub2s` VALUES (59, '05', 'Kerapian', 11, '2020-05-06 19:28:02', '2020-05-06 19:28:02');
INSERT INTO `sub2s` VALUES (60, '01', 'Kesesuaian', 14, '2020-05-06 19:29:43', '2020-05-06 19:29:43');
INSERT INTO `sub2s` VALUES (61, '02', 'Keseragaman', 14, '2020-05-06 19:29:55', '2020-05-06 19:29:55');
INSERT INTO `sub2s` VALUES (62, '03', 'Keindahan', 14, '2020-05-06 19:30:12', '2020-05-06 19:30:12');
INSERT INTO `sub2s` VALUES (63, '04', 'Keunikan', 14, '2020-05-06 19:30:22', '2020-05-06 19:30:22');

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subs
-- ----------------------------
INSERT INTO `subs` VALUES (7, 'A', 'Gerakan Ditempat', '0,5,10,20,40', 1, '2020-05-06 19:02:49', '2020-05-06 19:03:24');
INSERT INTO `subs` VALUES (8, 'B', 'Gerakan Pindah Tempat', '0,5,10,20,40', 1, '2020-05-06 19:03:48', '2020-05-06 19:03:48');
INSERT INTO `subs` VALUES (9, 'C', 'Gerakan Berjalan', '0,5,10,20,40', 1, '2020-05-06 19:04:04', '2020-05-06 19:04:04');
INSERT INTO `subs` VALUES (10, 'A', NULL, '0,5,10,20,40', 2, '2020-05-06 19:18:13', '2020-05-06 19:18:13');
INSERT INTO `subs` VALUES (11, 'A', NULL, '0,5,10,20,40', 3, '2020-05-06 19:20:30', '2020-05-06 19:20:30');
INSERT INTO `subs` VALUES (12, 'A', NULL, '0,5,10,20,40', 5, '2020-05-06 19:22:09', '2020-05-06 19:22:09');
INSERT INTO `subs` VALUES (13, 'A', NULL, '0,5,10,20,40', 4, '2020-05-06 19:24:47', '2020-05-06 19:24:47');
INSERT INTO `subs` VALUES (14, 'A', NULL, '0,5,10,20,40', 7, '2020-05-06 19:29:23', '2020-05-06 19:29:23');

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
INSERT INTO `tb_penilaian` VALUES (1, '1', '111', 1, 20);
INSERT INTO `tb_penilaian` VALUES (2, '1', '121', 1, 3);
INSERT INTO `tb_penilaian` VALUES (3, '1', '211', 1, 15);
INSERT INTO `tb_penilaian` VALUES (4, '1', '212', 1, 18);
INSERT INTO `tb_penilaian` VALUES (5, '1', '111', 2, 20);
INSERT INTO `tb_penilaian` VALUES (6, '1', '121', 2, 4);
INSERT INTO `tb_penilaian` VALUES (7, '1', '211', 2, 20);
INSERT INTO `tb_penilaian` VALUES (8, '1', '212', 2, 17);
INSERT INTO `tb_penilaian` VALUES (9, '1', '111', 3, 20);
INSERT INTO `tb_penilaian` VALUES (10, '1', '121', 3, 3);
INSERT INTO `tb_penilaian` VALUES (11, '1', '211', 3, 16);
INSERT INTO `tb_penilaian` VALUES (12, '1', '212', 3, 20);
INSERT INTO `tb_penilaian` VALUES (13, '1', '111', 4, 20);
INSERT INTO `tb_penilaian` VALUES (14, '1', '121', 4, 2);
INSERT INTO `tb_penilaian` VALUES (15, '1', '211', 4, 16);
INSERT INTO `tb_penilaian` VALUES (16, '1', '212', 4, 18);
INSERT INTO `tb_penilaian` VALUES (17, '1', '111', 5, 0);
INSERT INTO `tb_penilaian` VALUES (18, '1', '121', 5, 2);
INSERT INTO `tb_penilaian` VALUES (19, '1', '211', 5, 0);
INSERT INTO `tb_penilaian` VALUES (20, '1', '212', 5, 17);
INSERT INTO `tb_penilaian` VALUES (21, '1', '111', 6, 25);
INSERT INTO `tb_penilaian` VALUES (22, '1', '121', 6, 2);
INSERT INTO `tb_penilaian` VALUES (23, '1', '211', 6, 18);
INSERT INTO `tb_penilaian` VALUES (24, '1', '212', 6, 0);
INSERT INTO `tb_penilaian` VALUES (25, '1', '111', 7, 50);
INSERT INTO `tb_penilaian` VALUES (26, '1', '121', 7, 5);
INSERT INTO `tb_penilaian` VALUES (27, '1', '211', 7, 18);
INSERT INTO `tb_penilaian` VALUES (28, '1', '212', 7, 18);
INSERT INTO `tb_penilaian` VALUES (29, '1', '111', 8, 50);
INSERT INTO `tb_penilaian` VALUES (30, '1', '121', 8, 5);
INSERT INTO `tb_penilaian` VALUES (31, '1', '211', 8, 17);
INSERT INTO `tb_penilaian` VALUES (32, '1', '212', 8, 18);
INSERT INTO `tb_penilaian` VALUES (33, '1', '111', 9, 20);
INSERT INTO `tb_penilaian` VALUES (34, '1', '121', 9, 3);
INSERT INTO `tb_penilaian` VALUES (35, '1', '211', 9, 17);
INSERT INTO `tb_penilaian` VALUES (36, '1', '212', 9, 17);
INSERT INTO `tb_penilaian` VALUES (37, '1', '111', 10, 50);
INSERT INTO `tb_penilaian` VALUES (38, '1', '121', 10, 4);
INSERT INTO `tb_penilaian` VALUES (39, '1', '211', 10, 17);
INSERT INTO `tb_penilaian` VALUES (40, '1', '212', 10, 18);
INSERT INTO `tb_penilaian` VALUES (41, '1', '111', 11, 0);
INSERT INTO `tb_penilaian` VALUES (42, '1', '121', 11, 4);
INSERT INTO `tb_penilaian` VALUES (43, '1', '211', 11, 18);
INSERT INTO `tb_penilaian` VALUES (44, '1', '212', 11, 17);
INSERT INTO `tb_penilaian` VALUES (45, '1', '111', 12, 0);
INSERT INTO `tb_penilaian` VALUES (46, '1', '121', 12, 2);
INSERT INTO `tb_penilaian` VALUES (47, '1', '211', 12, 17);
INSERT INTO `tb_penilaian` VALUES (48, '1', '212', 12, 16);
INSERT INTO `tb_penilaian` VALUES (49, '1', '111', 13, 50);
INSERT INTO `tb_penilaian` VALUES (50, '1', '121', 13, 4);
INSERT INTO `tb_penilaian` VALUES (51, '1', '211', 13, 18);
INSERT INTO `tb_penilaian` VALUES (52, '1', '212', 13, 17);
INSERT INTO `tb_penilaian` VALUES (53, '1', '111', 14, 50);
INSERT INTO `tb_penilaian` VALUES (54, '1', '121', 14, 4);
INSERT INTO `tb_penilaian` VALUES (55, '1', '211', 14, 18);
INSERT INTO `tb_penilaian` VALUES (56, '1', '212', 14, 18);
INSERT INTO `tb_penilaian` VALUES (57, '1', '111', 15, 50);
INSERT INTO `tb_penilaian` VALUES (58, '1', '121', 15, 4);
INSERT INTO `tb_penilaian` VALUES (59, '1', '211', 15, 17);
INSERT INTO `tb_penilaian` VALUES (60, '1', '212', 15, 15);

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
