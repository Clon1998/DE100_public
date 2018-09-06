/*
	File:	fn_setupHousDisplay.sqf
	Date:   2017-04-30 21:56:51
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Makes the HousInventory ready to use
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]],
	["_isLocker",false]
];

private _house = if (_isLocker) then {
	lockers_obj;
} else {
	cursorObject;
};

if (_house getVariable ["forSale",false]) exitwith {
	_display closeDisplay 0;
	["Das Gebäude wird im Auktionshaus verkauft.",true,"fast"] call life_fnc_notification_system;
};
if (isNull _house || !(_house isKindOf "House_F")) exitWith {["Kein Haus",true,"fast"] call life_fnc_notification_system; _display closeDisplay 0;true;};
if ((_house getVariable["trunkUser",getPlayerUID player]) != getPlayerUID player && !_isLocker) exitWith {
	if !([_house getVariable["trunkUser",getPlayerUID player]] call life_fnc_isUIDActive) then {
		_house setVariable ["trunkUser",nil,true];
	};
	["Das Inventar wird gerade von jemand anderem benutzt",true,"fast"] call life_fnc_notification_system;
	_display closeDisplay 0;
	true;
};
private _space = _house call life_fnc_getSpace;
if (_space == 0) exitWith {["Keine Kisten",true,"fast"] call life_fnc_notification_system; _display closeDisplay 0;true;};
_house setVariable ["trunkUser",getPlayerUID player,true];
if (!_isLocker) then {
	dupeProtectionFSM = [_house,"HouseInv"] execFSM "core\fsm\dupeProtection.fsm";
};

_display setVariable ["house",_house];
(_display displayCtrl 4000) ctrlSetText (if (_isLocker) then {"Spind-Lagerboxen-System"} else {format["Lagerraum von %1",getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName")];});
setMousePosition [0.5, 0.5];
_display setVariable ["used_weapon_space",[_house,"weapon_space"] call life_fnc_getUsedSpace];
_display setVariable ["used_clothing_space",[_house,"clothing_space"] call life_fnc_getUsedSpace];
_display setVariable ["used_other_space",[_house,"other_space"] call life_fnc_getUsedSpace];
_display setVariable ["available_space",_space];

[_display displayCtrl 1001,0] call life_fnc_setupCategory;