/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Verifies that the ticket was paid.
*/
params[
	["_value", 5, [0]],
	["_unit", objNull, [objNull]],
	["_cop", objNull, [objNull]]
];

if(isNull _unit or {_unit != life_ticket_unit}) exitWith {}; //NO
if(isNull _cop or {_cop != player}) exitWith {}; //Double NO
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc + round _value;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
if (life_HC_isActive) then {
	[getPlayerUID player, 20,[format ["%2 hat das Ticket über €%3 von %1 gezahlt.",player call life_fnc_nameUID, _unit call life_fnc_nameUID,[round _value] call life_fnc_numberText],[getPlayerUID _unit, 21, format ["%2 hat das Ticket über €%3 von %1 gezahlt.",player call life_fnc_nameUID, _unit call life_fnc_nameUID,[round _value] call life_fnc_numberText]]]] remoteExecCall ["MSC_fnc_log",HC_Life];
} else {
	[getPlayerUID player, 20,[format ["%2 hat das Ticket über €%3 von %1 gezahlt.",player call life_fnc_nameUID, _unit call life_fnc_nameUID,[round _value] call life_fnc_numberText],[getPlayerUID _unit, 21, format ["%2 hat das Ticket über €%3 von %1 gezahlt.",player call life_fnc_nameUID, _unit call life_fnc_nameUID,[round _value] call life_fnc_numberText]]]] remoteExecCall ["MSC_fnc_log",2];
};
[format["Du hast die Strafzettelsumme auf dein Gehalt draufgerechnet bekommen (%1€)",[round(_value)]call life_fnc_numberText,"%"],false,"fast"] call life_fnc_notification_system;