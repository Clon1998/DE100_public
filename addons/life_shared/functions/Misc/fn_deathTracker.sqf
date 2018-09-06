#include "\life_shared\script_macros.hpp"
/*
	File:	fn_deathTracker.sqf
	Date:   2017-04-13 18:26:58
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_s", "", [""]],
	["_v", "", [""]],
	["_p", [], [[]]]
];

if (_s isEqualTo "" || _v isEqualTo "" || _p isEqualTo [] || _v isEqualTo _s) exitwith {};

[format["INSERT INTO `death_tracker` (`source`, `victim`, `pos`, `time`) VALUES ('%1', '%2', '%3', NOW());",_s,_v,_p],1] call DB_fnc_asyncCall;