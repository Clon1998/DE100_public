/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price"];
_dp = param [0,objNull,[objNull]];
life_delivery_in_progress = false;
life_dp_punkt = nil;
_dis = round((getPos life_dp_start) distance (getPos _dp));
_price = round(2.0 * _dis);

[format [(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system; 
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula + _price;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];