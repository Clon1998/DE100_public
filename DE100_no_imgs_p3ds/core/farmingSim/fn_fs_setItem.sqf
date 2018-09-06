/*
	File:	fn_fs_setItem.sqf
	Date:   2017-07-01 23:06:00
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_d", displayNull, [displayNull]],
	["_i",""]
];
if (!canSuspend) exitWith {
	hint "Because of an Arma bug you should spawn this fnc, to prevent a fking gamecrash."	
};
private _lb = _d displayCtrl 1;
private _rI = for "_j" from 0 to (lbSize _lb -1) do {
	if (toLower(_lb lbData _j) isEqualTo tolower _i) exitWith {_j;};
	0;
};
_lb lbSetCurSel _rI;