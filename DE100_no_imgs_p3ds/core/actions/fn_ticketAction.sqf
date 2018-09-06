/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = param [0,objNull,[objNull]];
disableSerialization;
if(!(createDialog "life_ticket_give")) exitWith {hint localize "STR_Cop_TicketFail"};
if(isNull _unit or !isPlayer _unit) exitWith {};
ctrlSetText[2651,format[localize "STR_Cop_Ticket",_unit call life_fnc_name]];
life_ticket_unit = _unit;