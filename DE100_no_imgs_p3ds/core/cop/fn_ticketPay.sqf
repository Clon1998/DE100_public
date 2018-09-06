/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} or isNil {life_ticket_cop}) exitWith {};
if(de100_luciandjuli_mula < life_ticket_val) exitWith
{
	if(de100_luciandjuli_bc < life_ticket_val) exitWith 
	{
		[localize "STR_Cop_Ticket_NotEnough",true,"fast"] call life_fnc_notification_system;
		[2,"STR_Cop_Ticket_NotEnoughNOTF",true,[player call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	if (life_ticket_val+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
		[localize "STR_Cop_Ticket_NotEnough",true,"fast"] call life_fnc_notification_system;
		["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
		[2,"STR_Cop_Ticket_NotEnoughNOTF",true,[player call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	[format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
	de100_mSpace setVariable ["cT",diag_tickTime];
	de100_luciandjuli_bc = de100_luciandjuli_bc - life_ticket_val;
	de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	life_ticket_paid = true;
	[0,"STR_Cop_Ticket_PaidNOTF",true,[player call life_fnc_name,[life_ticket_val] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];
	[2,"STR_Cop_Ticket_PaidNOTF_2",true,[player call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
	[life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];
	[getPlayerUID player,false] call life_fnc_removeCrime;
	closeDialog 0;
	["CASH"] call SOCK_fnc_updatePartial;
};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula - life_ticket_val;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
life_ticket_paid = true;

[getPlayerUID player,false] call life_fnc_removeCrime;
[0,"STR_Cop_Ticket_PaidNOTF",true,[player call life_fnc_name,[life_ticket_val] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];
closeDialog 0;
[2,"STR_Cop_Ticket_PaidNOTF_2",true,[player call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
[life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];
["CASH"] call SOCK_fnc_updatePartial;