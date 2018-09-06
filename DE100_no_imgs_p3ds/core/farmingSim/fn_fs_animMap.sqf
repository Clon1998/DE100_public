/*
	File:	fn_fs_animMap.sqf
	Date:   2017-07-01 23:07:37
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_d", displayNull, [displayNull]],
	["_mks", [], [[],""]],
	["_i", "", [""]]
];
private _m = _d displayCtrl 6;
private _mD = _d displayCtrl 7;
ctrlMapAnimClear _m;
if (_mks isEqualType "") then {
	_mks = [_mks];
};
if ((count _mks) isEqualTo 1) then {
	_mks = getMarkerPos (_mks select 0);
	_m ctrlMapAnimAdd [1,0.05,_mks];
	_mD ctrlSetText format ["MapGrid: %1",mapGridPosition _mks];
	ctrlMapAnimCommit _m;
} else {
	while {(_m getVariable ["item",""]) isEqualTo _i} do {
		for "_j" from 0 to (count _mks -1) do {
			private _t = time;
			private _p = getMarkerPos (_mks select _j);
			_m ctrlMapAnimAdd [1,0.05,_p];
			_mD ctrlSetText format ["MapGrid: %1",mapGridPosition _p];
			ctrlMapAnimCommit _m;
			waitUntil {(ctrlMapAnimDone _m && time - _t > 4) || !((_m getVariable ["item",""]) isEqualTo _i)};
			if !((_m getVariable ["item",""]) isEqualTo _i) exitWith {};
		};
	};
};