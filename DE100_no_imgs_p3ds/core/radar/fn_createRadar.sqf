/*
	File:	fn_createRadar.sqf
	Date:   2017-04-29 15:52:50
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_radar", objNull, [objNull]]
];

private _code = '
	private _radar = thisTrigger getVariable ["radar",objNull];
	if (isNull _radar) exitwith {
		deleteVehicle thisTrigger;
	};
	private _veh = objectParent player;
	if (isNull _veh) exitwith {};
	private _active = _radar getVariable ["enabled",true];
	private _limit = _radar getVariable ["limit",50];
	private _speed = speed _veh;

	if (!_active || (_veh getVariable ["sirenLights",false]) || !(_veh isKindOf "LandVehicle")) exitwith {};
	if (([getPosASL _radar,getDir _radar,120,getPosASl _veh] call BIS_fnc_inAngleSector)&& _speed > _limit) then {
		if (driver _veh isEqualTo player) then { 
			playSound "Speedtrap";
			private _ticket = round (2500 * (_speed-_limit));
			de100_mSpace setVariable ["cT",diag_tickTime];
			if (de100_luciandjuli_bc < _ticket) then {
				_ticket = de100_luciandjuli_bc;
				de100_luciandjuli_bc = 0;
			} else {
				if (_ticket+(call life_fnc_calcDebts) > de100_luciandjuli_bc) then {
					_ticket = de100_luciandjuli_bc-(call life_fnc_calcDebts) max 0;
				};
				de100_luciandjuli_bc = de100_luciandjuli_bc-_ticket;
			};
			de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];

			[format["Sie wurden geblitzt!<br/>Gemessene Geschwindigkeit: %1km/h<br/>Erlaubt: %2km/h<br/><br/>%3€ wurden von deinem Bankkonto abgebucht", ceil _speed, _limit,[_ticket] call life_fnc_numberText],false,"slow"] call life_fnc_notification_system;
		};
		0 spawn {
			cutRsc ["RadarFlashRed","PLAIN"];
			uisleep 0.05;
			cutRsc ["RadarFlash","PLAIN"];
			uisleep 0.1;
			cutRsc ["RadarFlash","PLAIN"];
			uisleep 0.05;
			cutRsc ["RadarFlashRed","PLAIN"];
		};
	};
';

_trigger = createTrigger ["EmptyDetector",getPos _radar,false];
_trigger setTriggerStatements ["this", _code, ""];
_trigger setTriggerActivation ["ANYPLAYER","PRESENT", true];
_trigger setTriggerArea [20,20,0,false,10];
_trigger triggerAttachVehicle [player];
_trigger setVariable ["radar",_radar];