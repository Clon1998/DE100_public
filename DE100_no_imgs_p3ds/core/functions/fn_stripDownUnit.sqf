/*
	File:	fn_stripDownUnit.sqf
	Date:   25.10.2014
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_unit", objNull, [objNull]]
];
if (isNull _unit) exitWith {};

_unit setUnitLoadout[[],[],[],[],[],[],"","",[],["","","","","",""]];