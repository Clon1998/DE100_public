/*
	File:	fn_pushVehicle.sqf
	Date:   24.11.2015
	Author: Unkown
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private["_target","_caller","_posCaller","_dir"];
_target = cursorObject;
_caller = player;
_posCaller = getPos _caller;
_dir = getDir _caller;

if (isNull _target) exitWith {};
if (_caller distance _target > 5) exitWith {};

if (local _target) then {
	[_caller,_target,_posCaller,_dir] spawn life_fnc_pushFunction;
} else {
	[_caller,_target,_posCaller,_dir] remoteExecCall ["life_fnc_pushFunction",_target];
};