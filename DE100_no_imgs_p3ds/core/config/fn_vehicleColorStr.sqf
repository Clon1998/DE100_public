/*
	File:	fn_vehicleColorStr.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
params[
	["_vehicle", "", [""]],
	["_colorClass", "", [""]],
	"_color"
];
_color = if (isClass (missionConfigFile >> "lifeVehicles" >> _vehicle >> "TextureSources" >> _colorClass)) then {
	getText(missionConfigFile >> "lifeVehicles" >> _vehicle >> "TextureSources" >> _colorClass >> "displayName");
} else {
	"A3-Standart";
};

_color;