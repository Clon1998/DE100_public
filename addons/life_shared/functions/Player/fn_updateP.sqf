#include "\life_shared\script_macros.hpp"
/*
	File:	fn_updateP.sqf
	Date:   2017-03-23 11:43:07
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
_check = params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_side", sideUnknown, [sideUnknown]],
	["_isNobody", false, [false]],
	["_pack", [], [[]]]
];
if !([_uid,_cid]call AH_fnc_verify) exitWith {};
if (!_check || _uid isEqualTo "" || _side isEqualTo sideUnknown || count _pack == 0) exitWith {
	[format["Error in updateP: %1",str _this]] call A3Log;
};

private _fields = [];
{
	private _data = _x select 1;

	call {
		if ((_x select 0) isEqualTo "CASH") exitWith {
			_fields pushBackUnique format["bankacc='%1', cash='%2'",[_data select 0] call life_fnc_number,[_data select 1] call life_fnc_number]
		};
	
		if ((_x select 0) isEqualTo "GEAR") exitWith {
			private _flag = call {if (_side isEqualTo civilian) exitWith {"civ_gear";};if (_side isEqualTo west) exitWith {"cop_gear";};if (_side isEqualTo independent) exitWith {"thr_gear";};};

			if (_isNobody) then {
				_flag = "nobody_gear"; 
			};
			_fields pushBackUnique format["%1='%2'",_flag,[_data] call DB_fnc_mres];
		};

		if ((_x select 0) isEqualTo "LICENSE") exitWith {
			private _flag = call {if (_side isEqualTo civilian) exitWith {"civ_licenses";};if (_side isEqualTo west) exitWith {"cop_licenses";};if (_side isEqualTo independent) exitWith {"thr_licenses";};};

			_fields pushBackUnique format["%1='%2'",_flag,[_data] call DB_fnc_mres];
		};

		if ((_x select 0) isEqualTo "JAILED") exitWith {
			_fields pushBackUnique format["arrested='%1'",_data];
		};

		if ((_x select 0) isEqualTo "NEWBEE") exitWith {
			_fields pushBackUnique format["newBee='%1'",_data];
		};

		if ((_x select 0) isEqualTo "ADVENT") exitWith {
			_fields pushBackUnique format["advent='%1'",_data];
		};

		if ((_x select 0) isEqualTo "PROF") exitWith {
			private _flag = call {if (_side isEqualTo civilian) exitWith {"civ_prof";};if (_side isEqualTo west) exitWith {"cop_prof";};if (_side isEqualTo independent) exitWith {"thr_prof";};};

			_fields pushBackUnique format["%1='%2'",_flag,[_data] call DB_fnc_mres];
		};

		if ((_x select 0) isEqualTo "ACHIV") exitWith {
			_fields pushBackUnique format["achievements='%1'",[_data] call DB_fnc_mres];
		};

		if ((_x select 0) isEqualTo "IDCARD") exitWith {
			_fields pushBackUnique format["name='%1', idCard='%2'",[_data select 0] call DB_fnc_mres,[_data select 1] call DB_fnc_mres];
		};
	};	
	nil
} count _pack;

if (_fields isEqualTo []) exitWith {};
[format["UPDATE players SET %1, lastLogged=NOW() WHERE playerid='%2'",_fields joinstring ", ",_uid], 1] call DB_fnc_asyncCall;
[_uid,_side] call PL_fnc_saveTime;