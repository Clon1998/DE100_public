#include "\life_shared\script_macros.hpp"
/*
	File:	fn_store.sqf
	Date:   2017-03-24 10:34:49
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define IMPOUND 0
	#define IMPOUND 1
	#define STORE 2
*/

_check = params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_vehicle", objNull, [objNull]],
	["_type", 0, [0]],
	["_trunkData", [], [[]]],
	"_query"
];
if (!_check) exitWith{};
if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitwith {};

if (isNull _vehicle) exitWith {
	[missionNamespace,["life_impound_inuse",false]] remoteExecCall ["setVariable",_unit];
	[missionNamespace,["life_garage_store",false]] remoteExecCall ["setVariable",_unit];
};

private _vid = _vehicle getVariable["vid",-1];
private _owner = _vehicle getVariable["owner",["",""]];
private _upgrade = _vehicle getVariable ["TruckExt",0];
private _fuelCargo = _vehicle getVariable ["stationfuel",0];
private _fuel = fuel _vehicle;
private _vehArmaInv = [["SAFE",_vehicle,[]] call VEH_fnc_handleInv] call DB_fnc_mres;

_trunkData = [_trunkData] call DB_fnc_mres;


private _query = "";
private _var = "";
private _msg = "";
private _log = [];
private _exit = false;

call {
	if (_type isEqualTo 0) exitWith {
		_var = "life_impound_inuse";
		if(_vid < 0) exitwith {};
		_log = [_owner select 0,27,format["%1(%2)'s %3(VID:%4) wurde von %5 beschlagnahmt.",_owner select 1,_owner select 0,getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),_vid,_unit call life_fnc_nameUID]];
		_query = format["UPDATE vehicles SET active='0', depository='1', fuel='%1', upgrade='%2', inventory='%3', Armainventory='%4',fuelcargo='%5', coolDown=NOW() WHERE id='%6'",_fuel,_upgrade,_trunkdata,_vehArmaInv,_fuelCargo,_vid];
	};

	if (_type isEqualTo 1) exitWith {
		_var = "life_impound_inuse";
		if(_vid < 0) exitwith {};
		_log = [_owner select 0,26,format["%1(%2)'s %3(VID:%4) wurde von %5 abgeschleppt und in die Garage gestellt.",_owner select 1,_owner select 0,getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),_vid,_unit call life_fnc_nameUID]];
		_query = format["UPDATE vehicles SET active='0', fuel='%1', upgrade='%2', inventory='%3', Armainventory='%4',fuelcargo='%5' , coolDown=NOW() WHERE id='%6'",_fuel,_upgrade,_trunkdata,_vehArmaInv,_fuelCargo,_vid];
	};

	if (_type isEqualTo 2) exitWith {
		_var = "life_garage_store";
		if(_vid < 0) exitwith {
			_msg = if (side _unit == independent) then {
				"Das Fahrzeug wurde wieder in die Einsatzgarage zurückgestellt";
			} else {
				localize "STR_Garage_Store_NotPersistent";
			};
		};
		if(_uid != (_owner select 0)) exitWith {
			_msg = localize "STR_Garage_Store_NoOwnership";
			_exit = true;
		};
		_log = [_owner select 0,28,format["%1(%2)'s %3(VID:%4) wurde in die Garage gestellt.",_owner select 1,_owner select 0,getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),_vid]];
		_query = format["UPDATE vehicles SET active='0', fuel='%1', upgrade='%2', inventory='%3', Armainventory='%4',fuelcargo='%5', coolDown=NOW() WHERE id='%6'",_fuel,_upgrade,_trunkdata,_vehArmaInv,_fuelCargo,_vid];
		_msg = localize "STR_Garage_Store_Success";
	};
	_exit = true; 
	_msg = "Ein Fehler ist aufgetreten, versuche es später nochmal."
};	

if (count _var > 0) then {
	[missionNamespace,[_var,false]] remoteExecCall ["setVariable",_unit];
};

if (count _msg > 0) then {
	[2,_msg] remoteExecCall ["life_fnc_broadcast",_unit];
};

if (count _log > 0) then {
	_log call MSC_fnc_log;
};

if (_exit) exitwith {};

if (count _query > 0) then { 
	[_query,1] call DB_fnc_asyncCall;
};

if(!isNil "_vehicle" && {!isNull _vehicle}) then {
	[_vehicle] call VEH_fnc_remContainer;
	deleteVehicle _vehicle;
};
