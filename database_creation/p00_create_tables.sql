/*
 Pokemon Competitive Battling database
 See changelog table for details

 Original data scraped by Rounak Banik from Serebii.net
 https://www.kaggle.com/rounakbanik/pokemon
 https://www.serebii.net/pokedex-sm/

 DISCLAIMER
 - If pokemon has a mega, the data does not differentiate and replaces original entry
 - Also, does not consider if Pokemon has 2 megas
 - TODO join serebii table with serebii
 - TODO get height/weight information for megas
*/

SELECT 'CREATING DATABASE STRUCTURE' info;

DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;

/*!50503 SET default_storage_engine = innodb */;
/*!50503 SELECT CONCAT('storage engine: ', @@default_storage_engine) info */;

DROP TABLE IF EXISTS serebii;
CREATE TABLE serebii (
	abilities           VARCHAR(100)  NOT NULL,
	against_bug         DECIMAL(3, 2) UNSIGNED,
	against_dark        DECIMAL(3, 2) UNSIGNED,
	against_dragon      DECIMAL(3, 2) UNSIGNED,
	against_electric    DECIMAL(3, 2) UNSIGNED,
	against_fairy       DECIMAL(3, 2) UNSIGNED,
	against_fight       DECIMAL(3, 2) UNSIGNED,
	against_fire        DECIMAL(3, 2) UNSIGNED,
	against_flying      DECIMAL(3, 2) UNSIGNED,
	against_ghost       DECIMAL(3, 2) UNSIGNED,
	against_grass       DECIMAL(3, 2) UNSIGNED,
	against_ground      DECIMAL(3, 2) UNSIGNED,
	against_ice         DECIMAL(3, 2) UNSIGNED,
	against_normal      DECIMAL(3, 2) UNSIGNED,
	against_poison      DECIMAL(3, 2) UNSIGNED,
	against_psychic     DECIMAL(3, 2) UNSIGNED,
	against_rock        DECIMAL(3, 2) UNSIGNED,
	against_steel       DECIMAL(3, 2) UNSIGNED,
	against_water       DECIMAL(3, 2) UNSIGNED,
	attack              SMALLINT      UNSIGNED NOT NULL,
	base_egg_steps      SMALLINT      UNSIGNED,
	base_happiness      SMALLINT      UNSIGNED,
	base_total          SMALLINT      AS (hp
	                                  + attack
	                                  + defense
	                                  + special_attack
	                                  + special_defense
	                                  + speed) NOT NULL,
	capture_rate        TINYINT       UNSIGNED,
	classfication       VARCHAR(50),
	defense             SMALLINT      UNSIGNED NOT NULL,
	experience_growth   MEDIUMINT     UNSIGNED,
	height_m            DECIMAL(2, 1) UNSIGNED,
	hp                  SMALLINT      UNSIGNED NOT NULL,
	name                VARCHAR(50)   NOT NULL,
	percentage_male     DECIMAL(3, 1) UNSIGNED,
	pokedex_number      SMALLINT      UNSIGNED NOT NULL,
	special_attack      SMALLINT      UNSIGNED NOT NULL,
	special_defense     SMALLINT      UNSIGNED NOT NULL,
	speed               SMALLINT      UNSIGNED NOT NULL,
	type1               ENUM(
	                    'bug', 'dark', 'dragon', 'electric', 'fairy', 'fighting',
	                    'fire', 'flying', 'ghost', 'grass', 'ground', 'ice',
	                    'normal', 'poison', 'psychic', 'rock', 'steel', 'water'
	                    )                      NOT NULL,
	type2               ENUM(
	                    'bug', 'dark', 'dragon', 'electric', 'fairy', 'fighting',
	                    'fire', 'flying', 'ghost', 'grass', 'ground', 'ice',
	                    'normal', 'poison', 'psychic', 'rock', 'steel', 'water'
	                    ),
	weight_kg           DECIMAL(2, 1) UNSIGNED,
	generation          TINYINT       UNSIGNED NOT NULL,
	is_legendary        BOOL          NOT NULL,
	id                  SERIAL,
	PRIMARY KEY (id),
	UNIQUE KEY (name)
);

DROP TABLE IF EXISTS pokestats;
CREATE TABLE pokestats (
	pdex_id         SMALLINT    UNSIGNED NOT NULL,
	pdex_name       VARCHAR(50)          NOT NULL,
	type1           ENUM(
				    'Bug', 'Dark', 'Dragon', 'Electric', 'Fairy', 'Fighting',
				    'Fire', 'Flying', 'Ghost', 'Grass', 'Ground', 'Ice',
				    'Normal', 'Poison', 'Psychic', 'Rock', 'Steel', 'Water'
					)                    NOT NULL,
	type2           ENUM(
				    'Bug', 'Dark', 'Dragon', 'Electric', 'Fairy', 'Fighting',
				    'Fire', 'Flying', 'Ghost', 'Grass', 'Ground', 'Ice',
				    'Normal', 'Poison', 'Psychic', 'Rock', 'Steel', 'Water'
					)                    NOT NULL,
	base_stat_total SMALLINT    AS (hp
                                + attack
                                + defense
                                + special_attack
                                + special_defense
                                + speed) NOT NULL,
	hp              SMALLINT    UNSIGNED NOT NULL,
	attack          SMALLINT    UNSIGNED NOT NULL,
	defense         SMALLINT    UNSIGNED NOT NULL,
	special_attack  SMALLINT    UNSIGNED NOT NULL,
	special_defense SMALLINT    UNSIGNED NOT NULL,
	speed           SMALLINT    UNSIGNED NOT NULL,
	generation      TINYINT     UNSIGNED NOT NULL,
	is_mega         BOOL        AS (IF(pdex_name LIKE '%Mega %', 1, 0)) NOT NULL,
	is_legendary    BOOL        NOT NULL,
	id              SERIAL,
	PRIMARY KEY (id),
	UNIQUE KEY (pdex_name)
);
