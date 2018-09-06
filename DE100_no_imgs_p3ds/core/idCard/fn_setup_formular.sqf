/*
	File:	fn_setup_formular.sqf
	Date:   18.02.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;

params[
	["_display", displayNull, [displayNull]]
];
_display call life_fnc_bgBlure;
private _hLb = _display displayCtrl 4004;
private _rLb = _display displayCtrl 4007;
private _eLb = _display displayCtrl 4008;
private _nTxt = _display displayCtrl 4009;
private _bBtn = _display displayCtrl 4011;

_bBtn ctrlSetEventHandler ["ButtonClick","closeDialog 0; [] spawn life_fnc_logout;(findDisplay 49)closeDisplay 2;"];
_nTxt ctrlSetText (player call life_fnc_name);

{
	private _i = _eLb lbAdd _x;
	_eLb lbSetData [_i,_x];
	nil;
} count [
	"Braun",
	"Blau",
	"Grün",
	"Grau",
	"Hellbraun",
	"Hellblau",  
	"Blaugrün",
	"Braungrün",
	"Bernstein",
	"Blau-Grün-Grau",
	"Blau-Grün"
];
_eLb lbSetCurSel 0;
{
	private _i = _hLb lbAdd _x;
	_hLb lbSetData [_i,_x];
	nil;
} count [
	"Schwarz",
	"Grau",
	"Mocca",
	"Braun",
	"Hellbraun",
	"Blond",
	"Rot",
	"Blau",
	"Grün"
];
_hLb lbSetCurSel 0;
{
	private _i = _rLb lbAdd _x;
	_rLb lbSetData [_i,_x];
	nil;
} count [
	"Hinduismus",
	"Buddhismus",
	"Judentum",
	"Christentum",
	"Islam",
	"Satanismus",
	"Atheismus",
	"Kanibalismus",
	"Scientology",
	"Weedismus",
	"Anarchismus",
	"Nord germanische Religion",
	"Praise lord Gaben"
];
_rLb lbSetCurSel 0;
[_display,""] call life_fnc_fillBox;