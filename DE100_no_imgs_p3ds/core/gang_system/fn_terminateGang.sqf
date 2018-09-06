/*
	File:	fn_terminateGang.sqf
	Date:   2016-10-15 12:13:44
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _gang = group player;
private _action = [
	format["Möchtest du die Gang %1 wirklick auflösen?",_gang getVariable ["gang_NAME",""]],
	"Gang auflösen?",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (!_action) exitwith {};
{
	_x setVariable["clothing_space",nil,true];
	_x setVariable["container",nil,true];
	_x setVariable["house_id",nil,true];
	_x setVariable["house_owner",nil,true];
	_x setVariable["other_space",nil,true];
	_x setVariable["trunk",nil,true];
	_x setVariable["trunkuser",nil,true];
	_x setVariable["vehspawnpoint",nil,true];
	_x setVariable["weapon_space",nil,true];
	_x setVariable["isStorehouse",nil,true];
	_x setVariable["storehouse_level",nil,true];
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_x setVariable[format["bis_disabled_Door_%1",_i],0,true];
	};
} forEach (_gang getVariable ["gang_HOUSES",[]]);

if (life_HC_isActive) then {
	["Terminate",_gang getVariable ["gang_ID",1],[_gang]] remoteExec ["HC_fnc_gangUpdatePartial",HC_Life];
} else {
	["Terminate",_gang getVariable ["gang_ID",1],[_gang]] remoteExec ["TON_fnc_gangUpdatePartial",2];
};


closeDialog 0;