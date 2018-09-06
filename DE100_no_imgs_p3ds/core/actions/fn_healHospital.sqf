/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(de100_luciandjuli_mula < 1000) exitWith {[format[localize "STR_NOTF_HS_NoCash",1000],true,"fast"] call life_fnc_notification_system;};
[localize "STR_NOTF_HS_Healing",true,"fast"] call life_fnc_notification_system;
sleep 8;
if(player distance (_this select 0) > 5) exitWith {[localize "STR_NOTF_HS_ToFar",true,"fast"] call life_fnc_notification_system;};

player setdamage 0;
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula - 1000;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];