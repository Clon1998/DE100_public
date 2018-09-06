/*
   File:    fn_pullOutVeh.sqf
   Date:    2017-10-28 18:00:15
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

params[
	["_source", objNull, [objNull]]
];

if (isNull objectParent player || isNull _source) exitWith {};
player setVariable ["forcedVeh",false,true];

if (player getVariable ["isUnconscious",false]) then {
    player setUnconscious false;
    [getPosASL _source] spawn {
        params ["_pos"];
        sleep 0.2;
        player setPosASL _pos;
        player setUnconscious true;
    };
};

unassignVehicle player;
player action ["Eject", vehicle player];
[localize "STR_NOTF_PulledOut",false,"fast"] call life_fnc_notification_system;


if (life_HC_isActive) then {
	[getPlayerUID player, 43,[format["%1 wurde von %2 aus einem Fahrzeug gezogen",player call life_fnc_nameUid, _source call life_fnc_nameUid],[getPlayerUID _source, 44, format["%2 hat %1 aus einem Fahrzeug gezogen",player call life_fnc_nameUid, _source call life_fnc_nameUid]]]] remoteExecCall ["MSC_fnc_log",HC_Life];
} else {
	[getPlayerUID player, 43,[format["%1 wurde von %2 aus einem Fahrzeug gezogen",player call life_fnc_nameUid, _source call life_fnc_nameUid],[getPlayerUID _source, 44, format["%2 hat %1 aus einem Fahrzeug gezogen",player call life_fnc_nameUid, _source call life_fnc_nameUid]]]] remoteExecCall ["MSC_fnc_log",2];
};