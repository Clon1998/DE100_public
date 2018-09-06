/*
	File:	fn_fs_onMouseEnter.sqf
	Date:   2017-07-01 23:12:29
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_b", controlNull, [controlNull]]
];
private _d = ctrlParent _b;
private _m = _d displayCtrl 6;
private _i = _b getVariable ["item",""];
if ((_m getVariable ["item",""]) isEqualTo _i) exitWith {};
_m setVariable ["item",_i];
private _rI = _d getVariable ["rawItems",[]];
private _fI = _d getVariable ["finalItems",[]];
private _iR = [toLower _i,_rI] call life_fnc_index;
if (_iR >= 0) exitWith {
	private _mks = getArray(missionConfigFile >> "resourceFields" >> (_rI select _iR select 0) >> "zones");
	[_d,_mks,_i] spawn life_fnc_fs_animMap;
};
private _iF = [toLower _i,_fI] call life_fnc_index;
if (_iF >= 0) exitWith {
	private _mks = if (isArray(missionConfigFile >> "ItemProcessing" >> (_fI select _iF select 0) >> "refinery")) then {
		getArray(missionConfigFile >> "ItemProcessing" >> (_fI select _iF select 0) >> "refinery")
	} else {
		[getText(missionConfigFile >> "ItemProcessing" >> (_fI select _iF select 0) >> "refinery")];
	};
	[_d,_mks,_i] spawn life_fnc_fs_animMap;
	if !(_b getVariable ["isEnd",false]) then {
		private _c = (_d displayCtrl 2) controlsGroupCtrl 0;
		_c ctrlSetStructuredText parseText "Klicke auf das Item, um heraus zu finden wie du das Item herstellst.";
	};
};