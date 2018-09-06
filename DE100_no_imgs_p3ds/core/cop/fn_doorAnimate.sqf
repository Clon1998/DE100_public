/*
	File:	fn_doorAnimate.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_house", objNull, [objNull]],
	"_selPos",
	"_worldSpace"
];

if (isNull _house) exitWith {};
if !(typeOf _house in ["Land_Dome_Small_F"]) exitwith {};

private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "NumberOfDoors");
private _door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _house selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _house modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if (_door isEqualTo 0) exitWith {[localize "STR_Cop_NotaDoor",true,"fast"] call life_fnc_notification_system;}; //Not near a door to be broken into.

if ((_house animationPhase format["Door_%1A_move",_door]) < 0.5) then {
	[_house,format["Door_%1A_move",_door],format["Door_%1B_move",_door]] call BIS_fnc_TwoWingSlideDoorOpen;
} else {
	[_house,format["Door_%1A_move",_door],format["Door_%1B_move",_door]] call BIS_fnc_TwoWingSlideDoorClose;
};

closeDialog 0;