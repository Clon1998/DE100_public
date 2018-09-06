#include "\life_shared\script_macros.hpp"
/*
	File:	fn_reSync.sqf
	Date:   2017-03-23 11:43:07
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Resyncs Gear, if Unit disconnects and wasnt verifyed
*/

params[
	["_uid", "", [""]],
	["_side", sideUnknown, [sideUnknown]],
	["_isNobody", false, [false]],
	["_data", [], [[]]],
	"_query",
	"_flag"
];
_query = "";
_data = [_data] call DB_fnc_mres;

_flag = call {if (_side isEqualTo civilian) exitWith {"civ_gear";};if (_side isEqualTo west) exitWith {"cop_gear";};if (_side isEqualTo independent) exitWith {"thr_gear";};};
if (_isNobody) then {
	_flag = "nobody_gear"; 
};

if (_query isEqualTo "") then {
	_query = format["UPDATE players SET %1='%2'",_flag,_data];
} else {
	_query = format["%1, %2='%3'",_query,_flag,_data];
};


if (_query isEqualTo "") exitWith {};
_query = format["%1 WHERE playerid='%2'",_query,_uid];

[_query,1] call DB_fnc_asyncCall;
[_uid,_side] call PL_fnc_saveTime;