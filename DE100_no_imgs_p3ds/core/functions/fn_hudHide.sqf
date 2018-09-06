/*
	File:	fn_hudHide.sqf
	Date:   2017-05-11 21:03:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define HIDE_NOT_TD 0
	#define HIDE_ALL 1
*/
disableSerialization;

params[
	["_mode", 1, [0]]
];
private _hud = uiNameSpace getVariable ["playerHUD",displayNull];
private _sBar = uiNamespace getVariable ["statusBar",displayNull];

if (isNull _hud || isNull _sBar) then {
	call life_fnc_hudSetup;
	_hud = uiNameSpace getVariable ["playerHUD",displayNull];
	_sBar = uiNamespace getVariable ["statusBar",displayNull];
};
if (_hud getVariable ["hidden",false]) exitwith {};
_hud setVariable ["hidden",true];
if (_mode isEqualTo 0) then {
	for "_i" from 4451 to 4469 do {
		private _ctrl = _hud displayCtrl _i;
		if (!isNull _ctrl) then {
			_ctrl ctrlShow false;
		};
	};
	private _ctrl = _hud displayCtrl 4470;
	_ctrl ctrlSetFade 0;
	_ctrl ctrlCommit 0;
	(_sBar displayCtrl 1000) ctrlShow false;
} else {
	for "_i" from 4451 to 4469 do {
		private _ctrl = _hud displayCtrl _i;
		if (!isNull _ctrl) then {
			_ctrl ctrlShow false;
		};
	};
	private _ctrl = _hud displayCtrl 4470;
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 0;
	(_sBar displayCtrl 1000) ctrlShow false;
};