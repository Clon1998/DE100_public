/*
	File:	fn_articleData.sqf
	Date:   2017-09-04 18:18:12
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_lb", controlNull, [controlNull]],
	["_sI", 0, [0]],
	"_b"
];
private _display = ctrlParent _lb;
private _grp = _display displayCtrl 4400;
private _title = _grp controlsGroupCtrl 4401;
private _price = _grp controlsGroupCtrl 4402;
private _pic = _grp controlsGroupCtrl 4403;
private _desc = _grp controlsGroupCtrl 4404 controlsGroupCtrl 0;
private _betTree = _grp controlsGroupCtrl 4405;
private _betBtn = _grp controlsGroupCtrl 4408;
private _buyBtn = _grp controlsGroupCtrl 4409;
private _betEdit = _grp controlsGroupCtrl 4407;
private _delBtn = _grp controlsGroupCtrl 4411;
private _favBtn = _grp controlsGroupCtrl 4412;
private _map = _display displayCtrl 1100;
_betEdit ctrlSetText "Gebot";
_map ctrlShow false;

private _aId = _lb lnbValue [_sI,0];
private _aData = [_aId,_display getVariable ["tableData",[]]] call life_fnc_dataFromKey;
private _type = _aData select 1;
private _class = _aData select 2;
private _dName = if (_type isEqualTo "zitems") then {
	localize getText(missionConfigFile >> "VirtualItems" >> _class >> "displayName");
} else {
	private _cfg = call {
		if (isClass (configFile >> "CfgWeapons" >> _class)) exitWith {"CfgWeapons";};
		if (isClass (configFile >> "CfgMagazines" >> _class)) exitWith {"CfgMagazines";};
		if (isClass (configFile >> "CfgVehicles" >> _class)) exitWith {"CfgVehicles";};
		"CfgGlasses";
	};
	getText(configFile >> _cfg >> _class >> "displayName");
};
private _bHisData = +(de100_ac_storage getVariable [format["%1_auction_history",_aId],[]]);
reverse _bHisData;

private _expired = (([_aData select 5] call life_fnc_timeUnix) < ([life_real_time] call life_fnc_timeUnix)) || (_aData select 11);

if ((_aData select 7) > 0 && !_expired && !((_aData select 0) isEqualTo (getPlayerUID player))) then {
	_buyBtn ctrlEnable true;
	_buyBtn ctrlSetTextColor [1,1,1,1];
} else {
	_buyBtn ctrlEnable false;
	_buyBtn ctrlSetTextColor [0.4,0.4,0.4,1];
};

if (!_expired && !((_aData select 0) isEqualTo (getPlayerUID player))) then {
	_betBtn ctrlEnable true;
	_betEdit ctrlEnable true;
	_betBtn ctrlSetTextColor [1,1,1,1];
} else {
	_betBtn ctrlEnable false;
	_betEdit ctrlEnable false;
	_betBtn ctrlSetTextColor [0.4,0.4,0.4,1];
};

_delBtn ctrlShow ((_aData select 0) isEqualTo (getPlayerUID player) && !_expired);
_favBtn ctrlSetTooltip (["Beobachten","Entfernen"] select (_aId in (profileNamespace getVariable ["de100_auc_watchlist",[]])));
_display setVariable ["openAuction",_aId];

tvClear _betTree;
private _mask = _type in ["houses","storehouses"];
{
	private _num = _x select 2;
	private _i = _betTree tvAdd [[],if ((_x select 0) isEqualTo (_aData select 0)) then {if (_num < 0) then {"Zurückgezogen";} else {"Startgebot";}} else {private _name = _x select 1;if (_mask && !((_x select 0) isEqualTo getPlayerUID player)) then {format["%1*****",_name select [0,1]];} else {_name;};}];
	_betTree tvSetPicture [[_i],'A3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_toolbox_units_ca.paa'];
	private _ii = _betTree tvAdd [[_i],[0,_x select 3] call life_fnc_timeToStr];
	_betTree tvSetPicture [[_i,_ii],'a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa'];
	if (!((_x select 0) isEqualTo (_aData select 0)) || _num >= 0) then{
		private _ii = _betTree tvAdd [[_i],if (_num<0) then {"Sofortkauf";} else {[_num] call life_fnc_numberText;}];
		_betTree tvSetPicture [[_i,_ii],'images\icons\ico_money.paa'];
	};
	_betTree tvExpand [_i];
	nil;
} count _bHisData;

_title ctrlSetText format ["%1 von %2", _dName, _aData select 3];
_price ctrlSetStructuredText parseText (if (_expired) then {"<t align='center'>Beendet</t>"} else {format ["<t align='left'>Sofortkauf: %1</t><t align='right'>Höchstgebot: %2€</t>",if ((_aData select 7) < 0) then {"Nicht verfügbar";} else {format["%1€",[_aData select 7] call life_fnc_numberText];}, [_bHisData select 0 select 2] call life_fnc_numberText];});
call {
	if (_type in ["houses","storehouses"]) exitWith {
		_b = nearestBuilding (_aData select 10);
		private _wea = [];
		private _clo = [];
		private _oth = [];
		private _zItems = [];
		private _con = [];
		private _map = "";
		if (_expired) then {
			_wea pushBack "Unbekannt";
			_clo pushBack "Unbekannt";
			_oth pushBack "Unbekannt";
			_zItems pushBack "Unbekannt";
			_con pushBack "Unbekannt";
			_map = "Unbekannt";
		} else {
			{
				{
					private _tmpClass = _x select 0;
					_wea pushBackUnique format["%1x %2",_x select 1,getText(configFile >> (call {if (isClass (configFile >> "CfgWeapons" >> _tmpClass)) exitWith {"CfgWeapons";};if (isClass (configFile >> "CfgMagazines" >> _tmpClass)) exitWith {"CfgMagazines";};if (isClass (configFile >> "CfgVehicles" >> _tmpClass)) exitWith {"CfgVehicles";};"CfgGlasses";}) >> _tmpClass >> "displayName")];
					nil;
				} count (_x select 1);
				nil;
			} count (_b getVariable ["weapon_space",[]]);
			if (_wea isEqualTo []) then {_wea pushBack "Keine";};
			{
				{
					private _tmpClass = _x select 0;
					_clo pushBackUnique format["%1x %2",_x select 1,getText(configFile >> (call {if (isClass (configFile >> "CfgWeapons" >> _tmpClass)) exitWith {"CfgWeapons";};if (isClass (configFile >> "CfgMagazines" >> _tmpClass)) exitWith {"CfgMagazines";};if (isClass (configFile >> "CfgVehicles" >> _tmpClass)) exitWith {"CfgVehicles";};"CfgGlasses";}) >> _tmpClass >> "displayName")];
					nil;
				} count (_x select 1);
				nil;
			} count (_b getVariable ["clothing_space",[]]);
			if (_clo isEqualTo []) then {_clo pushBack "Keine";};
			{
				{
					private _tmpClass = _x select 0;
					_oth pushBackUnique format["%1x %2",_x select 1,getText(configFile >> (call {if (isClass (configFile >> "CfgWeapons" >> _tmpClass)) exitWith {"CfgWeapons";};if (isClass (configFile >> "CfgMagazines" >> _tmpClass)) exitWith {"CfgMagazines";};if (isClass (configFile >> "CfgVehicles" >> _tmpClass)) exitWith {"CfgVehicles";};"CfgGlasses";}) >> _tmpClass >> "displayName")];
					nil;
				} count (_x select 1);
				nil;
			} count (_b getVariable ["other_space",[]]);
			if (_oth isEqualTo []) then {_oth pushBack "Keine";};
			{
				_zItems pushBackUnique format["%1x %2",_x select 1,localize getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "displayName")];
				nil;
			} count ((_b getVariable ["Trunk",[[],0]]) select 0);
			if (_zItems isEqualTo []) then {_zItems pushBack "Keine";};
			private _tmp = [];
			{
				private _i = [_x,_tmp] call life_fnc_index;
				if (_i >= 0) then {
					_tmp set [_i,[_x,(_tmp select _i select 1) + 1]];
				} else {
					_tmp pushBackUnique [_x,1];
				};
				nil;
			} count (_b getVariable ["container",[]]);
			{
				_con pushBackUnique format["%1x %2",_x select 1,localize getText(missionConfigFile >> "VirtualItems" >> (call {if ((_x select 0) isEqualTo "gang_storageBox") exitWith {"storagegang";};if ((_x select 0) isEqualTo "cop_storageBox") exitWith {"storagecop";};if ((_x select 0) isEqualTo "big_storageBox") exitWith {"storagebig";};if ((_x select 0) isEqualTo "small_storageBox") exitWith {"storagesmall";};}) >> "displayName")];
				nil;
			} count _tmp;
			if (_con isEqualTo []) then {_con pushBack "Keine";};
			_map = mapGridPosition (_aData select 10);
		};
		_desc ctrlSetText format["Artikel: %2%1MapGrid: %3%1Enddatum: %4%1%1Beschreibung:%1%10%1%1Gelagerte Waffen:%1%5%1Gelagerte Kleidung:%1%6%1Gelagerte Items:%1%7%1Gelagerte Z-Items:%1%8%1Verbaute Kisten:%1%9%1",endl,_dName,_map,[0,_aData select 5] call life_fnc_timeToStr,_wea joinString format[",%1",endl],_clo joinString format[",%1",endl],_oth joinString format[",%1",endl],_zItems joinString format[",%1",endl],_con joinString format[",%1",endl],_aData select 8];
	};
	if (_type in ["car","air","ship"]) exitWith {
		private _vehData = _aData select 10;
		private _zItems = [];
		{
			_zItems pushBackUnique format["%1x %2",_x select 1,localize getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "displayName")];
			nil;
		} count ((_vehData select 1) select 0);
		if (_zItems isEqualTo []) then {_zItems pushBack "Keine";};
		_desc ctrlSetText format["Artikel: %2%1Lackierung: %3%1Verbaute Kisten: %4%1Enddatum: %5%1%1Beschreibung:%1%6%1%1Gelagerte Z-Items:%1%7%1",endl,_dName,[_class,_vehData select 0] call life_fnc_vehicleColorStr,_vehData select 2,[0,_aData select 5] call life_fnc_timeToStr,_aData select 8, _zItems joinString format[",%1",endl]];
	};
	_desc ctrlSetText format["Artikel: %2%1Menge: %5 %1Enddatum: %4%1%1Beschreibung:%1%3",endl,_dName,_aData select 8,[0,_aData select 5] call life_fnc_timeToStr,_aData select 4];
};

_desc ctrlSetPosition [0,0,0.354 * safezoneW,ctrlTextHeight _desc];
_desc ctrlCommit 0;

[_grp,1] call life_fnc_calcHistory;
[0,_display] call life_fnc_handleCam;
if (_type in ["houses"]) then {
	if (_expired) then {
		_pic ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";
	} else {
		_pic ctrlSetText "#(argb,512,512,1)r2t(auc_prev_pic,2)";
		[_b,_display,_pic] call life_fnc_housePrev;
	};
} else {
	if (_type in ["car","air","ship"]) then {
		[_class,_display,(_aData select 10) select 0] call life_fnc_createPrevObj;
		_pic ctrlSetText "#(argb,512,512,1)r2t(auc_prev_picV,2)";
	} else {
		_pic ctrlSetText "#(argb,512,512,1)r2t(auc_prev_pic,2)";
		[_class,_display] call life_fnc_createPrevObj;
	};
};