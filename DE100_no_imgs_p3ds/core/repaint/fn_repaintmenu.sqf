/*
	File:	fn_repaintmenu.sqf
	Date:   06.12.2014
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
params[
	["_vendor", objNull, [objNull]],
	["_caller", objNull, [objNull]],
	["_addactionId", 0, [0]],
	["_arguments", "", [""]],
	"_dialog",
	"_VehList",
	"_nearVeh",
	"_color"
];
if (vehicle _caller != _caller) exitWith {["Du darfst nicht in einem Fahrzeug sitzen.",true,"fast"] call life_fnc_notification_system;};

createDialog "Life_vehicle_repaint";
disableSerialization;
_dialog = findDisplay 2300;

_VehList = _dialog displayCtrl 2302;
_nearVeh = nearestObjects[getPos _vendor,["Car","Air","Ship"],10];
if (count _nearVeh == 0) exitWith {
	closeDialog 0;
	["Kein Fahrzeug in der Nähe",true,"fast"] call life_fnc_notification_system;
};

lbClear _VehList;
{
	_color = [(typeOf _x),(_x getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
	_vehInfo = [typeOf _x] call life_fnc_fetchVehInfo;

	_VehList lbAdd format ["%1 (%2)",_vehInfo select 3,_color];		
	_VehList lbSetPicture [(lbSize _VehList)-1,_vehInfo select 2];	
	_VehList lbSetData [(lbSize _VehList)-1,netId (_x)];
} forEach _nearVeh;