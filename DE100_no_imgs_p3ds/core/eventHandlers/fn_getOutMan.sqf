/*
	File:	fn_getOutMan.sqf
	Date:   2016-12-26 15:35:30
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

_player setVariable ["inVeh",nil,true];
private _addZero = {
	params[
		["_number", 0, [0]]
	];
	if (_number < 10) exitWith {
		format ["0%1",_number];
	};
	_number;
};

if (missionNamespace getVariable ["life_godmode",false]) then {    
    _vehicle removeAllEventHandlers"HandleDamage";
};

if (life_action_inUse) then {
	if(!life_interrupted) then {life_interrupted = true;};
};
private _time = format["%1%2",(life_real_Time select 3) call _addZero,(life_real_Time select 4) call _addZero];
_vehicle setVariable ["lastTime",parseNumber _time,true];