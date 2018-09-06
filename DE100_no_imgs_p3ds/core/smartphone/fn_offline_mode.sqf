/*
	File:	fn_offline_mode.sqf
	Date:   2016-07-31 18:40:12
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


if (life_offline_mode) then {
	life_offline_mode = false;//AUS
	player setVariable ["offlineMode",false,true];
	["Flugmodus deaktiviert",false,"fast"] call life_fnc_notification_system;
} else {
	life_offline_mode = true;//AN
	player setVariable ["offlineMode",true,true];
	["Flugmodus aktiviert",false,"fast"] call life_fnc_notification_system;
};