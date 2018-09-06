/*
	File:	fn_prof_LB_art_change.sqf
	Date:   2016-07-28 19:52:12
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_aLB", controlNull, [controlNull]],
	["_index", 0, [-1]]
];
if (_index < 0) exitWith {};

private _display = ctrlParent _aLB;
private _tLB = 	_display displayCtrl 7730;
private _rLB = 	_display displayCtrl 7732;

private _art = _aLB lbData _index;
private _type = _tLB lbData (lbCurSel _tLB);
lbClear _rLB;

private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};

{
	_rLB lbSetData [_rLB lbAdd format["%1",getText(_x >> 'displayName')],configName _x];
} forEach (format["getText(_x >> 'flag') isEqualTo '%1' && getText(_x >> 'type') isEqualTo '%2' && getText(_x >> 'skilltype') isEqualTo '%3'",_flag,_art,_type] configClasses (missionConfigFile >> "ProfSys"));

lbSort _rLB;
_rLB lbSetCurSel 0;