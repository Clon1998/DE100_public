/*
	File: fn_escortAction.sqf
*/
private["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNil "_unit" or isNull _unit or !isPlayer _unit) exitWith {};
//if(!(side _unit in [civilian,independent])) exitWith {};
_unit attachTo [player,[0.1,1.1,0]];
_unit setVariable["Escorting",true,true];
player reveal _unit;