/*
	File:	fn_breakLPick.sqf
	Date:   2017-06-01 01:22:24
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
if (_display getVariable ["lockPickBroke",false]) exitwith {};
_display setVariable ["lockPickBroke",true];
private _lpick = _display getVariable ["lockPick",controlNull];
private _pos = ctrlPosition _lpick;
private _cAngle = ctrlAngle _lpick select 0;	
playSound "pickBreacking";
_pos set [1,(_pos select 1) * 2];
_lpick ctrlSetText "images\dialog\lockpick_broke.paa";
_lPick ctrlSetPosition _pos;
_lpick ctrlSetFade 1;
_lpick ctrlCommit 0.5;
for "_i" from 1 to 20 step 1 do {
	_lpick ctrlSetAngle [_cAngle+(180/20)*_i,0.5,0.5];
	uisleep (0.5/20);
};
["Der Dietrich ist abgebrochen.",false,"fast"] call life_fnc_notification_system;
waitUntil {ctrlCommitted _lpick};

if (([false,"lockpick",1] call life_fnc_handleInv) == 0) exitwith {
	_display closeDisplay 0;
	["Du hast keine Dietriche mehr",true,"fast"] call life_fnc_notification_system;
};

_pos set [1,(_pos select 1) / 2];
_lPick ctrlSetPosition _pos;
_lPick ctrlSetAngle [_cAngle,0.5,0.5];
_lpick ctrlSetFade 0;
_lpick ctrlSetText "images\dialog\lockpick.paa";
_lpick ctrlCommit 0.5;

[format["Du hast noch %1 Dietrich(e)",[0,"lockpick"] call life_fnc_handleVItem],false,"fast"] call life_fnc_notification_system;
waitUntil {ctrlCommitted _lpick};
_lpick setVariable ["wear",0];
_display setVariable ["lockPickBroke",false];
_display setVariable ["shaking",false];
