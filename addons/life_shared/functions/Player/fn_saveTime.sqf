#include "\life_shared\script_macros.hpp"
/*
	File:	fn_saveTime.sqf
	Date:   2017-04-14 19:40:49
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_p", "", [""]],
	["_s", sideUnknown, [sideUnknown]],
	["_c",false]
];

if (_p isEqualTo "" || _s isEqualTo sideUnknown) exitwith {};

_s = call {if (_s isEqualTo civilian) exitWith {0;};if (_s isEqualTo west) exitWith {1;};if (_s isEqualTo independent) exitWith {2;};};
_c = [0,1] select _c;

[format["CALL `updatePlaytime`('%1', '%2', %3);",_p,_s,_c],1] call DB_fnc_asyncCall;