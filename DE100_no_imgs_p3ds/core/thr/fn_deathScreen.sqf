/*
	File:	fn_deathScreen.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	
	Description:
	Take a look for yourself.

	#define FADEIN 0
	#define FADEOUT 1

	#define RESPAWN 0
	#define DISCONNECT 1
	#define REVIVED 2
*/

disableSerialization;
params[
	["_display", displayNull, [displayNull]],
	["_mode", 0, [0]],
	["_exit", 0, [0]],
	"_ctrls",
	"_handle",
	"_confirm"
];
if (_display getVariable ["exit",false]) exitwith {};
_ctrls = allControls _display;
switch (_mode) do { 
	case 0 : {
		life_deathScreen = true;
		_handle = ppEffectCreate ["DynamicBlur", 401]; 
		_handle ppEffectForceInNVG true;
		_handle ppEffectEnable true; 
		_handle ppEffectAdjust [4];
		_handle ppEffectCommit 1.5;

		_display setVariable ["Blur",_handle];

		{
			_x ctrlSetFade 1;
			_x ctrlCommit 0;
		} forEach _ctrls;

		[] spawn {
			disableSerialization;
			private _display = findDisplay 7000;
			private _time = time + (2 * 60);
			private _called = false;
			private _finished = false;
			life_thr_request = false;
			(_display displayCtrl 6) ctrlEnable false;
			(_display displayCtrl 8) ctrlEnable false;
			while {!isNull _display} do {
				if (life_thr_request && !_called) then {
					if (_time <= 0) then {
						_time = time + (5*60);
					} else {
						_time = _time + (3*60);
					};
					_called = true;
					_finished = false;
				};
			  	(_display displayCtrl 3) ctrlSetText format["THR-Mitglieder im Spiel: %1 Spieler",{side _x isEqualTo independent && _x getVariable["isAlive",true]} count allPlayers];
			  	(_display displayCtrl 4) ctrlSetText format["THR-Mitglied auf dem Weg: %1",if (!isNull (player getVariable ["thrClerk",objNull])) then {format["%1 m",round(player distance (player getVariable ["thrClerk",objNull]))];} else {"Nein";}];
			  	if (round(_time - time) > 0) then {
			  		(_display displayCtrl 5) ctrlSetText format["Respawn verfügbar in: %1",[round(_time - time),"MM:SS"] call BIS_fnc_secondsToString];
			  	} else {
			  		if (!_finished) then {
				  		(_display displayCtrl 5) ctrlSetText "Du kannst nun respawnen";
						(_display displayCtrl 6) ctrlEnable true;
						(_display displayCtrl 8) ctrlEnable true;
						_finished = true;
			  		};
			  	};
			  	if (!isNull (player getVariable ["reviver",objNull])) then {
					(_display displayCtrl 5) ctrlSetText "Du wirst wiederbelebt...";
					(_display displayCtrl 6) ctrlEnable false;
					(_display displayCtrl 8) ctrlEnable false;
					_finished = false;
			  	};
			  	uiSleep 1;
			};
		};
		uiSleep 2;
		{
			_x ctrlSetFade 0;
			_x ctrlCommit 1;
			uiSleep 0.25;
		} forEach _ctrls;
	};
	
	case 1 : {
		if (_display getVariable ["exit",false]) exitwith {};//DoubleCheck to be SURE that it cant be executed 2 times
		_display setVariable ["exit",true];
		reverse _ctrls;
		{
			_x ctrlSetFade 1;
			_x ctrlCommit 1;
			uiSleep 0.35;
		} forEach _ctrls;
		if (_exit isEqualTo 0) then {
			cutText ["","BLACK OUT",0.35];
		};
		waitUntil {ctrlCommitted (_ctrls select (count _ctrls -1))};
		uiSleep 0.3;
		_handle = _display getVariable ["Blur",0];
		_display closeDisplay 2;
		switch (_exit) do {
			case 0 : {
				if (life_HC_isActive) then {
					[getPlayerUID player, 35,format["%1 hat ein neues Leben gestartet (Respawned)", player call life_fnc_nameUID]] remoteExecCall ["MSC_fnc_log",HC_Life];
				} else {
					[getPlayerUID player, 35,format["%1 hat ein neues Leben gestartet (Respawned)", player call life_fnc_nameUID]] remoteExecCall ["MSC_fnc_log",2];
				};
				life_respawned = true;
				[] call life_fnc_spawnMenu;
			}; 
			case 1 : {
				if (!isNil "_handle") then {
					_handle ppEffectAdjust [0];
					_handle ppEffectCommit 3;
				};
				life_pause_pos = true;
				bank_obj setVariable [(format["DE100_UID_%2_%1",(getPlayerUID player),playerSide]),nil,true];
				[]spawn life_fnc_logout;
				(findDisplay 49)closeDisplay 2;
			};
			case 2 : {
				if (!isNil "_handle") then {
					_handle ppEffectAdjust [0];
					_handle ppEffectCommit 3;
				};
			};
		};
		life_deathScreen = false;
		if (!isNil "_handle") then {
			waitUntil {ppEffectCommitted _handle};
			_handle ppEffectEnable false;
			ppEffectDestroy _handle;
		};
	};
};