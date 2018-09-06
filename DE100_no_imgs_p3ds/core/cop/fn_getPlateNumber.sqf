/*
Author: McKenzie
Description: gets the license Plate Number of Any Vehicle

*/

private _checkVehicle = CursorTarget;
if ((Vehicle player != player) && (_checkVehicle distance player > 25) ) exitWith {
   ["Du bist zu weit weg um das Kennzeichen eindeutig zu lesen.", false, "fast"] call life_fnc_notification_system;
};

if ((_checkVehicle distance player > 20) && (!(currentWeapon player in ["Binocular", "Rangefinder"])) && (Vehicle player isEqualTo player)) exitWith {
   ["Du bist zu weit weg um das Kennzeichen eindeutig zu lesen. Nehme ein Binocular oder einen Rangefinder in die Hand", false, "fast"] call life_fnc_notification_system;
};

if ((_checkVehicle distance player > 50) && (currentWeapon player in ["Binocular", "Rangefinder"]) && (Vehicle player isEqualTo player)) exitWith {
   ["Du bist zu weit weg um das Kennzeichen eindeutig zu lesen.", false, "fast"] call life_fnc_notification_system;
};

_checkVehiclePlate = getPlateNumber _checkVehicle;

   [format["Du konntest folgendes Kennzeichen entziffern: %1",_checkVehiclePlate], false, "fast"] call life_fnc_notification_system;
