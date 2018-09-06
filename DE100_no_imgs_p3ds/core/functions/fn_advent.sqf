/*
File:	fn_advent.sqf
Date:   2016-07-15 13:50:45
Author: Patrick "Lucian" Schmidt
Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

Description:
Take a look for yourself.
*/
if (playerSide != civilian) exitwith {
	["Nur Zivs bekommen Geschenke, Sorry ;/",false,"fast"] call life_fnc_notification_system;
};

if !(life_real_date >= 1201 && life_real_date <= 1224) exitwith {
	["Der Adventskalender, ist nicht aktiv, Sorry ;/",false,"fast"] call life_fnc_notification_system;
};

if (uniform player == "") exitwith {
	["Du brauchst eine Uniform, wo wir deine Geschenke verstauen können",false,"fast"] call life_fnc_notification_system;
};

if (life_advent == life_real_date) exitwith {
	["Du kannst nur einmal am Tag ein Türchen öffnen",false,"fast"] call life_fnc_notification_system;
};

life_advent = life_real_date;

//Abuse Arma Engnie to add more :)
private _addItemToUniform = {
	private _item = _this;
	private _loadout = getUnitLoadout player;
	private _items = _loadout select 3 select 1;

	private _index = [_item,_items] call life_fnc_index;
	if (_index >= 0) then {
		if ((_items select _index select 1) isEqualType false) then {
			_items pushBack [_item,false];
		} else {
			_items set [_index,[_item,(_items select _index select 1) + 1]];
		};
	} else {
		_items pushBack [_item,1];
	};

	_loadout set [3,[(_loadout select 3) select 0,_items]];
	player setUnitLoadout _loadout;

};

private _addWeaponToUniform = {
	private _item = _this;
	private _loadout = getUnitLoadout player;
	private _items = _loadout select 3 select 1;
	_items pushBack [[_item,"","","",[],[],""],1];

	_loadout set [3,[(_loadout select 3) select 0,_items]];
	player setUnitLoadout _loadout;

};

private _rndm = random 100;
private _selector = random 100;

private _poolVeh = [
	[95,100,"O_T_VTOL_02_infantry_F",["Hex","GreenHex","Grey"]],
	[93,95,"B_T_VTOL_01_infantry_F",["Blue","Olive"]],
	[90,93,"B_Heli_Attack_01_F","Olive"],
	[84,90,"B_Truck_01_ammo_F","Default"],
	[50,84,"C_SUV_01_F",["Xmas_01","Xmas_02","Xmas_03"]],
	[35,50,"C_Hatchback_01_sport_F","Xmas"],
	[0,35,"C_Hatchback_01_F","Xmas"]
];

private _poolWeapon = [
	[99,100,"LMG_Mk200_F"],
	[94,99,"muzzle_snds_H"],
	[89,94,"arifle_SPAR_01_blk_F"],
	[83,89,"arifle_SPAR_02_blk_F"],
	[76,83,"arifle_Mk20_F"],
	[68,76,"arifle_MXC_F"],
	[60,68,"arifle_Katiba_F"],
	[51,60,"arifle_CTAR_blk_F"],
	[45,51,"arifle_AKS_F"],
	[40,45,"arifle_sdar_F"],
	[33,40,"hgun_PDW2000_F"],
	[20,33,"hgun_Pistol_heavy_02_F"],
	[0,20,"hgun_ACPC2_F"]
];

private _poolCloth = [
	[98,100,"V_PlateCarrier2_blk"],
	[94,98,"H_Beret_02"],
	[89,94,"U_B_FullGhillie_sard"],
	[84,89,"U_I_FullGhillie_sard"],
	[78,84,"U_B_GhillieSuit"],
	[71,78,"U_B_CombatUniform_mcam"],
	[63,71,"U_I_C_Soldier_Para_2_F"],
	[56,63,"U_B_survival_uniform"],
	[47,56,"U_C_Man_casual_3_F"],
	[38,47,"U_I_C_Soldier_Bandit_3_F"],
	[30,38,"U_C_Poloshirt_burgundy"],
	[24,30,"U_IG_Guerilla3_1"],
	[15,24,"U_C_HunterBody_grn"],
	[10,15,"U_I_C_Soldier_Bandit_4_F"],
	[0,10,"U_NikosAgedBody"]
];

private _selectArray = [
	[90,100,"Veh"],
	[70,90,"Weapon"],
	[40,70,"Cash"],
	[0,40,"Cloth"]
];

private _type = "Cloth";
{
	if (_rndm >= (_x select 0) && _rndm < (_x select 1)) exitWith {
		_type = (_x select 2);
	};
} forEach _selectArray;

if (life_real_date == 1224) then {
	_type = "Veh";
};

switch (_type) do { 
	case "Veh" : {
		{
			if (_selector >= (_x select 0) && _selector < (_x select 1)) exitWith {
				private _classname = (_x select 2);

				private _color = if ((_x select 3) isEqualType []) then {
					selectRandom (_x select 3);
				} else {
					(_x select 3);
				};

				_type = switch(true) do{
					case (_classname isKindOf "Car"): {"Car"};
					case (_classname isKindOf "Air"): {"Air"};
					case (_classname isKindOf "Ship"): {"Ship"};
					case (_classname isKindOf "Pod_Heli_Transport_04_base_F"): {"Air"};
				};

				if (life_HC_isActive) then {
					[getPlayerUID player,call life_clientId select 0,_classname,_color,"Adventskalender"] remoteExec ["VEH_fnc_insert",HC_Life];
				} else {
					[getPlayerUID player,call life_clientId select 0,_classname,_color,"Adventskalender"] remoteExec ["VEH_fnc_insert",2];
				};
				[format["Hinter dem %1 Türchen war ein/e %2.<br/> %2 wurde in deine Garage gestellt. Die Farbe bleibt eine kleine Überraschung.<br/>Frohe Weinachten wünscht dir<br/>Dein DE100-Team",life_real_time select 2,([_x select 2] call life_fnc_fetchVehInfo) select 3],false,"Slow"] call life_fnc_notification_system;
			};
		} forEach _poolVeh;
	};
	case "Weapon" : {
		{
			if (_selector >= (_x select 0) && _selector < (_x select 1)) exitWith {
				(_x select 2) call _addWeaponToUniform;

				[format["Hinter dem %1 Türchen war ein/e %2.<br/> %2 wurde in deiner Uniform verstaut.<br/>Frohe Weinachten wünscht dir<br/>Dein DE100-Team",life_real_time select 2,([(_x select 2)] call life_fnc_fetchCfgDetails) select 1],false,"Slow"] call life_fnc_notification_system;
			};
		} forEach _poolWeapon;
	};
	case "Cash" : {
		private _add = round (11000 * _selector);
		de100_mSpace setVariable ["cT",diag_tickTime];
		de100_luciandjuli_mula = de100_luciandjuli_mula + _add;
		de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
		[format["Hinter dem %1 Türchen waren %2€ Bargeld.<br/>Frohe Weinachten wünscht dir<br/>Dein DE100-Team",life_real_time select 2,[_add] call life_fnc_numberText],false,"Slow"] call life_fnc_notification_system;
	};
	case "Cloth" : {
		{
			if (_selector >= (_x select 0) && _selector < (_x select 1)) exitWith {
				(_x select 2) call _addItemToUniform;
				[format["Hinter dem %1 Türchen war ein/e %2.<br/> %2 wurde in deiner Uniform verstaut.<br/>Frohe Weinachten wünscht dir<br/>Dein DE100-Team",life_real_time select 2,([(_x select 2)] call life_fnc_fetchCfgDetails) select 1],false,"Slow"] call life_fnc_notification_system;
			};
		} forEach _poolCloth;
	};
};

[["ADVENT","GEAR","CASH"]] call SOCK_fnc_updatePartial;
