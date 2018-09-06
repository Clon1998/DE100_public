/*
   File:    fn_handleFilter.sqf
   Date:    2017-9-24 16:18:01
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
	["_b", controlNull, [controlNull]],
	["_t", "", [""]]
];

private _d = ctrlParent _b;
private _lb = (_d displayCtrl 4300) controlsGroupCtrl 4301;
private _r = false;
private _s = [];
private _bl = _d getVariable ["lastFilterBtn",objNull];
if (_b isEqualTo _bl) then {
	_t = _d getVariable ["mainFilter","clothing"];
};
if (!isNull _bl) then {
	_bl ctrlSetTextColor [1,1,1,1];
};
private _tD = call {
	if (_t isEqualTo "weapon") exitWith {
		_s = [
			["Zurück","a3\3den\Data\Displays\Display3DEN\ToolBar\undo_ca.paa","(_this + ['']) call life_fnc_handleFilter;"],
			["Gewehre","images\dialog\ico_rifle.paa","(_this + ['rifles']) call life_fnc_handleFilter;"],
			["Pistolen","images\dialog\ico_handgun.paa","(_this + ['pistols']) call life_fnc_handleFilter;"],
			["Ferngläser","images\dialog\ico_binocular.paa","(_this + ['binoculars']) call life_fnc_handleFilter;"],
			["Waffenzubehör","images\dialog\ico_sideAttach.paa","(_this + ['accessory']) call life_fnc_handleFilter;"],
			["Granaten","images\dialog\ico_grenades.paa","(_this + ['throw']) call life_fnc_handleFilter;"],
			["Munition","images\dialog\ico_ammunition.paa","(_this + ['ammo']) call life_fnc_handleFilter;"]
		];
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) in ["AssaultRifle","BombLauncher","Cannon","GrenadeLauncher","Handgun","Launcher","MachineGun","Magazine","MissileLauncher","Mortar","RocketLauncher","Shotgun","Throw","Rifle","SubmachineGun","SniperRifle","Artillery","Bullet","CounterMeasures","Flare","Grenade","Laser","Missile","Rocket","Shell","ShotgunShell","SmokeShell","UnknownMagazine","AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod","Binocular","NVGoggles","LaserDesignator"]};
	};
	if (_t isEqualTo "clothing") exitWith {
		_s = [
			["Zurück","a3\3den\Data\Displays\Display3DEN\ToolBar\undo_ca.paa","(_this + ['']) call life_fnc_handleFilter;"],
			["Uniformen","images\dialog\ico_uniform.paa","(_this + ['uniform']) call life_fnc_handleFilter;"],
			["Westen","images\dialog\ico_vest.paa","(_this + ['vest']) call life_fnc_handleFilter;"],
			["Rucksäcke","images\dialog\ico_backpack.paa","(_this + ['backpack']) call life_fnc_handleFilter;"],
			["Kopfbedeckungen","images\dialog\ico_helmet.paa","(_this + ['headgear']) call life_fnc_handleFilter;"],
			["Brillen","images\dialog\ico_glasses.paa","(_this + ['glass']) call life_fnc_handleFilter;"]
		];
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) in ["Glasses","Headgear","Vest","Uniform","Backpack"]};
	};
	if (_t isEqualTo "items") exitWith {
		_s = [["Zurück","a3\3den\Data\Displays\Display3DEN\ToolBar\undo_ca.paa","(_this + ['']) call life_fnc_handleFilter;"]];
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) in ["Compass","FirstAidKit","GPS","Map","Medikit","MineDetector","Radio","Toolkit","UAVTerminal","VehicleWeapon","Unknown","UnknownEquipment","UnknownWeapon","Watch"]};
	};
	if (_t isEqualTo "zitems") exitWith {
		_s = [["Zurück","a3\3den\Data\Displays\Display3DEN\ToolBar\undo_ca.paa","(_this + ['']) call life_fnc_handleFilter;"]];
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "zitems"};
	};
	if (_t isEqualTo "vehicle") exitWith {
		_s = [
			["Zurück","a3\3den\Data\Displays\Display3DEN\ToolBar\undo_ca.paa","(_this + ['']) call life_fnc_handleFilter;"],
			["Land","images\dialog\ico_car.paa","(_this + ['land']) call life_fnc_handleFilter;"],
			["Luft","images\dialog\ico_heli.paa","(_this + ['air']) call life_fnc_handleFilter;"],
			["Wasser","images\dialog\ico_ship.paa","(_this + ['water']) call life_fnc_handleFilter;"]
		];
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) in ["car","air","ship"]};
	};
	if (_t isEqualTo "buildings") exitWith {
		_s = [
			["Zurück","a3\3den\Data\Displays\Display3DEN\ToolBar\undo_ca.paa","(_this + ['']) call life_fnc_handleFilter;"],
			["Häuser","images\dialog\ico_house.paa","(_this + ['houses']) call life_fnc_handleFilter;"],
			["Lagerhäuser","images\dialog\ico_storehouse.paa","(_this + ['storehouses']) call life_fnc_handleFilter;"]
		];
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) in ["houses","storehouses"]};
	};
	if (_t isEqualTo "rifles") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) in ["SniperRifle","AssaultRifle","MachineGun","MachineGun","Rifle","SubmachineGun"]};
	};
	if (_t isEqualTo "pistols") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "Handgun"};
	};
	if (_t isEqualTo "binoculars") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) in ["Binocular","NVGoggles","LaserDesignator"]};
	};
	if (_t isEqualTo "accessory") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"]};
	};
	if (_t isEqualTo "throw") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) in ["SmokeShell","Grenade","Flare","Artillery"]};
	};
	if (_t isEqualTo "ammo") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) in ["Bullet","Shell"]};
	};
	if (_t isEqualTo "uniform") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "Uniform"};
	};
	if (_t isEqualTo "vest") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "Vest"};
	};
	if (_t isEqualTo "backpack") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "Backpack"};
	};
	if (_t isEqualTo "headgear") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "Headgear"};
	};
	if (_t isEqualTo "glass") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "Glasses"};
	};
	if (_t isEqualTo "land") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "car"};
	};
	if (_t isEqualTo "air") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "air"};
	};
	if (_t isEqualTo "water") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "ship"};
	};
	if (_t isEqualTo "houses") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "houses"};
	};
	if (_t isEqualTo "storehouses") exitWith {
		(_d getVariable ["tableData",[]]) select {((_x select 1) select 1) isEqualTo "storehouses"};
	};
	_r = true;
	_s = [["Waffen","images\dialog\ico_weaDealer.paa","(_this + ['weapon']) call life_fnc_handleFilter;"],["Kleidung","images\dialog\ico_cloDealer.paa","(_this + ['clothing']) call life_fnc_handleFilter;"],["Items","images\dialog\ico_itemDealer.paa","(_this + ['items']) call life_fnc_handleFilter;"],["Z-Items","images\dialog\ico_vIDealer.paa","(_this + ['zitems']) call life_fnc_handleFilter;"],["Fahrzeuge","images\dialog\ico_vehDealer.paa","(_this + ['vehicle']) call life_fnc_handleFilter;"],["Immobilien","images\dialog\ico_imo.paa","(_this + ['buildings']) call life_fnc_handleFilter;"]];
	_d getVariable ["tableData",[]];
};
_d setVariable ["filterData",[_tD,[]] select _r];
if !(_s isEqualTo []) then {
	[_d,_s] call life_fnc_setSections;
	_d setVariable ["mainFilter",_t];
	_d setVariable ["lastFilterBtn",objNull];
} else {
	_b ctrlSetTextColor [profilenamespace getvariable ['GUI_BCG_RGB_R',0.3], profilenamespace getvariable ['GUI_BCG_RGB_G',0.3], profilenamespace getvariable ['GUI_BCG_RGB_B',0.3], profilenamespace getvariable ['GUI_BCG_RGB_A',1]];
	_d setVariable ["lastFilterBtn",_b];
};
lbClear _lb;
{
	private _a = _x select 1;
	private _c = _a select 2;
	private _iD = if ((_a select 1) isEqualTo "zitems") then {
		[[localize getText(missionConfigFile >> "VirtualItems" >> _c >> "displayName"),44] call STR_fnc_cutText,getText(missionConfigFile >> "VirtualItems" >> _c >> "icon")];
	} else {
		private _cfg = call {
			if (isClass (configFile >> "CfgWeapons" >> _c)) exitWith {"CfgWeapons";};
			if (isClass (configFile >> "CfgMagazines" >> _c)) exitWith {"CfgMagazines";};
			if (isClass (configFile >> "CfgVehicles" >> _c)) exitWith {"CfgVehicles";};
			"CfgGlasses";
		};
		[[getText(configFile >> _cfg >> _c >> "displayName"),44] call STR_fnc_cutText,getText(configFile >> _cfg >> _c >> "picture")];
	};
	
	private _z = [_a select 5,life_real_time] call life_fnc_timeDiff;
	private _i = _lb lnbAddRow ["",_iD select 0, (_a select 3) call STR_fnc_cutText,format ["%1",_a select 4],if (_z select 0 || _a select 11) then {"Beendet";} else {_z select 1;},if (_a select 6 < 0) then {"k.A.";} else {format["%1€",[_a select 6] call life_fnc_numberText];},if (_a select 7 < 0) then {"Nicht verfügbar"} else {format["%1€",[_a select 7] call life_fnc_numberText]}];
	_lb lnbSetPicture [[_i,0],if ((_iD select 1) isEqualTo "pictureStaticObject") then {"images\icons\ico_house.paa";} else {_iD select 1;}];
	_lb lnbSetValue [[_i,0],_x select 0];
	_lb lnbSetValue [[_i,3],_a select 4];
	_lb lnbSetValue [[_i,4],_z select 2];
	_lb lnbSetValue [[_i,5],_a select 6];
	_lb lnbSetValue [[_i,6],_a select 7];
	nil;
} count _tD;
if (lbSize _lb == 0) then {
	private _i = _lb lnbAddRow ["","Keine Auktionen gefunden","","","","",""];
	_lb lnbSetValue [[_i,0], -1];
	_lb lnbSetValue [[_i,3], -1];
	_lb lnbSetValue [[_i,4], -1];
	_lb lnbSetValue [[_i,5], -1];
	_lb lnbSetValue [[_i,6], -1];
};
_lb lnbSort [0,true];
_lb lnbSetCurSelRow 0;