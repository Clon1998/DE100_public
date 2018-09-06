/*
	File:	fn_setupVehicleEVH.sqf
	Date:   2016-12-23 22:02:02
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_vehcile", objNull, [objNull]]
];

if (isNull _vehcile) exitwith {};

{
	player removeAllEventHandlers _x;
	nil;
} count ["RopeAttach"];



if (_vehicle isKindOf "Air") then {
	_vehicle addEventHandler["RopeAttach","_this remoteExec ['life_fnc_RopeBoxCheck',driver (_this select 0)];"];
};