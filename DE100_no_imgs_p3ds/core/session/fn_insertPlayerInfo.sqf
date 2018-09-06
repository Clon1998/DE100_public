/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Read the file name... Explains it.
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
[.7,localize "STR_Session_QueryFail"] call life_fnc_introCamSetPerc;

if (life_HC_isActive) then {
    [getPlayerUID player,call life_clientId select 0,profileName,de100_luciandjuli_mula,de100_luciandjuli_bc] remoteExecCall ["PL_fnc_insert",HC_Life];
} else {
    [getPlayerUID player,call life_clientId select 0,profileName,de100_luciandjuli_mula,de100_luciandjuli_bc] remoteExecCall ["PL_fnc_insert",2];
};