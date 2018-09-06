/*
	File:	fn_fs_onMouseExit.sqf
	Date:   2017-07-01 23:08:02
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
private _c = (_d displayCtrl 2) controlsGroupCtrl 0;
private _m = _d displayCtrl 6;
_m setVariable ["item",""];
_c ctrlSetStructuredText parseText "";