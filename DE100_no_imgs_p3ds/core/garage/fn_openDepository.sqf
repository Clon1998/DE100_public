/*
	File:	fn_openDepository.sqf
	Date:   2017-03-01 15:41:31
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
	["_data", [], [[],""]]
];


switch (_mode) do { 
	case 0 : {
		createDialog "Life_impound_menu";
		setMousePosition [0.5, 0.5];
		private _display = findDisplay 2800;
		private _unimpound = _display displayCtrl 1006;
		private _sell = _display displayCtrl 2842;
		private _title = _display displayCtrl 2801;
		_title ctrlSetText "Verwahrstelle";
		_display setVariable ["SpawnPoint",_data];
		_display setVariable ["Type",1];
		_unimpound ctrlEnable false;
		_sell ctrlShow false;
		if (life_HC_isActive) then {
			[getPlayerUID player, playerSide, player] remoteExec["HC_fnc_getDepository", HC_Life];
		} else {
			[getPlayerUID player, playerSide, player] remoteExec["TON_fnc_getDepository", 2];
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
		_sell ctrlShow false;
		if (count _data == 0) exitwith {
			_hidetext ctrlSetText "Keine Fahrzeuge in der Verwahrstelle";
			_unimpound ctrlEnable false;
		};
		lbClear _vehList;
		{
			_vehicleInfo = [_x select 2] call life_fnc_fetchVehInfo;
			private _i = _vehList lbAdd (_vehicleInfo select 3);
			private _tmp = [_x select 2,_x select 8];;
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