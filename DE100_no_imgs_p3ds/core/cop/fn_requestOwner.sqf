/*
Author: McKenzie
Description: Provides the Owner of the NumberPlate
*/

params [
  ["_PlateNumber","",[""]]
];

if (!(side player in [WEST,INDEPENDENT])) exitWith {
    ["Als Zivilist besitzt du keinen Zugangscode zum Fahrzeugcomputer", false, "fast"] call life_fnc_notification_system;
};

if (Vehicle player isEqualTo player) exitWith {
    ["Du musst in einem Fahrzeug sitzen um den Bordcomputer bedienen zu können", false, "fast"] call life_fnc_notification_system;
};

if (_PlateNumber isEqualTo " ") exitWith {
    ["Das Nummernschild ist ungültig", false, "fast"] call life_fnc_notification_system;
};

/*
PLATZHALTER FÜR QUERY
*/
