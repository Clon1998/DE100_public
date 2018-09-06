/*
	File:	fn_kickOutLocal.sqf
	Date:   2016-10-15 14:03:02
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
private _display = findDisplay 2500;
private _listBox = _display displayCtrl 2502;
private _index = lbCurSel _listBox;
if ((_listBox lbData _index) isEqualTo "exit") exitwith {};
private _name = _listBox lbText _index;
private _uid = _listBox lbData _index;
private _gang = group player;
private _gangMembers = _gang getVariable ["gang_MEMBERS",[]];
private _action = [
	format["Möchtest du %1 wirklick aus der Gang %2 werfen?", _name, _gang getVariable ["gang_NAME",""]],
	format["%1 rauswerfen", _name],
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (!_action) exitwith {};

[2,format["%1 wurder aus der Gang %2 geworfen",_name,_gang getVariable ["gang_NAME",""]]] remoteExecCall ["life_fnc_broadcast",(units _gang)];
private _newIndex = if (_index < (lbSize _listBox -1)) then {
	_index;
} else {
	(lbSize _listBox -1);
};
_listBox lbDelete _index;
if ((lbSize _listBox) == 0) then {
	_listBox lbSetData [(_listBox lbAdd "Keiner"),"exit"];
	{
		_display displayCtrl _x ctrlEnable false;
		_display displayCtrl _x cbSetChecked false;
	} forEach [2507,2509,2511,2515];
};
_listBox lbSetCurSel _newIndex;

_gangMembers deleteAt ([_uid,_gangMembers] call life_fnc_index);
_gang setVariable ["gang_MEMBERS",_gangMembers,true];
life_gang_permission_update = true;