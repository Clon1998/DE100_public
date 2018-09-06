/*
	File:	fn_vehicleAnimate.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_vehicle", Objnull, [Objnull]],
	["_colorClass", "", [""]],
	"_animations",
	"_turrets"
];
if(isNull _vehicle OR !alive _vehicle OR _colorClass == "") exitWith {};

_animations = getArray(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "TextureSources" >> _colorClass >> "animations");
_turrets = getArray(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "TextureSources" >> _colorClass >> "lockTurrets");

if (count _animations > 0) then {
	{
		_vehicle animate _x;
		[_vehicle, _x select 1] call compile (getText(configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "AnimationSources" >> (_x select 0) >> "onPhaseChanged"));
		nil;
	} count _animations;
};

if (count _turrets > 0) then {
	{
		_vehicle lockTurret [_x, true];
		nil;
	} count _turrets;
};