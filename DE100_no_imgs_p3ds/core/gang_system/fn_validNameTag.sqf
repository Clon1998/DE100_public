/*
   File:    fn_validNameTag.sqf
   Date:    2017-10-7 12:30:55
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

disableSerialization;
params[
	["_ctrl", controlNull],
	["_nameTag", false]
];

if (_ctrl isEqualType controlNull) exitWith {
	if (isNull _ctrl) exitWith {};
	private _display = ctrlParent _ctrl;
	_display setVariable [["nameValid","tagValid"] select (ctrlIDC _ctrl == 4002),false];
	(_display displayCtrl 4004) ctrlEnable false;
	private _toCheck = ctrlText _ctrl;
	private _tick = diag_tickTime;
	_ctrl ctrlSetBackgroundColor [0.28,0.28,0.28,0.28];
	_ctrl setVariable ["tick",_tick];
	[_ctrl,_tick,_toCheck] spawn {
		disableSerialization;
		params[
			["_ctrl", controlNull,[controlNull]],
			["_tick", 1,[1]],
			["_toCheck", "",[""]]
		];
		uiSleep 3;

		if (isNull _ctrl) exitWith {};
		if ((_ctrl getVariable ["tick",0]) != _tick) exitWith {};
		if (_toCheck isEqualTo "") exitWith {};
		_ctrl ctrlSetBackgroundColor [1,0.8,0,1];
		_ctrl setVariable ["tick",nil];
		_ctrl ctrlEnable false;
		_ctrl ctrlSetText _toCheck;
		if (life_HC_isActive) then {
			[getPlayerUID player,call life_clientId select 0, _toCheck, ctrlIDC _ctrl == 4002] remoteExecCall ["GS_fnc_checkName",HC_Life];
		} else {
			[getPlayerUID player,call life_clientId select 0, _toCheck, ctrlIDC _ctrl == 4002] remoteExecCall ["GS_fnc_checkName",2];
		};
	};
};

private _display = findDisplay 4000;
if (isNull _display) exitWith {};
private _valid = _ctrl;
_ctrl = _display displayCtrl ([4003,4002] select _nameTag);
_ctrl ctrlEnable true;
_ctrl ctrlSetBackgroundColor ([[0.518,0,0,1],[0,0.42,0,1]] select _valid);
_display setVariable [["nameValid","tagValid"] select _nameTag,_valid];

(_display displayCtrl 4004) ctrlEnable (_display getVariable ["nameValid",false] && _display getVariable ["tagValid",false]);