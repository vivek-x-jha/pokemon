USE pokemon;

LOAD DATA
    LOCAL INFILE '/Users/vivekjha/Dropbox/tech/projects/pokemon/source_data/serebii.csv'
	INTO TABLE serebii
	FIELDS TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
	IGNORE 1 LINES
    (
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
     @base_total,
     capture_rate,
     classfication,
     defense,
     experience_growth,
     height_m,
     hp,
     @japanese_name,
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
	);

LOAD DATA
    LOCAL INFILE '/Users/vivekjha/Dropbox/tech/projects/pokemon/source_data/pokestats.csv'
	INTO TABLE pokestats
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(
	 pdex_id,
	 @pname,
	 type1,
	 type2,
	 @bst,
	 hp,
	 attack,
	 defense,
	 special_attack,
	 special_defense,
	 speed,
	 generation,
	 @isLegend
	)
	SET
	    -- Clean up Pokemon Names: Case 1 Megas
	    pdex_name := IF(@pname LIKE '%Mega %', SUBSTRING(@pname, POSITION('Mega ' IN @pname)), @pname),
	    -- Ensure is_legendary flag properly loads as Boolean not String
	    is_legendary := @isLegend = 'True';
