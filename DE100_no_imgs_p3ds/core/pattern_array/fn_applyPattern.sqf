/*
	File:	fn_applyPattern.sqf
	Date:   2016-12-24 00:07:28
	Author: Patrick "Lucian" Schmidt
	
	Description:
	Take a look for yourself.
*/

params[
	["_patern", [], [[]]],
	["_data", [], [[]]]
];
private _return = [];
{
  _return pushBack [_patern select _forEachIndex,_x];
} forEach _data;

_return;