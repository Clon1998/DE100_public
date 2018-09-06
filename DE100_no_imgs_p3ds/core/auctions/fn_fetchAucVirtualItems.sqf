/*
	File:	fn_fetchAucVirtualItems.sqf
	Date:   12.05.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_button", controlNull, [controlNull]]
];

private _grp = ctrlParentControlsGroup _button;
private _display = ctrlParent _grp;
private _house = _display getVariable ["house",objNull];
private _lastSection = _display getVariable ["lastSelection",controlNull];
private _houseLB = _display displayCtrl 4500 controlsGroupCtrl 4511;
if (!isNull _lastSection) then {
	(_lastSection controlsGroupCtrl 2) ctrlSetText "";
	(_lastSection controlsGroupCtrl 3) ctrlEnable true;
};
_display setVariable ["lastSelection",_grp];
_button ctrlEnable false;
(_grp controlsGroupCtrl 2) ctrlSetText "images\dialog\sel_indicator.paa";

lnbClear _houseLB;

_houseLB lnbSetColumnsPos [-0.01,0.03,0.11];

_var = format["%1_%2_locker_Trunk",getPlayerUID player,playerSide];

private _data = _house getVariable [_var,[[],0]];
if (_data isEqualTo []) then {
	_house setVariable[_var,[[],0],true];
	_data = [[],0];
};

private _iColor = getArray(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color");
{
	private _var = _x select 0;
	private _val = _x select 1;
	if (_val > 0) then {
		private _icon = getText(missionConfigFile >> "VirtualItems" >> _var >> "icon");
		private _dName = localize (getText(missionConfigFile >> "VirtualItems" >> _var >> "displayName"));
		private _i = _houseLB lnbAddRow ["",format["[%1]",_val],_dName];
		_houseLB lbSetTooltip [_i*3,_dName];
		_houseLB lnbSetData [[_i,0],_var];
		_houseLB lnbSetValue [[_i,0],_val];
		if !(_icon isEqualTo "") then {
			_houseLB lnbSetPicture [[_i,0], _icon];
		};
		if ((getNumber(missionConfigFile >> "VirtualItems" >> _var >> "illegal")) isEqualTo 1) then {
			_houseLB lnbSetColor [[_i,2], _iColor];
		};
	};
	nil;
} count (_data select 0);
_houseLB lnbSort [2,false];