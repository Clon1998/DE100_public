/*
	File:	fn_setDataAtKey.sqf
	Date:   2016-12-24 00:23:14
	Author: Patrick "Lucian" Schmidt
	
	Description:
	Take a look for yourself.
*/

params[
	["_key", ""],
	["_stack", [], [[]]],
	["_new", nil]
];

private _i = [_key,_stack] call life_fnc_index;

if (!isNil "_new") then {
	// We can manipulate the inner Array, since the Pointer in the memory from the main Array still will point
	// to the same array, since the only thing we change is the data in the inner Array. So the Array-Address isnt changed
	if (_i >= 0) then {
		(_stack select _i) set [1,_new];
	} else {
		_stack pushBack [_key,_new];
	};
} else {
	if (_i >= 0) exitWith {
		_stack deleteAt _i;
	};
};