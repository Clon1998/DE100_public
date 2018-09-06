/*
	File:	fn_handleTables.sqf
	Date:   2017-08-12 22:06:42
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_d", displayNull, [displayNull,controlNull]],
	["_t", ""]
];

if (_d isEqualType controlNull) then {
	_d = ctrlParent _d;
};

private _lb = (_d displayCtrl 4300) controlsGroupCtrl 4301;
private _tD = call {
	private _uid = getPlayerUID player;
	if (_t isEqualTo "myAuctions") exitWith {
		((de100_ac_storage getVariable ["active_auctions",[]])+(de100_ac_storage getVariable ["past_auctions",[]])) select {((_x select 1) select 0) isEqualTo _uid};
	};
	if (_t isEqualTo "watchlist") exitWith {
		((de100_ac_storage getVariable ["active_auctions",[]])+(de100_ac_storage getVariable ["past_auctions",[]])) select {(_x select 0) in (profileNamespace getVariable ["de100_auc_watchlist",[]])};
	};
	if (_t isEqualTo "pastAuctions") exitWith {
		de100_ac_storage getVariable ["past_auctions",[]];
	};
	if (_t isEqualTo "wonAuctions") exitWith {
		(de100_ac_storage getVariable ["past_auctions",[]]) select {((_x select 1) select 13) isEqualTo _uid && !(((_x select 1) select 0) isEqualTo _uid)};
	};

	de100_ac_storage getVariable ["active_auctions",[]];
};
private _tmp =+ _tD;
_d setVariable ["tableData",_tmp];

private _s = diag_tickTime;
lbClear _lb;
{
	private _a = _x select 1;
	private _c = _a select 2;
	private _iD = if ((_a select 1) isEqualTo "zitems") then {
		[[localize getText(missionConfigFile >> "VirtualItems" >> _c >> "displayName"),44] call STR_fnc_cutText,getText(missionConfigFile >> "VirtualItems" >> _c >> "icon")];
	} else {
		private _cfg = call {
			if (isClass (configFile >> "CfgWeapons" >> _c)) exitWith {"CfgWeapons";};
			if (isClass (configFile >> "CfgMagazines" >> _c)) exitWith {"CfgMagazines";};
			if (isClass (configFile >> "CfgVehicles" >> _c)) exitWith {"CfgVehicles";};
			"CfgGlasses";
		};
		[[getText(configFile >> _cfg >> _c >> "displayName"),44] call STR_fnc_cutText,getText(configFile >> _cfg >> _c >> "picture")];
	};
	
	private _z = [_a select 5,life_real_time] call life_fnc_timeDiff;
	private _i = _lb lnbAddRow ["",_iD select 0,(_a select 3) call STR_fnc_cutText,format ["%1",_a select 4],if (_z select 0 || _a select 11) then {"Beendet";} else {_z select 1;},if (_a select 6 < 0) then {"k.A.";} else {format["%1€",[_a select 6] call life_fnc_numberText];},if (_a select 7 < 0) then {"Nicht verfügbar"} else {format["%1€",[_a select 7] call life_fnc_numberText]}];
	_lb lnbSetPicture [[_i,0],if ((_iD select 1) isEqualTo "pictureStaticObject") then {"images\icons\ico_house.paa";} else {_iD select 1;}];
	_lb lnbSetValue [[_i,0],_x select 0];
	_lb lnbSetValue [[_i,3],_a select 4];
	_lb lnbSetValue [[_i,4],_z select 2];
	_lb lnbSetValue [[_i,5],_a select 6];
	_lb lnbSetValue [[_i,6],_a select 7];
	nil;
} count _tD;
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
if (!isNil "DE100_Diagnostic") then {
	systemChat format ["Auc-Build after %1 Sek",diag_tickTime - _s];
};