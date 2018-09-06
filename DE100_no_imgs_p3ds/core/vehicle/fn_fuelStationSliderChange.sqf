/*
	File : fn_fuelStationSliderChange.sqf
	Date:   24.11.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private["_display","_newFit"];
disableSerialization;

_display = findDisplay 29000;

_txtFit = _display displayCtrl 29003;
_txtCash = _display displayCtrl 29004;
_sliFit = _display displayCtrl 29012;

if(isNull life_fuelstation_fueltruck) then {
	_maxFit = ( floor ((de100_luciandjuli_bc / life_fuelstation_price)-1)) min life_fuelstation_fitamount;
	if(_maxFit < 1) then {_maxFit = 0;};
	_sliNew = sliderPosition _sliFit;
	if(_sliNew > _maxFit) then {
		_sliFit sliderSetPosition _maxFit;
	};
	life_fuelstation_amount = sliderPosition _sliFit;
	
	_txtCash ctrlSetText format["€%1",[round (life_fuelstation_price * life_fuelstation_amount)] call life_fnc_numberText];
};

life_fuelstation_amount = floor(sliderPosition _sliFit);
_newFit = life_fuelstation_amount;

_txtFit ctrlSetText format["%1 / %2 Liter", [life_fuelstation_amount]  call life_fnc_numberText, [life_fuelstation_fitamount]  call life_fnc_numberText];