life_versionInfo = "DE100 Life 2.0 RPG v2.0_05_03_2018";
MISSION_ROOT = parsingNamespace getVariable "MISSION_ROOT";

9999999 setOvercast 0;
9999999 setFog 0;
9999999 setRain 0;

if (isDedicated) then {
	diag_log "-------SPAWNING SIMPLEOBJECTS------";
	[] execVM "buildings\buildings_2.sqf";
};

if (!hasInterface) exitWith {};
waitUntil {missionNamespace getVariable ["de100_compiled",false]};

setTerrainGrid 25;