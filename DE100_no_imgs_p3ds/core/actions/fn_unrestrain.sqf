/*
	File:   fn_unrestrain.sqf
*/

private _unit = param [0,objNull,[objNull]];
if(isNull _unit || !(_unit getVariable["restrained",false])) exitWith {}; //Error check?

_unit setVariable["restrained",false,true];
_unit setVariable["Escorting",false,true];
if (_unit getVariable ["SackDrauf",false]) then {
	[] remoteExecCall ["life_fnc_bag",life_action_target];
};
detach _unit;
if (playerSide isEqualTo west) then {
	[0,"STR_NOTF_Unrestrain",true,[_unit call life_fnc_name, player call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",west];
};

["Du wurdest freigelassen",false,"fast"] remoteExecCall ["life_fnc_notification_system",_unit];