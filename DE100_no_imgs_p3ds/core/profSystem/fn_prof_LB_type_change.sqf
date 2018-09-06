/*
	File:	fn_prof_LB_type_change.sqf
	Date:   2016-07-28 19:42:32
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_tLB", controlNull, [controlNull]],
	["_index", 0, [-1]]
];
if (_index < 0) exitWith {};

private _display = ctrlParent _tLB;
private _aLB = _display displayCtrl 7731;
private _rLB = _display displayCtrl 7732;
private _type = _tLB lbData _index;

lbClear _aLB;
lbClear _rLB;

if (_type isEqualTo "Character") then {
	_aLB lbSetData [_aLB lbAdd format ["Tätigkeit"], "skill"];
	_aLB lbSetData [_aLB lbAdd format ["Fitness"], "body"];
} else {
	_aLB lbSetData [_aLB lbAdd format ["Legal"], "legal"];
	_aLB lbSetData [_aLB lbAdd format ["Illegal"], "illegal"];
}; 
_aLB lbSetCurSel 0;