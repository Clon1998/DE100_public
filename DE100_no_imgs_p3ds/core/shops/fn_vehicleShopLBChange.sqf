/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_buyMultiplier","_control","_index","_className","_hasLicense","_vehicleInfo","_basePrice","_trunkSpace","_maxTrunkUpdate","_ctrl","_CollorPermission","_colorArray","_displayName","_colorClass","_neededLicense"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_hasLicense = if ((_control lbValue _index) < 0) then {false;} else {true;};
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;

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
_basePrice = getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "price") * _buyMultiplier;
if ((life_veh_shop select 2) isEqualTo "tyShop") then {
	_basePrice = round(_basePrice * 0.7);
};
_trunkSpace = 0;
if (isClass (missionConfigFile >> "lifeVehicles" >> _className)) then {
	_trunkSpace = getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "vItemSpace");
};

_maxTrunkUpdate = getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "maxTrunkUpdate");
_neededLicense = getArray(missionConfigFile >> "lifeVehicles" >> _className >> "licenses");
_neededLicense = switch (playerSide) do { 
	case civilian : {_neededLicense select 0; };
	case west : {_neededLicense select 1; };
	case independent : {_neededLicense select 2;}; 
};
_neededLicense = localize (getText(missionConfigFile >> "Licenses" >> _neededLicense >> "displayName"));

[_className] call life_fnc_vehicleShop3DPreview;
ctrlShow [2330,true];
((findDisplay 2300) displayCtrl 2303) ctrlSetStructuredText parseText format[
	(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>€%1</t><br/>" +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %2 km/h<br/>" +(localize "STR_Shop_Veh_UI_HPower")+ " %3<br/>" +(localize "STR_Shop_Veh_UI_PSeats")+ " %4<br/>" +(localize "STR_Shop_Veh_UI_Trunk")+ " %5<br/>" +(localize "STR_Shop_Veh_UI_Fuel")+ " %6 Liter<br/>" +(localize "STR_Shop_Veh_UI_Armor")+ " %7<br/>" +(localize "STR_Shop_Veh_UI_ausbau")+ " %8<br/>" + "Benötigte Lizenz: %9",
	[_basePrice] call life_fnc_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	if(_trunkSpace == -1) then {"Keinen";} else {_trunkSpace;},
	(getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "Fuel")),
	_vehicleInfo select 9,
	if(_maxTrunkUpdate == 0) then {"Keine";} else {_maxTrunkUpdate;},
	if(_neededLicense isEqualTo "") then {"Keine";} else {_neededLicense;}
];

_ctrl = (findDisplay 2300) displayCtrl 2304;
lbClear _ctrl;


_CollorPermission = [(life_veh_shop select 2)];
if ((life_veh_shop select 2) == "tyShop") then {
	_CollorPermission pushBack "civ";
	_CollorPermission pushBack "reb";
};
if ((life_veh_shop select 2) == "reb") then {
	_CollorPermission pushBack "civ";
};

if ((call life_adminlevel) > 4) then {
	_CollorPermission pushBack "admin";
};

private _tier = call life_skin_tier;

if (_tier > 0) then {
	for "_i" from 1 to _tier do {
		_CollorPermission pushBack format["tier%1_%2",_i,playerSide];
	};
};

_colorArray = configProperties [
	(missionConfigFile >> "lifeVehicles" >> _className >> "TextureSources"), 
	format["count (%1 arrayIntersect (getArray(_x >> 'factions'))) > 0",_CollorPermission], 
	true
];

{
	_displayName = getText(_x >> "displayName");
	_colorClass = configName _x;
	switch (true) do { 
		case ("tyShop" in (getArray(_x >> 'factions'))) : {
			_ctrl lbAdd format["[Begr-Verfügbar] %1",_displayName];
		}; 
		case ("SkinDesMonats" in (getArray(_x >> 'factions'))) : {
			_ctrl lbAdd format["[SkinDesMonats] %1",_displayName];
		}; 
		default {
			_ctrl lbAdd format["%1",_displayName];
		}; 
	};
	_ctrl lbSetData [(lbSize _ctrl)-1,_colorClass];
} forEach _colorArray;

if(_className in ((call life_vShop_rentalOnly))) then {
	ctrlEnable [2309,false];
} else {
	ctrlEnable [2312,false];	
	if(!(life_veh_shop select 3)) then {
		ctrlEnable [2309,true];
	} else {
		ctrlEnable [2312,true];
	};
};
if (!_hasLicense) then {
	ctrlEnable [2312,false];
	ctrlEnable [2309,false];
};

lbSetCurSel[2304,0];
lbSort _ctrl;
if((lbSize _ctrl) > 1) then {
	ctrlShow[2304,true];
} else {
	ctrlShow[2304,false];
};
true;