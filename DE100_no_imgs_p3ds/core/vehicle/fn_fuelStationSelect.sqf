/*
	File: fn_fuelStationSelect.sqf
	Author: MarioF
	
	Description:
	Prepares the FuelstationMenu for the Selection
*/

private["_display","_selIndex","_fitFuel","_perLitre","_cashFit","_veh"];
disableSerialization;

_listVeh = (_this select 0) select 0;
_selIndex = (_this select 0) select 1;

_display = findDisplay 29000;

_txtVeh = _display displayCtrl 29002;
_txtFit = _display displayCtrl 29003;
_txtCash = _display displayCtrl 29004;
_sliFit = _display displayCtrl 29012;
_btnRefill = _display displayCtrl 29021;
_txtCash ctrlShow false;

_nearVeh = nearestObjects[(getPos player),["Car","Air"],30];
{ if(str(_x) == (_listVeh lbData _selIndex)) exitWith { _veh = _x; }; } foreach _nearVeh;
_isTrailer = (_listVeh lbValue _selIndex);

if(isNil "_veh" || {isNull _veh}) exitWith { life_action_inUse = false; [ "Fahrzeug nicht mehr in der nähe!",true,"fast"] call life_fnc_notification_system;};

life_fuelstation_lockVeh = [_veh,_isTrailer];

_txtVeh ctrlShow true;
if(!isNull life_fuelstation_fueltruck) then {
	_txtVeh ctrlSetText format["Tanklaster"];
} else {
	_txtVeh ctrlSetText format["Zapfsäule (€%1 Liter)", life_fuelstation_price];
};

if(_isTrailer == 1) then {
	_fitFuel = switch (typeOf _veh) do { 
		case "C_Van_01_fuel_F" : {5000}; 
		case "O_Truck_02_fuel_F" : {14000}; 
		case "O_Truck_03_fuel_F": {21000};
		case "B_Truck_01_fuel_F" : {25000}; 
	};
	_fitFuel = floor (_fitFuel - (_veh getVariable["stationfuel",0]));
} else {
	_fitFuel = getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _veh) >> "Fuel");
	_fitFuel = floor (_fitFuel - ((fuel _veh) * _fitFuel));
	if(Life_tankvolumen <_fitFuel) then {_fitfuel = Life_tankvolumen;};
};
if(!isNull life_fuelstation_fueltruck) then { _fitFuel = (life_fuelstation_fueltruck getVariable["stationfuel",0]) min _fitFuel;};
life_fuelstation_fitamount = _fitFuel;

_sliFit ctrlShow true;
_sliFit sliderSetSpeed [1,1];
//if (_fitFuel > Life_tankvolumen) then {
//if (Life_tankvolumen < 1) then { _sliFit sliderSetRange [0,0]} else { _sliFit sliderSetRange [0, Life_tankvolumen];};
//}else{
_sliFit sliderSetRange [0, _fitFuel];
//};
if(isNull life_fuelstation_fueltruck) then {
	_cashFit = ( floor (de100_luciandjuli_bc / life_fuelstation_price)) min _fitFuel;
	if(_cashFit < 1) then {_btnRefill ctrlShow false;} else {_btnRefill ctrlShow true;};
	_sliFit sliderSetPosition _cashFit;
	_txtCash ctrlShow true;
	
	_txtCash ctrlSetText format["€%1",[round (_cashFit * life_fuelstation_price)] call life_fnc_numberText];
} else {
	if(_fitFuel < 1) then {_btnRefill ctrlShow false; _fitFuel = 0;} else {_btnRefill ctrlShow true;};
	_cashFit = floor _fitFuel;
};
_txtFit ctrlShow true;
_txtFit ctrlSetText format["%1 / %2 Liter", [_cashFit]  call life_fnc_numberText, [_fitFuel]  call life_fnc_numberText];
life_fuelstation_amount = _cashFit;
