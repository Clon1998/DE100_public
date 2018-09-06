#include "\life_shared\script_macros.hpp"
/*
	File:	fn_spawnContainers.sqf
	Date:   30.12.2014
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_vehicle", objNull, [objNull]]
];
private _upgrade = _vehicle getVariable ["TruckExt",0];

if (_upgrade isEqualTo 0) exitWith {};
private _offSet = call {
	if (typeOf _vehicle isEqualTo "B_Truck_01_transport_F") exitWith {
		[-0,2,-1.6];
	};

	if (typeOf _vehicle isEqualTo "B_Truck_01_covered_F") exitWith {
		[-0.2,-1.6];
	};

	if (typeOf _vehicle isEqualTo "O_Truck_03_transport_F") exitWith {
		[-0.8,-1.6];
	};

	if (typeOf _vehicle isEqualTo "O_Truck_03_covered_F") exitWith {
		[-0.8,-1.6];
	};

	if (typeOf _vehicle isEqualTo "C_Offroad_01_F") exitWith {
		[-1.8,0];
	};

	if (typeOf _vehicle isEqualTo "C_Van_01_transport_F") exitWith {
		[-1.8,0];
	};

	if (typeOf _vehicle isEqualTo "I_Truck_02_transport_F") exitWith {
		[0.4,-1.6];
	};

	if (typeOf _vehicle isEqualTo "I_Truck_02_covered_F") exitWith {
		[0.4,-1.6];
	};
	[0,0];
};	


for "_i" from 0 to (_upgrade - 1) step 1 do {
	_cargo = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];
	_cargo enableSimulationGlobal false;
	_cargo attachTo [_vehicle, [0, (_offSet select 0) + ((_offSet select 1) * _i), 0.3]];
};