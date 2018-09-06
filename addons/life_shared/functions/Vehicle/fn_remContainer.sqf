#include "\life_shared\script_macros.hpp"
/*
	File:	fn_remContainer.sqf
	Date:   30.12.2014
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_vehicle", objNull, [objNull]]
];
private _upgrade = _vehicle getVariable ["TruckExt",0];
if (_upgrade == 0 || count attachedObjects _vehicle == 0) exitWith {};


{
	detach _x;
	deleteVehicle _x;
} forEach attachedObjects _vehicle;