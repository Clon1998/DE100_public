/*
	File:	fn_handleInv.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	_a - <boolean> true add, false remove
	_i - <string> item Class
	_v - <number> Val to rem/add

	return - <number> added/removed amount 
*/

params[
	["_a", false, [false]],
	["_i", "", [""]],
	["_v", 0, [0]]
];

if(_i isEqualTo "" || _v <= 0) exitWith {0;};

if (_a) then {
	private _v = [_i,_v] call life_fnc_canAdd;
	if (_v == 0) exitwith {0;};
	private _c = [0,_i] call life_fnc_handleVItem;
	[1,[_i,_c + _v]] call life_fnc_handleVItem;
	if (_i isEqualTo "fissileMaterial") then {
		fed_bank setVariable ["radiationObject",player,true];
	};
	life_carryWeight = life_carryWeight + _v * getNumber(missionConfigFile >> "VirtualItems" >> _i >> "weight");
} else {
	private _c = [0,_i] call life_fnc_handleVItem;
	_v = _v min _c;
	if (_i isEqualTo "fissileMaterial" && _v == 0) then {
		fed_bank setVariable ["radiationObject",nil,true];
	};
	if (_v == 0) exitwith {0;};
	[1,[_i,(_c - _v) max 0]] call life_fnc_handleVItem;
	life_carryWeight = (life_carryWeight - _v * getNumber(missionConfigFile >> "VirtualItems" >> _i >> "weight")) max 0;
};

private _ts = [];
{
	private _v = [0,configName _x] call life_fnc_handleVItem;
	if (_v > 0) then {
		_ts pushBack [(configName _x),_v];
	};
} forEach ("(getNumber(_x >> 'safeToDB')) == 1" configClasses (missionConfigFile >> "VirtualItems"));

player setVariable ["TrunkSave",_ts,true];

_v;