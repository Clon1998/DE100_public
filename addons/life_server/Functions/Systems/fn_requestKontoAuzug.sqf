/*
	File :  fn_requestKontoAuzug.sqf
	Date:   18.10.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_player", objNull, [objNull]],
	["_uid", "", [""]],
	"_query",
	"_queryResult"
];

_query = format["SELECT sender, receiver, sender_name, receiver_name, type, menge, verwendungszweck, zeitpunkt FROM bank WHERE sender='%1' OR  receiver='%1' ORDER BY zeitpunkt DESC",_uid];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if(count _queryResult == 0) exitWith {};
[4,_queryResult] remoteExec ["life_fnc_atmMenu",_player];