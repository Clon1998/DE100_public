/*
   File:    fn_licenseIM.sqf
   Date:    2018-2-4 14:10:42
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

private _target = param [0,objNull,[objNull]];
if (isNull _target) exitwith {};
if (_target distance player > 5) exitwith {};
private _hasIDCart_player = player getVariable["Perso_has_IdCard",false];

private _actions = [];
_actions pushBackUnique [20,"Zurück","life_action_target call life_fnc_civIM;"];
if (_hasIDCart_player) then {
	_actions pushBackUnique [-1,"Perso zeigen","closeDialog 0; [1, life_action_target] call life_fnc_handleIDCard;"];
};

_actions pushBackUnique [-1,"PKW-Schein zeigen","closeDialog 0; [life_action_target,0,'driver'] call life_fnc_checkLicense;"];
_actions pushBackUnique [-1,"LKW-Schein zeigen","closeDialog 0; [life_action_target,0,'truck'] call life_fnc_checkLicense;"];
_actions pushBackUnique [-1,"Helikopter-Schein zeigen","closeDialog 0; [life_action_target,0,'air'] call life_fnc_checkLicense;"];
_actions pushBackUnique [-1,"Boots-Schein zeigen","closeDialog 0; [life_action_target,0,'boat'] call life_fnc_checkLicense;"];
_actions pushBackUnique [-1,"Waffen-Schein zeigen","closeDialog 0; [life_action_target,0,'gun'] call life_fnc_checkLicense;"];

[_target,_actions,"Ausweisinteraktionsmenü"] call life_fnc_openMenu;