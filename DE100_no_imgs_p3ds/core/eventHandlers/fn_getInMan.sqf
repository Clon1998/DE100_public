/*
	File:	fn_getInMan.sqf
	Date:   31.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_player", objNull, [objNull]],
	["_position", "", [""]],
	["_vehicle", objNull, [objNull]],
	["_turret", [], [[]]]
];

_player setVariable ["inVeh",_vehicle,true];
if (_vehicle getVariable ["spawnIndicator",false]) then {
	_vehicle setVariable ["spawnIndicator",nil];
	if ((life_newBought find _vehicle) >= 0) then {
		life_newBought deleteAt (life_newBought find _vehicle);
	};
};

if (missionNamespace getVariable ["life_godmode",false]) then {    
    _vehicle removeAllEventHandlers"HandleDamage";
    _vehicle addEventHandler["HandleDamage",{false}];
};

if (([0,"fissileMaterial"] call life_fnc_handleVItem) > 0 && _vehicle isKindOf  "Air") then {
	hint "Fliegen wäre mit deiner Ware zu gefährlich!";
	moveOut _player;
};

if (life_action_inUse) then {
	if(!life_interrupted) then {life_interrupted = true;};
};