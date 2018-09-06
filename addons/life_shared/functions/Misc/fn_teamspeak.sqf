/*
   File:    fn_teamspeak.sqf
   Date:    2017-10-28 18:54:25
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_token", "", [""]],
    "_ret"
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitWith {};

_ret = [format["SELECT id FROM arma_ts.validated WHERE pid='%1'",_uid],2] call DB_fnc_asyncCall;

if !(_ret isEqualTo []) exitWith {
    [5,"Du kannst deinen Arma3-Account nur mit einem Ts³-Profil verknüpfen.<br/>Solltest du dein altes Ts³-Profil nicht mehr haben, können wir die Verknüpfung der Accounts im Support ändern."] remoteExecCall ["life_fnc_broadcast",_unit];
};

_ret = [format["SELECT id FROM arma_ts.validated WHERE token='%1'",_token],2] call DB_fnc_asyncCall;
if (_ret isEqualTo []) exitWith {
	[5,"Der Token scheint ungültig zu sein"] remoteExecCall ["life_fnc_broadcast",_unit];
};

[format["UPDATE arma_ts.validated SET pid='%1' WHERE id='%2' and token='%3'",_uid,_ret select 0,_token], 1] call DB_fnc_asyncCall;

[3,"Der Token war gültig. Wenn du dich das nächste mal im TS³ einloggst, wirst du freigeschaltet."] remoteExecCall ["life_fnc_broadcast",_unit];