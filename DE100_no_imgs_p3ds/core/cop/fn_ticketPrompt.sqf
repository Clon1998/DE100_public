/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_cop","_val"];
_cop = _this select 0;
if(isNull _cop) exitWith {};
_val = _this select 1;

disableSerialization;

life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;
[] call life_fnc_ticketPay;