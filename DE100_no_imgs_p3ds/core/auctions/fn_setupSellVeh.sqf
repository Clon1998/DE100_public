/*
   File:    fn_setupSellVeh.sqf
   Date:    2017-9-19 17:17:06
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
	["_btn", controlNull, [controlNull]],
	["_type", 0, [0]],
	["_data",[]]
];
if (isNull _btn) then {
	_btn = ((findDisplay 4000) displayCtrl 4700) controlsGroupCtrl 4710;
};
private _display = ctrlParent _btn;
private _lb = (_display displayCtrl 4700) controlsGroupCtrl 4711;
private _lastCategory = _display getVariable ["lastCategoryVeh",controlNull];
if (_data isEqualTo []) then {
	_data = _display getVariable ["reqVeh",[]];
} else {
	_display setVariable ["reqVeh",_data];
};
if (!isNull _lastCategory) then {
	_lastCategory ctrlSetBackgroundColor [0,0,0,0.8];
};
_btn ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])];
_display setVariable ["lastCategoryVeh",_btn];

private _timeLB = (_display displayCtrl 4700) controlsGroupCtrl 4718;
lbClear _timeLB;
{
	private _i = _timeLB lbAdd (_x select 0);
	_timeLB lbSetValue [_i,_x select 1];
	nil;
} count [["2 Stunden",7200],["12 Stunden",43200],["1 Tag",86400],["3 Tage",259200],["1 Woche",604800]];
_timeLB lbSetCurSel 0;
lbClear _lb;

if (_data isEqualTo []) exitWith {
	private _i = _lb lbAdd "Daten werden abgefragt";
	_lb lbSetData [_i,"exit"];
	_lb lbSetCurSel 0;
	if (life_HC_isActive) then {
		[getPlayerUID player, call life_clientId select 0] remoteExec["AC_fnc_fetchVeh", HC_Life];
	} else {
		[getPlayerUID player, call life_clientId select 0] remoteExec["AC_fnc_fetchVeh", 2];
	};
};
private _fillFnc = {
	{
		private _i = _lb lbAdd getText(configfile >> "CfgVehicles" >> (_x select 1) >> "displayName");
		_lb lbSetPicture [_i,getText(configfile >> "CfgVehicles" >> (_x select 1) >> "Icon")];
		_lb lbSetData [_i,str _x];
		_lb lbSetValue [_i,1];
		nil;
	} count _this;
};
call {
	if (_type == 0) exitWith {
		_display setVariable ["current_Namespace","car"];
		(_data select {(_x select 2) isEqualTo "Car"}) call _fillFnc;
	};
	if (_type == 1) exitWith {
		_display setVariable ["current_Namespace","air"];
		(_data select {(_x select 2) isEqualTo "Air"}) call _fillFnc;
	};
	if (_type == 2) exitWith {
		_display setVariable ["current_Namespace","ship"];
		(_data select {(_x select 2) isEqualTo "Ship"}) call _fillFnc;
	};
};
lbSort _lb;
if (lbSize _lb > 0) then {
	_lb lbSetCurSel 0;
};