/*
	File: fn_giveDiff.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	??A?SD?ADS?A
*/
private["_unit","_item","_val","_from","_bool","_itemName"];
_unit = _this select 0;
if(_unit != player) exitWith {};
_item = _this select 1;
_val = _this select 2;
_from = _this select 3;
_bool = count _this > 4;
_itemName = (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName")); 

if(_bool) then {
	if(([true,_item,_val] call life_fnc_handleInv) > 0) then {
		[format[localize "STR_MISC_TooMuch",_from call life_fnc_name,_val,localize _itemName],false,"fast"] call life_fnc_notification_system;
	};
} else {
	if(([true,_item,_val] call life_fnc_handleInv) > 0) then {
		[format[localize "STR_MISC_TooMuch_2",_from call life_fnc_name,_val,localize _itemName],false,"fast"] call life_fnc_notification_system;
	};
};