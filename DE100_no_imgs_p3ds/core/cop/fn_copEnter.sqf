/*
	File: fn_copEnter.sqf
	Author: Skalicon
	
	Description:
	Allows Cops to enter locked Vehicles
*/
if(playerSide != west && playerSide != independent) exitWith {};
private ["_position","_veh"];
_position = _this select 3;

call {
	if (_position isEqualTo "driver") exitWith {
		cursorObject lock false;
		player action ["getInDriver", cursorObject];
		cursorObject lock true;
	};

	if (_position isEqualTo "passenger") exitWith {
		cursorObject lock false;
		player action ["getInCargo", cursorObject];
		cursorObject lock true;
	};

	if (_position isEqualTo "gunner") exitWith {
		cursorObject lock false;
		player action ["getIngunner", cursorObject];
		cursorObject lock true;
	};

	if (_position isEqualTo "open") exitWith {
		cursorObject lock false;
	};

	if (_position isEqualTo "exit") exitWith {
		_veh = vehicle player;
		_veh lock false;
		player action ["getOut", _veh];
		_veh lock true;
	};
};	