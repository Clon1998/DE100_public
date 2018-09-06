/*
	File: fn_player_query.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends admin informations to an admin
*/

private["_ret"];
_ret = _this select 0;
if(isNull _ret) exitWith {};
if(isNil "_ret") exitWith {};
[de100_luciandjuli_bc,de100_luciandjuli_mula,owner player,player] remoteExecCall ['life_fnc_admininfo',_ret];