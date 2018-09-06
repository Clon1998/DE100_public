/*
	File:	fn_rotateLPick.sqf
	Date:   2017-05-31 16:14:30
	Author: Patrick "Lucian" Schmidt (DE100) & - RamBob(Team ELAN)
	Disclaimer: This script was developted as a result of a co-operation betwen DE100-Altis.Life and Team-Elan.de.
				No one besides the two mentioned communitys is allowed to use and/or edit the script.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_display", displayNull, [displayNull]]
];

private _kHole = _display displayCtrl 5001;
private _lPick = _display getVariable ["lockPick",controlNull];

private _lockPickPos = _lpick getVariable ["iniPos",[0,0]];
private _radius = _display getVariable ["radius",false];

if (_radius isEqualTo false) then {
	private _kholePos = _kHole getVariable ["iniPos",[0,0]];
	private _centerkHole = [(_kholePos select 0)+(_kholePos select 2)/2,(_kholePos select 1)+(_kholePos select 3)/2,0];
	private _centerLockPick = [(_lockPickPos select 0)+(_lockPickPos select 2)/2,(_lockPickPos select 1)+(_lockPickPos select 3)/2,0];
	_radius = _centerLockPick vectorDistance _centerkHole;
	_display setVariable ["radius",_radius];
};

private _cAngle = ctrlAngle _kHole select 0;
private _shiftX = _radius * (sin _cAngle);
private _shiftY = _radius * -(cos _cAngle);

_lpick ctrlSetPosition [(_lockPickPos select 0) + _shiftX,(_lockPickPos select 1) + _shiftY + _radius];
_lpick ctrlCommit 0;