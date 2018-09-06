/*
	File:	fn_shakeLPick.sqf
	Date:   2017-05-31 15:46:15
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
if (!canSuspend) exitwith {
	hint "SPAWN IT IDIOT";
};

if (_display getVariable ["shaking",false]) exitwith {};
_display setVariable ["shaking",true];
private _lpick = _display getVariable ["lockPick",controlNull];
private _cAngle = ctrlAngle _lpick select 0;
private _wear = _lpick getVariable ["wear",0];
if (_wear >= 100) then {
	[_display] call lpick_fnc_breakLPick;
} else {
	playSound "lockWrong";
	for "_i" from 1 to 5 step 1 do {
		_lpick ctrlSetAngle [_cAngle + -1^_i + 1.5,0.5,0.5];
		uiSleep 0.0175;
	};
	_lPick ctrlSetAngle [_cAngle,0.5,0.5];
	private _wearCfg = getArray(missionConfigFile >> "Life_Settings" >> "lpick_sys_fray");
	_lpick setVariable ["wear",_wear + (_wearCfg select 0) + random (_wearCfg select 1)];
};
_display setVariable ["shaking",false];