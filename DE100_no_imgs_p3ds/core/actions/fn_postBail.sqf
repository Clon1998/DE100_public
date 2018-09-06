/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {[localize "STR_NOTF_Bail_Post",true,"fast"] call life_fnc_notification_system;};
if(de100_luciandjuli_bc < life_bail_amount) exitWith {[format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount],true,"fast"] call life_fnc_notification_system;};
if (life_bail_amount+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc - life_bail_amount;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
life_bail_paid = true;
[0,"STR_NOTF_Bail_Bailed",true,[player call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",-2];