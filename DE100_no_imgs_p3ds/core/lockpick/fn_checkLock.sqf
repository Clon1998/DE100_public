/*
	File:	fn_checkLock.sqf
	Date:   2017-05-31 12:53:16
	Author: Patrick "Lucian" Schmidt (DE100) & - RamBob(Team ELAN)
	Disclaimer: This script was developted as a result of a co-operation betwen DE100-Altis.Life and Team-Elan.de.
				No one besides the two mentioned communitys is allowed to use and/or edit the script.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

private _display = findDisplay 5000;
if (isNull _display) exitwith {
	removeMissionEventHandler ["EachFrame",_thisEventHandler];
};
if (time - (_display getVariable ["lastCheck",0]) < 0.015) exitwith {};
_display setVariable ["lastCheck",time];

private _kHole = _display displayCtrl 5001;
private _lPick = _display getVariable ["lockPick",controlNull];

if (ctrlAngle _kHole select 0 > 0) then {
	_kHole ctrlSetAngle [((ctrlAngle _kHole select 0)-0.5) max 0,0.5,0.5];
	_display call lpick_fnc_rotateLPick;
};

if (_display getVariable ["shiftingActive",false] && !(_display getVariable ["lockPickBroke",false]) && !(_display getVariable ["shaking",false])) then {
	private _tolerance = _display getVariable ["tolerance",getNumber(missionConfigFile >> "Life_Settings" >> "lpick_sys_tolerance")];
	private _perc = _display getVariable ["perc",getNumber(missionConfigFile >> "Life_Settings" >> "lpick_sys_perc")];

	private _deviation = abs((ctrlAngle _lPick select 0) - (_display getVariable ["targetAngle",0]));
	if (_deviation > _tolerance*((90-(ctrlAngle _kHole select 0))/90 max _perc)) exitwith {
		if !(_display getVariable ["shaking",false]) then {
			[_display] spawn lpick_fnc_shakeLPick;
		};
	};
	_kHole ctrlSetAngle [((ctrlAngle _kHole select 0)+1.5) min 90,0.5,0.5];
	_display call lpick_fnc_rotateLPick;
	if (((ctrlAngle _kHole select 0)+1.5) >= 90) exitwith {
		(_display getVariable ["params",[]]) call (_display getVariable ["code",{}]);
		_display closeDisplay 0;
	};
};