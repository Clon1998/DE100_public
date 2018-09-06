/*
	File:	fn_setupAucInv.sqf
	Date:   2017-04-30 21:56:51
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Makes the HousInventory ready to use
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]]
];

private _timeLB = (_display displayCtrl 4500) controlsGroupCtrl 4518;
private _house = lockers_obj;
private _space = _house call life_fnc_getSpace;

lbClear _timeLB;
{
	private _i = _timeLB lbAdd (_x select 0);
	_timeLB lbSetValue [_i,_x select 1];
	nil;
} count [["2 Stunden",7200],["12 Stunden",43200],["1 Tag",86400],["3 Tage",259200],["1 Woche",604800]];
_timeLB lbSetCurSel 0;


_display setVariable ["house",_house];
_display setVariable ["used_weapon_space",[_house,"weapon_space"] call life_fnc_getUsedSpace];
_display setVariable ["used_clothing_space",[_house,"clothing_space"] call life_fnc_getUsedSpace];
_display setVariable ["used_other_space",[_house,"other_space"] call life_fnc_getUsedSpace];
_display setVariable ["available_space",_space];

[_display displayCtrl 4500 controlsGroupCtrl 4513,0] call life_fnc_setupAucCategory;