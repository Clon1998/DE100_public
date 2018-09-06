/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
params[
	["_item", "", [""]]
];
if((_item isEqualTo "")) exitWith {};

getNumber(missionConfigFile >> "VirtualItems" >> _item >> "weight");