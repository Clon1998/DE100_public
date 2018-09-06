/*
	File:	fn_thrHQ.sqf
	Date:   2016-12-27 18:17:24
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define OPEN 0
	#define SEARCH 1
*/


disableSerialization;
params[
	["_display", displayNull, [displayNull]],
	["_mode", 0, [0]],
	"_search"
];

private _tree = (_display displayCtrl 6);

switch (_mode) do { 
	case 0 : {
		(_display displayCtrl 1) ctrlShow true;
		(_display displayCtrl 2) ctrlShow true;
		(_display displayCtrl 9) ctrlShow true;
		private _text = "";
		for "_i" from 0 to (3 + round(random 6)) do {
			if (isNull _display) exitwith {};
			if (_text isEqualTo "...") then {
				_text = "";
			};
			_text = _text + ".";
			(_display displayCtrl 1) ctrlSetText format["Verbinde mit der THR-Zentrale%1",_text];
			(_display displayCtrl 2) ctrlSetText format["Verbinde mit der THR-Zentrale%1",_text];
			uiSleep 0.4;
		};
		if (isNull _display) exitwith {};
		(_display displayCtrl 1) ctrlSetText "Verbunden mit der THR-Zentrale";
		(_display displayCtrl 2) ctrlSetText "";
		[] spawn life_fnc_thrMarker;
		["",[]] spawn life_fnc_thrHQLoadPlayers;
		for "_i" from 3 to 8 do {
			(_display displayCtrl _i) ctrlEnable true;
			(_display displayCtrl _i) ctrlSetFade 0;
			(_display displayCtrl _i) ctrlCommit 0.6;
			uiSleep 0.25;
		};
		(_display displayCtrl 8) ctrlEnable false;
	};

	case 1 : {
		_search = ctrlText (_display displayCtrl 5);
		[_search,[]] call life_fnc_thrHQLoadPlayers;
	};
};