/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
if (time - life_session_time < 300) exitWith {[localize "STR_Session_SyncdAlready",true,"fast"] call life_fnc_notification_system;};
life_session_time = time;
[] call SOCK_fnc_updateRequest;
[localize "STR_Session_SyncData",false,"fast"] call life_fnc_notification_system;