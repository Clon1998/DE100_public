/*
   File:    fn_searchTable.sqf
   Date:    2017-9-24 16:25:57
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
	["_c", controlNull, [controlNull]]
];
private _d = ctrlParent _c;
private _lb = (ctrlParentControlsGroup _c) controlsGroupCtrl 4301;
private _sT = ctrlText _c;

if (_sT isEqualTo (_lb getVariable ["lastSearch",""]) && !(_sT isEqualTo "")) exitWith {};
_lb setVariable ["lastSearch",_sT];

private _fD = _d getVariable ["filterData",[]];
if (_fD isEqualTo []) then {
	_fD = _d getVariable ["tableData",[]];
};

lbClear _lb;
{
	private _a = _x select 1;
	private _iC = _a select 2;
	private _iD = if ((_a select 1) isEqualTo "zitems") then {
		[localize getText(missionConfigFile >> "VirtualItems" >> _iC >> "displayName"),getText(missionConfigFile >> "VirtualItems" >> _iC >> "icon")];
	} else {
		private _cfg = call {
			if (isClass (configFile >> "CfgWeapons" >> _iC)) exitWith {"CfgWeapons";};
			if (isClass (configFile >> "CfgMagazines" >> _iC)) exitWith {"CfgMagazines";};
			if (isClass (configFile >> "CfgVehicles" >> _iC)) exitWith {"CfgVehicles";};
			"CfgGlasses";
		};
		[getText(configFile >> _cfg >> _iC >> "displayName"),getText(configFile >> _cfg >> _iC >> "picture")];
	};

	if ((toLower (_iD select 0) find toLower _sT) >= 0 || (toLower (_a select 3) find toLower _sT) >= 0 || _sT isEqualTo "") then {
		private _t = [_a select 5,life_real_time] call life_fnc_timeDiff;
		private _i = _lb lnbAddRow ["",[_iD select 0,44] call STR_fnc_cutText, (_a select 3) call STR_fnc_cutText,format ["%1",_a select 4],if (_t select 0 || _a select 11) then {"Beendet";} else {_t select 1;},if (_a select 6 < 0) then {"k.A.";} else {format["%1€",[_a select 6] call life_fnc_numberText];},if (_a select 7 < 0) then {"Nicht verfügbar"} else {format["%1€",[_a select 7] call life_fnc_numberText]}];
		_lb lnbSetPicture [[_i,0],if ((_iD select 1) isEqualTo "pictureStaticObject") then {"images\icons\ico_house.paa";} else {_iD select 1;}];
		_lb lnbSetValue [[_i,0],_x select 0];
		_lb lnbSetValue [[_i,3],_a select 4];
		_lb lnbSetValue [[_i,4],_t select 2];
		_lb lnbSetValue [[_i,5],_a select 6];
		_lb lnbSetValue [[_i,6],_a select 7];
	};
	nil;
} count _fD;

if (lbSize _lb == 0) then {
	private _i = _lb lnbAddRow ["","Keine Auktionen gefunden","","","","",""];
	_lb lnbSetValue [[_i,0], -1];
	_lb lnbSetValue [[_i,3], -1];
	_lb lnbSetValue [[_i,4], -1];
	_lb lnbSetValue [[_i,5], -1];
	_lb lnbSetValue [[_i,6], -1];
};
_lb lnbSort [0,true];
_lb lnbSetCurSelRow 0;