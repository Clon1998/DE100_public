/*
	File:	fn_vehicleWeight.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


params[
	["_vehicle", objNull, [objNull]],
	"_weight",
	"_used"
];

if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable ["Trunk",[0,0]]) select 1;
if (isClass (missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle))) then {
	_weight = getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "vItemSpace");
};
_weight = _weight + (50*(_vehicle getVariable ["TruckExt",0]));
[_weight,_used];