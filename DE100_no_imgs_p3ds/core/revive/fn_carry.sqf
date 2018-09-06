/*
   File:    fn_carry.sqf
   Date:    2017-12-30 15:55:31
   Author: Patrick "Lucian" Schmidt
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
		if (primaryWeapon player == "") exitWith {
			["Du kannst nur mit einer Primärwaffe jemanden Tragen.", false, "fast"] call life_fnc_notification_system;
		};
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
		player setVariable ["carriedObj",_obj,true];
		_obj setVariable ["carrySrc",player,true];


		player selectWeapon primaryWeapon player;
		[1,player] remoteExecCall ["life_fnc_carry",_obj];
		waitUntil {animationState player isEqualTo "amovpercmstpsraswrfldnon" && animationState _obj isEqualTo "ainjpfalmstpsnonwrfldnon_carried_up"};
		[player,"AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon",1] call life_fnc_doAnimation;

		_obj attachTo [player,[0.4,-0.1,-1.22], "LeftShoulder"];

		addMissionEventHandler ["EachFrame", {
			private _obj = player getVariable ["carriedObj",objNull];
			if (animationState _obj isEqualTo "ainjpfalmstpsnonwrfldnon_carried_still" && !(_obj getVariable ["dirUpdated",false])) then {
				player setVariable ["carryId",player addAction ["Absetzen",{player setVariable ["stopCarry",true];}]];
				_obj setVariable ["dirUpdated",true,true];
				[3,player] remoteExecCall ["life_fnc_carry",_obj];
			};
			if (!isNull objectParent player || !(player getVariable ["isAlive",true]) || !(_obj getVariable ["isUnconscious",false]) || _obj getVariable ["isAlive",true] || player getVariable ["stopCarry",false]) then {
				[2,_obj] call life_fnc_carry;
				player setVariable ["stopCarry",nil];
				removeMissionEventHandler ["EachFrame", _thisEventHandler];
			};
		}];
	};
	if (_type == 1) exitWith {
		player setDir (getDir _obj + 180);
		player setPosASL (getPosASL _obj vectorAdd (vectorDir _obj));
		[player,"AinjPfalMstpSnonWrflDnon_carried_Up",1] call life_fnc_doAnimation;	
	};
	if (_type == 2) exitWith {
		detach _obj;
		player removeAction (player getVariable ["carryId",-1]);
		player setVariable ["carriedObj",nil,true];
		_obj setVariable ["carrySrc",nil,true];
		_obj setVariable ["dirUpdated",nil,true];
		[player,"",1] call life_fnc_doAnimation;
		[_obj,"unconsciousrevivedefault"] remoteExecCall ["switchMove",-2];
	};
	if (_type == 3) exitWith {
		player setDir 0;
	};
};

