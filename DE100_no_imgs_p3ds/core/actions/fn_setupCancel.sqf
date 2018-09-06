/*
	File:	fn_setupCancel.sqf
	Date:   04.04.2016
	Author: Garth de Wet (LH), edited by commy2, Lucian
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

if (DE100_Fortifications_pfeh_running) then {
	["DE100_Fortifications_Placement", "OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
	DE100_Fortifications_pfeh_running = false;
};

if (!isNull (missionNamespace getVariable ["DE100_Fortifications_Setup", objNull])) then {
	[true,(DE100_Fortifications_Setup getVariable "Item"),1] call life_fnc_handleInv;
	deleteVehicle DE100_Fortifications_Setup;
};

DE100_Fortifications_Setup = objNull;

("MouseHint" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

(findDisplay 46) displayRemoveEventHandler ["MouseZChanged",(player getVariable ["DE100_Fortifications_Turn", -1])];
player removeAction (player getVariable ["DE100_Fortifications_Place", -1]);
player removeAction (player getVariable ["DE100_Fortifications_Cancel", -1]);