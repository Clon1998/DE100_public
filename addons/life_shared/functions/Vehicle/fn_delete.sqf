#include "\life_shared\script_macros.hpp"
/*
	File:	fn_delete.sqf
	Date:   2017-04-10 15:56:39
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_vid", -1, [0]],
	["_class", "", [""]]
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};
if (_vid isEqualTo -1 || _uid isEqualTo "") exitWith {};

[format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND id='%2'",_uid,_vid],1] call DB_fnc_asyncCall;