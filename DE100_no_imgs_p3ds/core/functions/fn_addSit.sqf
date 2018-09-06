/*
	File:	fn_addSit.sqf
	Date:   2017-03-11 18:50:14
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	this call life_fnc_addSit;
*/

params [["_obj",objNull]];
private _sitDown = {
	params[
		["_obj", objNull, [objNull]],
		["_player", objNull, [objNull]]
	];
	if (_obj distance _player > 3) exitwith {["Du bist zu weit weg",true,"fast"] call life_fnc_notification_system;};
	_obj setVariable ["inUse",_player,true];
	[_player,"Crew"] remoteExecCall ["switchMove",-2];
	_player setPosATL (getPosATL _obj);
	_player setDir ((getDir _obj) - 180);
	private _standUp = {
		params[
			["_obj", objNull, [objNull]],
			["_player", objNull, [objNull]],
			["_aid", 1, [1]],
			["_chair", objNull, [objNull]]
		];
		
		_chair setVariable ["inUse",nil,true];
		[_player,"AmovPercMstpSlowWpstDnon",1] call life_fnc_doAnimation;
		_player removeAction _aid;
	};
	_player addAction ["Aufstehen",_standUp,_obj,1.5,true,true];
};


_condDown = "isNull(_target getVariable ['inUse',objNull]) && _target distance _this < 3";

_obj addAction ["Hinsetzen",_sitDown,nil,1.5,true,true,"",_condDown];
