/*
	File:	fn_setupApprove.sqf
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

private "_setup";

_setup = DE100_Fortifications_Setup;

DE100_Fortifications_Setup = objNull;
player removeAction (player getVariable ["DE100_Fortifications_Place", -1]);
player removeAction (player getVariable ["DE100_Fortifications_Cancel", -1]);
(findDisplay 46) displayRemoveEventHandler ["MouseZChanged",(player getVariable ["DE100_Fortifications_Turn", -1])];
("MouseHint" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
_setup spawn {
	_pos = getPosASL _this;
	_dir = getDir _this;
	player playActionNow "MedicOther";

	sleep 5;

	// create global object
	_type = typeOf _this;
	_setup = _type createVehicle [0, 0, -10000];
	if !((_this getVariable["Raketen_type",[]]) isEqualTo []) then {
		_rocketVar = _this getVariable["Raketen_type",[]];
		_setup setVariable["Rakete",_this getVariable["Rakete",""],true];
		_setup setVariable["Raketen_type",_rocketVar,true];
		life_preRockets pushBack [_setup,_rocketVar];
	};
	deleteVehicle _this;
	_setup setDir _dir;
	_setup setPosASL _pos;
	_setup setVariable ["Placed",true,true];
	_setup allowDamage false;

	_this allowDamage true;
	_this enableSimulationGlobal true;
};