/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle","_trunk","_weight"];
if(!isNull objectParent player) then
{
	_vehicle = vehicle player;
}	else {
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship","Pod_Heli_Transport_04_base_F"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then {
		{
			private _vd = _x getVariable ["owner",["",""]];
			if (_vd select 0 isEqualTo getPlayerUID player) exitwith {
				_vehicle = _x;
			};
			nil
		} count _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {[localize "STR_Garage_NoNPC",true,"fast"] call life_fnc_notification_system;};
if(isNull _vehicle) exitWith {};
_trunk = _vehicle getVariable["Trunk",[[],0]];
_weight = 0;

_trunk = (_trunk select 0) select {(getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "safeToDB")) isEqualTo 1 && isClass (missionConfigFile >> "VirtualItems" >> (_x select 0))};
{_weight = _weight + (getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "weight")) * (_x select 1);false} count _trunk;

if (life_HC_isActive) then {
	[getPlayerUID player, call life_clientId select 0,_vehicle,2,[_trunk,_weight]] remoteExecCall ["VEH_fnc_store",HC_Life];
} else {
	[getPlayerUID player, call life_clientId select 0,_vehicle,2,[_trunk,_weight]] remoteExecCall ["VEH_fnc_store",2];
};
life_garage_store = true;
