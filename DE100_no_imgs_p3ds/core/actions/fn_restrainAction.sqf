/*
	File:   fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorObject;
if (isNull _unit) exitWith {}; //Not valid
if (_unit getVariable ["restrained",false] || player distance _unit > 3 || !alive player || !(player getVariable ["isAlive",true]) || !isPlayer _unit || player isEqualTo _unit) exitWith {};
if (side _unit isEqualTo west && playerSide isEqualTo west) exitWith {["Du kannst keine Kollegen festnehmen",true,"fast"] call life_fnc_notification_system;};

if (playerSide isEqualTo west) then { 
	["Restrain",1] spawn life_fnc_addAchievExp;
	[0,"STR_NOTF_Restrained",true,[_unit call life_fnc_name, player call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",west];
} else {
	[player,"hostagtaker",1] call life_fnc_addCrime;
};

[player] remoteExec ["life_fnc_restrain",_unit];