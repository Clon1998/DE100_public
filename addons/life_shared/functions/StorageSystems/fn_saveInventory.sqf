/*
	File:	fn_saveInventory.sqf
	Date:   2017-06-20 22:00:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _err = params[
	["_b", objNull, [objNull]],//Storage Obj
	["_s", sideUnknown, [sideUnknown]],//Storage Obj
	["_uid", "", [""]],
	["_cid", "", [""]],
	"_sVar",
	"_wVar",
	"_cVar",
	"_oVar",
	"_tVar",
	"_iVar"
];
if (!_err) exitWith {};
if (!([_uid,_cid]call AH_fnc_verify) || isNull _b) exitWith {};
private _il = _b isEqualTo lockers_obj;//is Locker

if (_il) then {
	_sVar = format["%1_%2_locker_container",_uid,_s];
	_wVar = format["%1_%2_locker_weapon_space",_uid,_s];
	_cVar = format["%1_%2_locker_clothing_space",_uid,_s];
	_oVar = format["%1_%2_locker_other_space",_uid,_s];
	_tVar = format["%1_%2_locker_Trunk",_uid,_s];
	_iVar = format["%1_%2_locker_id",_uid,_s];
} else {
	_sVar = "container";
	_wVar = "weapon_space";
	_cVar = "clothing_space";
	_oVar = "other_space";
	_tVar = "Trunk";
	_iVar = "house_id";
};

private _id = _b getVariable [_iVar,-1];
if (_id < 0) exitWith {};
[
	format[
		"UPDATE %1 SET space_data='%2', inventory='%3', container='%4' WHERE id='%5'",
		call {
			if (_il) exitWith {"lockers";};
			if (_b getVariable ["isStorehouse",false]) exitWith {"storehouses";};
			"houses";
		},
		[[_b getVariable [_wVar,[]],_b getVariable [_cVar,[]],_b getVariable [_oVar,[]]]] call DB_fnc_mres,
		[_b getVariable [_tVar,[[],0]]] call DB_fnc_mres,
		[_b getVariable [_sVar,[]]] call DB_fnc_mres,
		_id
	],
	1
] call DB_fnc_asyncCall;