#include "\life_shared\script_macros.hpp"
/*
	File:	fn_spawn.sqf
	Date:   2017-03-23 23:18:04
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_vid", -1, [0]],
	["_sp", [],[[]]],
	["_skipTrunk", false, [false]]
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitwith {};

private _name = _unit call life_fnc_name;
private _side = side _unit;

if(_vid == -1 || _uid == "") exitWith {};

private _query = format["SELECT id, side, classname, type, pid, alive, active, plate, color, fuel, fuelcargo, upgrade, inventory, Armainventory FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_uid];
private _vInfo = [_query,2] call DB_fnc_asyncCall;

if(count _vInfo == 0) exitWith {};

if((_vInfo select 5) == 0) exitWith {
	[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]] remoteExecCall ["life_fnc_broadcast",_unit];
};

if((_vInfo select 6) == 1) exitWith {
	[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]] remoteExecCall ["life_fnc_broadcast",_unit];
};

_query = format["UPDATE vehicles SET active='1',depository='0' WHERE pid='%1' AND id='%2'",_uid,_vid];
[_query,1] call DB_fnc_asyncCall;

private _vehicle = objNull;
_vehicle = createVehicle [(_vInfo select 2),[0,0,0],[],0,"NONE"];
_vehicle setPos ((_sp select 0) vectorAdd [0,0,0.25]);
_vehicle allowDamage false;
_vehicle setVectorUp (surfaceNormal (_sp select 0));
_vehicle setDir (_sp select 1);

_vehicle setVariable ["key_owners",[[_uid,_name]],true];
_vehicle setVariable ["owner",[_uid,_name],true];

[_vehicle] remoteExecCall ["life_fnc_safeKey",_unit];
_vehicle lock 2;

//Reskin the vehicle 
[_vehicle,_vInfo select 8,true] call life_fnc_colorVehicle;

_fuel = parseNumber (_vInfo select 9);
_fuel_tank = parseNumber (_vInfo select 10);
if (_fuel < 0.05) then {
	_vehicle setFuel 0.05
} else {
	_vehicle setFuel _fuel;
};

if !(_vehicle isKindOf "Pod_Heli_Transport_04_base_F") then {
	_vehicle enableRopeAttach false;
};

[_vehicle] call life_fnc_setupVehicleEVH;
//_upgrade =(_vInfo select 11);
//13 = ArmaInv
//_armaInv = [_vInfo select 13] call DB_fnc_toArray;
_trunk = [_vInfo select 12] call DB_fnc_toArray;
if (count _trunk != 2) then {_trunk= [[],0];};

if !((_trunk select 0) isEqualType []) then {
	_trunk set [0,[]];
};

if !((_trunk select 1) isEqualType 0) then {
	_trunk set [1,0];
};

if (_skipTrunk) then {
	_trunk = [[],0];
};

_vehicle setVariable["Trunk",_trunk,true];

if((typeOf _vehicle) in ["C_SUV_01_F"]) then {
	_vehicle setCenterOfMass [0,0.1,-0.6];
};

_vehicle setVariable ["TruckExt",_vInfo select 11,true];

if ((_vInfo select 11) > 0)then{
	[_vehicle] call VEH_fnc_spawnContainers;
};

if((typeOf _vehicle) in ["B_Truck_01_fuel_F","O_Truck_02_fuel_F","C_Van_01_fuel_F","O_Truck_03_fuel_F"]) then {
	[_vehicle] remoteExecCall ["life_fnc_fuelStationAdd",RCLIENT];
};
if((typeOf _vehicle) in ["B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","C_Van_01_fuel_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_fuel_black_F"]) then {
	_vehicle setvariable ["stationfuel",_fuel_tank,true];
};

_vehicle setFuelCargo 0;
_vehicle setAmmoCargo 0;
_vehicle setRepairCargo 0;

_vehicle setVariable ["VID",_vInfo select 0,true];
[_vehicle] call life_fnc_clearVehicleAmmo;
// if (count _armaInv > 0) then {
// 	["GET",_vehicle,_armaInv] call VEH_fnc_handleInv;
// };
if(!((_vInfo select 1) == "cop")) then {_vehicle disableTIEquipment true;};

if ((_vInfo select 1) in ["cop","thr"]) then {
	_vehicle setVariable["lights",false,true];
};

[_vehicle,_vInfo select 8] call life_fnc_vehicleAnimate;

[_uid, 32, format ["%1 hat einen %2(VID %3) bei MapGrid %4 ausgeparkt",_unit call life_fnc_nameUID, getText(configFile >> "CfgVehicles" >> (_vInfo select 2) >> "displayName"),_vInfo select 0,mapGridPosition (_sp select 0)]] call MSC_fnc_log;

[2,"Fahrzeug ist bereit!"] remoteExecCall ["life_fnc_broadcast",_unit];
[missionNamespace,["life_isUnimpounding",false]] remoteExecCall ["setVariable",_unit];

_vehicle allowDamage true;