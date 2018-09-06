/*
	File:	fn_newLeader.sqf
	Date:   2016-10-14 16:59:19
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;

private _display = findDisplay 2500;
private _listBox = _display displayCtrl 2502;
private _unit = objectFromNetId (_listBox lbData (lbCurSel _listBox));
private _gang = group player;

private _action = [
	format["Möchtest du %1 wirklick zum Besitzer der Gang %2 machen?", _unit call life_fnc_name, _gang getVariable ["gang_NAME",""]],
	format["%1 zum Besitzer machen", _unit call life_fnc_name],
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (!_action) exitwith {};

private _gangMembers = _gang getVariable ["gang_MEMBERS",[]];
private _unitPermissions = (_gangMembers select ([getPlayerUID _unit,_gangMembers] call life_fnc_index)) select 1;
private _playerPermissions = (_gangMembers select ([getPlayerUID player,_gangMembers] call life_fnc_index)) select 1;

_unitPermissions pushBackUnique "OWNER";
_unitPermissions pushBackUnique "INVITE";
_unitPermissions pushBackUnique "BANK";
_unitPermissions pushBackUnique "MEMBERMANAGER";
_unitPermissions pushBackUnique "HOUSE";
_playerPermissions deleteAt (_playerPermissions find "OWNER");

_gangMembers set [([getPlayerUID _unit,_gangMembers] call life_fnc_index),[getPlayerUID _unit,_unitPermissions]];
_gangMembers set [([getPlayerUID player,_gangMembers] call life_fnc_index),[getPlayerUID player,_playerPermissions]];

player setRank "PRIVATE";
(group player) selectLeader _unit;
_gang setVariable ["gang_MEMBERS",_gangMembers,true];
life_gang_permission_update = true;
[] remoteExecCall ["life_fnc_promoted",_unit];
closeDialog 0;