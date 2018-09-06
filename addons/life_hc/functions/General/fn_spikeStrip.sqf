#include "\life_hc\hc_macros.hpp"
/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	This is the server-side part of it which constantly monitors the spike strip and vehicles near it.
	First originally tried triggers but I was never any good at those nor do I like them as they 
	have a global effect.
*/

params[
	["_spikeStrip", objNull, [objNull]],
	"_nearVehicles",
	"_spikeStrip"
];

if(isNull _spikeStrip) exitWith {}; //Bad vehicle type passed.

waitUntil {_nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],5]; count _nearVehicles > 0 OR isNull _spikeStrip};

if(isNull _spikeStrip) exitWith {}; //It was picked up?
_vehicle = _nearVehicles select 0;

if(isNil "_vehicle") exitWith {deleteVehicle _spikeStrip;};
[_vehicle] remoteExecCall ["life_fnc_spikeStripEffect",_vehicle];
deleteVehicle _spikeStrip;