#include "\life_shared\script_macros.hpp"
/*
	File:	fn_updateC.sqf
	Date:   2017-03-23 11:42:52
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

_error = params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_name", "", [""]],
	["_side", sideUnknown, [civilian]],
	["_cash", 0, [0]],
	["_bank", -1, [0]],
	["_licenses", [], [[]]],
	["_gear", [], [[]]],
	["_prof", [], [[]]],
	["_achivments", [], [[]]],
	["_arrested", 0, [0]],
	["_job", 0, [0]],
	["_isNobody", false, [false]],
	"_query"
];
//AH Check
if !([_uid,_cid]call AH_fnc_verify) exitWith {};
//Get to those error checks.
if(_uid == "" || _name == "" || _bank < 0 || !_error) exitWith {
	[format["Error in updateC: %1",str _this]] call A3Log;
};


//Parse and setup some data.
_name = [_name] call DB_fnc_mres;
_cash = [_cash] call life_fnc_number;
_bank = [_bank] call life_fnc_number;
_licenses = [_licenses] call DB_fnc_mres;
_gear = [_gear] call DB_fnc_mres;
_prof = [_prof] call DB_fnc_mres;
_achivments = [_achivments] call DB_fnc_mres;

if (_isNobody) exitWith {
	_query = format["UPDATE players SET cash='%2', bankacc='%3', civ_licenses='%4', nobody_gear='%6', arrested='%7', life_civjob='%8', civ_prof='%9',achievements='%10', lastLogged=NOW() WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,_arrested,_job,_prof,_achivments];
	_queryResult = [_query,1] call DB_fnc_asyncCall;
};

_query = call {
	if (_side isEqualTo civilian) exitWith {
		format["UPDATE players SET cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7', life_civjob='%8', civ_prof='%9',achievements='%10', lastLogged=NOW() WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,_arrested,_job,_prof,_achivments];
	};

	if (_side isEqualTo west) exitWith {
		format["UPDATE players SET cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', cop_prof='%7',achievements='%8', lastLogged=NOW() WHERE playerid='%6'",_name,_cash,_bank,_gear,_licenses,_uid,_prof,_achivments];
	};

	if (_side isEqualTo independent) exitWith {
		format["UPDATE players SET cash='%2', bankacc='%3', thr_licenses='%4', thr_gear='%6', thr_prof='%7',achievements='%8', lastLogged=NOW() WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,_prof,_achivments];
	};
};	

_queryResult = [_query,1] call DB_fnc_asyncCall;
[_uid,_side] call PL_fnc_saveTime;