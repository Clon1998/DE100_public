/*
	File:	fn_openTrunk.sqf
	Date:   2016-08-08 22:33:30
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
private _error = params[
	["_vehicle", objNull, [objNull]]
];

if (!_error) exitWith {};
if ((_vehicle getVariable["trunkUser",(getPlayerUID player)]) != (getPlayerUID player)) exitWith {
	closeDialog 0;
	if !([_vehicle getVariable["trunkUser",getPlayerUID player]] call life_fnc_isUIDActive) then {
		_vehicle setVariable ["trunkUser",nil,true];
	};
	["Das Inventar wird gerade von jemand anderem benutzt",true,"fast"] call life_fnc_notification_system;
};
if (missionNamespace getVariable ["auc_isLoading", false]) exitWith {
	["Aufgrund eines potenziellen Netzwerklags darfst du das Inventar erst öffnen wenn das Auktionshaus alle Daten geladen hat.",true,"fast"] call life_fnc_notification_system;
};
if (dialog || (!(_vehicle isKindOf "Car") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship") && !(_vehicle isKindOf "Pod_Heli_Transport_04_base_F"))) exitWith {};
private _totalWeight = [_vehicle] call life_fnc_vehicleWeight;
if ((_totalWeight select 0) isEqualTo -1) exitWith {[localize "STR_MISC_NoStorageVeh",true,"fast"] call life_fnc_notification_system;};
if (!createDialog "TrunkMenu") exitWith {[localize "STR_MISC_DialogError",true,"fast"] call life_fnc_notification_system;};
private _display = findDisplay 3500;

_vehicle setVariable ["trunkUser",(getPlayerUID player),true];
dupeProtectionFSM = [_vehicle,"VehicleTrunk"] execFSM "core\fsm\dupeProtection.fsm";
if ((typeOf _vehicle) in getArray(missionConfigFile >> "Life_Settings" >> "vehicle_fuel_trucks")) then {
	 (_display displayCtrl 1015) ctrlShow true;
	 (_display displayCtrl 1015) ctrlSetStructuredText parseText format["Tankfüllung: %1 Liter",[_vehicle getVariable ["stationfuel",0]] call life_fnc_numberText];
} else {
	 (_display displayCtrl 1015) ctrlShow false;
};

 (_display displayCtrl 3501) ctrlSetText format["%1 - %2",(localize "STR_MISC_VehStorage"),getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")];
 (_display displayCtrl 3504) ctrlSetText format[(localize "STR_MISC_Weight")+ " %2/%1",_totalWeight select 0,_totalWeight select 1];
(findDisplay 3500) setVariable ["vehicle",_vehicle];
[_vehicle] call life_fnc_updateTrunkView;