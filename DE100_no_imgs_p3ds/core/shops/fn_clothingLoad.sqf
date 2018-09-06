/*
   File:    fn_clothingLoad.sqf
   Date:    2017-10-20 12:32:41
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]]
];
private _cEntry = uiNamespace getVariable ["shopCfg",""];
private _data =+ [_cEntry,missionNamespace getVariable ["de100_Shops",[]]] call life_fnc_dataFromKey;

private _tmp = (uiNamespace getVariable ["helpers",objNull]) select 1;
_display setVariable ["prevObj",_tmp];
_display setVariable ["center",_tmp modelToWorld [0,0,1]];

private _checkCond = {
	params[
		["_t", "", [""]],
		["_v", "", [""]],
		["_w", ""]//VALUE WERT
	];
	if ("" in [_t,_v,_w]) exitWith {true;};
	call {
		if (_t isEqualTo "scalar") exitWith {
			(if ((missionNamespace getVariable [_v,0]) isEqualType {}) then {call (missionNamespace getVariable [_v,0]);} else {missionNamespace getVariable [_v,0];}) >= _w;
		};
	
		if (_t isEqualTo "array") exitWith {
			(if ((missionNamespace getVariable [_v,""]) isEqualType {}) then {call (missionNamespace getVariable [_v,""]);} else {missionNamespace getVariable [_v,""];}) in _w;
		};

		if (_t isEqualTo "equalInt") exitWith {
			(if ((missionNamespace getVariable [_v,0]) isEqualType {}) then {call (missionNamespace getVariable [_v,0]);} else {missionNamespace getVariable [_v,0];}) == _w;
		};
	};
};

private _u = ["uniform",_data] call life_fnc_dataFromKey;
private _h = ["headgear",_data] call life_fnc_dataFromKey;
private _g = ["goggle",_data] call life_fnc_dataFromKey;
private _v = ["vest",_data] call life_fnc_dataFromKey;
private _b = ["backpack",_data] call life_fnc_dataFromKey;

_u = if (_u isEqualTo false) then {[];} else {_u select {(_x select 3) call _checkCond};};
_h = if (_h isEqualTo false) then {[];} else {_h select {(_x select 3) call _checkCond};};
_g = if (_g isEqualTo false) then {[];} else {_g select {(_x select 3) call _checkCond};};
_v = if (_v isEqualTo false) then {[];} else {_v select {(_x select 3) call _checkCond};};
_b = if (_b isEqualTo false) then {[];} else {_b select {(_x select 3) call _checkCond};};

if (_u isEqualTo [] && _h isEqualTo [] && _g isEqualTo [] && _v isEqualTo [] && _b isEqualTo []) exitWith {["Du kannst dir nichts in diesem Laden kaufen",false,"fast"] call life_fnc_notification_system;_display closeDisplay 0;};

private _tv = _display displayCtrl 4002;
private _lb = _display displayCtrl 4003;
tvClear _tv;
lbClear _lb;

(_display displayCtrl 4001) ctrlSetText (["title",_data] call life_fnc_dataFromKey);

{
	private _items = _x select 2;
	if !(_items isEqualTo []) then {
		private _pI = _tv tvAdd [[],_x select 0];
		_tv tvSetPicture [[_pI],_x select 1];
		_tv tvSetData [[_pI],"exit"];
		{
			private _class = _x select 0;
			private _dN = _x select 1;
			private _cfg = call {
				if (isClass (configFile >> "CfgWeapons" >> _class)) exitWith {"CfgWeapons";};
				if (isClass (configFile >> "CfgMagazines" >> _class)) exitWith {"CfgMagazines";};
				if (isClass (configFile >> "CfgVehicles" >> _class)) exitWith {"CfgVehicles";};
				"CfgGlasses";
			};
			_dN = if (_dN isEqualTo "") then {
				getText(configFile >> _cfg >> _class >> "displayName");
			} else {
				_dN;
			};
			private _cI = _tv tvAdd [[_pI],_dN];
			_tv tvSetPicture [[_pI,_cI],getText(configFile >> _cfg >> _class >> "picture")];
			_tv tvSetData [[_pI,_cI],_class];
			_tv tvSetValue [[_pI,_cI],_x select 2];
			nil;
		} count _items;
	};
	nil;
} count [["Uniform","",_u],["Weste","",_v],["Rucksack","",_b],["Kopfbedeckung","",_h],["Brille","",_g]];