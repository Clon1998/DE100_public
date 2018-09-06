/*
   File:    fn_drag.sqf
   Date:    2017-12-25 20:05:35
   Author: Patrick "Lucian" Schmidt 
   Inspired by the Script by AAW BadGuy
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_type", 0, [0]],
	["_obj", objNull, [objNull]]
];


call {
	if (_type == 0) exitWith {
		if (!isNull (player getVariable ["draggedObj",objNull])) exitWith {
			["Du ziehst bereits eine Person", true, "fast"] call life_fnc_notification_system;
		};
		if (!isNull (player getVariable ["carriedObj",objNull])) exitWith {
			["Du trägst bereits eine Person", true, "fast"] call life_fnc_notification_system;
		};
		if (!isNull (_obj getVariable ["dragSrc",objNull])) exitWith {
			["Die Person wird bereits gezogen", true, "fast"] call life_fnc_notification_system;
		};
		if (!isNull (_obj getVariable ["carrySrc",objNull])) exitWith {
			["Die Person wird bereits getragen", true, "fast"] call life_fnc_notification_system;
		};
		private _pos = getPos player;
		_obj setPos _pos;
		player setVariable ["draggedObj",_obj,true];
		_obj setVariable ["dragSrc",player,true];

		_aPoint = [0,1.1,((_obj modelToWorld [0, 0, 0]) select 2) - ((player modelToWorld [0, 0, 0]) select 2)];

		_obj attachTo [player,_aPoint];

		[player,"grabDrag",2] call life_fnc_doAnimation;
		[_obj,"AinjPpneMrunSnonWnonDb_grab"] remoteExecCall ["switchMove",-2];
		[1,player] remoteExecCall ["life_fnc_drag",_obj];
		player setVariable ["dragId",player addAction ["Absetzen",{player setVariable ["stopDrag",true];}]];

		addMissionEventHandler ["EachFrame", {
			private _obj = player getVariable ["draggedObj",objNull];
			if (!isNull objectParent player || !(player getVariable ["isAlive",true]) || !(_obj getVariable ["isUnconscious",false]) || _obj getVariable ["isAlive",true] || player getVariable ["stopDrag",false]) then {
				[2,_obj] call life_fnc_drag;
				player setVariable ["stopDrag",nil];
				removeMissionEventHandler ["EachFrame", _thisEventHandler];
			};
		}];
	};
	if (_type == 1) exitWith {
		player setDir 180;
	};
	if (_type == 2) exitWith {
		detach _obj;
		player removeAction (player getVariable ["dragId",-1]);
		player setVariable ["draggedObj",nil,true];
		[player,"released",2] call life_fnc_doAnimation;
		[_obj,"unconsciousrevivedefault"] remoteExecCall ["switchMove",-2];
		_obj setVariable ["dragSrc",nil,true];
	};
};