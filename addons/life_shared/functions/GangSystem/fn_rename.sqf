/*
   File:    fn_rename.sqf
   Date:    2018-1-18 20:20:41
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params [
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_name", "", [""]],
	["_tag", "", [""]],
	"_queryResult"
];
if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitwith {};
private _gang = group _unit;
private _gid = _gang getVariable ["gang_id",-1];

_name = [_name] call DB_fnc_mres;
_tag = [_tag] call DB_fnc_mres;

_queryResult = [format["SELECT id FROM gang_system WHERE LOWER(`name`)='%1' AND active='0'",toLower _name],2] call DB_fnc_asyncCall;

private _query = if !(_queryResult isEqualTo []) then {
	_gang setVariable ["gang_ID",_queryResult select 0,true];
	[format["UPDATE gang_system SET active='0' WHERE id='%1'",_gid call life_fnc_number],1] call DB_fnc_asyncCall;
	format["Update gang_system AS new LEFT JOIN gang_system AS old ON old.id='%1' SET new.active='1', new.tag='%4', new.name='%3', new.members=old.members, new.level=old.level, new.bank=old.bank, new.skin=old.skin WHERE new.id='%2';",_gid,_queryResult select 0,_name,_tag];
} else {
	format["UPDATE gang_system SET name='%2', tag='%3' WHERE id='%1'",_gid call life_fnc_number,_name,_tag]
};
[_query,1] call DB_fnc_asyncCall;

private _oTag = _gang getVariable ["gang_TAG",""];
private _oName = _gang getVariable ["gang_NAME",""];
_gang setVariable ["gang_NAME",_name,true];
_gang setVariable ["gang_TAG",format ["[%1] ", _tag],true];

[_uid, 56, format["%1 hat die Gang %2%3 (ID:%6) in [%4] %5 umbenannt.%7",_unit call life_fnc_nameUid, _oTag, _oName, _tag, _name,_gid,if !(_queryResult isEqualTo []) then {format[" Die alte Gang (ID: %1) wurde dafür inaktiv geschaltet und die neue Gang (ID: %2) wurde aktiv geschaltet und die Parameter der alten Gang sollten übernommen worden sein!",_gid,_queryResult select 0];} else {"";}]] call MSC_fnc_log;
[format["Die Gang %1%2 wurde in [%3] %4 umbenannt.", _oTag, _oName, _tag, _name], false, "slow"] remoteExecCall ["life_fnc_notification_system",-2];

if (isServer) then {
	["Bank",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_BANK",1]]] call TON_fnc_gangUpdatePartial;
} else {
	["Bank",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_BANK",1]]] call HC_fnc_gangUpdatePartial;
};