/*
	File:	fn_gangMenuCbChange.sqf
	Date:   2016-10-14 16:02:36
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;

params[
	["_checkBox", controlNull, [controlNull]],
	["_state", 0, [0]],
	["_type", "", [""]]
];

private _display = findDisplay 2500;
private _listBox = _display displayCtrl 2502;
if ((_listBox lbData (lbCurSel _listBox)) isEqualTo "exit" || (_display getVariable ["mode",""]) isEqualTo "invite") exitwith {};
private _uid = if (isNull (objectFromNetId (_listBox lbData (lbCurSel _listBox)))) then {
	_listBox lbData (lbCurSel _listBox);
} else {
	getPlayerUID (objectFromNetId (_listBox lbData (lbCurSel _listBox)));
};
private _gang = group player;
private _gangMembers = _gang getVariable ["gang_MEMBERS",[]];
private _uidPermissions = (_gangMembers select ([_uid,_gangMembers] call life_fnc_index)) select 1;

if (_state isEqualTo 1) then {
	_uidPermissions pushBackUnique _type;
} else {
	_uidPermissions deleteAt (_uidPermissions find _type);
};

_gangMembers set [([_uid,_gangMembers] call life_fnc_index),[_uid,_uidPermissions]];
_gang setVariable ["gang_MEMBERS",_gangMembers,true];

life_gang_permission_update = true;