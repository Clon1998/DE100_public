/*
	File:	fn_scrollWheel.sqf
	Date:   04.04.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
_scroll = _this select 1;

if (DE100_Core_ScrollWheelFrame == diag_frameno) exitWith {};
DE100_Core_ScrollWheelFrame = diag_frameno;

if (!isNull (missionNamespace getVariable ["DE100_Fortifications_Setup", objNull]) && !isNil{DE100_Fortifications_TweakedAngle}) then {
	DE100_Fortifications_TweakedAngle = DE100_Fortifications_TweakedAngle + _scroll min 240 max 120;
};
