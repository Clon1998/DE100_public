#include "\life_shared\script_macros.hpp"
/*
	File:	fn_request.sqf
	Date:   2017-03-22 22:56:27
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


params [
	["_uid", "", [""]],
	["_cid", "", [""]]
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitwith {};
private _side = side _unit;

private _queryResult = [format["SELECT von, datum, grund, id FROM bans WHERE playerid='%1' AND status='true'",_uid],2] call DB_fnc_asyncCall;

if ((count _queryResult) > 0) exitWith {
	_queryResult remoteExec ["SOCK_fnc_banned",_unit];
};

private _patern = ["uid" ,"name", "playerid", "guid", "cash", "bankacc", "adminlevel", "coplevel", "nobody_level", "backpack", "cop_licenses", "civ_licenses", "cop_gear", "civ_gear", "nobody_gear", "cop_prof", "civ_prof", "achievements", "arrested", "life_civjob", "jail_time", "idCard", "skin_tier", "blacklist", "thrlevel","thr_prof","thr_gear","thr_licenses","playtime","newBee","advent"];
private _query = format["SELECT uid, name, playerid, guid, cash, bankacc, adminlevel, coplevel, nobody_level, TIME_TO_SEC(TIMEDIFF(backpack,NOW())), cop_licenses, civ_licenses, cop_gear, civ_gear, nobody_gear, cop_prof, civ_prof, achievements, arrested, life_civjob, jail_time, idCard, skin_tier, blacklist, thrlevel, thr_prof, thr_gear, thr_licenses, playtime_sum,newBee,advent FROM players WHERE playerid='%1'",_uid];
_queryResult = [_query,2] call DB_fnc_asyncCall;

if(_queryResult isEqualType "" || count _queryResult == 0) exitWith {
	[] remoteExec ["SOCK_fnc_requestReceived",_unit];
};

_queryResult = [_patern,_queryResult] call life_fnc_applyPattern;

//CHECK FOR ADMIN PERMISSION
if(["adminlevel",_queryResult] call life_fnc_dataFromKey > 0)then{
	[missionNamespace,["passwordtemp",AH_ADMIN_KEY]]remoteExec["setVariable",_unit];
	AD_fnc_load remoteExecCall ["call",_unit];
};

if (["guid",_queryResult] call life_fnc_dataFromKey isEqualTo "") then {
	[format["UPDATE players SET guid='%2' WHERE playerid='%1'",_uid,("battleye\A3_UIDToGUID"callExtension _uid)] ,1] call DB_fnc_asyncCall;
};

[format["CALL `updateAliases`('%1', '%2');",_uid,_unit call life_fnc_name] , 1] call DB_fnc_asyncCall;

[_uid,_side,true] call PL_fnc_saveTime;

["arrested",_queryResult,{[_this] call life_fnc_clientBool;}] call life_fnc_applyCodeAtKey;
["bankacc",_queryResult,{[_this] call life_fnc_number;}] call life_fnc_applyCodeAtKey;
["blacklist",_queryResult,{[_this] call life_fnc_clientBool;}] call life_fnc_applyCodeAtKey;
["newBee",_queryResult,{!([_this] call life_fnc_clientBool);}] call life_fnc_applyCodeAtKey;
["cash",_queryResult,{[_this] call life_fnc_number;}] call life_fnc_applyCodeAtKey;
["playtime",_queryResult,{if (_this isEqualType 0) then {[_this] call life_fnc_number;} else {"0";};}] call life_fnc_applyCodeAtKey;
["civ_gear",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;
["cop_gear",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;
["thr_gear",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;
["achievements",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;
["civ_prof",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;
["cop_prof",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;
["thr_prof",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;
["civ_licenses",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;
["cop_licenses",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;
["thr_licenses",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;
["idCard",_queryResult,{[_this] call DB_fnc_toArray;}] call life_fnc_applyCodeAtKey;

if (_side isEqualTo civilian) then {
	["Gang",_queryResult,_uid call PL_fnc_fetchGang] call life_fnc_setDataAtKey;
	["Houses",_queryResult,_uid call SS_fnc_fetchHouse] call life_fnc_setDataAtKey;
};

["Locker",_queryResult,_uid call SS_fnc_fetchLocker] call life_fnc_setDataAtKey;

[_uid,8,format["%1 hat sich eingeloggt",_unit call life_fnc_nameUID]] call MSC_fnc_log;
_queryResult remoteExec ["SOCK_fnc_requestReceived",_unit];