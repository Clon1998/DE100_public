/*
	File:	fn_callPlayer.sqf
	Date:   2016-07-30 23:29:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
params [
	["_number", "", [""]]
];
private _target = allPlayers select {_x getVariable ["phoneNumber","nope"] isEqualTo _number};
private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
if (player getVariable ["offlineMode",false]) exitWith {["Dein Handy ist im Flugmodus",false,"fast"] call life_fnc_notification_system;};
if (count _target == 0) exitWith {["Kein Anschluss unter dieser Nummer",false,"fast"] call life_fnc_notification_system; playSound "nonumber";};
_target = _target select 0; 
if (_target getVariable ["inCall",false]) exitWith {["Besetzt",false,"fast"] call life_fnc_notification_system;};
if (_target getVariable ["offlineMode",false] && (call life_adminlevel) < 5) exitWith {["Der angerufene Teilnehmer ist zur Zeit nicht erreichbar.",false,"fast"] call life_fnc_notification_system;};
if (_target == player) exitWith {["Du kannst dich nicht selbst anrufen",false,"fast"] call life_fnc_notification_system; };
if (count life_telekomInUse == 7) exitWith {["Das Mobilnetz ist im Moment überlastet. Versuche es später nochmal.",false,"fast"] call life_fnc_notification_system;};
life_caller = _target;
private _callNumber = if ((getPlayerUID _target) in (profileNamespace getVariable [format["DE100_contacts_%1",_flag],[]])) then {
	_target call life_fnc_name;
} else {
	_target getVariable ["phoneNumber","nope"];
};
[format["Rufe %1 an",_callNumber],false,"slow"] call life_fnc_notification_system;
player setVariable ["inCall",true,true];
{(findDisplay _x) closeDisplay 2;} forEach [6500,6600,6700,6800,7000,7100,7200,8200,9200,4000,6200];
life_call_mode = "calling";
life_call_active = true;
playSound "start_beep";
uiSleep 4;
playSound "start_beep";
if (_target getVariable ["inCall",false]) exitWith {["Besetzt",false,"fast"] call life_fnc_notification_system;};
_target setVariable ["inCall",true,true];

[player] remoteExec ["life_fnc_recive_call",_target];
life_call_target = false;
uiSleep 4;
for "_i" from 0 to 6 step 1 do {
	if (life_call_target || life_call_interrupt) exitWith {_sound = ASLToAGL [0,0,0] nearestObject "#soundonvehicle"; if (!isNull _sound) then {deleteVehicle _sound; };};
	playSound "start_beep";
	uiSleep 4;
};
if (life_call_target && !life_call_interrupt) then {
	waitUntil {!life_call_active};
} else {
	["Aufgelegt",false,"fast"] call life_fnc_notification_system;
};
playSound "hangup";
life_call_interrupt = false;
player setVariable ["inCall",false,true];