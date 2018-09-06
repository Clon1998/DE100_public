/*
	File: fn_report.sqf
	Author: Anton
	
	Description:
	Der Client reportet sein Vergehen an den Server
*/
params[
	["_uid", '', ['']],
	["_cid", '', ['']],
	["_msg", [0,''], [[]]],
	["_ban", false, [false]],
	"_unit",
	"_guid"
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};
_unit = _uid call life_fnc_unitFromUid;

if (_ban && (uiNamespace getVariable["AH_BAN_ENABLED",true])) then {
	_unit spawn TON_fnc_banPlayer;
};

if (uiNamespace getVariable["AH_LOG_ENABLED",true]) then {
	_msg set [1,format["%1%2",["AH-Meldung: ","AH-Ban: "] select _ban,_msg select 1]];
	if (life_HC_isActive) then {
		[_uid, _msg select 0, _msg select 1] remoteExecCall ["MSC_fnc_log",HC_Life];
	} else {
		[_uid, _msg select 0, _msg select 1] call MSC_fnc_log;
	};

	bank_obj setVariable["AH_LASTMSG",(format["[%1|%2]",[_unit] call life_fnc_name,_uid]+(_msg select 1)),true];

	private _trgs = allPlayers select {_x getVariable["isAdmin",0] > 0};
	if (_trgs isEqualTo []) exitWith {};
	{
		if ((call(life_adminlevel))<1) exitWith {};
		cutText[format["AntiHack: %1", bank_obj getVariable["AH_LASTMSG",""]],"PLAIN DOWN"];
	}remoteExec["call",_trgs];
};