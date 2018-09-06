/*
	File : fn_refuelStation.sqf
	Date:   27.12.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState","_ext","_station","_cash"];
if (life_action_inUse) exitWith {};
_station = _this select 3;
_vehicle = (vehicle player);
_vendor = getPos _vehicle;
_fuelleft = _vehicle getVariable ["stationfuel",0];
life_interrupted = false;
if(!(_vehicle isKindOF "LandVehicle")) exitWith {};
if((_fuelleft <= 0 )) exitWith {["Fahrzeug ist leer. Betanke es erst!",true,"fast"] call life_fnc_notification_system;};

life_action_inUse = true;
_displayName = [(typeOf _vehicle)] call life_fnc_fetchVehInfo select 3;

_lastIndex = [_station,tankstellen] call life_fnc_index;
_tankstelle = tankstellen select _lastIndex;
_tankfuel = _tankstelle select 1;
//Setup our progress bar.
if (_tankfuel >= 60000) exitWith {["Der Tank der Tankstelle ist voll. Versuche eine andere Tankstelle zu betanken!",true,"fast"] call life_fnc_notification_system;life_action_inUse=false};
disableSerialization;
_id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["1 Liter betankt (1%1)...","%"];
_progress progressSetPosition 0.01;
_fuel = 70;
for "_i" from 0 to 1 step 0 do {
	sleep  0.5;
	_fuel = _fuel + 90;	
	if ((_tankfuel + _fuel) >= 60000) exitWith {};
	if(_fuel >= _fuelleft) exitWith {};
	_progress progressSetPosition (_fuel / _fuelleft);
	_pgText ctrlSetText format["%3 Liter betankt (%1%2)...",round((_fuel / _fuelleft) * 100),"%",[_fuel] call life_fnc_numberText];
	if(player distance _vendor > 10) exitWith {life_interrupted = true;};
	if(isNull objectParent player) exitWith {life_interrupted = true;};
	if(life_interrupted) exitWith {};
};

_fuelleft = _fuelleft - _fuel;
if (_fuelleft < 0) then {
  _fuelleft = 0;
};
_vehicle setVariable ["stationfuel",_fuelleft,true];


_tankfuelFinal = _tankfuel + _fuel;
if (_tankfuelFinal > 60000) then {_tankfuelFinal = 60000};
_fuelTenPerc = _fuel * 0.1;
_cash = 0;
while {_fuel > 0} do {
	_cashMulti = 7;
	if(_tankfuel < 40000)then{
		_cashMulti = 10;
	};
	if(_tankfuel < 10000)then{
		_cashMulti = 15;
	};	
	if(_tankfuel < 1000)then{
		_cashMulti = 20;
	};
	_cash = _cash + (_fuelTenPerc * _cashMulti);
	_tankfuel = _tankfuel + _fuelTenPerc;
	_fuel = _fuel - _fuelTenPerc;
};

if (life_HC_isActive) then {
	[_station,_tankfuelFinal] remoteExec ["HC_fnc_savefuelstation",HC_Life];
} else {
	[_station,_tankfuelFinal] remoteExec ["TON_fnc_savefuelstation",2];
};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc + _cash;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
["Tankstelle erfolgreich Betankt",false,"fast"] call life_fnc_notification_system;
[format["Dir wurden %1€ auf dein Bankkonto überwiesen", [_cash] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
life_action_inUse = false;
_id cutText ["","PLAIN"];
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false;};
