private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

disableSerialization;

if (uiNamespace getVariable ["pressed_4",false]) then {
	private _display = findDisplay 46;
	if ((_display getVariable ["earZ",-1]) >= 0 || !isNull(_display getVariable ["earPG",controlNull]) || dialog) exitWith {};
	["Halte ""3"" gedrückt, um mittels scrollen die Lautstärke zu ändern.", false, "fast"] call life_fnc_notification_system;
	private _pg = _display ctrlCreate ["Life_RscProgressV", -1];
	private _txt = _display ctrlCreate ["Life_RscTextR", -1];
	_display setVariable ["earPG",_pg];
	_display setVariable ["earTXT",_txt];
	
	_pg ctrlSetPosition [1.03 * safezoneW + safezoneX, 0.24 * safezoneH + safezoneY, 0.00515625 * safezoneW, 0.154 * safezoneH];
	_txt ctrlSetPosition [1 * safezoneW + safezoneX, (0.38-0.149*soundVolume) * safezoneH + safezoneY, 0.03 * safezoneW, 0.02 * safezoneH]; 
	
	_pg progressSetPosition soundVolume;
	_txt ctrlSetText format ["%1%2",round (soundVolume*100),"%"];
	
	_pg ctrlSetFade 1;
	_txt ctrlSetFade 1;
	_pg ctrlCommit 0;
	_txt ctrlCommit 0;

	_pg ctrlSetPosition [0.98 * safezoneW + safezoneX, 0.24 * safezoneH + safezoneY, 0.00515625 * safezoneW, 0.154 * safezoneH];
	_txt ctrlSetPosition [0.95 * safezoneW + safezoneX, (0.38-0.149*soundVolume) * safezoneH + safezoneY, 0.03 * safezoneW, 0.02 * safezoneH]; 
	_pg ctrlCommit 0.05;
	_txt ctrlCommit 0.05;

	_pg ctrlSetFade 0;
	_txt ctrlSetFade 0;
	_pg ctrlCommit 0.12;
	_txt ctrlCommit 0.12;

	_display setVariable ["earZ",_display displayAddEventHandler ["MouseZChanged",'
		params[
			["_display", displayNull, [displayNull]],
			["_step", 1, [0]]
		];	
		if !(uiNamespace getVariable ["pressed_4",false]) exitWith {
			[] spawn {
				disableSerialization;
				private _display = findDisplay 46;
				private _pg = _display getVariable ["earPG",controlNull];
				private _txt = _display getVariable ["earTXT",controlNull];
				if (ctrlFade _pg > 0) exitWith {};

				_display displayRemoveEventHandler ["MouseZChanged", _display getVariable ["earZ",-1]];

				_pg ctrlSetPosition [1.03 * safezoneW + safezoneX, 0.24 * safezoneH + safezoneY, 0.00515625 * safezoneW, 0.154 * safezoneH];
				_txt ctrlSetPosition [1 * safezoneW + safezoneX, (0.38-0.149*soundVolume) * safezoneH + safezoneY, 0.03 * safezoneW, 0.02 * safezoneH];
				_pg ctrlCommit 0.05;
				_txt ctrlCommit 0.05;

				_pg ctrlSetFade 1;
				_txt ctrlSetFade 1;
				_pg ctrlCommit 0.2;
				_txt ctrlCommit 0.2;
				waitUntil {ctrlCommitted _pg};
				if (!isNull _pg) then {
					ctrlDelete _pg;
				};
				if (!isNull _txt) then {
					ctrlDelete _txt;
				};
				_display setVariable ["earZ",nil];
				life_ear_in = soundVolume < 1;
			};
		};
		private _pg = _display getVariable ["earPG",controlNull];
		private _txt = _display getVariable ["earTXT",controlNull];
		
		_step = ((progressPosition _pg) + (_step/120 * ([1,5] select (diag_ticktime - (_pg getVariable ["last",0]) < 0.05))) max 0 min 1);
		_pg progressSetPosition _step;
		_pg setVariable ["last",diag_tickTime];

		_txt ctrlSetText format ["%1%2",round (_step*100),"%"];
		_txt ctrlSetPosition [0.95 * safezoneW + safezoneX, (0.38-0.149*_step) * safezoneH + safezoneY, 0.03 * safezoneW, 0.02 * safezoneH];  
		_txt ctrlCommit 0;

		0 fadeSound _step;
		profileNamespace setVariable ["de100_fadeSound",_step];
	']];
} else {
	[] spawn {
		disableSerialization;
		private _display = findDisplay 46;
		private _pg = _display getVariable ["earPG",controlNull];
		private _txt = _display getVariable ["earTXT",controlNull];
		if (ctrlFade _pg > 0) exitWith {};

		_display displayRemoveEventHandler ["MouseZChanged", _display getVariable ["earZ",-1]];
		
		_pg ctrlSetPosition [1.03 * safezoneW + safezoneX, 0.24 * safezoneH + safezoneY, 0.00515625 * safezoneW, 0.154 * safezoneH];
		_txt ctrlSetPosition [1 * safezoneW + safezoneX, (0.38-0.149*soundVolume) * safezoneH + safezoneY, 0.03 * safezoneW, 0.02 * safezoneH]; 
		_pg ctrlCommit 0.05;
		_txt ctrlCommit 0.05;

		_pg ctrlSetFade 1;
		_txt ctrlSetFade 1;
		_pg ctrlCommit 0.2;
		_txt ctrlCommit 0.2;
		waitUntil {ctrlCommitted _pg};
		if (!isNull _pg) then {
			ctrlDelete _pg;
		};
		if (!isNull _txt) then {
			ctrlDelete _txt;
		};
		_display setVariable ["earZ",nil];
		life_ear_in = soundVolume < 1;
	};
};

_stop