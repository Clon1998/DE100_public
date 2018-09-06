/*
	File: fn_seizeWeapon.sqf
	Author: Skalicon
	
	Description:

*/
private ["_destroyed","_clear"];
_clear = nearestObjects [player,["weaponholder"],3];
_destroyed = 0;
for "_i" from 0 to count _clear - 1 
do
{
	_destroyed = _destroyed + 1;
	deleteVehicle (_clear select _i);
	sleep 0.056;
};

[format["Es wurden %1 Objekte in der Nähe beschlagnahmte.", _destroyed],false,"fast"] call life_fnc_notification_system;