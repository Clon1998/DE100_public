#include "\life_server\script_macros.hpp"
/*
	File: fn_jailSys.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	I forget?
*/
params[
	["_unit", objNull, [objNull]],
	["_bad", false, [false]],
	["_time", 15, [0]],
	"_result",
	"_query",
	"_time"
];

if(isNull _unit) exitWith {};


if(_bad) then {
	_query = format["SELECT jail_time FROM players WHERE playerid='%2'", _time, getPlayerUID _unit];

	_result = [_query,2] call DB_fnc_asyncCall;
	_result = (_result select 0);

	_time = _result;
} else {
	_query = format["UPDATE players SET jail_time='%1' WHERE playerid='%2'", _time, getPlayerUID _unit];
	[_query,1] call DB_fnc_asyncCall;
};


[[getPlayerUID _unit] call life_fnc_getBounty,_bad,_time] remoteExec ["life_fnc_jailMe",_unit];