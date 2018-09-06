/*
	File:	fn_promoted.sqf
	Date:   2016-10-14 17:05:36
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

[format["Du bist nun Besitzer der Gang %1",(group player) getVariable ["gang_NAME",""]],false,"fast"] call life_fnc_notification_system;

[2,format["%1 ist nun der Besitzer der Gang %2",player call life_fnc_name,(group player) getVariable ["gang_NAME",""]]] remoteExecCall ["life_fnc_broadcast",units (group player)];

player setRank "COLONEL";
(group player) selectLeader player;