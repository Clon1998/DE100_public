/*
	File:	fn_fetchOthers.sqf
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
private _houseLB = _display displayCtrl 1100;
private _playerLB = _display displayCtrl 1200;
if (!isNull _lastSection) then {
	(_lastSection controlsGroupCtrl 2) ctrlSetText "";
	(_lastSection controlsGroupCtrl 3) ctrlEnable true;
};
_display setVariable ["lastSelection",_grp];
_display setVariable ["current_Key",_key];
_button ctrlEnable false;
(_grp controlsGroupCtrl 2) ctrlSetText "images\dialog\sel_indicator.paa";

lnbClear _houseLB;
lnbClear _playerLB;

_houseLB lnbSetColumnsPos [-0.01,0.012375 * safezoneW,0.045375 * safezoneW];
_playerLB lnbSetColumnsPos [-0.01,0.012375 * safezoneW,0.045375 * safezoneW];

(_display displayCtrl 4002) ctrlSetText format["%1/%2",_display getVariable ["used_other_space",0],_display getVariable ["available_space",0]];
(_display displayCtrl 4004) ctrlSetText format[""];

private _var = if (_house isEqualTo lockers_obj) then {
	format["%1_%2_locker_other_space",getPlayerUID player,playerSide];
} else {
	"other_space";
};
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
		if (lnbCurSelRow _houseLB > (((lnbSize _houseLB) select 0)-1)) then {
			_houseLB lnbSetCurSelRow (lnbCurSelRow _houseLB);
		};
	};
};

private _loadout = getUnitLoadout player;
_allowedTypes = ["Watch","Compass","GPS","Radio","Map","FirstAidKit","Medikit","Toolkit","UAVTerminal"];

for "_lIndex" from 0 to 9 step 1 do {
	private _infoArray = _loadout select _lIndex;
	if (count _infoArray > 0) then {
		if (_infoArray isEqualType []) then {
			if (count _infoArray > 0) then {
				for "_i" from 0 to (count _infoArray - 1) step 1 do {
					private _item = _infoArray select _i;
					if (_item isEqualType [] && _lIndex > 2) then {
						[_item,_allowedTypes,_i,_lIndex,_playerLB] call life_fnc_screenItemContainer;
					} else {
						[_item,_allowedTypes,_i,_lIndex,_playerLB] call life_fnc_screenItem;
					};
				};
			};
		} else {
			[_infoArray,_allowedTypes,0,_lIndex,_playerLB] call life_fnc_screenItem;
		};
	};
};
_playerLB lnbSort [2,false];
if (((lnbSize _playerLB) select 0) > 0) then {
	if (lnbCurSelRow _playerLB < 0) then {
		_playerLB lnbSetCurSelRow 0;
	} else {
		if (lnbCurSelRow _playerLB > (((lnbSize _playerLB) select 0)-1)) then {
			_playerLB lnbSetCurSelRow (lnbCurSelRow _playerLB);
		};
	};
};