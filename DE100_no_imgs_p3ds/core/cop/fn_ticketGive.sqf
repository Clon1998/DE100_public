/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call life_fnc_isnumber)) exitWith {[localize "STR_Cop_TicketNum",true,"fast"] call life_fnc_notification_system;};
if((parseNumber _val) > 999999) exitWith {[localize "STR_Cop_TicketOver100",true,"fast"] call life_fnc_notification_system;};
[0,"STR_Cop_TicketGive",true,[player call life_fnc_name,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",-2];
[player,(parseNumber _val)] remoteExecCall ["life_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;