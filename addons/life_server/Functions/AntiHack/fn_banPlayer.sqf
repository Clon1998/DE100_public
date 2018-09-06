/*
	File:	fn_banPlayer.sqf
	Date:   2017-03-20 19:42:46
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_target", objNull, ["",objNull]],
	"_queryResult"
];

if !(uiNamespace getVariable["AH_BAN_ENABLED",true]) exitwith {};

if (_target isEqualType "") then {
	_target = _target call life_fnc_unitFromUid;
};

if (_target isEqualTo objNull || _target isEqualTo "") exitwith {};

if (_target getVariable ["banned",false]) then {
	[[],["life_fnc_dummy",2]] remoteExec ["remoteExec",_target];
} else {
	_target setVariable ["banned",true,true];
	private _name = _target call life_fnc_name;
	private _uid = getPlayerUID _target;
	_queryResult = [format["SELECT id FROM `bans` WHERE `playerid`='%1' AND `status`='true'",_uid],2] call DB_fnc_asyncCall;
	if (count _queryResult == 0) then {		
		[format["INSERT INTO `bans` (`name`,`playerid`,`von`,`datum`,`status`,`grund`,`insert_time`)VALUES('%1','%2','L_AntiHack','-1','true','Du wurdest durch LAntiHack gebannt. Weitere Informationen erhälst du im Support.',NOW());",_name,_uid],1] call DB_fnc_asyncCall;

		for "_i" from 0 to 1 step 0 do {
			uiSleep 0.1;
			_queryResult = [format["SELECT id FROM `bans` WHERE `name`='%1' AND `playerid`='%2' AND `von`='L_AntiHack' AND `status`='true'",_name,_uid],2] call DB_fnc_asyncCall;
			if (count _queryResult > 0) exitWith {};
		};
	};
	["L_AntiHack","-1","Du wurdest durch LAntiHack gebannt. Weitere Informationen erhälst du im Support.",_queryResult select 0] remoteExec ["SOCK_fnc_banned",_target];
};