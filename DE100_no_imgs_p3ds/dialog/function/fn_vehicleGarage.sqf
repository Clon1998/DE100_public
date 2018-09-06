/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
params[
	["_house", objNull, [objNull]],
	["_type", "", [""]],
	"_spawnPos"
];
_spawnPos = _house getVariable ["VehSpawnPoint",[0,0,0]];

if (_spawnPos isEqualTo [0,0,0]) exitWith {
	["Du hast noch keinen Spawnpunkt festgelegt!",true,"fast"] call life_fnc_notification_system;
};

[0,_type,_spawnPos] call life_fnc_openGarage;