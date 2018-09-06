/*
	File: fn_spawnVehicle.sqf
	Author: Anton
	
	Description:
	Spawnt ein Fahrzeug für Admins an die gewünschte Position.
*/
params[
	["_unit", objNull, [objNull]],
	["_pw", '', ['']],
	["_class", '', ['']],
	["_skin", '', ['']],
	["_pos", [], [[]]]
];

if(_pw!=AH_ADMIN_KEY)exitWith{};

_vehicle = createVehicle [_class,[0,0,0],[],0,"NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
_vehicle setPos _pos;
_vehicle setVectorUp (surfaceNormal _pos);

//Key
[_vehicle] remoteExecCall ["life_fnc_safeKey",_unit];
_vehicle lock 2;

[_vehicle,_skin,true] call life_fnc_colorVehicle;
_vehicle setVariable["key_owners",[[getPlayerUID _unit,name _unit]],true];
_vehicle setVariable ["owner",[getPlayerUID _unit,name _unit],true];

if !(_vehicle isKindOf "Pod_Heli_Transport_04_base_F") then {
	_vehicle enableRopeAttach false;
};

[_vehicle] call life_fnc_setupVehicleEVH;

if((typeOf _vehicle) in ["C_SUV_01_F"]) then {
	_vehicle setCenterOfMass [0,0.1,-0.6];
};
if((typeOf _vehicle) in ["B_Truck_01_fuel_F","O_Truck_02_fuel_F","C_Van_01_fuel_F","O_Truck_03_fuel_F"]) then {
	[_vehicle] remoteExecCall ["life_fnc_fuelStationAdd",0];
};
if((typeOf _vehicle) in ["B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","C_Van_01_fuel_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_fuel_black_F"]) then {
	_vehicle setvariable ["stationfuel",0,true];
	_vehicle setFuelCargo 0;
};
if((typeOf _vehicle) in ["O_Truck_02_Ammo_F","I_Truck_02_ammo_F","B_Truck_01_ammo_F"]) then {
	_vehicle setAmmoCargo 0;
};

if (getRepairCargo _vehicle > 0) then {
	_vehicle setRepairCargo 0
};

[_vehicle] call life_fnc_clearVehicleAmmo;
sleep 2;
_vehicle allowDamage true;


[format["Folgendes Fahrzeug wurde erfolgreich gespawnt: %1",getText(configFile>>'CfgVehicles'>>_class>>'displayName')],false,"fast"]remoteExecCall["life_fnc_notification_system",_unit];
if (life_HC_isActive) then {
	[format["%1(%4) hat folgendes Fahrzeug gespawnt: %2 (Position: %3).",player call life_fnc_name,getText(configFile>>'CfgVehicles'>>_class>>'displayName'),mapGridPosition _vehicle,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
} else {
	[format["%1(%4) hat folgendes Fahrzeug gespawnt: %2 (Position: %3).",player call life_fnc_name,getText(configFile>>'CfgVehicles'>>_class>>'displayName'),mapGridPosition _vehicle,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
};