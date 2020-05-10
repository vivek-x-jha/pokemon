/*
 Implements Logger for `serebii` table
 1. Create the log table with added fields `action` & `timestamp`
 2. Create Insert Trigger
 3. Create Update Trigger
 4. Create Delete Trigger
 */

USE pokemon;

DROP TABLE IF EXISTS serebii_log;
CREATE TABLE serebii_log LIKE serebii;
ALTER TABLE serebii_log
	ADD COLUMN action    ENUM('INSERT', 'UPDATE', 'DELETE') FIRST,
	ADD COLUMN timestamp DATETIME NOT NULL
                           DEFAULT CURRENT_TIMESTAMP
                           ON UPDATE CURRENT_TIMESTAMP AFTER action;

DROP TRIGGER IF EXISTS ai_serebii;
DELIMITER $$
CREATE TRIGGER ai_serebii
	AFTER INSERT
	ON serebii
	FOR EACH ROW
BEGIN
	INSERT INTO serebii_log (
	    action,
		abilities,
		against_bug,
		against_dark,
		against_dragon,
		against_electric,
		against_fairy,
		against_fight,
		against_fire,
		against_flying,
		against_ghost,
		against_grass,
		against_ground,
		against_ice,
		against_normal,
		against_poison,
		against_psychic,
		against_rock,
		against_steel,
		against_water,
		attack,
		base_egg_steps,
		base_happiness,
		capture_rate,
		classfication,
		defense,
		experience_growth,
		height_m,
		hp,
		name,
		percentage_male,
		pokedex_number,
		special_attack,
		special_defense,
		speed,
		type1,
		type2,
		weight_kg,
		generation,
		is_legendary
	)
    VALUES (
        'INSERT',
		new.abilities,
		new.against_bug,
		new.against_dark,
		new.against_dragon,
		new.against_electric,
		new.against_fairy,
		new.against_fight,
		new.against_fire,
		new.against_flying,
		new.against_ghost,
		new.against_grass,
		new.against_ground,
		new.against_ice,
		new.against_normal,
		new.against_poison,
		new.against_psychic,
		new.against_rock,
		new.against_steel,
		new.against_water,
		new.attack,
		new.base_egg_steps,
		new.base_happiness,
		new.capture_rate,
		new.classfication,
		new.defense,
		new.experience_growth,
		new.height_m,
		new.hp,
		new.name,
		new.percentage_male,
		new.pokedex_number,
		new.special_attack,
		new.special_defense,
		new.speed,
		new.type1,
		new.type2,
		new.weight_kg,
		new.generation,
		new.is_legendary
	);
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS au_serebii;
DELIMITER $$
CREATE TRIGGER au_serebii
	AFTER UPDATE
	ON serebii
	FOR EACH ROW
BEGIN
	INSERT INTO serebii_log (
	    action,
		abilities,
		against_bug,
		against_dark,
		against_dragon,
		against_electric,
		against_fairy,
		against_fight,
		against_fire,
		against_flying,
		against_ghost,
		against_grass,
		against_ground,
		against_ice,
		against_normal,
		against_poison,
		against_psychic,
		against_rock,
		against_steel,
		against_water,
		attack,
		base_egg_steps,
		base_happiness,
		capture_rate,
		classfication,
		defense,
		experience_growth,
		height_m,
		hp,
		name,
		percentage_male,
		pokedex_number,
		special_attack,
		special_defense,
		speed,
		type1,
		type2,
		weight_kg,
		generation,
		is_legendary
	)
    VALUES (
        'UPDATE',
		new.abilities,
		new.against_bug,
		new.against_dark,
		new.against_dragon,
		new.against_electric,
		new.against_fairy,
		new.against_fight,
		new.against_fire,
		new.against_flying,
		new.against_ghost,
		new.against_grass,
		new.against_ground,
		new.against_ice,
		new.against_normal,
		new.against_poison,
		new.against_psychic,
		new.against_rock,
		new.against_steel,
		new.against_water,
		new.attack,
		new.base_egg_steps,
		new.base_happiness,
		new.capture_rate,
		new.classfication,
		new.defense,
		new.experience_growth,
		new.height_m,
		new.hp,
		new.name,
		new.percentage_male,
		new.pokedex_number,
		new.special_attack,
		new.special_defense,
		new.speed,
		new.type1,
		new.type2,
		new.weight_kg,
		new.generation,
		new.is_legendary
	);
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS ad_serebii;
DELIMITER $$
CREATE TRIGGER ad_serebii
	AFTER DELETE
	ON serebii
	FOR EACH ROW
BEGIN
	INSERT INTO serebii_log (
	    action,
		abilities,
		against_bug,
		against_dark,
		against_dragon,
		against_electric,
		against_fairy,
		against_fight,
		against_fire,
		against_flying,
		against_ghost,
		against_grass,
		against_ground,
		against_ice,
		against_normal,
		against_poison,
		against_psychic,
		against_rock,
		against_steel,
		against_water,
		attack,
		base_egg_steps,
		base_happiness,
		capture_rate,
		classfication,
		defense,
		experience_growth,
		height_m,
		hp,
		name,
		percentage_male,
		pokedex_number,
		special_attack,
		special_defense,
		speed,
		type1,
		type2,
		weight_kg,
		generation,
		is_legendary
	)
    VALUES (
        'DELETE',
		old.abilities,
		old.against_bug,
		old.against_dark,
		old.against_dragon,
		old.against_electric,
		old.against_fairy,
		old.against_fight,
		old.against_fire,
		old.against_flying,
		old.against_ghost,
		old.against_grass,
		old.against_ground,
		old.against_ice,
		old.against_normal,
		old.against_poison,
		old.against_psychic,
		old.against_rock,
		old.against_steel,
		old.against_water,
		old.attack,
		old.base_egg_steps,
		old.base_happiness,
		old.capture_rate,
		old.classfication,
		old.defense,
		old.experience_growth,
		old.height_m,
		old.hp,
		old.name,
		old.percentage_male,
		old.pokedex_number,
		old.special_attack,
		old.special_defense,
		old.speed,
		old.type1,
		old.type2,
		old.weight_kg,
		old.generation,
		old.is_legendary
	);
END$$
DELIMITER ;
