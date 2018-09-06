/*
	File:	fn_torture.sqf
	Date:   2017-03-11 20:20:33
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


params[
	["_unit", objNull, [objNull]],
	["_anim", "", [""]]
];

switch (_anim) do {
	case "Forhand" : {
		if (player distance _unit > 3) exitwith {
			["Du musst näher ran, um die Geisel zu schlagen.",true,"slow"] call life_fnc_notification_system;
		};
		[player,"Acts_Executioner_Forehand",1] call life_fnc_doAnimation;
		waitUntil {animationState player == "acts_executioner_forehand"};
		[player,"ForhandTgt"] remoteExecCall ["life_fnc_torture",_unit];
		waitUntil {animationState player == "acts_executioner_standingloop"};
		[player,""] call life_fnc_doAnimation;
	}; 
	case "ForhandTgt" : {
		[player,"Acts_ExecutionVictim_Forehand",1] call life_fnc_doAnimation;
		player setHitIndex [2,((player getHitIndex 2) + 0.2) min 0.95];
	}; 
	case "Backhand" : {
		if (player distance _unit > 3) exitwith {
			["Du musst näher ran, um die Geisel zu schlagen.",true,"slow"] call life_fnc_notification_system;
		};
		[player,"Acts_Executioner_Backhand",1] call life_fnc_doAnimation;
		waitUntil {animationState player == "acts_executioner_backhand"};
		[player,"BackhandTgt"] remoteExecCall ["life_fnc_torture",_unit];
		waitUntil {animationState player == "acts_executioner_standingloop"};
		[player,""] call life_fnc_doAnimation;
	};
	case "BackhandTgt" : {
		[player,"Acts_ExecutionVictim_Backhand",1] call life_fnc_doAnimation;
		player setHitIndex [2,((player getHitIndex 2) + 0.2) min 0.95];
	};
};