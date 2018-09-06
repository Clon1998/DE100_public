/*
	File:	fn_saveDescEdit.sqf
	Date:   2017-09-03 11:06:21
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_desc", controlNull, [controlNull]]
];

private _display = ctrlParent _desc;
private _grp = ctrlParentControlsGroup _desc;
private _idc = ctrlIDC _grp;
private _lb = _grp controlsGroupCtrl (_idc + 11);
private _header = _grp controlsGroupCtrl (_idc + 21);
private _class = if (ctrlType _lb == 102) then {
	_lb lnbData [lnbCurSelRow _lb,0];
} else {
	_lb lbData (lbCurSel _lb);
};
private _txt = ctrlText _desc;
_header ctrlSetStructuredText parseText format ["<t align='left'>Beschreibung</t><t align='right'>%1/5120</t>",count _txt];

_display setVariable [format["sel_desc_%1",_class],_txt];