/*
	File:	fn_staffManager.sqf
	Date:   2016-11-01 16:45:32
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.

	#define ONLINE 0
	#define STAFFREQUEST 1
	#define STAFFANWSER 2

	#define COP 0
	#define THR 1
	#define ERROR -1

*/
disableSerialization;

params[
	["_display", displayNull, [displayNull,objNull]],
	["_mode", 0, [0]],
	["_array", [], [[]]],
	"_index",
	"_type"
];
if (isNull _display) then {
	_display = findDisplay 4000;
};

private _listBox = _display displayCtrl 4001;
private _dropBox = _display displayCtrl 4002;
private _btn = _display displayCtrl 4003;

_type = -1;
if ((call life_thrlevel) > 3) then {
	_type = 1;
};

if ((call life_coplevel) >= 10) then {
	_type = 0;
};

if (_type == -1) exitWith {closeDialog 0;};

_display setVariable ["type",_type];
lbClear _listBox;
switch (_mode) do { 
	case 0 : {
		{
			private _side = call {
				if (side _x isEqualTo civilian) exitWith {"Ziv";};
				if (side _x isEqualTo west) exitWith {"Cop";};
				if (side _x isEqualTo independent) exitWith {"THR";};
				"Unbekannt";
			};	

			_index = _listBox lbAdd format["%1 - %2", _x call life_fnc_name, _side];
			_listBox lbSetdata [_index,netId _x];
		} foreach (allPlayers select {_x != hc_1 && _x != player});
		lbSort _listBox;
		_btn ctrlSetText "Mitarbeiter";
		_btn buttonSetAction "[findDisplay 4000, 1] call life_fnc_staffManager;";
	};

	case 1 : {
		_btn ctrlSetText "Spieler";
		_btn buttonSetAction "[findDisplay 4000, 0] call life_fnc_staffManager;";
		if (life_HC_isActive) then {
			[_type,player] remoteExec ["HC_fnc_fetchStaff",HC_Life];
		} else {
			[_type,player] remoteExec ["TON_fnc_fetchStaff",2];
		};
	};

	case 2 : {
		{
			_index = _listBox lbAdd (_x select 1);
			_listBox lbSetdata [_index,str _x];
		} forEach _array;
	}; 
};

if (lbSize _dropBox isEqualTo 0) then {
	switch (_type) do {
		// === Cop ===
		case 0 : {
			if ((call life_coplevel) >= 10) then {
				_index = _dropBox lbAdd "0 - Entlassen";
				_dropBox lbSetValue[_index, 0];
				_index = _dropBox lbAdd "1 - Polizeimeisteranwärter";
				_dropBox lbSetValue[_index, 1];
				_index = _dropBox lbAdd "2 - Polizeimeister";
				_dropBox lbSetValue[_index, 2];
				_index = _dropBox lbAdd "3 - Polizeiobermeister";
				_dropBox lbSetValue[_index, 3];
				_index = _dropBox lbAdd "4 - Polizeihauptmeister";
				_dropBox lbSetValue[_index, 4];
				_index = _dropBox lbAdd "5 - Polizeikommisaranwärter";
				_dropBox lbSetValue[_index, 5];
				_index = _dropBox lbAdd "6 - Polizeikommissar";
				_dropBox lbSetValue[_index, 6];
				_index = _dropBox lbAdd "7 - Polizeioberkommissar";
				_dropBox lbSetValue[_index, 7];
				_index = _dropBox lbAdd "8 - Polizeihauptkommissar";
				_dropBox lbSetValue[_index, 8];
				_index = _dropBox lbAdd "9 - Erster Polizeihauptkommissar";
				_dropBox lbSetValue[_index, 9];
				_index = _dropBox lbAdd "10 - Polizeioberrat";
				_dropBox lbSetValue[_index, 10];
				_index = _dropBox lbAdd "11 - Polizeidirektor";
				_dropBox lbSetValue[_index, 11];
				_index = _dropBox lbAdd "12 - Polizeipräsident";
				_dropBox lbSetValue[_index, 12];
			};
		};
		// === Sanis ===
		case 1 : {
			if ((call life_thrlevel) > 3) then {
				_index = _dropBox lbAdd "0 - Entlassen";
				_dropBox lbSetValue[_index, 0];
				_index = _dropBox lbAdd "1 - Praktikant";
				_dropBox lbSetValue[_index, 1];
				_index = _dropBox lbAdd "2 - Auszubildender";
				_dropBox lbSetValue[_index, 2];
				_index = _dropBox lbAdd "3 - Geselle";
				_dropBox lbSetValue[_index, 3];
				_index = _dropBox lbAdd "4 - Meister";
				_dropBox lbSetValue[_index, 4];
				_index = _dropBox lbAdd "5 - Ausbilder";
				_dropBox lbSetValue[_index, 5];
			};
		};
	};
};