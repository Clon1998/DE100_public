/*
Author: McKenzie
Description: Allows to Customize the Number Plate of any Vehicle. It won´t save to Db

*/
params[
  ["_myPlate","",[""]]
];
private _myVehicle = CursorTarget;

if (!(_myVehicle isKindOf "Car")) exitWith {
    ["Du kannst nur an Bodenfahrzeugen das Nummernschild abändern", false, "fast"] call life_fnc_notification_system;
};

if (_myVehicle distance Player > 6) exitWith {
    ["Du stehst zu weit weg um das Nummernschild zu manipulieren", false, "fast"] call life_fnc_notification_system;
};

if (side player isEqualTo west) exitWith {
    ["Du bist im Dienst und solltest deine Finger von solchen Dingen lassen", false, "fast"] call life_fnc_notification_system;
};

if (_myPlate isEqualTo " ") exitWith {
    Hint Format ["Das Nummernschild ist ungültig"]
};
private _oldPlate = getPlateNumber _myVehicle;
private _badwords = getArray(missionConfigFile >> "Life_Settings" >> "badWords_filter");
private _tmp = [];
{
  if (__PlateNumber find _x >= 0 && _x != "  ") then {
    _tmp pushBackUnique _x;
  };
  nil;
} count _badwords;

if !(_tmp isEqualTo []) exitWith {
  ["Du hast ein nicht erlaubtes Wort eingegeben", false, "fast"] call life_fnc_notification_system;
};


_myVehicle say3D ["spray",10,1];
_myVehicle setPlateNumber _myPlate;
[format["Du hast dein Nummernschild erfolgreich von %1 in %2 abgeändert",_oldPlate,_myPlate], true, "fast"] call life_fnc_notification_system;
