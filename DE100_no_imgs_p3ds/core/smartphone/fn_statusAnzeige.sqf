/*
	File:	fn_statusAnzeige.sqf
	Date:   30.10.2015
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private["_index","_data"];
_index = [_this,0,0] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 7100};
_display = findDisplay 7100;
_cMessageList = _display displayCtrl 6422;
_cMessageShow = _display displayCtrl 7105;

_data = parseSimpleArray (_cMessageList lnbData[_index,0]);
_cMessageShow ctrlSetStructuredText parseText format["%1",_data select 2];
_cMessageShow ctrlSetPosition [0,0,0.49,ctrlTextHeight _cMessageShow];
_cMessageShow ctrlCommit 0;