/*
	File :  fn_packupobjekt.sqf
	Date:   11.12.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private ["_classname","_allowedSides","_itemName","_item","_array","_VIndex","_object"];
_array = _this select 3;
_classname = _array select 0;
_allowedSides =	_array select 1;
_item = _array select 2;

_object = nearestObjects[getPos player,[_classname],5] select 0;

if(isNil "_object") exitWith {};

if(!(playerSide in _allowedSides)) exitWith {["Das darfst du nicht machen",true,"fast"] call life_fnc_notification_system; };
	
if (_classname == "Metal_Pole_F") then {
	_item = _object getVariable ["Rakete","rocket_random"];
};

if (_item in ["rocket_random","rocket_normal_red","rocket_normal_blue","rocket_normal_white","rocket_normal_green","rocket_fizzer_blue", "rocket_fizzer_red", "rocket_fizzer_white", "rocket_fizzer_green", "rocket_rain_blue", "rocket_rain_red", "rocket_rain_white", "rocket_rain_green"]) then {
	_VIndex = [_object,life_preRockets] call life_fnc_index;
	if (_VIndex >= 0) then {
		life_preRockets deleteAt  _VIndex;
	};
};


_itemName = (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName")); 

if(([true,_item,1] call life_fnc_handleInv) > 0) then {
    [format["Du hast eine/n %1 aufgehoben.",localize _itemName],false,"fast"] call life_fnc_notification_system;
    deleteVehicle _object;
};
