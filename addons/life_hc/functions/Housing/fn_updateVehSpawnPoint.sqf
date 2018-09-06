#include "\life_hc\hc_macros.hpp"
/*
	File:	fn_updateVehSpawnPoint.sqf
	Date:   24.02.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

_check = params[
	["_houseID", -1, [0]],
	["_VehSpawnPoint", [], [[]]],
	["_isStorehouse", false, [false]],
	"_check",
	"_query"
];
if (!_check) exitWith {["Error in updateVehSpawnPoint PARAMS"] call A3Log;};
if(_houseID == -1) exitWith {["Error in updateVehSpawnPoint HOUSEID"] call A3Log;};

_VehSpawnPoint = [_VehSpawnPoint] call DB_fnc_mres;
_query = if (_isStorehouse) then {
	format["UPDATE storehouses SET vehSpawnPoint='%1' WHERE id='%2'",_VehSpawnPoint,_houseID];
} else {
	format["UPDATE houses SET vehSpawnPoint='%1' WHERE id='%2'",_VehSpawnPoint,_houseID];
};

[_query,1] call DB_fnc_asyncCall;
//systemChat "Query ran?";