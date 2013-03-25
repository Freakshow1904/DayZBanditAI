/*
	Usage: [_unit] call fnc_unitConsumables;
*/
	private ["_unit","_i","_miscItem","_skinItem","_bpmedical","_bpedible","_invmedical","_invedible"];
	_unit = _this select 0;
	
	//Add one guaranteed Bandage and Painkiller to inventory
	_unit addMagazine "ItemBandage";
	_unit addMagazine "ItemPainkiller";

	//Chance to add miscellaneous item to backpack
	if (random 1 < DZAI_miscItemChance) then {
		_miscItem = DZAI_DefaultMiscs select (floor random (count DZAI_DefaultMiscs));
		(unitBackpack _unit) addMagazineCargoGlobal [_miscItem,1];
		if (DZAI_extdebug) then {diag_log format["DZAI Extended Debug: Generated Misc Item: %1 for AI.",_miscItem];};
	};
		
	//Chance to add skin to backpack
	if (random 1 < DZAI_skinItemChance) then {
		_skinItem = DZAI_DefaultSkinLoot select (floor random (count DZAI_DefaultSkinLoot));
		(unitBackpack _unit) addMagazineCargoGlobal [_skinItem,1];
		if (DZAI_extdebug) then {diag_log format["DZAI Extended Debug: Generated Skin Item: %1 for AI.",_skinItem];};
	};
	
	//Backpack Medicals
	for [{_i=0},{_i<DZAI_bpmedicals},{_i=_i+1}] do {
		_bpmedical = DZAI_DefaultMedicals2 select (floor random (count DZAI_DefaultMedicals2));
		(unitBackpack _unit) addMagazineCargoGlobal [_bpmedical, (floor random (DZAI_nbpmedicals + 1))];
		if (DZAI_extdebug) then {diag_log format["DZAI Extended Debug: Generated Backpack Medical Item: %1 for AI.",_bpmedical];};
	};

	//Backpack Edibles
	for [{_i=0},{_i<DZAI_bpedibles},{_i=_i+1}] do {
		_bpedible = DZAI_DefaultEdibles select (floor random (count DZAI_DefaultEdibles));
		(unitBackpack _unit) addMagazineCargoGlobal [_bpedible, (floor random (DZAI_nbpedibles + 1))];
		if (DZAI_extdebug) then {diag_log format["DZAI Extended Debug: Generated Backpack Edible Item: %1 for AI.",_bpedible];};
	};
	
	//Inventory Medicals
	for [{_i=0},{_i<DZAI_invmedicals},{_i=_i+1}] do {
		_invmedical = DZAI_DefaultMedicals1 select (floor random (count DZAI_DefaultMedicals1));
		_unit addMagazine [_invmedical, (floor random (DZAI_ninmedicals + 1))];
		if (DZAI_extdebug) then {diag_log format["DZAI Extended Debug: Generated Inventory Medical Item: %1 for AI.",_invmedical];};
	};
	
	//Inventory Edibles
	for [{_i=0},{_i<DZAI_invedibles},{_i=_i+1}] do {
		_invedible = DZAI_DefaultEdibles select (floor random (count DZAI_DefaultEdibles));
		_unit addMagazine [_invedible, (floor random (DZAI_ninedibles + 1))];
		if (DZAI_extdebug) then {diag_log format["DZAI Extended Debug: Generated Inventory Edible Item: %1 for AI.",_invedible];};
	};
	