/*
	File:	fn_timeLbChange.sqf
	Date:   2017-09-03 10:53:26
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_lb", controlNull, [controlNull]],
	["_sI", 0, [0]]
];
private _grp = ctrlParentControlsGroup _lb;
private _idc = ctrlIDC _grp;
private _txt = _grp controlsGroupCtrl (_idc + 19);
private _tA = _lb lbValue _sI;

_txt ctrlSetStructuredText parseText format["<t size='1.35'>Bis: %1</t>",([life_real_time,_tA] call life_fnc_timeAdd)];