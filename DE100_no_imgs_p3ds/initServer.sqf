/*
	File:   initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/

if(!isServer) exitWith {};
setTerrainGrid 50;
[8,true,32] execFSM "core\fsm\timeModule.fsm";