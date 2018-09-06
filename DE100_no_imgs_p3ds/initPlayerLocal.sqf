/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
BIS_fnc_endMission = compileFinal (if( BIS_fnc_endMission isEqualType "") then {BIS_fnc_endMission} else {str BIS_fnc_endMission});

if (!hasInterface) exitwith {};

0 cutText ["","BLACK FADED"];
0 cutFadeOut  1e+011;
waitUntil {missionNamespace getVariable ["de100_compiled",false]};
[] execVM "core\init.sqf";
[{2},time,{scriptName "Snake-Remover";{if((agent _x)isKindOf"Snake_random_F")then{deleteVehicle(agent _x)}}forEach agents;}]call life_fnc_threadControl;
[] execVM "core\functions\fn_emptyFuel.sqf";
[] execVM "scripts\briefing.sqf";
[] execVM "scripts\safezone.sqf";