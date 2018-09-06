#include "\life_server\script_macros.hpp"
/*
	File:	fn_startJackpot.sqf
	Date:   31.03.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_UID", "", [""]],
	["_name", "", [""]],
	["_val", 0, [0]],
	["_player", objNull, [objNull]],
	"_placedMoney",
	"_totalMoney",
	"_winnerInfo",
	"_winningTicket",
	"_winningIndex"
];

if (!isNil {life_gamble_starttime} || _val <= 0) exitWith {}; // Jackpot sill running
life_gamble_teil = [[_UID,_name,0,_val,_val,_player]];
life_gamble_amt = _val;
life_gamble_starttime = serverTime;
// [5,format["<t size= '1.6' color='#f19727'>DE100-Jackpot<br/><br/></t><t size= '1.2'>%1hat den DE100-Jackpot gestartet mit<br/>€%2<br/>Aktueller Wert:<br/>€%2</t>",_name,[life_gamble_amt] call life_fnc_numberText],false] remoteExecCall ["life_fnc_broadcast",RCLIENT];
PVAR_ALL("life_gamble_teil");
PVAR_ALL("life_gamble_amt");
PVAR_ALL("life_gamble_starttime");

waitUntil {((life_gamble_starttime + 120 - serverTime) <= 0) or (count life_gamble_teil) >= 10};
life_gamble_zi = true;
PVAR_ALL("life_gamble_zi");
uiSleep 5;
_winningTicket = round random life_gamble_amt;
_winningIndex = 0;
{
	if (_winningTicket >= (_x select 2) && _winningTicket <= (_x select 3)) exitWith {_winningIndex = _forEachIndex;};
} forEach life_gamble_teil;
_player = objNull;
if (_winningIndex >= 0) then {
	_winnerInfo = life_gamble_teil select _winningIndex;
	_name = _winnerInfo select 1;
	_player = _winnerInfo select 5;
	_placedMoney = 0;
	{
		if ((_winnerInfo select 0) == (_x select 0)) then {
			_placedMoney = _placedMoney + (_x select 4);
		};
	} forEach life_gamble_teil;
	_totalMoney = life_gamble_amt;
};
if (isNil {_player} || (count life_gamble_teil) == 1) then {
	{
		_name = _x select 1;
		_player = _x select 5;
		_placedMoney = _x select 4;
		if !(isNil {_player}) then {
			[_placedMoney,_name] remoteExecCall ["life_fnc_BugOccored",(_player)];
		};
	} forEach life_gamble_teil;
	life_gamble_lastwinner = ["Niemand",0,0];
} else {
	[_totalMoney,round((_placedMoney/_totalMoney)*10000)/100,_winningTicket] remoteExecCall ["life_fnc_reciveWinnings",(_player)];
	life_gamble_lastwinner = [_name,_totalMoney * 0.9,(round((_placedMoney/_totalMoney)*10000)/100)];
	//[0,format["Der gewinner des DE100-Jackpots über €%1 ist %2 mit einer Chance von %3%4",[life_gamble_amt * 0.9] call life_fnc_numberText,_name,round((_placedMoney/_totalMoney)*10000)/100,"%"],false] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	//[0,format["Gezogenes Ticket: %1",[_winningTicket] call life_fnc_numberText],false] remoteExecCall ["life_fnc_broadcast",RCLIENT];
};

uiSleep 10;
life_gamble_zi = false;
PVAR_ALL("life_gamble_zi");
life_gamble_starttime = nil;
life_gamble_amt = 0;
life_gamble_teil = [];
PVAR_ALL("life_gamble_starttime");
PVAR_ALL("life_gamble_teil");
PVAR_ALL("life_gamble_amt");
PVAR_ALL("life_gamble_lastwinner");
