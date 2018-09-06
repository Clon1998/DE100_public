/*
	File: fn_execGlobal.sqf
	Author: Anton
	
	Description:
	SQF-Befehle sicher und global ausführen.
*/

params[
	["_mode",0,[0]],
	["_pass",'',['']],
	["_code",'',['']],
	["_unit",objNull]
];

if (_pass!=AH_ADMIN_KEY)exitWith{};

call {
	if (_mode isEqualTo 0) exitWith {
		if(isNull _unit)exitWith{};
		(compile _code)remoteExec["BIS_fnc_Spawn",_unit];
	};

	if (_mode isEqualTo 1) exitWith {
		(compile _code)remoteExec["BIS_fnc_Spawn",0];
	};

	if (_mode isEqualTo 2) exitWith {
		call(compile _code);
	};
};