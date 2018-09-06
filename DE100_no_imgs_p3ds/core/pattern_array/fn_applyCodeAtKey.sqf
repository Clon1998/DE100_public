/*
	File:	fn_applyCodeAtKey.sqf
	Date:   2016-12-24 00:25:29
	Author: Patrick "Lucian" Schmidt
	
	Description:
	Take a look for yourself.
*/

params[
	["_key", ""],
	["_stack", [], [[]]],
	["_code", {}, [{}]]
];

private _d = [_key,_stack] call life_fnc_dataFromKey;

if (_d isEqualTo false) exitwith {
	_stack;
};

_d = _d call _code;

[_key,_stack,_d] call life_fnc_setDataAtKey;