#include "\life_shared\script_macros.hpp"
/*
	File:	fn_updateC.sqf
	Date:   2017-03-24 10:08:28
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

_check = params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_vid", -1, [0]],
	["_color", "", [""]]
];
if (!_check || _vid < 0) exitWith{};
if !([_uid,_cid]call AH_fnc_verify) exitWith {};

[format["UPDATE vehicles SET color='%1' WHERE id='%2'",_color, _vid],1] call DB_fnc_asyncCall;