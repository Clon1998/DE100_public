/*
	File:	fn_sellItemLbChange.sqf
	Date:   2017-09-03 11:02:37
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_lb", controlNull, [controlNull]],
	["_sI", 0, [0]],
	["_type",0],
	"_cfg"
];
private _display = ctrlParent _lb;
private _grp = ctrlParentControlsGroup _lb;
private _desc = _grp controlsGroupCtrl (ctrlIDC _grp+20);
private _exit = false;
call {
	if (_type == 0) exitWith {
		private _class = _lb lnbData [_sI,0];
		private _txt = _display getVariable [format["sel_desc_%1",_class],""];

		if !(_txt isEqualTo "") exitWith {
			_cfg = _txt;
		};
		_cfg = call {
			if (isClass (configFile >> "CfgMagazines" >> _class)) exitWith {"CfgMagazines";};
			if (isClass (configFile >> "CfgWeapons" >> _class)) exitWith {"CfgWeapons";};
			if (isClass (configFile >> "CfgVehicles" >> _class)) exitWith {"CfgVehicles";};
			if (isClass (configFile >> "CfgGlasses" >> _class)) exitWith {"CfgGlasses";};
		};
		_cfg = getText(configFile >> _cfg >> _class >> "Library" >> "libTextDesc");
	};
	if (_type == 1) exitWith {
		private _map = _display displayCtrl 1000;
		private _netId = _lb lbData _sI;
		private _obj = objectFromNetId _netId;
		private _class = typeOf _obj;
		private _txt = _display getVariable [format["sel_desc_%1",_netId],""];
		ctrlMapAnimClear _map;
		_map ctrlMapAnimAdd [0,0.5,getPosATL _obj];
		ctrlMapAnimCommit _map;
		_map ctrlMapAnimAdd [3,0.001,getPosATL _obj];
		ctrlMapAnimCommit _map;
		if !(_txt isEqualTo "") exitWith {
			_cfg = _txt;
		};
		_cfg = getText(configFile >> "CfgVehicles" >> _class >> "Library" >> "libTextDesc");
	};
	if (_type == 2) exitWith {
		private _pic = _display displayCtrl 4701;
		private _vehData = (_lb lbData _sI);
		if (_vehData isEqualTo "exit") exitWith {_pic ctrlSetText "#(argb,8,8,3)color(0,0,0,1)";_exit = true;};
		private _txt = _display getVariable [format["sel_desc_%1",_vehData],""];
		_vehData = parseSimpleArray _vehData;
		private _class = _vehData select 1;
		[0,_display] call life_fnc_handleCam;
		[_class,_display,_vehData select 4] call life_fnc_createPrevObj;
		_pic ctrlSetText "#(argb,512,512,1)r2t(auc_prev_picV,2)";
		if !(_txt isEqualTo "") exitWith {
			_cfg = _txt;
		};
		_cfg = getText(configFile >> "CfgVehicles" >> _class >> "Library" >> "libTextDesc");
	};
};
if (_exit) exitWith {};
_cfg = [_cfg,"<br />",endl] call STR_fnc_replace;
_desc ctrlSetText _cfg;
_desc call life_fnc_saveDescEdit;