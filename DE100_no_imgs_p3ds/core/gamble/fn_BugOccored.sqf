/*
	File:	fn_BugOccored.sqf
	Date:   02.04.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life,hawaii-life.net server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_placedMoney", 0,[0]],
	["_name", "0",[""]]
];
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc + _placedMoney;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];

if ((count life_gamble_teil) == 1) then {
	hint parseText format["<t size= '1.6' color='#f19727'>DE100-Jackpot<br/><br/></t><t size= '1.2'>Es tut uns leid %1. Da du der einzige Teilnehmer des DE100-Jackpot warst, wurde dir dein gesamter Einsatz ohne Abzüge zurück überwiesen.<br/>Dein Einsatz: €%2</t>",_name,[_placedMoney] call life_fnc_numberText];
} else {
	hint parseText format["<t size= '1.6' color='#f19727'>DE100-Jackpot<br/><br/></t><t size= '1.2'>Es tut uns leid %1. Leider ist ein Fehler bei der Ziehung des Gewinners aufgetreten, deswegen wurden allen Teilnehmern der Einsatz  zurück überwiesen.<br/>Dein Einsatz: €%2</t>",_name,[_placedMoney] call life_fnc_numberText];
};

["CASH"] call SOCK_fnc_updatePartial;