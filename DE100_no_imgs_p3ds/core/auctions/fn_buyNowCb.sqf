/*
	File:	fn_buyNowCb.sqf
	Date:   2017-09-03 11:16:04
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_cb", controlNull, [controlNull]],
	["_state", 0, [0]]
];
private _display = ctrlParent _cb;
private _grp = ctrlParentControlsGroup _cb;
private _idc = ctrlIDC _grp;
private _bEdit = _grp controlsGroupCtrl (_idc + 16);
_bEdit ctrlEnable ([true,false] select _state);
_bEdit ctrlSetBackgroundColor ([[1,1,1,0.8],[0.35,0.35,0.35,1]] select _state);