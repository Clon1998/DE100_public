/*

	Player clicked arrest/ok

*/

private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_action_target") exitWith {hint "Invalid destination."};

//Get minutes
_time = ctrlText 1400;


if(! ([_time] call life_fnc_isnumber)) exitWith
{
	["Du musst eine Nummer eingeben",true,"fast"] call life_fnc_notification_system;
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 5 || _time > 60) exitWith {["Minimal 5 Minuten und maximal 60 Minuten",true,"fast"] call life_fnc_notification_system; };

closeDialog 0; 
[life_action_target, _time] call life_fnc_arrestAction;