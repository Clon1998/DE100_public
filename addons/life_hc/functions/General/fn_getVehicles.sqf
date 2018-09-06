/*
	File: fn_getVehicles.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends a request to query the database information and returns vehicles.
*/
_error = params[
	["_pid", "", [""]],
	["_side", sideUnknown, [sideUnknown]],
	["_type", "", [""]],
	["_unit", objNull, [objNull]],
	"_query",
	"_queryResult"
];

//Error checks
if(!_error) exitWith {
	if(!isNull _unit) then {
		[1,_type,[]] remoteExecCall ["life_fnc_openGarage",_unit];
	};
};

_side = call {if (_side isEqualTo civilian) exitWith {"civ";};if (_side isEqualTo west) exitWith {"cop";};if (_side isEqualTo independent) exitWith {"thr";};};

if(_side == "Error") exitWith {
	[1,_type,[]] remoteExecCall ["life_fnc_openGarage",_unit];
};

_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color, inventory, (TIME_TO_SEC(TIMEDIFF(NOW(),coolDown))) FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND depository='0' AND forSale='0' AND type='%3'",_pid,_side,_type];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

[1,_type,_queryResult] remoteExecCall ["life_fnc_openGarage",_unit];