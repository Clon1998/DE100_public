
/*
	File :  fn_placeObjekt.sqf
	Date:   11.12.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


private["_error","_info","_classname","_offsetZ","_unit"];

_error = params [
	["_item", "", [""]]
];
if (!_error) exitWith {};

_info = switch (_item) do { 
	case "rocket_random" : {["Metal_Pole_F", 0.3,["random","random"]]};
	case "rocket_normal_red" : {["Metal_Pole_F", 0.3,["normal","red"]]};
	case "rocket_normal_blue" : {["Metal_Pole_F", 0.3,["normal","blue"]]};
	case "rocket_normal_green" : {["Metal_Pole_F", 0.3,["normal","green"]]};
	case "rocket_normal_white" : {["Metal_Pole_F", 0.3,["normal","white"]]};
	case "rocket_fizzer_red" : {["Metal_Pole_F", 0.3,["fizzer","red"]]};
	case "rocket_fizzer_blue" : {["Metal_Pole_F", 0.3,["fizzer","blue"]]};
	case "rocket_fizzer_green" : {["Metal_Pole_F", 0.3,["fizzer","green"]]};
	case "rocket_fizzer_white" : {["Metal_Pole_F", 0.3,["fizzer","white"]]};
	case "rocket_rain_red" : {["Metal_Pole_F", 0.3,["rain","red"]]};
	case "rocket_rain_blue" : {["Metal_Pole_F", 0.3,["rain","blue"]]};
	case "rocket_rain_green" : {["Metal_Pole_F", 0.3,["rain","green"]]};
	case "rocket_rain_white" : {["Metal_Pole_F", 0.3,["rain","white"]]};
	case "mauer" : {["Land_Concrete_SmallWall_4m_F", 0.7]};
	case "gate" : {["Land_BarGate_F", 4.5]};
	case "arrowdeskl" : {["ArrowDesk_L_F", 0.7]};
	case "arrowdeskr" : {["ArrowDesk_R_F", 0.7]};
	case "roadbarrier" : {["RoadBarrier_F", 0.7]};
	case "roadcone" : {["RoadCone_L_F ", 0.7]};
	case "tapesign" : {["TapeSign_F", 0.7]};
	case "hescobag" : {["Land_HBarrier_Big_F", 0.7]};
	default {["",0]}; 
};
if ((_info select 0) == "") exitWith {};
if (!isNull DE100_Fortifications_Setup) exitWith {["Du platzierst bereits etwas",true,"fast"] call life_fnc_notification_system;[true,_item,1] call life_fnc_handleInv};
if (count life_preRockets > 2 && (_item in ["rocket_random","rocket_normal_red","rocket_normal_blue","rocket_normal_white","rocket_normal_green","rocket_fizzer_blue", "rocket_fizzer_red", "rocket_fizzer_white", "rocket_fizzer_green", "rocket_rain_blue", "rocket_rain_red", "rocket_rain_white", "rocket_rain_green"])) exitWith {[format["Du kannst maximal 3 Raketen platzieren. Zünde die plazierten Raketen erst."],true,"fast"] call life_fnc_notification_system; [true,_item,1] call life_fnc_handleInv};
_type = _info select 0;
_offsetZ = _info select 1;
_unit  = player;
//by Garth de Wet (LH), edited by commy2 and Lucian
DE100_Fortifications_Setup = _type createVehicleLocal [0, 0, -10000];
DE100_Fortifications_Setup setVariable ["Item",_item,true];
DE100_Fortifications_Setup allowDamage false;
DE100_Fortifications_Setup enableSimulationGlobal false;
DE100_Fortifications_Setup attachTo [_unit, _unit worldToModel ((ASLtoATL eyePos player) vectorAdd (positionCameraToWorld [0, 0, 4] vectorDiff positionCameraToWorld [0, 0, 0]))];
detach DE100_Fortifications_Setup;

DE100_Fortifications_TweakedAngle = 180;

private _allDis = switch (_type) do {
	case "Land_HBarrier_Big_F" : {3.6;};
	default {2;}; 
};

["DE100_Fortifications_Placement", "OnEachFrame", {
	DE100_Fortifications_pfeh_running = true;

	_pos = (ASLtoATL eyePos player) vectorAdd (positionCameraToWorld [0, 0, 4] vectorDiff positionCameraToWorld [0, 0, 0]);
	_pos set [2, 0];

	if (getPosATL player distance _pos < _allDis || {!alive player} || {player != vehicle player}) exitWith {
		call Life_fnc_setupCancel;
	};

	DE100_Fortifications_Setup setPosATL _pos;

	DE100_Fortifications_Setup setDir (DE100_Fortifications_TweakedAngle + getDir player);

}] call BIS_fnc_addStackedEventHandler;

[] spawn {
	private ["_leftClick", "_rightClick", "_scroll"];
	_leftClick = "Platzieren";
	_rightClick = "Abbrechen";
	_scroll = "Drehen";
	("MouseHint" call BIS_fnc_rscLayer) cutRsc ["MouseHint", "PLAIN",0.5, false];
	disableSerialization;
	_display = uiNamespace getVariable ["MouseHint_Display", objNull];
	if (isNull _display) exitWith{};

	(_display displayCtrl 1000) ctrlSetText _leftClick;
	(_display displayCtrl 1001) ctrlSetText _rightClick;
	(_display displayCtrl 1002) ctrlSetText _scroll;
};

if (_item in ["rocket_random","rocket_normal_red","rocket_normal_blue","rocket_normal_white","rocket_normal_green","rocket_fizzer_blue", "rocket_fizzer_red", "rocket_fizzer_white", "rocket_fizzer_green", "rocket_rain_blue", "rocket_rain_red", "rocket_rain_white", "rocket_rain_green"]) then {
	_rocketVar = _info select 2;
	DE100_Fortifications_Setup setVariable["Rakete",_item,true];
	DE100_Fortifications_Setup setVariable["Raketen_type",_rocketVar,true];
};

_unit setVariable ["DE100_Fortifications_Turn",(findDisplay 46) displayAddEventHandler ["MouseZChanged", "_this call life_fnc_scrollWheel"]];
_unit setVariable ["DE100_Fortifications_Place",_unit addAction["<p></p>",Life_fnc_setupApprove,nil,-1,false,true,'DefaultAction','DE100_Fortifications_pfeh_running && !isNull (missionNamespace getVariable ["DE100_Fortifications_Setup", objNull])']];
_unit setVariable ["DE100_Fortifications_Cancel",_unit addAction["<p></p>",Life_fnc_setupCancel,nil,-1,false,true,'MenuBack','DE100_Fortifications_pfeh_running && !isNull (missionNamespace getVariable ["DE100_Fortifications_Setup", objNull])']];