/*
	File : fn_confirm_formular.sqf
	Date:   26.10.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_cBtn", controlNull, [controlNull]],
	["_reset", false],
	"_toCheck"
];

private _display = ctrlParent _cBtn;

private _iTxt = (_display displayCtrl 4001) controlsGroupCtrl 3;
private _aEdit = _display displayCtrl 4002;
private _hEdit = _display displayCtrl 4003;
private _hLb = _display displayCtrl 4004;
private _sEdit = _display displayCtrl 4005;
private _cEdit = _display displayCtrl 4006;
private _rLb = _display displayCtrl 4007;
private _eLb = _display displayCtrl 4008;
private _bBtn = _display displayCtrl 4011;

if (_reset) exitWith {
	( _display displayCtrl 4010) ctrlEnable true;
	_display setVariable ["passed",false];
	_bBtn ctrlSetEventHandler ["ButtonClick","closeDialog 0; [] spawn life_fnc_logout;(findDisplay 49)closeDisplay 2;"];
	_bBtn ctrlSetText "Trennen";
	[_display,""] call life_fnc_fillBox;
	{
		_x ctrlSetBackgroundColor [0.28,0.28,0.28,0.28];
		_x ctrlEnable true;
		nil;
	} count [_aEdit,_hEdit,_hLb,_sEdit,_cEdit,_rLb,_eLb];
};

private _badwords = getArray(missionConfigFile >> "Life_Settings" >> "badWords_filter");
private _errors = [];
private _reasons = [];

private _numCheck = {
	params[
		["_ctrl", controlNull, [controlNull]],
		["_fname", "", [""]],
		["_minMax", [0,100], [[]]]
	];
	private _toCheck = ctrlText _ctrl;
	if !(_toCheck call life_fnc_isnumber) then {
		_errors pushBackUnique _ctrl;
		_reasons pushBackUnique format["%1-Feld ist keine gültige Zahl",_fname];
	} else {
		_toCheck = parseNumber _toCheck;
		if (_toCheck < (_minMax select 0) || _toCheck > (_minMax select 1)) then {
			_errors pushBackUnique _ctrl;
			_reasons pushBackUnique format["%1-Feld ist kleiner als %2 oder größer als %3",_fname,_minMax select 0, _minMax select 1];
		};
	};
};

private _txtCheck = {
	params[
		["_ctrl", controlNull, [controlNull]],
		["_fname", "", [""]],
		["_minMax", [0,100], [[]]]
	];
	private _toCheck = tolower ctrlText _ctrl;
	private _len = count _toCheck;
	if (_len < (_minMax select 0) || _len > (_minMax select 1)) then {	
		_errors pushBackUnique _ctrl;
		_reasons pushBackUnique format["%1-Feld muss minimal %2 und maximal %3 Zeichen haben",_fname,_minMax select 0, _minMax select 1];
	};
	private _tmp = [];
	{
		if (_toCheck find _x >= 0) then {
			if (_x isEqualTo "  ") then {
				_tmp pushBackUnique "Doppeltes Leerzeichen";
			} else {
				_tmp pushBackUnique _x;
			};
		};
		nil;
	} count _badwords;
	if !(_tmp isEqualTo []) then {
		_errors pushBackUnique _ctrl;
		_reasons pushBackUnique format["%1-Feld enthält nicht erlaubte Wörter:<br/><t color='#ff0000'>%2</t>",_fname,_tmp joinString ", "];
	};
};

[_aEdit,"Alter",[10,120]] call _numCheck;
[_hEdit,"Größe",[100,220]] call _numCheck;

[_sEdit,"Adresse",[7,17]] call _txtCheck;
[_cEdit,"Stadt",[4,12]] call _txtCheck;

_toCheck = tolower (player call life_fnc_name);
private _tmp = _toCheck splitString " ";
if (count _tmp < 2) then {
	_reasons pushBackUnique "Dein Name hat keinen erkennbaren Vor- und Nachnamen";
} else {
	{
		if (count _x < 3) exitWith {
			_reasons pushBackUnique "Dein Vor- oder Nachname ist zu kurz";
		};
		nil;
	} count _tmp;
	if ((_tmp select 0) find "[" >= 0) then {
		_reasons pushBackUnique "Clantags dürfen nicht im Namen stehen. Clantags werden über das Gangsystem angezeigt.";
	};
};
_tmp = [];
{
	if (_toCheck find _x >= 0 && _x != "  ") then {
		_tmp pushBackUnique _x;
	};
	nil;
} count _badwords;

if !(_tmp isEqualTo []) then {
	_reasons pushBackUnique format["Name enthält nicht erlaubte Wörter:<br/><t color='#ff0000'>%1</t>",_tmp joinString ", "];
};

{
	_x ctrlSetBackgroundColor (if (_x in _errors) then {
		[0.518,0,0,1];
	} else {
		[0,0.42,0,1];
	});
	_x ctrlEnable false;
	nil;
} count [_aEdit,_hEdit,_hLb,_sEdit,_cEdit,_rLb,_eLb];
if (_reasons isEqualTo []) then {
	if (_display getVariable ["passed",false]) then {
		private _tmp = [player call life_fnc_name,ctrlText _aEdit, _eLb lbData (lbCurSel _eLb), _hLb lbData (lbCurSel _hLb), ctrlText _hEdit, ctrlText _cEdit, ctrlText _sEdit, _rLb lbData (lbCurSel _rLb)];
		player setVariable ["idCard",_tmp select [1,7],true];
		closeDialog 0;
	} else {
		_display setVariable ["passed",true];
		[_display,"Erfolg"] call life_fnc_fillBox;
	};
} else {
	_cBtn ctrlEnable false;
	_display setVariable ["passed",false];
	_iTxt ctrlSetStructuredText parseText format["Folgende Fehler wurden gefunden:<br/>%1<br/>Bitte drücke auf Zurück, um die Angaben den Vorgaben entsprechend anzupassen.<br/>Sollte Ihr Name fehlerhaft sein, bitte drücke Zurück > Trenne und ändere diesen.",_reasons joinString format[",<br/>",endl]];
	private _pos = ctrlPosition _iTxt;
	_pos set [3,ctrlTextHeight _iTxt];
	_iTxt ctrlSetPosition _pos;
};
_bBtn ctrlSetText "Zurück";
_bBtn ctrlSetEventHandler ["ButtonClick","[_this select 0, true] call life_fnc_confirm_formular;"]; 