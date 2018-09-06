/*
	File:	fn_thrRequest.sqf
	Date:   2016-12-28 01:16:55
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define MED 0
	#define CAR 1
*/


params[
	["_type", 0, [0]],
	"_unit",
	"_veh",
	"_isVeh"
];
private _exit = false;
private _thrCount = {side _x isEqualTo independent && _x getVariable["isAlive",true]} count allPlayers;

if (_thrCount == 0) exitwith {
	["Im Moment kann kein THR-Mitglied deine Anfrage empfangen",true,"fast"] call life_fnc_notification_system;
};

if ((life_thr_request_delay select _type) - time > 0) exitwith {
	["Du kannst den THR nur alle 3 Minuten rufen!",true,"fast"] call life_fnc_notification_system;
};
private _action = [
	"Möchtest du wirklich den THR rufen?",
	"THR-Rufen?",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (!_action) exitwith {};

switch (_type) do { 
	case 0 : {
		player setVariable ["request",true,true];
		_unit = player;
	}; 
	case 1 : {
		_veh = _this param [1,objNull,[objNull]];
		if (!isNull(player getVariable ["requestveh",objNull])) exitwith {
			["Du hast bereits mit einem Fahrzeug den THR gerufen",true,"fast"] call life_fnc_notification_system;
			_exit = true;
		};

		if !(_veh in life_vehicles) exitwith {
			["Das Fahrzeug gehört nicht dir",true,"fast"] call life_fnc_notification_system;
			_exit = true;
		};
		player setVariable ["requestveh",_veh,true];
		_veh setVariable ["requestveh",player,true];
		_unit = player;
	};
};
if (_exit) exitwith {};
life_thr_request_delay set [_type,time + (3*60)];

[_type,_unit] remoteExecCall ["life_fnc_thrHandleRequest",independent];
["Du hast den THR gerufen!",false,"fast"] call life_fnc_notification_system;
life_thr_request = true;