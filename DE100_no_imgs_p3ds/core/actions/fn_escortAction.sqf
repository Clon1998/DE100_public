/*
	File: fn_escortAction.sqf
*/
private["_unit"];
_unit = param [0,objNull,[objNull]];
if (isNil "_unit" or isNull _unit or !isPlayer _unit) exitWith {};
if !(side _unit in [civilian,independent]) exitWith {};
if (player distance _unit > 3) exitWith {};
_unit setVariable["Escorting",true,true];
_unit attachTo [player,[0.1,1.1,0]];
player reveal _unit;
life_escort = true;