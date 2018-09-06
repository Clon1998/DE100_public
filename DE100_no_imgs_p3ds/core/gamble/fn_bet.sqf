/*
	File:	fn_bet.sqf
	Date:   31.03.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life,hawaii-life.net server and me.
	
	Description:
	Take a look for yourself.
*/

private["_val","_Startticket","_endTicket","_return","_tmp","_exited"];

if (life_gamble_serverCooldown) exitWith {["Aufgrund eines Arma Bugs kann der De100-Jackpot erst 5 Minuten nach dem Start des Servers benutzt werden.",true,"fast"] call life_fnc_notification_system;};
_val = _this select 0;
if((typeName _val != "SCALAR")) exitWith {[localize "STR_ATM_notnumeric",true,"fast"] call life_fnc_notification_system;};
if (_val < 10000 || _val > 20000000) exitWith {["Mindesteinsatz €10,000 Maximaleinsatz €20,000,000",true,"slow"] call life_fnc_notification_system;};
if(_val > de100_luciandjuli_bc) exitWith {["Du hast nicht genug Geld auf dem Konto",true,"fast"] call life_fnc_notification_system;};
if (_val+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
};
_return = 0;
_exited = false;
if (!isNil {life_gamble_teil}) then {
	if (count life_gamble_teil >= 10) exitWith {["Der De100-Jackpot ist schon zu!",true,"fast"] call life_fnc_notification_system;;_exited = true;};
	if (count life_gamble_teil > 0) then {
		_return = count (life_gamble_teil select {(getPlayerUID player) in _x});
	};
};
if (_exited) exitWith {};
if (_return > 1) exitWith {["Du kannst nur 2x in den De100-Jackpot gehen.",true,"fast"] call life_fnc_notification_system;};
de100_mSpace setVariable ["cT",diag_tickTime];
if (!isNil {life_gamble_starttime}) then {
	if (( life_gamble_starttime + 120 - serverTime) >= 10) then {
		de100_luciandjuli_bc = de100_luciandjuli_bc - _val;
		if (life_HC_isActive) then {
			[getPlayerUID player,player call life_fnc_name,_val,player] remoteExec ["HC_fnc_addBet",HC_Life];
		} else {
			[getPlayerUID player,player call life_fnc_name,_val,player] remoteExec ["TON_fnc_addBet",2];
		};
	} else {
		["Der De100-Jackpot ist schon zu!",true,"fast"] call life_fnc_notification_system;
	};
} else {
	de100_luciandjuli_bc = de100_luciandjuli_bc - _val;
	if (life_HC_isActive) then {
		[getPlayerUID player,player call life_fnc_name,_val,player] remoteExec ["HC_fnc_startJackpot",HC_Life];
	} else {
		[getPlayerUID player,player call life_fnc_name,_val,player] remoteExec ["TON_fnc_startJackpot",2];
	};
};
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
["CASH"] call SOCK_fnc_updatePartial;