/*
	File:	fn_moveLPick.sqf
	Date:   2017-05-31 13:44:58
	Author: Patrick "Lucian" Schmidt (DE100) & - RamBob(Team ELAN)
	Disclaimer: This script was developted as a result of a co-operation betwen DE100-Altis.Life and Team-Elan.de.
				No one besides the two mentioned communitys is allowed to use and/or edit the script.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_display", displayNull, [displayNull]],
	["_xPos", 0, [0]],
	["_yPos", 0, [0]]
];
if (!(_display getVariable ["pickActive",false]) || _display getVariable ["lockPickBroke",false]) exitWith {false;};
private _lpick = _display getVariable ["lockPick", controlNull];
private _cAngle = ctrlAngle _lpick select 0;
private _lPos = _display getVariable ["lastPos",getMousePosition select 0];
_xPos = getMousePosition select 0;

private _dis = _xPos - _lPos;
private _pickRange = getNumber(missionConfigFile >> "Life_Settings" >> "lpick_sys_range");
_lpick ctrlSetAngle [((_cAngle + (125*_dis)) max -_pickRange/2) min _pickRange/2,0.5,0.5];

_display setVariable ["lastPos",_xPos];