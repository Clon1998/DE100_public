#include "\life_shared\script_macros.hpp"
/*
	File:	fn_updateF.sqf
	Date:   2017-03-24 10:07:39
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

_check = params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_vid", -1, [0]],
	["_fuel", 1, [0]],
	["_type", 0, [0]],
	"_query"
];
if (!_check || _vid < 0) exitWith{};
if !([_uid,_cid]call AH_fnc_verify) exitWith {};

_query = if (_type == 0) then {
	format["UPDATE vehicles SET fuel='%1' WHERE id='%2'",_fuel,_vid];
} else {
	format["UPDATE vehicles SET fuelcargo='%1' WHERE id='%2'",_fuel,_vid];
};

[_query,1] call DB_fnc_asyncCall;