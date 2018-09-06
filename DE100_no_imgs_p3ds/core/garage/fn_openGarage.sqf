/*
	File:	fn_openGarage.sqf
	Date:   2017-01-01 14:42:21
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define OPEN 0
	#define FILL 1
*/

disableSerialization;
params[
	["_mode", 0, [0]],
	["_type", "Car", [""]],
	["_data", [], [[],""]]
];


switch (_mode) do { 
	case 0 : {
		createDialog "Life_impound_menu";
		setMousePosition [0.5, 0.5];
		private _display = findDisplay 2800;
		private _unimpound = _display displayCtrl 1006;
		private _sell = _display displayCtrl 2842;
		_display setVariable ["SpawnPoint",_data];
		_display setVariable ["Type",0];
		_unimpound ctrlEnable false;
		_sell ctrlEnable false;
		if (life_HC_isActive) then {
			[getPlayerUID player, playerSide, _type, player] remoteExec["HC_fnc_getVehicles", HC_Life];
		} else {
			[getPlayerUID player, playerSide, _type, player] remoteExec["TON_fnc_getVehicles", 2];
		};
	}; 
	case 1 : {
		private _display = findDisplay 2800;
		if (isNull _display) exitwith {};
		private _vehList = _display displayCtrl 2802;
		private _unimpound = _display displayCtrl 1006;
		private _sell = _display displayCtrl 2842;
		private _hidebg = _display displayCtrl 2810;
		private _hidetext = _display displayCtrl 2811;
		if (count _data == 0) exitwith {
			_hidetext ctrlSetText localize "STR_Garage_NoVehicles";
			_unimpound ctrlEnable false;
			_sell ctrlEnable false;
		};
		lbClear _vehList;

		{
			_vehicleInfo = [_x select 2] call life_fnc_fetchVehInfo;
			private _i = _vehList lbAdd (_vehicleInfo select 3);
			private _tmp = [_x select 2,_x select 8,_x select 9];
			private _timer = _x select 10;
			if (_timer isEqualType "") then {
				_timer = parseNumber _timer;
			};
			if (_timer < 1800 && _timer != 0) then {
				_tmp pushBack (time + 1800 - _timer);
				_vehList lbSetColor [_i, [0.478,0.478,0.478,1]];
			};
			_vehList lbSetData [_i,str _tmp];
			_vehList lbSetPicture [_i,_vehicleInfo select 2];
			_vehList lbSetValue [_i,_x select 0];
			nil;
		} count _data;
		lbSort _vehList;
		_vehList lbSetCurSel 0;
		_hidetext ctrlShow false;
		_hidebg ctrlShow false;
	}; 
};