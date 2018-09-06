/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:(life_maxWeight - life_carryWeight)
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
disableSerialization;
private _item = lbData[3502,lbCurSel 3502];
private _amt = parseNumber(ctrlText 3505);
private _vehicle = (findDisplay 3500) getVariable ["vehicle",objNull];
if (!isNull (findDisplay 4000)) then {
	if (lnbCurSelRow 1100 < 0) exitwith {
		["Du musst ein Item auswählen",true,"fast"] call life_fnc_notification_system;
		_vehicle = objNull;
	};
	_item = lnbData[1100,[lnbCurSelRow 1100,0]];
	_amt = parseNumber(ctrlText 1102);
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

private _trunkInfo = _vehicle getVariable [_trunkVar,[[],0]];
private _index = [_item,_trunkInfo select 0] call life_fnc_index;

private _storedAmt = if (_index >= 0) then {
	_trunkInfo select 0 select _index select 1;
} else {
	0;
};

if (_storedAmt == 0) exitWith {
	[format["Das Fahrzeug hat keine %1 %2",_amt,localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"))],true,"fast"] call life_fnc_notification_system;
};

if ((param[0,""]) == "All") then {
	_amt = _storedAmt;
};

if (_storedAmt < _amt) exitWith {
	[format["Das Fahrzeug hat keine %1 %2",_amt,localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"))],true,"fast"] call life_fnc_notification_system;
};

_amt = [true,_item,_amt] call life_fnc_handleInv;
if (_amt == 0) exitWith {
	[localize "STR_NOTF_InvFull",true,"fast"] call life_fnc_notification_system;
};

private _iWeight = [_item] call life_fnc_itemWeight;
private _weight = _iWeight * _amt;

private _tmpInv = _trunkInfo select 0;

if (_amt == _storedAmt) then {
	_tmpInv deleteAt _index;
} else {
	_tmpInv set[_index,[_item,(_storedAmt - _amt)]];
};
_vehicle setVariable[_trunkVar,[_tmpInv,((_trunkInfo select 1) - _weight) max 0],true];
if (isNull (findDisplay 4000)) then {
	[format["Du hast %1 %2 aus dem Fahrzeug genommen.",_amt,localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"))],false,"fast"] call life_fnc_notification_system;
	[_vehicle,lbCurSel 3502] call life_fnc_updateTrunkView;
	life_vehicle_session = true;
} else {
	[format["Du hast %1 %2 aus dem Lager genommen.",_amt,localize (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"))],false,"fast"] call life_fnc_notification_system;
	[((findDisplay 4000) getVariable ["lastSelection",controlNull]) controlsGroupCtrl 3] call life_fnc_fetchVirtualItems;
	life_house_session = true;
};