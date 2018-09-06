#include "\life_shared\script_macros.hpp"
/*
	File:	fn_insert.sqf
	Date:   2017-03-23 21:37:47
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_name", "", [""]],
	["_money", 0, [0]],
	["_bank", 20000, [0]]
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitwith {};

private _queryResult = [format["SELECT playerid, name FROM players WHERE playerid='%1'",_uid],2] call DB_fnc_asyncCall;


if( count _queryResult > 0) exitWith {
	[] remoteExecCall ["SOCK_fnc_dataQuery",_unit];
};


private _name = [_name] call DB_fnc_mres;
private _money = [_money] call life_fnc_number;
private _bank = [_bank] call life_fnc_number;
private _guid = ("battleye\A3_UIDToGUID" callExtension _uid);

private _query = format["INSERT INTO players (playerid, name, cash, bankacc, cop_licenses, thr_licenses, civ_licenses, civ_gear, cop_gear, thr_gear, nobody_gear, idCard, guid) VALUES('%1', '%2', '%3', '%4', '""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','%5')",
	_uid,
	_name,
	_money,
	_bank,
	_guid
];


[_query,1] call DB_fnc_asyncCall;
[] remoteExecCall ["SOCK_fnc_dataQuery",_unit];