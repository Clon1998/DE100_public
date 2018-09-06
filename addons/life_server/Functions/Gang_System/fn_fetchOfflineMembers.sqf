/*
	File:	fn_fetchOfflineMembers.sqf
	Date:   2017-02-24 15:06:55
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_gangID", 0, [0]],
	["_data", "", [""]],
	["_dir", "", [""]],
	["_client", 0, [0]],
	"_query"
];
private _queryResult = [];
if (count _data > 0) then {
	_query = format ["SELECT name,playerid FROM players WHERE playerid in (%1);",_data];
	_queryResult = [_query,2,true] call TON_fnc_asyncCall;
};

[_queryResult,"memberOff",_dir] remoteExec ["life_fnc_gangMenu",_client];