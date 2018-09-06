/*
	File:	fn_kickOut.sqf
	Date:   2016-10-15 14:03:02
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

if (isNull _unit) exitwith {};
private _action = [
	format["Möchtest du %1 wirklick aus der Gang %2 werfen?", _unit call life_fnc_name, _gang getVariable ["gang_NAME",""]],
	format["%1 rauswerfen", _unit call life_fnc_name],
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (!_action) exitwith {};

[2,format["%1 wurder aus der Gang %2 geworfen",_unit call life_fnc_name,_gang getVariable ["gang_NAME",""]]] remoteExecCall ["life_fnc_broadcast",(units _gang - [_unit])];

[(findDisplay 2500),"member","left"] call life_fnc_gangMenu;
["Kicked",_gang] remoteExec ["life_fnc_leaveGang",_unit];
life_gang_permission_update = true;