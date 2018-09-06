/*
   File:    fn_checkName.sqf
   Date:    2017-10-7 12:21:59
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.

   name = false
   Tag = true
*/
params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_toCheck", "", [""]],
	["_nameTag", false, [false]]
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
private _overWrite = if (isNull _unit) then {
    ["",""];
} else {
    private _gang = group _unit;
    [toLower (_gang getVariable ["gang_TAG",""]), toLower (_gang getVariable ["gang_NAME",""])];
};

private _valid = if (_nameTag) then {
	count([format["SELECT `id` FROM `gang_system` WHERE LOWER(`tag`)='%1' AND `active`='1'",(toLower _toCheck) call DB_fnc_mres],2] call DB_fnc_asyncCall) == 0;
} else {
	count([format["SELECT `id` FROM `gang_system` WHERE LOWER(`name`)='%1' AND `active`='1'",(toLower _toCheck) call DB_fnc_mres],2] call DB_fnc_asyncCall) == 0;
};

if (toLower _toCheck in _overWrite || format["[%1] ",toLower _toCheck] in _overWrite) then {
    _valid = true;
};

[_valid, _nameTag] remoteExecCall ["life_fnc_validNameTag",remoteExecutedOwner];