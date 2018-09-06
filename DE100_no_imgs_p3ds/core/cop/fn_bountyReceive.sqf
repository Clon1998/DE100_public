/*
	File: fn_bountyReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
params[
	["_amt", 0, [0]],
	["_halfe", false, [false]]
];
de100_mSpace setVariable ["cT",diag_tickTime];
if (_halfe) then {
	de100_luciandjuli_bc = de100_luciandjuli_bc + _amt/2;
	[format[localize "STR_Cop_BountyKill",[_amt/2] call life_fnc_numberText,[_amt] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
} else {
	de100_luciandjuli_bc = de100_luciandjuli_bc + _amt;
	[format[localize "STR_Cop_BountyRecieve",[_amt] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
};
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];