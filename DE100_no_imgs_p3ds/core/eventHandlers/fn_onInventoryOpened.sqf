/*
	File:	fn_onInventoryOpened.sqf
	Date:   2017-04-06 19:51:10
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_unit", objNull, [objNull]],
	["_cargo", objNull, [objNull]],
	["_secCargo", objNull, [objNull]],
	"_exit"
];

/*if (!(_cargo getVariable ["isAlive",true]) && _cargo isKindOf "Man" && !(_cargo getVariable ["steam64id",""] isEqualTo getPlayerUID player)) exitWith {
	["Du kannst nur deine eigene Leiche looten!",true,"fast"] call life_fnc_notification_system;
	true;
};*/

if (_cargo getVariable ["isDeathCreate",false]) exitWith {
	if ((_cargo getVariable ["isLocked","x"]) in ["",getPlayerUID player]) exitWith {false;};
	if (([0,"lockpick"] call life_fnc_handleVItem) == 0) exitWith {
		["Du hast keinen Dietrich um eine fremde Inventarbox zu öffnen", true, "fast"] call life_fnc_notification_system;
		true;
	};
	[5,0.1,_cargo,{
		params[
			["_create", objNull, [objNull]]
		];
		_create setVariable ["isLocked","",true];
		player action ["GEAR",_create];
	}] call lpick_fnc_openLpick;
	true;
};

if (getNumber(configFile >> "CfgVehicles" >> (typeOf _cargo) >> "isBackpack") isEqualTo 1) exitWith {
	[localize "STR_MISC_Backpack",true,"fast"] call life_fnc_notification_system;
	true;
};

if ((_cargo isKindOf "LandVehicle" || _cargo isKindOf "Ship" || _cargo isKindOf "Air" || _cargo isKindOf "Pod_Heli_Transport_04_base_F") && !(_cargo in life_vehicles) && (locked _cargo) == 2) exitwith {
	[localize "STR_MISC_VehInventory",true,"fast"] call life_fnc_notification_system;
	true;
};

if ((_cargo getVariable["trunkUser",getPlayerUID _unit]) != (getPlayerUID _unit) || !isNull (_cargo getVariable ["reviver",objNull])) exitWith {
	if !([_cargo getVariable["trunkUser",getPlayerUID _unit]] call life_fnc_isUIDActive) then {
		_cargo setVariable ["trunkUser",nil,true];
	};
	["Das Inventar wird gerade von jemand anderem benutzt",true,"fast"] call life_fnc_notification_system;
	true;
};

_exit = false;
if (!isNull _secCargo) then {
	if ((_secCargo isKindOf "LandVehicle" || _secCargo isKindOf "Ship" || _secCargo isKindOf "Air" || _secCargo isKindOf "Pod_Heli_Transport_04_base_F") && !(_secCargo in life_vehicles) && (locked _secCargo) == 2) exitwith {
		["Dir Fehlt die Berechtiung um auf ein Sekundär-Inventar zuzugreifen",true,"fast"] call life_fnc_notification_system;
		_exit = true;
	};

	if ((_secCargo getVariable["trunkUser",getPlayerUID _unit]) != (getPlayerUID _unit) || !isNull (_secCargo getVariable ["reviver",objNull])) exitWith {
		if !([_secCargo getVariable["trunkUser",getPlayerUID _unit]] call life_fnc_isUIDActive) then {
			_secCargo setVariable ["trunkUser",nil,true];
		};
		["Ein Sekundär-Inventar wird gerade von jemand anderem benutzt",true,"fast"] call life_fnc_notification_system;
		_exit = true;
	};

	if (_secCargo getVariable ["isDeathCreate",false]) exitWith {
		if ((_secCargo getVariable ["isLocked","x"]) in ["",getPlayerUID player]) exitWith {false;};
		["Du stehst zu nah an einer verschlossene Inventarbox.", true, "fast"] call life_fnc_notification_system;
		_exit = true;
	};
};
if (_exit) exitWith {true;};

if (!isNull _secCargo) then {	
	_secCargo setVariable ["trunkUser",(getPlayerUID player),true];
	_secCargo setVariable ["dupeProtection", [_secCargo,"ArmaInv"] execFSM "core\fsm\dupeProtection.fsm"];
	_cargo setVariable ["secCargo",_secCargo,true];
};

_cargo setVariable ["trunkUser",(getPlayerUID player),true];
dupeProtectionFSM = [_cargo,"ArmaInv"] execFSM "core\fsm\dupeProtection.fsm";
player setVariable ["vhcPro",str getUnitLoadout player];
[] call SOCK_fnc_ping; // make a Ping Req to make sure no one uses a lagswitch
[] spawn {
	disableSerialization;
	waitUntil {(!isNull (finddisplay 602))};
	_btn = (finddisplay 602) ctrlCreate ["RscButtonMenu", -1];
	_btn ctrlSetText "Magazine-Zusammenpacken";
	_btn ctrlSetPosition [0.515 * safezoneW + safezoneX, 0.757445 * safezoneH + safezoneY, 0.13625 * safezoneW, 0.026 * safezoneH];
	_btn buttonSetAction "closeDialog 0; call life_fnc_repackMags;";
	_btn ctrlCommit 0;
};
false;