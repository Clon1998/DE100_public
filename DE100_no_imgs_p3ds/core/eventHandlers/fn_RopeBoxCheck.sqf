/*
	File:	fn_RopeBoxCheck.sqf
	Date:   24.03.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Checks if the cargo is in the pilots life_vehicles
	yes:
		Go 
	no:
		Destroy Ropes
*/

params[
	["_heli", objNull, [objNull]],
	["_rope", objNull, [objNull]],
	["_box", objNull, [objNull]]
];

if (!(_box in life_vehicles)) then {
	ropeDestroy _rope;
	if (time - life_action_delay > 0.5) then {
		["Du benötigst den Schlüssel, um die Frachtbox anzuheben!",true,"fast"] call life_fnc_notification_system;
	};
} else {
	if (time - life_action_delay > 0.5) then {
		["Du hast die Frachtbox erfolgreich eingehakt!",false,"fast"] call life_fnc_notification_system;
	};
};
life_action_delay = time;