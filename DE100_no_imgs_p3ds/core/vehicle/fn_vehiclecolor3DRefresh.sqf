/*
	File: fn_vehiclecolor3DRefresh.sqf
	Author: Jawshy
	Modified : NiiRoZz

	Description:
	Called when a new selection is made in the rsc box and paint the vehicle with the color selected
*/
disableSerialization;
_display = findDisplay 2300;
_colorClass = lbData[2304,(lbCurSel 2304)];
if (isNull life_preview_3D_vehicle_object) exitWith {};

[life_preview_3D_vehicle_object,_colorClass,false] call life_fnc_colorVehicle;
[life_preview_3D_vehicle_object,_colorClass] call life_fnc_vehicleAnimate;