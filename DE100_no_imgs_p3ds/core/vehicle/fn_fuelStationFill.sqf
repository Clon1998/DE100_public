/*
	File: fn_fuelStationSliderChange.sqf
	Author: MarioF
	
	Description:
	Changes the FuelFit
*/

private["_display","_txtStation","_txtVehicle","_upp","_ui","_progress","_pgText","_cP","_previousState","_refill","_duration","_away"];
disableSerialization;

if(!isNull findDisplay 29000) then { closeDialog 0; };

life_interrupted = false;

_veh = life_fuelstation_lockVeh select 0;
_isTrailer = life_fuelstation_lockVeh select 1;

_txtStation = "Zapfsäule";
if(!isNull life_fuelstation_fueltruck) then {
	_txtStation = getText(configFile >> "CfgVehicles" >> (typeOf life_fuelstation_fueltruck) >> "displayName");
};
_txtVehicle = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
if(_isTrailer == 1) then { _txtVehicle = _txtVehicle + " - Tank"; };
_kap = getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _veh) >> "Fuel");
if ((typeOf _veh) in life_fuelstation_cfgTrucks) then {
	_kap = switch (typeOf _veh) do { 
		case "C_Van_01_fuel_F" : {5000}; 
		case "O_Truck_02_fuel_F" : {14000}; 
		case "O_Truck_03_fuel_F": {21000};
		case "B_Truck_01_fuel_F" : {25000}; 
	};
};
_upp = format["%2 -> %1",_txtVehicle,_txtStation];
//Setup our progress bar.
_id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%1 (0 / %2 Liter)...",_upp,life_fuelstation_amount];
_progress progressSetPosition 0.01;
_cP = 0.01;
_duration = (((life_fuelstation_amount / _kap) max 0.1) min 0.7);
_away = true;

while{alive player && !life_interrupted && _cP < 1 && _away} do
{
	sleep _duration;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%1 (%2 / %3 Liter)...",_upp, (_cP * life_fuelstation_amount), life_fuelstation_amount];
	if((_veh distance player) > 20) then { _away = false; };
	if(!isNull life_fuelstation_fueltruck) then {
		if((life_fuelstation_fueltruck distance player) > 20) then {  _away = false; };
	};
};
if (_cP > 1) then {
	_cP = 1;
};
if(life_impound_inuse) exitWith {life_impound_inuse =false;life_interrupted = false;life_action_inUse = false;};
_id cutText ["","PLAIN"];
_succAmount = round (life_fuelstation_amount * _cP);

if(life_interrupted || !alive player || !_away) then {
	_txtTmp = format ["Betankungsvorgang abgebrochen, du hast %1 Liter getankt und %2 gezahl", [_succAmount] call life_fnc_numberText,[(_succAmount * life_fuelstation_price)] call life_fnc_numberText];
	[_txtTmp,true,"fast"] call life_fnc_notification_system;
} else {
	_txtTmp = format ["Betankungsvorgang erfolgreich, du hast %1 Liter getankt", [_succAmount] call life_fnc_numberText,[(_succAmount * life_fuelstation_price)] call life_fnc_numberText];
	[_txtTmp,false,"fast"] call life_fnc_notification_system;
};

if(!isNull life_fuelstation_fueltruck) then {
	_fillTrailer = ((life_fuelstation_fueltruck getVariable["stationfuel",0]) - _succAmount);
	life_fuelstation_fueltruck setVariable["stationfuel",_fillTrailer,true]; 
	if (life_HC_isActive) then {
		[getPlayerUID player,call life_clientId select 0,life_fuelstation_fueltruck getVariable ["vid",-1],_fillTrailer,1] remoteExec ["VEH_fnc_updateF",HC_Life];
	} else {
		[getPlayerUID player,call life_clientId select 0,life_fuelstation_fueltruck getVariable ["vid",-1],_fillTrailer,1] remoteExec ["VEH_fnc_updateF",2];
	};
} else {
	de100_mSpace setVariable ["cT",diag_tickTime];
	if (de100_luciandjuli_mula < (_succAmount * life_fuelstation_price)) then {
		if (de100_luciandjuli_bc > (_succAmount * life_fuelstation_price+(call life_fnc_calcDebts))) then {
			de100_luciandjuli_bc = round (de100_luciandjuli_bc - (_succAmount * life_fuelstation_price));
			[format ["Ihnen wurden €%1 von Ihrer Bank abgebucht. Vielen Dank für Ihren einkauf !",[(_succAmount * life_fuelstation_price)] call life_fnc_numberText],true,"fast"] call life_fnc_notification_system;
		} else {
			[player,"fuelThief",1] call life_fnc_addCrime;
		};
	} else {
		de100_luciandjuli_mula = round ((de100_luciandjuli_mula - (_succAmount * life_fuelstation_price)) max 0);

		[format ["Sie haben insgesamt %2 Liter getankt und €%1 bar bezahlt. Vielen Dank für Ihren einkauf !",[(_succAmount * life_fuelstation_price)] call life_fnc_numberText,[(_succAmount)] call life_fnc_numberText],true,"fast"] call life_fnc_notification_system;
	};
	de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	if (life_HC_isActive) then {
		[life_tankstelle,(Life_tankvolumen - _succAmount)] remoteExec ["HC_fnc_savefuelstation",HC_Life];
	} else {
		[life_tankstelle,(Life_tankvolumen - _succAmount)] remoteExec ["TON_fnc_savefuelstation",2];
	};
};
if(_isTrailer == 1) then {
	_kap = switch (typeOf _veh) do { 
		case "C_Van_01_fuel_F" : {5000}; 
		case "O_Truck_02_fuel_F" : {14000};
		case "O_Truck_03_fuel_F": {21000};
		case "B_Truck_01_fuel_F" : {25000}; 
	};
	_fillTrailer = ((_veh getVariable["stationfuel",0]) + _succAmount) min (_kap);
	_veh setVariable["stationfuel",_fillTrailer,true];
	if ((_veh getVariable ["vid",-1]) >= 0 && _fillTrailer > 0) then {
		if (life_HC_isActive) then {
			[getPlayerUID player,call life_clientId select 0,_veh getVariable ["vid",-1],_fillTrailer,1] remoteExec ["VEH_fnc_updateF",HC_Life];
		} else {
			[getPlayerUID player,call life_clientId select 0,_veh getVariable ["vid",-1],_fillTrailer,1] remoteExec ["VEH_fnc_updateF",2];
		};
	};
} else {
	_fillValue = (fuel _veh) + (_succAmount / (getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _veh) >> "Fuel")));
	if(local _veh) then {
		_veh setFuel _fillValue;
	} else {
		[_veh,_fillValue] remoteExec ["setFuel",_veh];		
	};
	if ((_veh getVariable ["vid",-1]) >= 0) then {
		if (life_HC_isActive) then {
			[getPlayerUID player,call life_clientId select 0,_veh getVariable ["vid",-1],fuel _veh,0] remoteExec ["VEH_fnc_updateF",HC_Life];
		} else {
			[getPlayerUID player,call life_clientId select 0,_veh getVariable ["vid",-1],fuel _veh,0] remoteExec ["VEH_fnc_updateF",2];
		};
	};
};

life_action_inUse = false;
if(life_interrupted) exitWith {life_interrupted = false;};