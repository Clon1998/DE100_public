#include "\life_shared\script_macros.hpp"
/*
	File:	fn_log.sqf
	Date:   2017-01-15 12:01:43
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	0 - Einzahlung
	1 - Auszahlung
	2 - Überweisung senden
	3 - Überweisung erhalten
	4 - Geld Geben
	5 - Geld empfangen
	6 - Gestorben
	7 - Getötet
	8 - Login
	9 - Logout
	10 - Veh Buy
	11 - Veh Sell
	12 - WeaponShop buy
	13 - Clothing Buy
	14 - Wurde getazed
	15 - Hat getazed
	16 - Haus gekauft
	17 - Haus verkauft
	18 - ChopShop sell
	19 - ChopShop BuyBack
	20 - Ticket gegeben
	21 - Ticket bezahlt
	22 - ChopShop sold
	23 - Gang abgehoben
	24 - Gang eingezahlt
	25 - veh Destroyed
	26 - veh abgeschleppt
	27 - veh beschlagnahmt
	28 - veh Store
	29 - zItem give
	30 - zItem rec
	31 - Wurde in den Knast gesteckt
	32 - Veh unimpound
	33 - Has revived
	34 - Player revived
	35 - new life
	36 - Auktion erstellt
	37 - Auktion direktkauf
	38 - Auktion gebot
	39 - Auktion Winner Dis Offline
	40 - Auktion Creater Dis Offline
	41 - Auktion Winner Dis Online
	42 - Auktion Creater Dis Online
	43 - Aus Veh gezogen
	44 - Hat aus Veh gezogen
	45 - zItem sell
	46 - AH Fahrzeug-Itemcontainer Dupe 
	47 - AH Waffencheck
	48 - AH DialogCheck
	49 - AH Blacklisted Vars
	50 - AH Double UID
	51 - AH ParsingNamespace Check
	52 - AH BL String MissionNameSpace
	53 - AH BL String Dialog
	54 - AH addAction check
	55 - AH Moneycheck
	56 - Gang Rename
	57 - AH Ping Exceeded
*/

params[
	["_pid", "", [""]],
	["_type", -1, [0]],
	["_msg", "", ["",[]]]
];

if (_pid isEqualTo "" || _type isEqualTo -1 || _msg isEqualTo "") exitwith {};

if (_msg isEqualType "") then {
	_msg = [_msg];
};

private _sql = [];
{
	if (_x isEqualType "") then {
		_sql pushBackUnique format["('%1', '%2', '%3', NOW())",_pid,_type,[_x] call DB_fnc_mres];
	} else {
		_sql pushBackUnique format["('%1', '%2', '%3', NOW())",_x select 0,_x select 1,[_x select 2] call DB_fnc_mres];
	};
	nil;
} count _msg;

if !(_sql isEqualTo []) then {
	[format["INSERT INTO logs (`pid`, `type`, `msg`, `date`) VALUES %1;",_sql joinString ","],1] call DB_fnc_asyncCall;
};