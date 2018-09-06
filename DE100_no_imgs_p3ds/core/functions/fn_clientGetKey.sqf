/*
   File:    fn_clientGetKey.sqf
   Date:    2017-9-15 01:08:45
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_veh", objNull, [objNull]],
	["_src","", [""]]
];

if  !(_veh in life_vehicles) then {
	[format['%1 hat dir die Schlüssel für einen %2 gegeben',_src,getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName")],false,"fast"] call life_fnc_notification_system; 
	[_veh] call life_fnc_safeKey;
};