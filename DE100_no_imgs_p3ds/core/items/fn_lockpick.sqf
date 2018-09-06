/*
	File:	fn_lockpick.sqf
	Date:   2016-08-02 20:47:10
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _target = cursorObject;
life_interrupted = false;
if (life_action_inUse || isNull _target) exitWith {};
if (([_target,player] call life_fnc_bBoxDistance) > 3) exitWith {
	["Du stehst zu weit weg",false,"fast"] call life_fnc_notification_system;
};

private _isPlayer = _target isKindOf "Man" && isPlayer _target;

if !((_target isKindOf "LandVehicle") || (_target isKindOf "Ship") || (_target isKindOf "Air") || (_target isKindOf "Pod_Heli_Transport_04_base_F") || _isPlayer) exitwith {["Du kannst keinen Dietrich benutzen",true,"fast"] call life_fnc_notification_system;};
if (_target in life_vehicles) exitWith {[localize "STR_ISTR_Lock_AlreadyHave",true,"fast"] call life_fnc_notification_system;};
if (_isPlayer && !(_target getVariable["restrained",false])) exitwith {["Du kannst keinen Dietrich benutzen",true,"fast"] call life_fnc_notification_system;};
if (_isPlayer) then {
	[5,0.2,_target,{
		params[
			["_target", objNull, [objNull]]
		];
		["Handschellen geknackt",false,"fast"] call life_fnc_notification_system;
		_target setVariable["restrained",false,true];
		_target setVariable["Escorting",false,true];
	}] call lpick_fnc_openLpick;
} else {
	[5,random 0.22 max 0.02,_target,{
		params[
			["_target", objNull, [objNull]]
		];
		[localize "STR_ISTR_Lock_Success",false,"fast"] call life_fnc_notification_system;
		life_vehicles pushBack _target;
		[player,"carThief",1] call life_fnc_addCrime;
		[_target,"caralarm"] remoteExec ["say3D",-2];
	}] call lpick_fnc_openLpick;	
};
