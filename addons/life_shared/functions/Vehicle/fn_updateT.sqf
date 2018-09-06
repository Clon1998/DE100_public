#include "\life_shared\script_macros.hpp"
/*
	File:	fn_updateT.sqf
	Date:   2017-03-24 09:59:07
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

_check = params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_v", objNull, [objNull]],
	"_query"
];
if (!_check) exitWith {};
if (!([_uid,_cid]call AH_fnc_verify) || isNull _v) exitWith {};
private _id = _v getVariable["vid",-1];
if (_id < 0) exitWith {};

private _t = _v getVariable ["Trunk",[[],0]];
private _w = 0;

if !((_t select 0) isEqualType []) then {
	_t set [0,[]];
};

if !((_t select 1) isEqualType 0) then {
	_t set [1,0];
};

_t = (_t select 0) select {(getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "safeToDB")) isEqualTo 1 && isClass (missionConfigFile >> "VirtualItems" >> (_x select 0))};
{_w = _w + (getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "weight")) * (_x select 1);false} count _t;

[format["UPDATE vehicles SET inventory='%1', fuel='%2' WHERE id='%3'",[[_t,_w]] call DB_fnc_mres,fuel _v,_id],1] call DB_fnc_asyncCall;