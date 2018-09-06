/*
	File:	fn_recive_call.sqf
	Date:   2016-07-30 23:39:23
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_caller", objNull, [objNull]]
];
life_caller = _caller;
private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
private _callNumber = if ((getPlayerUID _caller) in (profileNamespace getVariable [format["DE100_contacts_%1",_flag],[]])) then {
	_caller call life_fnc_name;
} else {
	_caller getVariable ["phoneNumber","nope"];
};
if (!("ItemRadio" in assignedItems player)) exitWith {
	player setVariable ["inCall",false,true];
	[format["%1 hat dich versucht zu erreichen. Leider hast du kein Handy dabei!",_callNumber],false,"fast"] call life_fnc_notification_system;
	['stop'] spawn life_fnc_end_call;
};
playSound "ringtone";

[format["Eingehender Anruf von: %1",_callNumber],false,"slow"] call life_fnc_notification_system;
life_call_active = true;
life_call_target = false;
life_call_mode = "recieve";
if (!isNull findDisplay 6500 || !isNull findDisplay 6600 || !isNull findDisplay 6700 || !isNull findDisplay 6800 || !isNull findDisplay 7000 || !isNull findDisplay 7100 || !isNull findDisplay 7200 || !isNull findDisplay 8200 || !isNull findDisplay 9200 || !isNull findDisplay 4000 || !isNull findDisplay 9200 || !isNull findDisplay 6200) then {
	closeDialog 0;
	createDialog "Life_my_new_smartphone_incomming_call";
};

[] spawn {
	uiSleep 25;
	if (!life_call_target) then {
		['stop'] call life_fnc_end_call;
	};	
};

waitUntil {!life_call_active};
_sound = ASLToAGL [0,0,0] nearestObject "#soundonvehicle";
if (!isNull _sound) then {
	deleteVehicle _sound;
};
if (life_call_interrupt) then {
	["Aufgelegt",false,"fast"] call life_fnc_notification_system;
};
playSound "hangup";
player setVariable ["inCall",false,true];
life_call_interrupt = false;