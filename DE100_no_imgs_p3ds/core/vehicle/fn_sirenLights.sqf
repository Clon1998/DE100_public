/*
	File:	fn_sirenLights.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_vehicle", objNull, [objNull]],
	["_side", sideUnknown, [sideUnknown]]
];

if (getArray(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "sirenLights") isEqualTo []) exitwith {};

if (_vehicle getVariable ["sirenLights",false]) then {
	_vehicle setVariable ["sirenLights",false,true];
} else {
	[_vehicle,_side] remoteExecCall ["life_fnc_lights",-2]
};