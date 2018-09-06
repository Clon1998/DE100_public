/*
	File:	fn_getDepository.sqf
	Date:   2017-03-01 15:42:55
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

_error = params[
	["_pid", "", [""]],
	["_side", sideUnknown, [sideUnknown]],
	["_unit", objNull, [objNull]],
	"_query",
	"_queryResult"
];

//Error checks
if(!_error) exitWith {
	if(!isNull _unit) then {
		[1,[]] remoteExecCall ["life_fnc_openDepository",_unit];
	};
};

_side = call {if (_side isEqualTo civilian) exitWith {"civ";};if (_side isEqualTo west) exitWith {"cop";};if (_side isEqualTo independent) exitWith {"thr";};};

if(_side == "Error") exitWith {
	[1,[]] remoteExecCall ["life_fnc_openDepository",_unit];
};

_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND depository='1'",_pid,_side];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

[1,_queryResult] remoteExecCall ["life_fnc_openDepository",_unit];