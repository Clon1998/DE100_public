/*
	File:	fn_mBtnDown.sqf
	Date:   2017-05-31 14:09:36
	Author: Patrick "Lucian" Schmidt (DE100) & - RamBob(Team ELAN)
	Disclaimer: This script was developted as a result of a co-operation betwen DE100-Altis.Life and Team-Elan.de.
				No one besides the two mentioned communitys is allowed to use and/or edit the script.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_display", displayNull, [displayNull]],
	["_mBtn", 0, [0]],
	["_xPos", 0, [0]],
	["_yPos", 0, [0]],
	["_shift", false, [false]],
	["_ctrl", false, [false]],
	["_alt", false, [false]]
];

if !(_mBtn isEqualTo 0) exitWith {false;};
if (_display getVariable ["pickActive",false]) exitWith {false;};
_display setVariable ["lastPos",getMousePosition select 0];
_display setVariable ["pickActive",true];
false;