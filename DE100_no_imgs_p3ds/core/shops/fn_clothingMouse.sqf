/*
   File:    fn_clothingMouse.sqf
   Date:    2017-10-20 14:15:34
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

disableSerialization;
params[
	["_mode", 0, [0]],
	["_data", []]
];
if (_mode == 0) exitWith {
	_data params[
		["_display", displayNull, [displayNull]]
	];
	private _xPos = getMousePosition select 0;
	private _yPos = getMousePosition select 1;
	if !(_display getVariable ["turnable",false]) exitWith {};
	private _center = _display getVariable ["center",[0,0,0]];
	private _cam = uiNamespace getVariable ["cam",objNull];
	private _lPos = _display getVariable ["lastPos",getMousePosition];
	private _dirH = (_display getVariable ["dirh",13.62])+(_xPos - (_lPos select 0))*120;
	private _dirV = ((_display getVariable ["dirV",13.62])+(_yPos - (_lPos select 1))*120) max -11.5 min 90;
	private _rad = _display getVariable ["radius",4.24265];
	_cam camSetPos [(_center select 0) + sin _dirH * _rad,(_center select 1) + cos _dirH * _rad,(_center select 2) + sin _dirV * _rad];
	_cam camCommit 0;

	_display setVariable ["dirh",_dirH];
	_display setVariable ["dirv",_dirV];
	_display setVariable ["lastPos",getMousePosition];
};
if (_mode == 1) exitWith {
	_data params[
		["_display", displayNull, [displayNull]],
		["_mBtn", 0, [0]],
		["_xPos", 0, [0]],
		["_yPos", 0, [0]],
		["_shift", false, [false]],
		["_ctrl", false, [false]],
		["_alt", false, [false]]
	];
	if !(_mBtn == 1) exitWith {false;};
	_display setVariable ["turnable",true];
	_display setVariable ["lastPos",getMousePosition];
	false;
};
if (_mode == 2) exitWith {
	_data params[
		["_display", displayNull, [displayNull]],
		["_mBtn", 0, [0]],
		["_xPos", 0, [0]],
		["_yPos", 0, [0]],
		["_shift", false, [false]],
		["_ctrl", false, [false]],
		["_alt", false, [false]]
	];
	if !(_mBtn == 1) exitWith {false;};
	_display setVariable ["turnable",false];
	_display setVariable ["lastPos",nil];
	false;
};
if (_mode == 3) exitWith {
	_data params[
		["_display", displayNull, [displayNull]],
		["_num", 0, [0]]
	];
	if !(_display getVariable ["turnable",false]) exitWith {};
	private _cam = uiNamespace getVariable ["cam",objNull];
	private _center = ((uiNamespace getVariable ["helpers",objNull]) select 1) modelToWorld [0,0,1];
	private _dirH = _display getVariable ["dirh",0];
	private _dirV = _display getVariable ["dirV",0];
	private _rad = (_display getVariable ["radius",4.58274])+_num*0.2 min 8 max 1;
	_cam camSetPos [(_center select 0) + sin _dirH * _rad,(_center select 1) + cos _dirH * _rad,(_center select 2) + sin _dirV * _rad];
	_cam camCommit 0;
	_display setVariable ["radius",_rad];
};