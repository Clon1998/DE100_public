/*
	File:	fn_fs_onItemClick.sqf
	Date:   2017-07-01 23:08:18
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_b", controlNull, [controlNull]]
];

private _d = ctrlParent _b;
private _i = _b getVariable ["item",""];
private _fI = _d getVariable ["finalItems",[]];
private _iF = [toLower _i,_fI] call life_fnc_index;
if (_iF >= 0) exitWith {
	[_d,_fI select _iF select 0] spawn life_fnc_fs_setItem;
};