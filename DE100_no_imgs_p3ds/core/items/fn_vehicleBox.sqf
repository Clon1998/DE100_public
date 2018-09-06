/*
	File:	fn_upgrade.sqf
	Date:   31.01.2015
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.

	Description:
	Take a look for yourself.
*/

params[
	["_vehicle", objNull, [objNull]],
	"_upgrade",
	"_cargo",
	"_displayName",
	"_bool",
	"_upp",
	"_id",
	"_ui",
	"_progress",
	"_pgText",
	"_cP"
];
life_interrupted = false;
if (playerSide != independent) exitWith{ ["Das kann nur der THR machen",true,"fast"] call life_fnc_notification_system;};
if (isNull _vehicle) exitWith {["Du musst auf das Fahrzeug schauen um es zu erweitern!",true,"fast"] call life_fnc_notification_system;};
if !(typeOf _vehicle in ["B_Truck_01_transport_F","I_Truck_02_covered_F","B_Truck_01_covered_F","I_Truck_02_transport_F","O_Truck_03_covered_F","O_Truck_03_transport_F","C_Van_01_transport_F","C_Offroad_01_F","O_Truck_02_transport_F"]) exitWith {["Dieses Fahrzeug kann nicht erweitert werden!",true,"fast"] call life_fnc_notification_system;};
if (player distance _vehicle > 7.5) exitWith {["Du musst näher am Auto stehen!",true,"fast"] call life_fnc_notification_system;};
_bool = true;
if (([false,"vehicleBox",1] call life_fnc_handleInv) == 0) exitWith {};
life_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_upp = format["Erweitere Fahrzeug: %1",_displayName];
_upgrade = _vehicle getVariable ["TruckExt",0];
if (_upgrade >= (getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "maxTrunkUpdate"))) exitWith {
	[format["Das Fahrzeug kann nur %1 aufnehmen",(getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "maxTrunkUpdate"))],true,"fast"] call life_fnc_notification_system;
};
//Setup our progress bar.
disableSerialization;
closeDialog 0;
_id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
[player,"AinvPknlMstpSnonWrflDnon_AinvPknlMstpSnonWrflDnon_medic"] remoteExecCall ["switchMove",(allPlayers select {player distance _x < 500})];
for "_i" from 0 to 1 step 0 do {
	sleep 0.2;
	if(isNull _ui) then {
		_id cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_id cutText ["","PLAIN"];};
	if(!alive player) exitWith {_id cutText ["","PLAIN"];};
	if(life_interrupted) exitWith {_id cutText ["","PLAIN"];};
};
life_action_inUse = false;
_id cutText ["","PLAIN"];
[player,"AinvPknlMstpSnonWrflDnon_medicEnd"] remoteExecCall ["switchMove",(allPlayers select {player distance _x < 500})];

if(!alive player) exitWith {[true,"vehicleBox",1] call life_fnc_handleInv;};
if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system; [true,"vehicleBox",1] call life_fnc_handleInv; _id cutText ["","PLAIN"];};

_exit = false;
switch(typeOf _vehicle) do{

	case "B_Truck_01_transport_F":
	{
		_cargo = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];
		_cargo attachTo [_vehicle, [0, -0.2 + (-1.6 * _upgrade) , 0.3]];
		_cargo enableSimulationGlobal false;
	};

	case "B_Truck_01_covered_F":
	{
		_cargo = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];
		_cargo enableSimulationGlobal false;
		_cargo attachTo [_vehicle, [0, -0.2 + (-1.6 * _upgrade) , 0.3]];
	};

	case "O_Truck_03_transport_F": {
		_cargo = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];
		_cargo enableSimulationGlobal false;
		_cargo attachTo [_vehicle, [0, -0.8 + (-1.6 * _upgrade) , 0.3]];
	};

	case "O_Truck_03_covered_F": {
		_cargo = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];
		_cargo enableSimulationGlobal false;
		_cargo attachTo [_vehicle, [0, -0.8 + (-1.6 * _upgrade) , 0.3]];
	};

	case "C_Offroad_01_F": {
		_cargo = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];
		_cargo enableSimulationGlobal false;
		_cargo attachTo [_vehicle, [ 0, -1.8, 0.3]];
	};

	case "C_Van_01_transport_F": {
		_cargo = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];
		_cargo enableSimulationGlobal false;
		_cargo attachTo [_vehicle, [ 0, -1.8, 0.3]];
	};

	case "I_Truck_02_transport_F": {
		_cargo = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];
		_cargo enableSimulationGlobal false;
		_cargo attachTo [_vehicle, [0, 0.4 + (-1.6 * _upgrade) , 0.3]];
	};

	case "I_Truck_02_covered_F": {
		_cargo = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];
		_cargo enableSimulationGlobal false;
		_cargo attachTo [_vehicle, [0, 0.4 + (-1.6 * _upgrade) , 0.3]];
	};
};
if (_exit) exitWith {};
_vehicle setVariable ["TruckExt",_upgrade + 1,true];
_id cutText ["","PLAIN"];
[format["%1 wurde erweitert",_displayName],false,"fast"] call life_fnc_notification_system;