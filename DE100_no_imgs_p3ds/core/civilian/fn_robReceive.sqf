/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash == 0) exitWith {[localize "STR_Civ_RobFail",true,"fast"] call life_fnc_notification_system;};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula + _cash;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
["CASH"] call SOCK_fnc_updatePartial;