/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,objNull,[objNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["switchMove",(allPlayers select {player distance _x < 500})];
sleep 0.08;
[_target,player call life_fnc_name] remoteExec ["life_fnc_knockedOut",_target];
sleep 3;
life_knockout = false;