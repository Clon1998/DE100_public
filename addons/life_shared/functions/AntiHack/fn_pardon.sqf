#include "\life_shared\script_macros.hpp"
/*
	File:	fn_pardon.sqf
	Date:   2017-03-22 23:22:37
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", '', ['']],
	["_cid", '', ['']]
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};

[format["UPDATE bans SET status='false' WHERE playerid='%1'",_uid],1] call DB_fnc_asyncCall;