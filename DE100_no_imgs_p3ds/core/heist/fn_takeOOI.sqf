/*
   File:    fn_takeOOI.sqf
   Date:    2018-2-20 23:36:06
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params [
    ["_bomb",objNull,[objNull]],
    ["_caller",objNull,[objNull]]
];
if (fed_bank getVariable ["locked",true]) exitWith {
    ["Der Behälter ist nicht offen", true, "fast"] call life_fnc_notification_system;
};
if !(fed_bank getVariable ["stock",false]) exitWith {
    ["Der Behälter ist leer", true, "fast"] call life_fnc_notification_system;
};
if ((["fissileMaterial",1] call life_fnc_canAdd) == 0) exitWith {
	["Deine Tasche ist nicht groß genug für einen Sprengkopf.",true,"fast"] call life_fnc_notification_system;
};

if (([true,"fissileMaterial",1] call life_fnc_handleInv) == 1) then {
	fed_bank setVariable ["stock",false,true];
	fed_bank setVariable ["radiationObject",_caller,true];
	[format["Du hast das spaltbare Material erfolgreich entnommen, deshalb solltest du dich jetzt sehr vorsichtig fortbewegen :)"],true,"fast"] call life_fnc_notification_system;
}else{
	[format["Deine Tasche ist nicht groß genug für einen Sprengkopf."],true,"fast"] call life_fnc_notification_system;
};
