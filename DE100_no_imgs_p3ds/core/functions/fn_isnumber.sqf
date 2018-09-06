/*
	File: fn_isnumber.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Check if string is number
*/

private _value = param[0,"",[""]];
if (_value isEqualTo "") exitWith {
	false;
};
([parseNumber _value] call life_fnc_number) isEqualTo _value;