/*
	File:	fn_medIM.sqf
	Date:   2016-10-29 01:04:07
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _target = param [0,objNull,[objNull]];
if (isNull _target) exitwith {};

if (_target distance player > 5) exitwith {};
private _actions = [];

if (_target getVariable ["isAlive",true]) then {
	_actions pushBackUnique [-1,"Ausweis zeigen","closeDialog 0; [1 , life_action_target] call life_fnc_handleIDCard;"];
} else {
	_actions pushBackUnique [-1,"Wiederbeleben","closeDialog 0; [life_action_target] call life_fnc_revivePlayer;"];
	_actions pushBackUnique [-1,"Ziehen","closeDialog 0; [0,life_action_target] call life_fnc_drag;"];
};

[_target,_actions,"Polizeiinteraktionsmenü"] call life_fnc_openMenu;