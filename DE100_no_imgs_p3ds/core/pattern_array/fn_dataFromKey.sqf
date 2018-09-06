/*
	File:	fn_dataFromKey.sqf
	Date:   2016-12-24 00:16:10
	Author: Patrick "Lucian" Schmidt
	
	Description:
	Take a look for yourself.
*/

params[
	["_key", ""],
	["_stack", [], [[]]]
];

private _i = [_key,_stack] call life_fnc_index;

if (_i >= 0) then {
	_stack select _i select 1;
} else {
	false;
};