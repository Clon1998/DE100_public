/*
 File: fn_gpsTracker.sqf
 Author: Poseidon
 Modified by XFireFighter

 Description: Attaches a gps tracker to selected vehicle
*/
params [
	["_obj",objNull,[objNull]]
];

if(isNull _obj) exitWith {};
if!((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air") || (_veh isKindOf "Pod_Heli_Transport_04_base_F")) exitWith {[format["Du kannst den GPS Tracker hier nicht benutzen."],true,"fast"] call life_fnc_notification_system;};
if([_obj,player] call life_fnc_bBoxDistance > 5) exitWith {[format["Du musst dich näher hinstellen."],true,"fast"] call life_fnc_notification_system;};
if(([false,"gpstracker",1] call life_fnc_handleInv) == 0) exitWith {};

closeDialog 0;
life_action_inUse = true;
[player,"AinvPknlMstpSnonWnonDnon_medic_1"] call life_fnc_doAnimation;
uiSleep 4;
life_action_inUse = false;
if(player distance _obj > 7) exitWith {[format["Du musst dich näher hinstellen."],true,"fast"] call life_fnc_notification_system;};

[format["Du hast den GPS Sender erfolgreich angebracht."],true,"fast"] call life_fnc_notification_system;

life_gps_tracking pushBackUnique _obj;