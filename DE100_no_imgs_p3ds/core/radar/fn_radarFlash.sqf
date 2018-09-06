/*
	File:	fn_radarFlash.sqf
	Date:   2017-04-29 15:43:23
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_radar", objNull, [objNull]]
];

private _veh = objectParent player;
if (isNull _veh || isNull _radar) exitwith {};
private _active = _radar getVariable ["enabled",true];
private _limit = _radar getVariable ["limit",50];
private _speed = speed _veh;
if (([getPosASL _radar,getDir _radar,140,getPosASl _veh] call BIS_fnc_inAngleSector)&& _speed > _limit) then {
	[format["Sie wurden geblitzt!<br/>Gemessene Geschwindigkeit: %1km/h<br/>Erlaubt: %2km/h", ceil _speed, _limit],false,"slow"] call life_fnc_notification_system;
	0 spawn {
		cutRsc ["RadarFlashRed","PLAIN"];
		uisleep 0.05;
		cutRsc ["RadarFlash","PLAIN"];
		uisleep 0.1;
		cutRsc ["RadarFlash","PLAIN"];
		uisleep 0.05;
		cutRsc ["RadarFlashRed","PLAIN"];
	};
};