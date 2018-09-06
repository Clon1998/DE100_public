/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_unit","_price","_action","_buyMultiplier","_basePrice"];
disableSerialization;
if(life_action_inUse) exitWith {};
if((life_action_delay != 0) && ((time - life_action_delay) < 2)) exitWith {
	ctrlEnable [2842, true];
	closeDialog 0;
};

life_action_delay = time;
life_action_inUse = true;
_action = [
	"Möchtest du das Fahrzeug wirklich verkaufen?",
	"Fahrzeug verkaufen?",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(!_action) exitWith {["Verkaufen abgebrochen",false,"fast"] call life_fnc_notification_system;ctrlEnable [2842, true];life_action_inUse = false;};
if(lbCurSel 2802 == -1) exitWith {[localize "STR_Global_NoSelection",true,"fast"] call life_fnc_notification_system;ctrlEnable [2842, true];life_action_inUse = false;};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (parseSimpleArray format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_unit = player;

if(isNil "_vehicle") exitWith {[localize "STR_Garage_Selection_Error",true,"fast"] call life_fnc_notification_system;life_action_inUse = false; ctrlEnable [2842, true];};

_buyMultiplier = switch (playerSide) do {
    case civilian: {
        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_CIVILIAN");
    };
    case west: {
        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_COP");
    };
    case independent: {
        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_THR");
    };
};

_basePrice = getNumber(missionConfigFile >> "lifeVehicles" >> _vehicle >> "price") * _buyMultiplier;

_price = round ( _basePrice * getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_sell_multiplier"));

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 11, format ["%1 hat einen %2(VID %4) für €%3 verkauft",player call life_fnc_nameUID, getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName"),[_price] call life_fnc_numberText,_vid]]],
		["VEH_fnc_delete",false,[getPlayerUID player,(call life_clientID) select 0,_vid,_vehicle]]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 11, format ["%1 hat einen %2(VID %4) für €%3 verkauft",player call life_fnc_nameUID, getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName"),[_price] call life_fnc_numberText,_vid]]],
		["VEH_fnc_delete",false,[getPlayerUID player,(call life_clientID) select 0,_vid,_vehicle]]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};

[format[localize "STR_Garage_SoldCar",[_price] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc + _price;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
closeDialog 0;
life_action_inUse = false;