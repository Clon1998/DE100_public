/*
	File:	fn_handleDeleteat.sqf
	Date:   14.05.2016
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
if (_findType) then {
	private _tmp = _item call life_fnc_getItemType;
	_namespace = _tmp select 0;
	_key = _tmp select 1;
};

private _uSpace = _display getVariable [format["used_%1",_namespace],0];
private _errors = _display getVariable ["errors",[]];
private _wFactor = getNumber(missionConfigFile >> "Life_Settings" >> "houseInv_weightFactor");
private _iMass = round((([_item] call life_fnc_fetchCfgDetails) select 15) * _wFactor * _amnt);
_display setVariable [format["used_%1",_namespace],_uSpace-_iMass];
if (_house isEqualTo lockers_obj) then {
	_namespace = format["%1_%3_locker_%2",getPlayerUID player,_namespace,playerSide];
};
private _data = _house getVariable [_namespace,[]];
private _kData = [_key,_data] call life_fnc_dataFromKey;

private _i = [_item,_kData] call life_fnc_index;
if (((_kData select _i) select 1) <= _amnt) then {
	_kData deleteAt _i;
} else {
	_kData set [_i,[_item,((_kData select _i) select 1)-_amnt]];
};

[_key,_data,_kData] call life_fnc_setDataAtKey;

_house setVariable [_namespace,_data,true];
life_house_session = true;
true;