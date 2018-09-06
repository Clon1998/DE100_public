/*
	File: fn_putInCar.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finds the nearest vehicle and loads the target into the vehicle.
*/
private ["_unit","_nearestVehicle"];
_unit = param [0,objNull,[objNull]];
if(isNull _unit or !isPlayer _unit) exitWith {};

_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
if(isNil "_nearestVehicle") exitWith {["STR_NOTF_VehicleNear",true,"fast"] call life_fnc_notification_system;};
detach _unit;
_unit setVariable ["forcedVeh",true,true];
_unit setVariable ["Escorting",false,true];
[_nearestVehicle] remoteExecCall ["life_fnc_moveIn",_unit];