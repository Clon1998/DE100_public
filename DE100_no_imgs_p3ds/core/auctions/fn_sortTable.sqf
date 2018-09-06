/*
	File:	fn_sortTable.sqf
	Date:   2017-09-08 00:07:44
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_btn", controlNull, [controlNull]],
	["_col", 0, [0]],
	["_byVal",false]
];

private _display = ctrlParent _btn;
private _lb = (_display displayCtrl 4300) controlsGroupCtrl 4301;
private _sort = _btn getVariable ["sort",true];
if (_byVal) then {
	_lb lnbSortByValue [_col, _sort];
} else {
	_lb lnbSort [_col, _sort];
};
_lb lnbSetCurSelRow 0;
_btn setVariable ["sort",!_sort];