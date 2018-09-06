#include "..\..\script_macros.hpp"
/*
	File:	fn_addBet.sqf
	Date:   2016-08-10 19:19:13
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_UID", "", [""]],
	["_name", "", [""]],
	["_val", 0, [0]],
	["_player", objNull, [objNull]]
];


private _Startticket = life_gamble_amt + 1;
private _endTicket = life_gamble_amt + _val;

life_gamble_teil pushBack [_UID,_name,_Startticket,_endTicket,_val,_player];
ADD(life_gamble_amt,_val);

PVAR_ALL("life_gamble_amt");
PVAR_ALL("life_gamble_teil");