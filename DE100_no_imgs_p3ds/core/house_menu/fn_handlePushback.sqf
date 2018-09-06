/*
	File:	fn_handlePushback.sqf
	Date:   14.05.2016
	Reworked: 03.05.2017
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]],
	["_namespace", "", [""]],
	["_key", "", [""]],
	["_item", "", [""]],
	["_amnt", 0, [0]],
	["_findType", false]
];

private _house = _display getVariable ["house",objNull];
private _aSpace = _display getVariable ["available_space",0];
if (_findType) then {
	private _tmp = _item call life_fnc_getItemType;
	_namespace = _tmp select 0;
	_key = _tmp select 1;
};

private _uSpace = _display getVariable [format["used_%1",_namespace],0];
private _errors = _display getVariable ["errors",[]];
private _wFactor = getNumber(missionConfigFile >> "Life_Settings" >> "houseInv_weightFactor");
private _iMass = round((([_item] call life_fnc_fetchCfgDetails) select 15) * _wFactor * _amnt);

if (_uSpace + _iMass > _aSpace) exitwith {
	//Can't believe that actually worked xD
	_errors pushBackUnique (switch (_namespace) do { 
		case "weapon_space" : {"Waffen";};
		case "clothing_space" : {"Kleidung";};
		case "other_space" : {"Sonstige";}; 
		default {"Unbekannt";}; 
	});
	_display setVariable ["errors",_errors];
	false;
};
_display setVariable [format["used_%1",_namespace],_uSpace+_iMass];
if (_house isEqualTo lockers_obj) then {
	_namespace = format["%1_%3_locker_%2",getPlayerUID player,_namespace,playerSide];
};
private _data = _house getVariable [_namespace,[]];
private _kData = [_key,_data] call life_fnc_dataFromKey; // Key Data
if (_kData isEqualTo false) then {
	_kData = [];
};
private _i = [_item,_kData] call life_fnc_index;
if (_i >= 0) then {
	_kData set [_i,[_item,_amnt+((_kData select _i) select 1)]];
} else {
	_kData pushBackUnique [_item,_amnt];
};
[_key,_data,_kData] call life_fnc_setDataAtKey;

_house setVariable [_namespace,_data,true];
life_house_session = true;
true;