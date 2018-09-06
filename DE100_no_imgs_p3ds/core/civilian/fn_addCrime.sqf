/*
	File:	fn_addCrime.sqf
	Date:   2017-03-31 19:00:29
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_unit", objNull, [objNull,[]]],
	["_cEntry", "", [""]],
	["_val", 1, [0,objNull]],
	"_c"
];
//wenn _val ein Obj, dann pos des Objects ansonsten pos der _unit
if (_unit isEqualType objNull) then {
	_unit = [getPlayerUID _unit,_unit call life_fnc_name, (getPos ([_unit,_val] select (_val isEqualType objNull))) vectorAdd [random 300,random 300,0]];
};
if (!isClass(missionConfigFile >> "crimes" >> _cEntry)) exitwith {};

private _all = bank_obj getVariable ["Crimes",[]];

private _i = [_unit select 0,_all] call life_fnc_index;
private _stackable = getNumber(missionConfigFile >> "crimes" >> _cEntry >> "stackable") isEqualTo 1;
if (_i >= 0) then {
	_c = (_all select _i) select 2;
	private _ii = [_cEntry,_c] call life_fnc_index;
	if (_ii >= 0) then {
		if (_stackable) then {
			_c set [_ii,[_cEntry,((_c select _ii) select 1)+_val]];
		} else {
			_c set [_ii,[_cEntry,((_c select _ii) select 1)+[_val call life_fnc_name]]];
		};
	} else {
		if (_stackable) then {
			_c pushBack [_cEntry,_val];
		} else {
			_c pushBack [_cEntry,[_val call life_fnc_name]];
		};
	};

	_all set [_i,[_unit select 0,_unit select 1,_c,_unit select 2]]
} else {
	if (_stackable) then {
		_all pushBack [_unit select 0,_unit select 1,[[_cEntry,_val]],_unit select 2];
	} else {
		_all pushBack [_unit select 0,_unit select 1,[[_cEntry,[_val call life_fnc_name]]],_unit select 2];
	};
};

bank_obj setVariable ["Crimes",_all,true];