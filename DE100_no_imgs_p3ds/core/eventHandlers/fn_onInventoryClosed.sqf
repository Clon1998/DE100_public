/*
	File:	fn_onInventoryClosed.sqf
	Date:   2017-04-06 19:51:18
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_unit", objNull, [objNull]],
	["_cargo", objNull, [objNull]]
];

_cargo setVariable ['trunkUser',nil,true];
dupeProtectionFSM setFSMVariable ['stopfsm',true];
private _secCargo = _cargo getVariable ["secCargo",objNull];
if (!isNull _secCargo) then {
	(_secCargo getVariable ["dupeProtection",-1]) setFSMVariable ['stopfsm',true];
	_secCargo setVariable ['trunkUser',nil,true];
	_cargo setVariable ['secCargo',nil,true]
};

if (_cargo getVariable ["isDeathCreate",false]) exitWith {
	if (((weaponCargo _cargo) + (magazineCargo _cargo) + (itemCargo _cargo) + (backpackCargo _cargo) - ["U_C_WorkerCoveralls","H_HeadBandage_bloody_F","ItemMap","ItemRadio","ItemCompass","ItemWatch"]) isEqualTo []) then {
		deleteVehicle _cargo;
	};
};

if (_cargo in (bank_obj getVariable ["airDrops",[]])) exitWith {
	if (((weaponCargo _cargo) + (magazineCargo _cargo) + (itemCargo _cargo) + (backpackCargo _cargo)) isEqualTo []) then {
		if (life_HC_isActive) then {
			_cargo remoteExec ["AD_fnc_delAirDrop",HC_Life];
		} else {
			_cargo remoteExec ["AD_fnc_delAirDrop",2];
		};	
	};
};