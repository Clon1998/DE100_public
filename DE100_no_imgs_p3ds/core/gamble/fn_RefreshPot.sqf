/*
	File:	fn_RefreshPot.sqf
	Date:   31.03.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life,hawaii-life.net server and me.
	
	Description:
	Take a look for yourself.
*/
private ["_pos","_dialog","_progressbar","_LastWinnerTxt","_CrntPotInfo","_timeLeft","_myMoney","_tmp"];
disableSerialization;

_dialog = findDisplay 9200;

_progressbar = _dialog displayCtrl 8205;
_timeLeft =  _dialog displayCtrl 8206; 
_CrntPotInfo = _dialog displayCtrl 8209;
_LastWinnerTxt = _dialog displayCtrl 8208;

_LastWinnerTxt ctrlSetText format["%1 - %3%4 - €%2",life_gamble_lastwinner select 0,[life_gamble_lastwinner select 1] call life_fnc_numberText,life_gamble_lastwinner select 2,"%"];
if (life_gamble_serverCooldown) then {
	_timeLeft ctrlSetText format["Jackpot Cooldown",0];
} else {
	_timeLeft ctrlSetText format["Kein Jackpot gestartet",0];
};
_progressbar progressSetPosition 0;
_CrntPotInfo ctrlSetStructuredText parseText format["<t size= '1.4' align = 'center'>€%1</t><br/><t size= '1.1' align = 'center'>%2 Teilnehmer<br/>Gewinnchance: %3%4</t>",[0] call life_fnc_numberText,0,0,"%"];
_myMoney = 0;
while {!((findDisplay 9200) isEqualTo displayNull)} do {
	if (!isNil {life_gamble_teil}) then {
		if (count life_gamble_teil > 0) then {
			_return = 0;
			{
				_tmp = _x;
				if ((getPlayerUID player) in _tmp) then {
					_return = _return + (life_gamble_teil select _forEachIndex select 4);
				};
			} forEach life_gamble_teil;
			if (_return > 0) then {
				_myMoney = (round((_return/life_gamble_amt)*10000)/100);
			};
		} else {
			_myMoney = 0;
		};
	};

	_LastWinnerTxt ctrlSetText format["%1 - %3%4 - €%2",life_gamble_lastwinner select 0,[life_gamble_lastwinner select 1] call life_fnc_numberText,life_gamble_lastwinner select 2,"%"];
	waitUntil {!isNil {life_gamble_starttime} or (findDisplay 9200) isEqualTo displayNull};
	if (isNil {life_gamble_starttime}) exitWith {};
	_pos = if ((( life_gamble_starttime + 120 - serverTime)) >= 0 && (count life_gamble_teil) < 10) then {
		(( life_gamble_starttime + 120 - serverTime))
	} else {
		0
	};
	if (life_gamble_zi) then {
		_timeLeft ctrlSetText format["Ziehung des Gewinners"];
	} else {
		if ((round _pos) == 0) then {
			_timeLeft ctrlSetText format["Jackpot Cooldown",round _pos];
		} else {
			_timeLeft ctrlSetText format["Verbleibende Zeit: %1 Sek.",round _pos];
		};
	};
	_progressbar progressSetPosition _pos/120;
	_CrntPotInfo ctrlSetStructuredText parseText format["<t size= '1.4' align = 'center'>€%1</t><br/><t size= '1.1' align = 'center'>%2 Teilnehmer<br/>Gewinnchance: %3%4</t>",[life_gamble_amt] call life_fnc_numberText,count life_gamble_teil,_myMoney,"%"];
	sleep 1;
};
