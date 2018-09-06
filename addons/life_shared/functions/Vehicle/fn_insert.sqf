#include "\life_shared\script_macros.hpp"
/*
	File:	fn_insert.sqf
	Date:   2017-03-23 21:49:44
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
scopeName "main";

params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_veh", objNull, [objNull,""]],
	["_col", "", [""]],
	["_log", "", [""]],
	"_queryResult"
];
if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;

private _class = if (_veh isEqualType objNull) then {
	if (isNull _unit || isNull _veh) exitwith {breakOut "main";};	
	typeOf _veh;
} else {
	if (_veh isEqualTo "") exitWith  {breakOut "main";};
	_veh;
};

private _type = call {
	if (_veh isKindOf "Car") exitWith {
		"Car";
	};

	if (_veh isKindOf "Air") exitWith {
		"Air";
	};

	if (_veh isKindOf "Ship") exitWith {
		"Ship";
	};

	if (_veh isKindOf "Pod_Heli_Transport_04_base_F") exitWith {
		"Air";
	};
	"";
};	

private _flag = call {if ((side _unit) isEqualTo civilian) exitWith {"civ";};if ((side _unit) isEqualTo west) exitWith {"cop";};if ((side _unit) isEqualTo independent) exitWith {"thr";};};

private _plate = round random 99999;
_query = format["INSERT INTO vehicles (side, classname, type, pid, alive, active, inventory, color, plate , zeitpunkt) VALUES ('%1', '%2', '%3', '%4', '1','%7','""[]""', '%5','%6', NOW())",_flag,_class,_type,_uid,_col,_plate,[0,1] select (_veh isEqualType objNull)];
[_query,1] call DB_fnc_asyncCall;

for "_i" from 0 to 1 step 0 do {
	uiSleep 0.1;
	_queryResult = [format["SELECT id FROM vehicles WHERE plate='%1' AND pid='%2'",_plate,_uid],2] call DB_fnc_asyncCall;
	if (count _queryResult > 0) exitWith {};
};
if (_veh isEqualType objNull) then {
	_veh setVariable["VID",_queryResult select 0,true];
};
[_uid, 10, format ["%1 hat einen %2(ID: %3) für €%4 gekauft",_unit call life_fnc_nameUID, getText(configFile >> "CfgVehicles" >> _class >> "displayName"),_queryResult select 0,_log]] call MSC_fnc_log;