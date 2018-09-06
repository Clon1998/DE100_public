/*
   File:    fn_insert.sqf
   Date:    2017-10-7 12:16:36
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
_name = [_name] call DB_fnc_mres;
_tag = [_tag] call DB_fnc_mres;

_queryResult = [format["SELECT id FROM gang_system WHERE LOWER(`name`)='%1' AND active='1'",toLower _name],2] call DB_fnc_asyncCall;

if !(_queryResult isEqualTo []) exitWith {
	[getNumber(missionConfigFile >> 'life_gang_config' >> 'levels' >> 'level_1' >> 'price'),"ATM","Es gibt bereits eine Gang mit diesem Namen. Dein Geld wurde auf die Bank zurücküberwiesen."] remoteExecCall ["life_fnc_refund",_unit];
};

_queryResult = [format["SELECT id FROM gang_system WHERE LOWER(`tag`)='%1' AND active='1'",toLower _tag],2] call DB_fnc_asyncCall;

if !(_queryResult isEqualTo []) exitWith {
	[getNumber(missionConfigFile >> 'life_gang_config' >> 'levels' >> 'level_1' >> 'price'),"ATM","Es gibt bereits eine Gang mit diesem Tag. Dein Geld wurde auf die Bank zurücküberwiesen."] remoteExecCall ["life_fnc_refund",_unit];
};

_queryResult = [format["SELECT id FROM gang_system WHERE members LIKE '%2%1%2' AND active='1'",_uid,"%"],2] call DB_fnc_asyncCall;

if !(_queryResult isEqualTo []) exitWith {
	[getNumber(missionConfigFile >> 'life_gang_config' >> 'levels' >> 'level_1' >> 'price'),"ATM","Du bist schon in einer Gang. Bitte verlasse diese erst. \nDein Geld wurde auf die Bank zurücküberwiesen."] remoteExecCall ["life_fnc_refund",_unit];
};

//Check to see if a gang with that name already exists but is inactive.
_queryResult = [format["SELECT id FROM gang_system WHERE LOWER(`name`)='%1' AND active='0'",toLower _name],2] call DB_fnc_asyncCall;

private _gangMembers = [[_uid,["OWNER","INVITE","MEMBERMANAGER","BANK","HOUSE"]]];

private _query = if !(_queryResult isEqualTo []) then {
	format["UPDATE gang_system SET active='1', members='%1', bank = '0', level = '1', name='%3', tag='%4' WHERE id='%2'",[_gangMembers] call DB_fnc_mres,(_queryResult select 0),_name,_tag];
} else {
	format["INSERT INTO gang_system (`name`, `tag`, `members`, `level`, `bank`, `active`) VALUES('%1','%2','%3','1','0','1')",_name,_tag,[_gangMembers] call DB_fnc_mres];
};
[_query,1] call DB_fnc_asyncCall;


private _gang = group _unit;
_gang setVariable ["gang_NAME",_name,true];
_gang setVariable ["gang_TAG",format ["[%1] ",_tag],true];
_gang setVariable ["gang_MEMBERS",_gangMembers,true];
_gang setVariable ["gang_LEVEL",1,true];
_gang setVariable ["gang_BANK",0,true];
_gang setVariable ["gang_SKIN",[["",""],["",""]],true];

//[_gang] remoteExec ["life_fnc_gangCreated",_unit];

for "_i" from 0 to 1 step 0 do {
	uiSleep 0.1;
	_queryResult = [format["SELECT id FROM gang_system WHERE active='1' AND members LIKE '%2%1%2'",_uid,"%"],2] call DB_fnc_asyncCall;
	if (count _queryResult > 0) exitWith {};
};

_gang setVariable ["gang_ID",_queryResult select 0,true];

[2,"Gang wurde erstellt"] remoteExecCall ["life_fnc_broadcast",_unit];