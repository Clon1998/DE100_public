#include "\life_server\script_macros.hpp"
/*
	File:	fn_updateRank.sqf
	Date:   04.02.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", "", [""]],
	["_id", 0, [0]],
	["_modus", 0, [0]],
	"_query"
];

_query = [
	format["UPDATE players SET coplevel='%2' WHERE playerid='%1'",_uid,_id],
	format["UPDATE players SET thrlevel='%2' WHERE playerid='%1'",_uid,_id]
] select _modus;

[_query,1] call DB_fnc_asyncCall;