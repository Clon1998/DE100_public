/*
	File:	fn_colorVehicle.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_vehicle", Objnull, [Objnull]],
	["_colorClass", "", [""]],
	["_global", true, [true]],
	"_texture"
];
if(isNull _vehicle OR !alive _vehicle OR _colorClass == "") exitWith {};

//Fetch texture from our present array.
_texture = getArray(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "TextureSources" >> _colorClass >> "textures");
if (count _texture == 0) exitWith {};
if (isNil "_texture") exitWith {};

_vehicle setVariable["Life_VEH_color",_colorClass,true];

if (_global) then {
	{_vehicle setObjectTextureGlobal[_forEachIndex,_x];} forEach _texture;
} else {
	{_vehicle setObjectTexture[_forEachIndex,_x];} forEach _texture;
};
