/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorClass","_spawnPoint","_vehicle","_weight","_buyMultiplier","_rentMultiplier","_purchasePrice"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {[localize "STR_Shop_Veh_DidntPick",true,"fast"] call life_fnc_notification_system; closeDialog 0;};
_className = lbData[2302,(lbCurSel 2302)];
_basePrice = getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "price");
_colorClass = lbData[2304,(lbCurSel 2304)];
if (_colorClass isEqualTo "") then {
	_colorClass = "Default";
};
if(_basePrice < 0) exitWith {closeDialog 0;}; //Bad price entry

switch (playerSide) do {
    case civilian: {
        _buyMultiplier = getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_CIVILIAN");
        _rentMultiplier = getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_CIVILIAN");
    };
    case west: {
        _buyMultiplier = getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_COP");
        _rentMultiplier = getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_COP");
    };
    case independent: {
        _buyMultiplier = getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_THR");
        _rentMultiplier = getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_THR");
    };
};
if (_mode) then {
	_purchasePrice = round(_basePrice * _buyMultiplier);
} else {
	_purchasePrice = round(_basePrice * _rentMultiplier);
};
//Prices for the TyShop
if ((life_veh_shop select 2) isEqualTo "tyShop") then {
	_purchasePrice = round(_purchasePrice * 0.7);
};

if(de100_luciandjuli_mula < _purchasePrice) exitWith {[format[localize "STR_Shop_Veh_NotEnough",[_purchasePrice - de100_luciandjuli_mula] call life_fnc_numberText],true,"fast"] call life_fnc_notification_system; closeDialog 0;};
private _hasLicense = call {
	private _lConfig = getArray(missionConfigFile >> "lifeVehicles" >> _className >> "licenses");
	if (playerSide isEqualTo civilian) exitWith {
		_lConfig = _lConfig select 0;
		if (_lConfig isEqualTo "") exitwith {true;};
		[0,_lConfig] call life_fnc_handleLicense;
	};

	if (playerSide isEqualTo west) exitWith {
		_lConfig = _lConfig select 1;
		if (_lConfig isEqualTo "") exitwith {true;};
		[0,_lConfig] call life_fnc_handleLicense;
	};

	if (playerSide isEqualTo independent) exitWith {
		_lConfig = _lConfig select 2;
		if (_lConfig isEqualTo "") exitwith {true;};
		[0,_lConfig] call life_fnc_handleLicense;
	};
	false;
};	

if(!_hasLicense) exitWith {[localize "STR_Shop_Veh_NoLicense",true,"fast"] call life_fnc_notification_system; closeDialog 0;};
_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) == "med_air_hs" && typeName _spawnPoints == "STRING") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air","Pod_Heli_Transport_04_base_F"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(_spawnPoints isEqualType []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air","Pod_Heli_Transport_04_base_F"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air","Pod_Heli_Transport_04_base_F"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};



if(_spawnPoint == "") exitWith {[localize "STR_Shop_Veh_Block",true,"fast"] call life_fnc_notification_system; closeDialog 0;};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula - _purchasePrice;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
[format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs" && typeName _spawnPoints == "STRING") then {
	_vehicle = createVehicle [_className,[0,0,0],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	_vehicle lock 2;
	//[_vehicle,_colorIndex,true] remoteExec ["life_fnc_colorVehicle",-2];
	[_vehicle,_colorClass,true] call life_fnc_colorVehicle;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable ["trunk_in_use",false,true];
	_vehicle setVariable ["key_owners",[[getPlayerUID player,player call life_fnc_name]],true];
	_vehicle setVariable ["owner",[getPlayerUID player,player call life_fnc_name],true];
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	//[_vehicle,_colorIndex,true] remoteExec ["life_fnc_colorVehicle",-2];
	[_vehicle,_colorClass,true] call life_fnc_colorVehicle;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable ["trunk_in_use",false,true];
	_vehicle setVariable ["key_owners",[[getPlayerUID player,player call life_fnc_name]],true];
	_vehicle setVariable ["owner",[getPlayerUID player,player call life_fnc_name],true];
};
if((life_veh_shop select 0) == "job_2") then {
	_vehicle setvariable ["taxi_offroad",true,true];
};
if((typeOf _vehicle) in ["C_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_fuel_black_F"]) then {
	_vehicle setFuelCargo 0;
	_vehicle setvariable ["stationfuel",0,true];
};

if((typeOf _vehicle) in ["O_Truck_02_Ammo_F","I_Truck_02_ammo_F","B_Truck_01_ammo_F"]) then {
	_vehicle setAmmoCargo 0;
};

if (getRepairCargo _vehicle > 0) then {
	_vehicle setRepairCargo 0
};

if((typeOf _vehicle) in ["B_Truck_01_fuel_F","O_Truck_02_fuel_F","C_Van_01_fuel_F","O_Truck_03_fuel_F"]) then {
	[_vehicle] remoteExecCall ["life_fnc_fuelStationAdd",-2];
};
if (playerSide != west) then {
	 _vehicle disableTIEquipment true;
};
switch (true) do { 
	case ((life_veh_shop select 2) == "cop") : {
		_vehicle setVariable["lights",false,true];
	}; 
	
	case ((life_veh_shop select 2) == "thr") : {
		_vehicle setVariable["lights",false,true];
	};
};

[_vehicle,_colorClass] call life_fnc_vehicleAnimate;

if !(_vehicle isKindOf "Pod_Heli_Transport_04_base_F") then {
	_vehicle enableRopeAttach false;
};

[_vehicle] call life_fnc_setupVehicleEVH;

life_newBought pushBack _vehicle;
life_newBought = life_newBought - [objNull];
_vehicle setVariable ["spawnIndicator",true];
[_vehicle] call life_fnc_safeKey;
private _fncs = [["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial]];
if(_mode) then {
	_fncs pushBack ["VEH_fnc_insert",true,[getPlayerUID player,call life_clientId select 0,_vehicle,_colorClass,[_purchasePrice] call life_fnc_numberText]];
} else {
	_fncs pushBack ["MSC_fnc_log",false,[getPlayerUID player, 10, format ["%1 hat einen %2 für €%3 gemietet",player call life_fnc_nameUID, getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText]]];
	_vehicle setVariable["rented",true,true];
};

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,_fncs] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,_fncs] remoteExecCall ["MSC_fnc_execStack",2];
};
//Else handle the vehicle weight ourselves.
_weight = 0;
if (isClass (missionConfigFile >> "lifeVehicles" >> _className)) then {
	_weight = getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "vItemSpace");
};
if(_weight >= 5) then { //Theres space, so add a default Fuel item.
	_vehicle setVariable["Trunk",[[["fuelFull",1]],5],true];
} else {
	_vehicle setVariable["Trunk",[[],0],true];
};
closeDialog 0; //Exit the menu.
_vehicle allowDamage true;
_vehicle setdamage 0;
true;