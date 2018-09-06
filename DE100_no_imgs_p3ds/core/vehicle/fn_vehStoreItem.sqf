/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
disableSerialization;

private _item = lbData[3503,(lbCurSel 3503)];
private _amt = parseNumber(ctrlText 3506);
private _vehicle = (findDisplay 3500) getVariable ["vehicle",objNull];
if (!isNull (findDisplay 4000)) then {
	if (lnbCurSelRow 1200 < 0) exitwith {
		["Du musst ein Item auswählen",true,"fast"] call life_fnc_notification_system;
		_vehicle = objNull;
	};
	_item = lnbData[1200,[lnbCurSelRow 1200,0]];
	_amt = parseNumber(ctrlText 1202);
	_vehicle = (findDisplay 4000) getVariable ["house",objNull];
};
if (isNull _vehicle) exitwith {};
private _containerVar = "container";
private _trunkVar = "Trunk";

if (_vehicle isEqualTo lockers_obj) then {
	_containerVar = format["%1_%2_locker_container",getPlayerUID player,playerSide];
	_trunkVar = format["%1_%2_locker_Trunk",getPlayerUID player,playerSide];
};

if (_vehicle getVariable["trunkUser",""] != getPlayerUID player && !(_vehicle isEqualTo lockers_obj)) exitWith {
	(findDisplay 3500) closeDisplay 2;
	["Das Inventar wird gerade von jemand anderem benutzt",true,"fast"] call life_fnc_notification_system;
};

if (isNull _vehicle || !alive _vehicle) exitWith {
	[localize "STR_MISC_VehDoesntExist",true,"fast"] call life_fnc_notification_system;
};

if (_amt <= 0 || _amt != round _amt) exitwith {
	["Du musst eine ganze Zahl, größer als 0, eingeben",true,"fast"] call life_fnc_notification_system;
};

if (_amt > ([0,_item] call life_fnc_handleVItem)) exitwith {
	[format["Du hast keine %1 %2",_amt,localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"))],true,"fast"] call life_fnc_notification_system;
};

private _needFuelVeh = getNumber(missionConfigFile >> "VirtualItems" >> _item >> "needFuelTruck") isEqualTo 1;
private _needGasVeh = getNumber(missionConfigFile >> "VirtualItems" >> _item >> "needGasTruck") isEqualTo 1;
private _isFuelVeh = getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "fuelVeh") == 1;
private _isGasVeh = getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "gasVeh") == 1;

if (_needFuelVeh && !_isFuelVeh) exitwith {
	["Öl kann nur in einen Tanklaster gefüllt werden!",true,"fast"] call life_fnc_notification_system;
};

if (!_needFuelVeh && _isFuelVeh) exitwith {
	["Nur Öl kann in einen Tanklaster gefüllt werden!",true,"fast"] call life_fnc_notification_system;
};

if (_needGasVeh && !_isGasVeh) exitwith {
	["Erdgas kann nur in einen Tank-Taru gefüllt werden.",true,"fast"] call life_fnc_notification_system;
};

if (!_needGasVeh && _isGasVeh) exitwith {
	["Nur Erdgas kann in den Tank-Taru gefüllt werden.",true,"fast"] call life_fnc_notification_system;
};

if (_item == "goldbar" && !(_vehicle isKindOf "LandVehicle" || _vehicle isKindOf "House_F")) exitwith {
	["Das kann nur in einem Landfahrzeug transportiert werden",true,"slow"] call life_fnc_notification_system;
};

private _trunkInfo = _vehicle getVariable [_trunkVar,[[],0]];

private _weightInfo = if (_vehicle isKindOf "House_F") then {
	[[_vehicle,_vehicle isEqualTo lockers_obj] call life_fnc_getSpace,_trunkInfo select 1];
} else {
	[_vehicle] call life_fnc_vehicleWeight;
};

if ((param[0,""]) isEqualTo "All") then {
	_amt = [0,_item] call life_fnc_handleVItem;
};
_amt = [_item,_amt,_weightInfo select 1, _weightInfo select 0] call life_fnc_canAdd;

if (_amt == 0) exitwith {
	["Das Fahrzeug ist voll oder kann so viel nicht mehr aufnehmen",true,"fast"] call life_fnc_notification_system;
};

_amt = [false,_item,_amt] call life_fnc_handleInv;
if (_amt == 0) exitwith {
	[format["Du hast nicht so viel von %1",localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"))],true,"fast"] call life_fnc_notification_system;
};

private _iWeight = [_item] call life_fnc_itemWeight;
private _weight = _iWeight * _amt;

private _tmpInv = _trunkInfo select 0;
private _index = [_item,_tmpInv] call life_fnc_index;
if (_index == -1) then {
	_tmpInv pushBack [_item,_amt];
} else {
	_tmpInv set[_index,[_item,(_tmpInv select _index select 1)+_amt]];
};
_vehicle setVariable[_trunkVar,[_tmpInv,(_weightInfo select 1) + _weight],true];

if (isNull (findDisplay 4000)) then {
	[format["Du hast %1 %2 in das Fahrzeug gelegt.",_amt,localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"))],false,"fast"] call life_fnc_notification_system;
	[_vehicle,lbCurSel 3503] call life_fnc_updateTrunkView;
	life_vehicle_session = true;
} else {
	[format["Du hast %1 %2 in das Lager gelegt.",_amt,localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"))],false,"fast"] call life_fnc_notification_system;
	[((findDisplay 4000) getVariable ["lastSelection",controlNull]) controlsGroupCtrl 3] call life_fnc_fetchVirtualItems;
	life_house_session = true;
};