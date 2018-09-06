/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Impounds the vehicle
	#define IMPOUND 0
	#define IMPOUNDSTORE 1
*/


params[
	["_type", 0, [0]],
	["_vehicle", objNull, [objNull]]
];
if (isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Pod_Heli_Transport_04_base_F"))) exitWith {};
if (!alive _vehicle) exitWith {};
if(player distance _vehicle > 10) exitWith {};

private _vehicleData = _vehicle getVariable["owner",[]];
if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle};
private _vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

[0,format["%1 dein %2 wird von %3 %4.",(_vehicleData select 1),_vehicleName,if (playerSide isEqualTo west) then {"der Polizei";} else {"dem THR";},if (_type isEqualTo 0) then {"beschlagnahmt";} else {"abgeschleppt";}]] remoteExecCall ["life_fnc_broadcast",-2];
private _header = localize "STR_NOTF_Impounding";
private _profName = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"abschlepp_Prof";};if (playerSide isEqualTo independent) exitWith {"abschlepp_thr_Prof";};};
private _pData = _profName call life_fnc_getProf;
private _onFinish = {
	params[
		["_vehicle", objNull, [objNull]],
		["_type", 0, [0]],
		["_success", false, [false]],
		"_getXp"
	];

	if (_success) then {
		if (isNull _vehicle) exitWith {
			["Ein Fehler ist aufgetreten, bitte versuche es erneut", true, "fast"] call life_fnc_notification_system;
		};
		if((count crew _vehicle) == 0) then {
			private _price = call {
				if (_vehicle isKindOf "Car") exitWith {call life_impound_car;};
				if (_vehicle isKindOf "Ship") exitWith {call life_impound_boat;};
				if (_vehicle isKindOf "Air") exitWith {call life_impound_air;};
				if (_vehicle isKindOf "Pod_Heli_Transport_04_base_F") exitWith {call life_impound_air;};
				0;
			};

			life_impound_inuse = true;

			//Fix if Veh has Wrong Weight
			private _vehicleData = _vehicle getVariable["owner",[]];
			private _vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
			private _trunk = _vehicle getVariable["Trunk",[[],0]];
			private _weight = 0;

			_trunk = (_trunk select 0) select {(getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "safeToDB")) isEqualTo 1 && isClass (missionConfigFile >> "VirtualItems" >> (_x select 0))};
			{_weight = _weight + (getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "weight")) * (_x select 1);false} count _trunk;

			if (life_HC_isActive) then {
				if (_type isEqualTo 0) then {
					[getPlayerUID player,call life_clientId select 0,_vehicle,0,[_trunk,_weight]] remoteExecCall ["VEH_fnc_store",HC_Life];
				} else {
					[getPlayerUID player,call life_clientId select 0,_vehicle,1,[_trunk,_weight]] remoteExecCall ["VEH_fnc_store",HC_Life];
				};

			} else {
				if (_type isEqualTo 0) then {
					[getPlayerUID player,call life_clientId select 0,_vehicle,0,[_trunk,_weight]] remoteExecCall ["VEH_fnc_store",2];
				} else {
					[getPlayerUID player,call life_clientId select 0,_vehicle,1,[_trunk,_weight]] remoteExecCall ["VEH_fnc_store",2];
				};
			};
			waitUntil {!life_impound_inuse};
			[format[localize "STR_NOTF_Impounded",_vehicleName,_price],false,"fast"] call life_fnc_notification_system; 
			[0,format["%1 hat %2's %3 %4.",player call life_fnc_name,(_vehicleData select 1),_vehicleName,if (_type isEqualTo 0) then {"beschlagnahmt";} else {"abgeschleppt";}]] remoteExecCall ["life_fnc_broadcast",-2];
			de100_mSpace setVariable ["cT",diag_tickTime];
			de100_luciandjuli_bc = de100_luciandjuli_bc + _price;
			de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
			private _getxp = 0;
			private _profName = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"abschlepp_Prof";};if (playerSide isEqualTo independent) exitWith {"abschlepp_thr_Prof";};};
			if(!(_vehicle in life_vehicles)) then {
				_getxp = round ((random 50)+100);
				if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
					_getXp = _getXp * 2;
				};
				[_profName,_getxp] call life_fnc_addExp;
			};
			[format["Du hast ein Fahrzeug beschlagnahmt und dabei %1 Erfahrung erhalten.",_getxp],false,"fast"] call life_fnc_notification_system;
		} else {
			[localize "STR_NOTF_ImpoundingCancelled",true,"fast"] call life_fnc_notification_system; 
		};
	} else {
		[localize "STR_NOTF_ImpoundingCancelled",true,"fast"] call life_fnc_notification_system;
	};
	life_action_inUse = false;
};


life_action_inUse = true;
[_pData select 0,_header,compile format["!isNull objectParent player || !life_action_inUse || player distance %1 > 10",getPos _vehicle],[_vehicle,_type],_onFinish,_onFinish,true] spawn life_fnc_progressBar;