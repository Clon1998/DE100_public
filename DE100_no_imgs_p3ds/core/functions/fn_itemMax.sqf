/*
	File:	fn_itemMax.sqf
	Date:   2016-08-04 00:39:44
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_listbox", controlNull, [controlNull]],
	["_index", 0, [0]]
];

private _item = _listbox lbData _index;
if (_item isEqualTo "") exitWith {};
private _value = [0,_item] call life_fnc_handleVItem;

ctrlSetText [2010, format["%1",_value]];