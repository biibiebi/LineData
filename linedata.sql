CREATE TABLE `station` (
  `station_cd` int(11) NOT NULL,
  `station_g_cd` int(11) NOT NULL,
  `station_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `station_name_k` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `station_name_r` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `railway_lines_id` int(11) NOT NULL,
  `prefectures_id` int(11) DEFAULT NULL,
  `post` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lon` decimal(9,6) DEFAULT NULL,
  `lat` decimal(8,6) DEFAULT NULL,
  `open_ymd` datetime DEFAULT NULL,
  `close_ymd` datetime DEFAULT NULL,
  `e_status` smallint(6) DEFAULT NULL,
  `e_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`station_cd`),
  KEY `index_stations_on_lon_and_lat` (`lon`,`lat`),
  KEY `index_stations_on_station_name` (`station_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `railway_line` (
  `railway_line_cd` int(11) NOT NULL,
  `railway_company_id` int(11) NOT NULL,
  `line_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line_name_k` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line_name_h` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line_color_c` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line_color_t` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line_type` int(11) DEFAULT NULL,
  `lon` decimal(9,6) DEFAULT NULL,
  `lat` decimal(8,6) DEFAULT NULL,
  `zoom` int(11) DEFAULT NULL,
  `e_status` smallint(6) DEFAULT NULL,
  `e_sort` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`railway_line_cd`),
  KEY `index_railway_lines_on_lon_and_lat` (`lon`,`lat`),
  KEY `index_railway_lines_on_line_name` (`line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `railway_company` (
  `company_cd` int(11) NOT NULL,
  `rr_cd` int(11) NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_name_k` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name_h` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name_r` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_type` int(11) DEFAULT NULL,
  `e_status` smallint(6) DEFAULT NULL,
  `e_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_cd`),
  KEY `index_railway_companies_on_company_name` (`company_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `prefecture` (
  `pref_cd` int(11) NOT NULL,
  `pref_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pref_cd`),
  UNIQUE KEY `index_prefectures_on_pref_name` (`pref_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `join` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_cd` int(11) NOT NULL,
  `station_cd1` int(11) NOT NULL,
  `station_cd2` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_joins_on_line_cd_and_station_cd1_and_station_cd2` (`line_cd`,`station_cd1`,`station_cd2`)
) ENGINE=InnoDB AUTO_INCREMENT=99929 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

