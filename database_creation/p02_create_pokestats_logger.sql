/*
 Implements Logger for `pokestats` table
 1. Create the log table with added fields `action` & `timestamp`
 2. Create Insert Trigger
 3. Create Update Trigger
 4. Create Delete Trigger
 */

USE pokemon;

DROP TABLE IF EXISTS pokestats_log;
CREATE TABLE pokestats_log LIKE pokestats;
ALTER TABLE pokestats_log
	ADD COLUMN action    ENUM('INSERT', 'UPDATE', 'DELETE') FIRST,
	ADD COLUMN timestamp DATETIME NOT NULL
                           DEFAULT CURRENT_TIMESTAMP
                           ON UPDATE CURRENT_TIMESTAMP AFTER action;

DROP TRIGGER IF EXISTS ai_pokestats;
DELIMITER $$
CREATE TRIGGER ai_pokestats
	AFTER INSERT
	ON pokestats
	FOR EACH ROW
BEGIN
	INSERT INTO pokestats_log (
		action,
		pdex_id,
		pdex_name,
		type1,
		type2,
		hp,
		attack,
		defense,
		special_attack,
		special_defense,
		speed,
		generation,
		is_legendary
	)
    VALUES (
        'INSERT',
        new.pdex_id,
		new.pdex_name,
		new.type1,
		new.type2,
		new.hp,
		new.attack,
		new.defense,
		new.special_attack,
		new.special_defense,
		new.speed,
		new.generation,
		new.is_legendary
	);
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS au_pokestats;
DELIMITER $$
CREATE
	TRIGGER au_pokestats
	AFTER UPDATE
	ON pokestats
	FOR EACH ROW
BEGIN
	INSERT INTO pokestats_log (
		action,
		pdex_id,
		pdex_name,
		type1,
		type2,
		hp,
		attack,
		defense,
		special_attack,
		special_defense,
		speed,
		generation,
		is_legendary
	)
    VALUES (
        'UPDATE',
        new.pdex_id,
		new.pdex_name,
		new.type1,
		new.type2,
		new.hp,
		new.attack,
		new.defense,
		new.special_attack,
		new.special_defense,
		new.speed,
		new.generation,
		new.is_legendary
	);
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS ad_pokestats;
DELIMITER $$
CREATE
	TRIGGER ad_pokestats
	AFTER DELETE
	ON pokestats
	FOR EACH ROW
BEGIN
	INSERT INTO pokestats_log (
		action,
		pdex_id,
		pdex_name,
		type1,
		type2,
		hp,
		attack,
		defense,
		special_attack,
		special_defense,
		speed,
		generation,
		is_legendary
	)
    VALUES (
        'DELETE',
        old.pdex_id,
		old.pdex_name,
		old.type1,
		old.type2,
		old.hp,
		old.attack,
		old.defense,
		old.special_attack,
		old.special_defense,
		old.speed,
		old.generation,
		old.is_legendary
	);
END$$
DELIMITER ;
