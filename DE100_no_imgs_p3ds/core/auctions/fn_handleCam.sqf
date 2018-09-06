/*
	File:	fn_handleCam.sqf
	Date:   2017-09-04 23:23:29
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	_mode:
	0 - Start
	1 - Stop
*/
disableSerialization;
params[
	["_mode", 0, [0]],
	["_display",displayNull,[displayNull]]
];
call {
	if (_mode isEqualTo 0) exitWith {
		if !(isNull (_display getVariable ["preview_cam",objNull])) exitWith {};
		private _cam = "camera" camCreate [8537.62,25095.6,5.27528];
		_cam cameraEffect ["INTERNAL","BACK","auc_prev_pic"];
		_cam camSetDir [-0.967915,0.0119484,-0.251459];
		_cam camCommit 0;
		_display setVariable ["preview_cam",_cam];
	};
	if (_mode isEqualTo 1) exitWith {
		if !(isNull (_display getVariable ["preview_helper",objNull])) exitWith {};
		private _cam = _display getVariable ["preview_cam",objNull];
		private _helper = "Land_Tablet_02_F" createVehicleLocal [0,0,0];
		_helper attachTo [auc_table,[0,0,0.4]];
		_display setVariable ["preview_helper",_helper];
		[_cam,_helper] spawn {
			params[
				["_cam", objNull, [objNull]],
				["_helper", objNull, [objNull]]
			];
			private _dir = getDir _helper;
			for "_i" from 0 to 1 step 0 do {
				uiSleep 0.005;
				if (isNull _cam) exitWith {deleteVehicle _helper;};
				_dir = _dir + ([1,-360] select (_dir >= 360));
				_helper setDir _dir;
			};
		};
	};
	if (_mode isEqualTo 2) then {
		if !(isNull (_display getVariable ["preview_Vhelper",objNull])) exitWith {};
		private _cam = _display getVariable ["preview_Vcam",objNull];
		if (isNull _cam) then {			
			_cam = "camera" camCreate [8537.62,25095.6,5.27528];
			_cam cameraEffect ["INTERNAL","BACK","auc_prev_picV"];
			_cam camSetDir [-0.967915,0.0119484,-0.251459];
			_cam camCommit 0;
			_display setVariable ["preview_Vcam",_cam];
		};
		private _helper = "Land_HelipadEmpty_F" createVehicleLocal [0,0,0];
		_helper setPosAsl [0,0,3000];
		_display setVariable ["preview_Vhelper",_helper];
		private _light = "#lightpoint" createVehicleLocal [0,0,0];
		_light setlightbrightness 0.5;
		_light setlightcolor [1,1,1];
		_light setlightambient [1,1,1];
		_light setPosAsl [0,0,3000];
		_display setVariable ["preview_light",_light];
		private _dir = getDir _cam;
		private _c = _helper getVariable ["center",getPos _helper];
		private _r = _helper getVariable ["radius", 7];
		private _h = _helper getVariable ["hight",5];
		_cam camSetPos (_c vectorAdd [_r*sin _dir,_r*cos _dir,_h*cos _dir]);
		_cam camSetTarget _helper;
		_cam camCommit 0;
		[_cam,_helper] spawn {
			params[
				["_cam", objNull, [objNull]],
				["_helper", objNull, [objNull]]
			];
			private _dir = getDir _cam;
			private _camDone = {
				if (isNull _this) exitWith {
					true;
				};
				camCommitted _this;
			};
			for "_i" from 0 to 1 step 0 do {
				if (isNull _cam || _helper getVariable ["exit",false]) exitWith {deleteVehicle _helper;};
				_dir = _dir + ([1,-360] select (_dir >= 360));
				private _c = _helper getVariable ["center",getPos _helper];
				private _r = _helper getVariable ["radius", 7];
				private _h = _helper getVariable ["hight",5];
				_cam camSetPos (_c vectorAdd [_r*sin _dir,_r*cos _dir,_h*cos _dir]);
				_cam camCommit 0.035;
				waitUntil {_cam call _camDone};
			};
		};
	};
	if (_mode isEqualTo -1) exitWith {
		private _cam = _display getVariable ["preview_cam",objNull];
		private _vcam = _display getVariable ["preview_Vcam",objNull];
		private _oModel = _display getVariable ["crnt_obj",objNull];
		private _light = _display getVariable ["preview_light",objNull];
		if (!isNull _cam) then {
			_cam cameraEffect ["Terminate", "BACK"];
			camDestroy _cam;
		};
		if (!isNull _vcam) then {
			_vcam cameraEffect ["Terminate", "BACK"];
			camDestroy _vcam;
		};
		if (!isNull _oModel) then {
			deleteVehicle _oModel;
		};
		if (!isNull _light) then {
			deleteVehicle _light;
		};
	};
};
