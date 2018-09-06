#include "\life_shared\script_macros.hpp"
/*
	File:	fn_execStack.sqf
	Date:   2017-03-23 16:14:04
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_stack", [], []]
];
if !([_uid,_cid]call AH_fnc_verify) exitWith {};
if (count _stack == 0) exitWith {};

{
	if (isClass(missionconfigfile >> "CfgRemoteExec" >> "Functions" >> (_x select 0)) && (if (isText(missionconfigfile >> "CfgRemoteExec" >> "Functions" >> (_x select 0) >> "allowedTargets")) then {getText(missionconfigfile >> "CfgRemoteExec" >> "Functions" >> (_x select 0) >> "allowedTargets") isEqualTo "HC_Life"} else {getNumber(missionconfigfile >> "CfgRemoteExec" >> "Functions" >> (_x select 0) >> "allowedTargets") in [0,2]})) then {
		if (_x select 1) then {
			(_x select 2) spawn (missionNamespace getVariable [_x select 0,{}]);
		} else {
			(_x select 2) call (missionNamespace getVariable [_x select 0,{}]);
		};
	} else {
		[format["%1 hat versucht %2, über execStack, auszuführen",_uid,_x select 0],"AntiHackLog"] call A3Log;
	};
	nil
} count _stack