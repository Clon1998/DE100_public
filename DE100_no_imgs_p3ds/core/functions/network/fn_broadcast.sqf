/*
	File: fn_broadcast.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Broadcast system used in the life mission for multi-notification purposes.
*/
params[
	["_type", 0, [0,[]]],
	["_msg", "", [""]],
	["_localize",false],
	["_format",[]]
];
if (_msg == "") exitWith {};
if (!hasInterface) exitwith {};
	
if (_localize) then {
	_msg = format ([localize _msg]+_format);	
};

if (_type isEqualType 0) then {
	_type = [_type];
};

{
	call {
		if (_x == 0) exitWith {systemchat _msg;};
		if (_x == 1) exitWith {hint _msg;};
		if (_x == 2) exitWith {[_msg,false,"fast"] call life_fnc_notification_system;};
		if (_x == 3) exitWith {[_msg,false,"slow"] call life_fnc_notification_system;};
		if (_x == 4) exitWith {[_msg,true,"fast"] call life_fnc_notification_system;};
		if (_x == 5) exitWith {[_msg,true,"slow"] call life_fnc_notification_system;};
	};
	nil;
} count _type;