/*
	File:	fn_setVehSpawnPoint.sqf
	Date:   23.02.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_house", objNull, [objNull]],
	"_VehSpawnPoint",
	"_distance"
];
["Bewege dich nun an die Position und schaue in die Richtung, wo das Fahrzeug spawnen soll!",false,"fast"] call life_fnc_notification_system;
life_wants_new_spawn = true;
life_spawn_fine = false;
_distance = switch (typeOf _house) do { 
	case "Land_i_Shed_Ind_F" : {35;}; 
	default {20;}; 
};
while {true} do {
	waitUntil {life_spawn_fine};
	if ((player distance _house) > _distance) then {
		[format ["Du darfst dich maximal ca. %1 Meter von deinem Haus entfernen!",_distance - 5],true,"fast"] call life_fnc_notification_system;
		life_spawn_fine = false;
	};

	if (life_spawn_fine) exitWith {};
};
life_wants_new_spawn = false;
_VehSpawnPoint = [getPosATL player,getDir player];
_house setVariable ["VehSpawnPoint",_VehSpawnPoint,true];
["Du hast einen neuen Spawnpunkt gesetzt!",false,"fast"] call life_fnc_notification_system;
//Now just make it global blaaa
if (life_HC_isActive) then {
	[(_house getVariable["house_id",-1]),_VehSpawnPoint,(_house getVariable ["isStorehouse",false])] remoteExecCall ["HC_fnc_updateVehSpawnPoint",HC_Life];
} else {
	[(_house getVariable["house_id",-1]),_VehSpawnPoint,(_house getVariable ["isStorehouse",false])] remoteExecCall ["TON_fnc_updateVehSpawnPoint",2];
};