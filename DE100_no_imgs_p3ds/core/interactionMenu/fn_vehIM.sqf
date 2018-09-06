/*
	File:	fn_vehIM.sqf
	Date:   2016-10-29 01:16:13
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _target = param [0,objNull,[objNull]];
if (isNull _target) exitwith {};
private _actions = [];
private _isDammaged = {
	if (_target getHit getText(_x >> "name") > 0) exitWith {true;};
	false;
} forEach ("true" configClasses (configfile >> "CfgVehicles" >> typeOf _target >> "HitPoints"));

private _isDLCVeh = !isNil {getObjectDLC cursorTarget} && _target in life_vehicles;
private _flipabel = count crew _target isEqualTo 0 && !canMove _target;
private _farmDevice = typeOf _target == "O_Truck_03_device_F";
private _cPullOut = count crew _target > 0 && (_target in life_vehicles || {!(_x getVariable ["isAlive",true]) || locked _target == 0} count crew _target > 0);
if (_target distance player > 9) exitwith {};

switch (playerSide) do { 
	case west : {
		if (_cPullOut) then {
			_actions pushBackUnique [8,localize "STR_vInAct_PullOut","closeDialog 0; life_action_target call life_fnc_pulloutAction;"];
		};
		_actions pushBackUnique [9,localize "STR_vInAct_Impound","closeDialog 0; [0,life_action_target] spawn life_fnc_impoundAction;"];
		_actions pushBackUnique [10,"Abschleppen","closeDialog 0; [1,life_action_target] spawn life_fnc_impoundAction;"];
		_actions pushBackUnique [11,localize "STR_vInAct_SearchVehicle","closeDialog 0; [life_action_target] spawn life_fnc_vehInvSearch;"];
		_actions pushBackUnique [12,localize "STR_vInAct_Registration","closeDialog 0; [life_action_target] spawn life_fnc_searchVehAction;"];
		if (_isDammaged) then {
			if ("ToolKit" in (items player)) then {
				_actions pushBackUnique [2,"Reparieren","closeDialog 0; [life_action_target] spawn life_fnc_repairTruck;"];
			};
		};
	};
	case civilian : {
		if (_cPullOut) then {
			_actions pushBackUnique [8,localize "STR_vInAct_PullOut","closeDialog 0; life_action_target call life_fnc_pulloutAction;"];
		};
		if (_target isKindOf "O_Truck_03_device_F") then {
			_actions pushBackUnique [11,localize "STR_vInAct_DeviceMine","closeDialog 0; [life_action_target] spawn life_fnc_deviceMine;"];
		};
		if (_isDammaged) then {
			if ("ToolKit" in (items player)) then {
				_actions pushBackUnique [2,"Reparieren","closeDialog 0; [life_action_target] spawn life_fnc_repairTruck;"];
			};
		};
	};
	case independent : {
		if (_isDammaged) then {
			if (([0,"toolbox"] call life_fnc_handleVItem) > 0) then {
				_actions pushBackUnique [2,"Reparieren","closeDialog 0; [life_action_target] spawn life_fnc_thrRepair;"];
			};
		};
		if (_cPullOut) then {
			_actions pushBackUnique [8,localize "STR_vInAct_PullOut","closeDialog 0; life_action_target call life_fnc_pulloutAction;"];
		};
		_actions pushBackUnique [9,localize "STR_vInAct_Impound","closeDialog 0; [0,life_action_target] spawn life_fnc_impoundAction;"];
		_actions pushBackUnique [10,"Abschleppen","closeDialog 0; [1,life_action_target] spawn life_fnc_impoundAction;"];
		_actions pushBackUnique [11,localize "STR_vInAct_Registration","closeDialog 0; [life_action_target] spawn life_fnc_searchVehAction;"];
	};
};
if (_isDammaged) then {
	_actions pushBackUnique [1,"THR Rufen","closeDialog 0; [1,life_action_target] spawn life_fnc_thrRequest;"];
};

if (_isDLCVeh) then {
	_actions pushBackUnique [3,"Einsteigen","closeDialog 0; player moveInDriver life_action_target;"];
};

if (_flipabel) then {
	_actions pushBackUnique [4,localize "STR_vInAct_Unflip","closeDialog 0; life_action_target setPos [getPos life_action_target select 0, getPos life_action_target select 1, (getPos life_action_target select 2)+1];"];
};

if (_target isKindOf "Ship") then { 
	_actions pushBackUnique [-1,localize "STR_vInAct_PushBoat","closeDialog 0; [] spawn life_fnc_pushObject;"];
};

if ((call life_adminlevel) >= 3 && playerside isEqualTo civilian) then {
	_actions pushBackUnique [11,localize "STR_vInAct_Registration","closeDialog 0; [life_action_target] spawn life_fnc_searchVehAction;"];
	_actions pushBackUnique [10,"Abschleppen","closeDialog 0; [1,life_action_target] spawn life_fnc_impoundAction;"];
};

[_target,_actions,"Fahrzeuginteraktionsmenü"] call life_fnc_openMenu;