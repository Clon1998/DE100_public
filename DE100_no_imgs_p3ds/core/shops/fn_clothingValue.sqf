/*
   File:    fn_clothingValue.sqf
   Date:    2017-10-20 18:20:39
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_ctrl", controlNull, [controlNull]],
	["_sI", 1, [1,[]]]
];
private _d = ctrlParent _ctrl;
private _lb = _d displayCtrl 4003;
private _iT = _d displayCtrl 4004;
private _bB = _d displayCtrl 4005;

private _sP = 0;
private _txt = "";
private _class = "";
private _tP = 0;
private _tC = lbSize _lb;
if (ctrlType _ctrl == 12) then {
	_sp = _ctrl tvValue _sI;
	_txt = _ctrl tvText _sI;
	_class = _ctrl tvData _sI;
} else {
	if (_sI < 0) exitWith {_class = "exit";};
	_sp = _ctrl lbValue _sI;
	_txt = _ctrl lbText _sI;
	_class = _ctrl lbData _sI;
};

if (_class isEqualTo "exit") exitWith {
	_iT ctrlSetStructuredText parseText format["Warenwert:<br/>%1€<br/>Ausgewählt:<br/>Nichts<br/>Preis:<br/>0€",_tP call life_fnc_numberText];	
};

for "_i" from 0 to _tC-1 do {
	_tP = _tP + (_lb lbValue _i);
};

_bB ctrlEnable (_tP <= de100_luciandjuli_mula);

_iT ctrlSetStructuredText parseText format["Warenwert:<br/>%1€<br/>Ausgewählt:<br/>%2<br/>Preis:<br/>%3€",_tP call life_fnc_numberText,_txt,_sP call life_fnc_numberText];