#include "\life_hc\hc_macros.hpp"
/*
	File : fn_getSideMember.sqf
	Date:   19.12.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
params[
	["_mode", 0, [0]],
	["_unit", objNull, [objNull]],
	"_query",
	"_queryResult"
];

_query = [
	format["SELECT playerid, name, coplevel FROM players WHERE coplevel > '0' ORDER BY coplevel DESC"],
	format["SELECT playerid, name, thrlevel FROM players WHERE thrlevel > '0' ORDER BY thrlevel DESC"]
] select _mode;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
[objNull,STAFFANWSER,_queryResult] remoteExecCall ["life_fnc_staffManager",_unit];