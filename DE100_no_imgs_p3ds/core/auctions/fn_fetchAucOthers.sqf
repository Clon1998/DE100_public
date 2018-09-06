/*
	File:	fn_fetchAucOthers.sqf
	Date:   10.05.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_button", controlNull, [controlNull]],
	["_key", "", [""]]
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
_display setVariable ["current_Key",_key];
_button ctrlEnable false;
(_grp controlsGroupCtrl 2) ctrlSetText "images\dialog\sel_indicator.paa";

lnbClear _houseLB;

_houseLB lnbSetColumnsPos [-0.01,0.012375 * safezoneW,0.045375 * safezoneW];

private _var = format["%1_%2_locker_other_space",getPlayerUID player,playerSide];
private _data = [_key,_house getVariable [_var,[]]] call life_fnc_dataFromKey;
if (_data isEqualTo false) then {
	_data = [];
};
private _illegal = toLower(str getArray(missionConfigFile >> "Life_Settings" >> "illegal_arma_items"));
private _iColor = getArray(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color");
{
	private _item = _x select 0;
	private _amnt = _x select 1;
	if (!(_item isEqualTo "") && _amnt > 0) then {
		private _cfg = [_item] call life_fnc_fetchCfgDetails;
		private _i = _houseLb lnbAddRow ["",format["[%1]",_amnt],_cfg select 1];
		_houseLb lbSetTooltip [_i*3,_cfg select 1];
		_houseLb lnbSetPicture [[_i,0],_cfg select 2];
		_houseLb lnbSetData [[_i,0],_item];
		_houseLb lnbSetValue [[_i,0],_amnt];
		if (_illegal find (toLower _item) >= 0) then {
			_houseLb lnbSetColor [[_i,2],_iColor];
		};
	};
	nil;
} count _data;
_houseLB lnbSort [2,false];
if (((lnbSize _houseLB) select 0) > 0) then {
	if (lnbCurSelRow _houseLB < 0) then {
		_houseLB lnbSetCurSelRow 0;
	} else {
		_houseLB lnbSetCurSelRow (lnbCurSelRow _houseLB);
	};
};