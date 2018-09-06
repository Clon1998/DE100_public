private["_vehicle","_displayName","_ui","_progress","_pgText","_cP"];

_vehicle = (vehicle player);
_vendor = getPos _vehicle;
life_interrupted = false;
if(!(_vehicle isKindOF "LandVehicle")) exitWith {};
life_action_inUse = true;
_displayName = [(typeOf _vehicle)] call life_fnc_fetchVehInfo select 3;
_crntFuel =	_vehicle getVariable ["stationfuel",0];
_fuelCap = switch (typeOf _vehicle) do { 
	case "C_Van_01_fuel_F" : {5000}; 
	case "O_Truck_02_fuel_F" : {14000}; 
	case "O_Truck_03_fuel_F": {21000};
	case "B_Truck_01_fuel_F" : {25000}; 
};
if((_crntFuel >= _fuelCap)) exitWith {["Fahrzeug ist bereits Betankt!",true,"fast"] call life_fnc_notification_system;};
_fuelcap = _fuelcap - _crntFuel;
//Setup our progress bar.
disableSerialization;
_id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["0 Liter getankt (0%1)...","%"];
_progress progressSetPosition 0.01;
_fuel = 10;
for "_i" from 0 to 1 step 0 do {
	sleep  0.5;
	_fuel = _fuel + 80;
	if(_fuel >= _fuelcap) exitWith { _fuel = _fuelcap;};
	_progress progressSetPosition (_fuel / _fuelcap);
	_pgText ctrlSetText format["%3 (%1%2)...",round((_fuel / _fuelcap) * 100),"%",format["%1 Liter getankt",[_fuel] call life_fnc_numberText]];
	if(player distance _vendor > 10) exitWith {life_interrupted = true;};
	if(isNull objectParent player) exitWith {life_interrupted = true;};
	if(life_interrupted) exitWith {};
};
[format["%1 hat %2 Liter getankt", _displayName, [_fuel] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
_fuel = _crntFuel + _fuel;
_vehicle setVariable ["stationfuel",_fuel,true];
life_action_inUse = false;
_id cutText ["","PLAIN"];
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false;_id cutText ["","PLAIN"];};
