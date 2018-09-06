/*
	File:	fn_handlePod.sqf
	Date:   06.06.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Inspired by XENO - Taru Pod Mod (http://www.armaholic.com/page.php?id=27532)
	Only works with Land_Pod_Heli_Transport_04_box_black_F and Land_Pod_Heli_Transport_04_box_F
*/

params[
	["_vendor", objNull, [objNull]],
	["_caller", objNull, [objNull]],
	["_addactionId", 0, [0]],
	["_arguments", "", [""]]
];
private _heli = (vehicle player);

if !(local _heli) exitwith {};
private _pod = getSlingLoad _heli;
private _mass_pod = getmass _pod;
private _mass_heli = getmass _heli;
if (speed _heli > 10) exitWith {["Dafür darfst du nur 10 Km/h fliegen!",true,"fast"] call life_fnc_notification_system;};

life_action_inUse = true;
_heli allowDamage false;
if (_arguments == "Attach") then {
	["Box wird hochgezogen!",false,"fast"] call life_fnc_notification_system;
	{ropeUnwind [_x, 1.9, 1];} foreach ropes _heli;
	waituntil {ropeLength (ropes _heli select 0) isEqualTo 1};

	_pod attachTo [_heli,[-0.09,-1.05,-1.1]];
	_heli setCustomWeightRTD 1270;
	_heli setmass _mass_heli + _mass_pod;
	_heli setVariable ["pod_attached",true,true];
	["Box wurde erfolgreich angedockt!",false,"fast"] call life_fnc_notification_system;
} else {
	_pod attachTo [_heli,[-0.09,-1.05,-2.8]];
	{ropeUnwind [_x, 1.9, 10];} foreach ropes _heli;
	["Box wird abgelassen!",false,"fast"] call life_fnc_notification_system;
	_heli setCustomWeightRTD 0;
	_heli setmass _mass_heli - _mass_pod;
	detach _pod;
	_heli setVariable ["pod_attached",false,true];
	waituntil {ropeLength (ropes _heli select 0) isEqualTo 10};
	["Box wurde erfolgreich abgedockt!",false,"fast"] call life_fnc_notification_system;
};
_heli allowDamage true;
life_action_inUse = false;