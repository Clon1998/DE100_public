/*
	File: fn_fuelStationMenu.sqf
	Author: MarioF
	
	Description:
	Fuelstation Menu handling / also for Fueltrucks
*/

private["_station","_mode","_types","_veh","_tanke","_volumen","_truckFuel","_fuelInUse","_preis","_pricemod","_type","_dis"];
disableSerialization;

_station = [_this,0,objNull] call BIS_fnc_param;
_mode = ([_this,3,""] call BIS_fnc_param) select 0;
_pricemod = ([_this,3,""] call BIS_fnc_param) select 1;

switch(_mode) do {
	case ("CAR"): {_types = ["Car"]; _dis = 8; };
	case ("FUELTRUCK"): {_types = ["Car","Air"]; _dis = 9; };
	case ("AIR"): {_types = ["Air"]; _dis = 15; };
};
if (_mode != "FUELTRUCK") then {
	{
		if(player distance (getMarkerPos (_x select 0)) < 30) exitWith {life_tankstelle = _x select 0; Life_tankvolumen = _x select 1;};
	} foreach tankstellen;
};
life_action_inUse = true;

[] spawn {
	waitUntil{!life_action_inUse};
	life_fuelstation_lockVeh = [];
	if(!isNull life_fuelstation_fueltruck) then {
		life_fuelstation_fueltruck setVariable["fueltruck_in_use",false,true];
		life_fuelstation_fueltruck = objNull;
	};
	life_fuelstation_amount = 0;
	life_fuelstation_fitamount = 0;
	if(!isNull findDisplay 29000) then { closeDialog 0 };
};

_fuelInUse = false;
if(_mode == "FUELTRUCK") then {
	if(_station getVariable["fueltruck_in_use",false]) exitWith { _fuelInUse = true };
	_station setVariable["fueltruck_in_use",true,true];
	_truckFuel = _station getVariable["stationfuel",0];
	life_fuelstation_fueltruck = _station;
};
if(_fuelInUse) exitWith {["Tanklaster bereits in benutzung!",true,"fast"] call life_fnc_notification_system; life_action_inUse = false; };

if(isNil "_types" || isNull _station) exitWith{};

if(isNull findDisplay 29000) then { createDialog "fuelstation_dialog" };
waitUntil {!isNull findDisplay 29000};
_display = findDisplay 29000;

_veh = nearestObjects[(getPos _station),_types,_dis];

if((count _veh) < 1) exitWith {["Kein Fahrzeug in der naehe.",true,"fast"] call life_fnc_notification_system; life_action_inUse = false; };

_txtTitle = _display displayCtrl 29001;
_txtVeh = _display displayCtrl 29002;
_txtFit = _display displayCtrl 29003;
_txtCash = _display displayCtrl 29004;
_listVeh = _display displayCtrl 29011;
_sliFit = _display displayCtrl 29012;
_btnRefill = _display displayCtrl 29021;

if(_mode == "FUELTRUCK") then {
	_txtTitle ctrlSetText format["Tanklaster (%1 Liter)",[_truckFuel] call life_fnc_numberText];
} else {
	_txtTitle ctrlSetText format["Tankstelle (%1 Liter)",[Life_tankvolumen] call life_fnc_numberText];
};
{
	if((_x select 0) == "oil_processed") exitWith
	{
		_preis = _x select 1;
	};
} foreach DYN_Price_array;

// Price per Litre
life_fuelstation_price = round (([(_preis / 200) * _pricemod, 2] call BIS_fnc_cutDecimals) max 3);

_txtVeh ctrlShow false;
_txtFit ctrlShow false;
_txtCash ctrlShow false;
_sliFit ctrlShow false;
_btnRefill ctrlShow false;

{
	_type = typeOf _x;
	_info = [_type] call life_fnc_fetchVehInfo;
	_owner = (_x getVariable ["owner",["",""]]) select 1;
	// if(_x in life_vehicles) then { _owner = "(Besitzer)"; };
	_kap = getNumber(missionConfigFile >> "lifeVehicles" >> _type >> "Fuel");
	_diff = _kap - (_kap * (fuel _x));
	if(_diff > 1) then {
		_listVeh lbAdd format["%2 %1", _info select 3, _owner];
		_listVeh lbSetPicture [(lbSize _listVeh)-1,(_info select 2)];
		_listVeh lbSetData [(lbSize _listVeh)-1,str(_x)];
		_listVeh lbSetValue [(lbSize _listVeh)-1,0];
	};
	
	if((_x != life_fuelstation_fueltruck) && _type in life_fuelstation_cfgTrucks && _x != _station) then {
		_kap = switch _type do { 
			case "C_Van_01_fuel_F" : {5000}; 
			case "O_Truck_02_fuel_F" : {14000}; 
			case "O_Truck_03_fuel_F": {21000};
			case "B_Truck_01_fuel_F" : {25000}; 
		};
		_diff = _kap - (_x getVariable["stationfuel",0]);
		if(_diff > 1) then {
			_listVeh lbAdd format["%2 %1 - Tank", _info select 3, _owner];
			_listVeh lbSetPicture [(lbSize _listVeh)-1,(_info select 2)];
			_listVeh lbSetData [(lbSize _listVeh)-1,str(_x)];
			_listVeh lbSetValue [(lbSize _listVeh)-1,1];
		};
	};
} foreach _veh;