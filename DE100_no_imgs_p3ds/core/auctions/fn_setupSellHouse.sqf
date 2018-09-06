/*
	File:	fn_setupSellHouse.sqf
	Date:   2017-09-09 14:09:59
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	0 - Haus
	1 - Lagerhaus
*/
disableSerialization;
params[
	["_btn", controlNull, [controlNull]],
	["_type", 0, [0]]
];

private _display = ctrlParent _btn;
private _lb = (_display displayCtrl 4600) controlsGroupCtrl 4611;
private _lastCategory = _display getVariable ["lastCategoryImo",controlNull];
if (!isNull _lastCategory) then {
	_lastCategory ctrlSetBackgroundColor [0,0,0,0.8];
};
_btn ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])];
_display setVariable ["lastCategoryImo",_btn];

private _timeLB = (_display displayCtrl 4600) controlsGroupCtrl 4618;
lbClear _timeLB;
{
	private _i = _timeLB lbAdd (_x select 0);
	_timeLB lbSetValue [_i,_x select 1];
	nil;
} count [["2 Stunden",7200],["12 Stunden",43200],["1 Tag",86400],["3 Tage",259200],["1 Woche",604800]];
_timeLB lbSetCurSel 0;

lbClear _lb;
if (_type == 0) then {
	{
		private _class = typeOf _x;
		private _i = _lb lbAdd getText(configfile >> "CfgVehicles" >> _class >> "displayName");
		_lb lbSetData [_i, netId _x];
		_lb lbSetValue [_i,1];
		nil;
	} count (life_houses select {!(_x getVariable ["forSale",false])});
	_display setVariable ["current_Namespace","houses"];
} else {
	// code...
	_display setVariable ["current_Namespace","storehouses"];
};
if (lbSize _lb > 0) then {
	_lb lbSetCurSel 0;
};