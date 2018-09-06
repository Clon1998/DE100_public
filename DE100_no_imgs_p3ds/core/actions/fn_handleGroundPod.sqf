/*
	File:	fn_handleGroundPod.sqf
	Date:   12.06.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


params[
	["_vendor", objNull, [objNull]],
	["_caller", objNull, [objNull]],
	["_addactionId", 0, [0]],
	["_arguments", "", [""]]
];
private _vehicle = (vehicle player);

if !(local _vehicle) exitwith {};
if (speed _vehicle > 5) exitWith {["Dafür darfst du nur 5 Km/h fahren!",true,"fast"] call life_fnc_notification_system;};

life_action_inUse = true;
_vehicle allowDamage false;
if (_arguments == "Attach") then {
	private _pod = (nearestObjects[((vehicle player) modelToWorld [0,-7,0]),["Land_Pod_Heli_Transport_04_box_black_F"],2.5]) select 0;
	if !(_pod in life_vehicles) exitWith {["Du brauchst die Schlüssel der Box um dies zu tuhen!",true,"fast"] call life_fnc_notification_system; _vehicle allowDamage true; life_action_inUse = false;};
	["Box wird aufgeladen!",false,"fast"] call life_fnc_notification_system;

	for "_i" from (-8) to (-3) step 0.5 do {
		_pod attachTo [_vehicle,[0,_i,0.8]];
		uiSleep .2;
	};
	_pod enableSimulationGlobal false;
	_vehicle setVariable ["pod_attached",true,true];
	["Box wurde erfolgreich aufgeladen!",false,"fast"] call life_fnc_notification_system;
} else {
	private _pod = (attachedObjects _vehicle) select 0;
	["Box wird abgeladen!",false,"fast"] call life_fnc_notification_system;
	for "_i" from (-3) to (-8) step (-0.5) do {
		_pod attachTo [_vehicle,[0,_i,0.8]];
		uiSleep .2;
	};
	detach _pod;
	_pod enableSimulationGlobal true;
	_vehicle setVariable ["pod_attached",false,true];
	["Box wurde erfolgreich abgeladen!",false,"fast"] call life_fnc_notification_system;
};
_vehicle allowDamage true;
life_action_inUse = false;