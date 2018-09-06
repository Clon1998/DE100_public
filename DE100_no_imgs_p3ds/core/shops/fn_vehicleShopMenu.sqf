/*
	File:	fn_vehicleShopMenu.sqf
	Author: Tonic

	Description:
	Take a look for yourself.
*/

private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy","_neededLicense","_buyMultiplier","_basePrice"];
(_this select 3) params [
    ["_shop","",[""]],
    ["_sideCheck",sideUnknown,[civilian]],
    ["_spawnPoints","",["",[]]],
    ["_shopFlag","",[""]],
    ["_shopTitle","",[""]],
    ["_disableBuy",false,[true]]
];


disableSerialization;
//Long boring series of checks
if(dialog) exitWith {};
if(_shop isEqualTo "") exitWith {};
if(_sideCheck != sideUnknown && {playerSide != _sideCheck}) exitWith {[localize "STR_Shop_Veh_NotAllowed",true,"fast"] call life_fnc_notification_system;};
if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};

life_veh_shop = [_shop,_spawnPoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,_shopTitle];


if(_disableBuy) then {
	//Disable the buy button.
	ctrlEnable [2309,false];
	ctrlEnable [2312,true];
};

//Fetch the shop config.
_vehicleList = getArray(missionConfigFile >> "CarShops" >> _shop >> "vehicles");
if (count _vehicleList == 0) exitWith {["Du kannst keine Fahrzeuge hier kaufen",true,"fast"] call life_fnc_notification_system;};
_control = ((findDisplay 2300) displayCtrl 2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];



{

    _className = _x select 0;
    _levelAssert = _x select 1;
    _levelName = _levelAssert select 0;
    _levelType = _levelAssert select 1;
    _levelValue = _levelAssert select 2;
    _showall = true;
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
    if (_shopFlag isEqualTo "tyShop") then {
        _basePrice = round(_basePrice * 0.7);
    };

    if (!(_levelValue isEqualTo -1)) then {
        _level = missionNamespace getVariable _levelName;
        if (_level isEqualType {}) then {_level = (call _level);};

        _showall = switch (_levelType) do {
            case "SCALAR": {_level >= _levelValue;};
            case "BOOL": {_level;};
            case "EQUAL": {_level isEqualTo _levelValue;};
            case "ARRAY": {_level in _levelValue};
            default {false;};
        };
    };
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

    if (_showall) then {
        _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
        _control lbAdd (_vehicleInfo select 3);
        _control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
        _control lbSetData [(lbSize _control)-1,_className];
        _control lbSetValue [(lbSize _control)-1,0];
        if ((getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "illegal")) isEqualTo 1 && playerSide isEqualTo civilian) then {
            _control lbSetColor [(lbSize _control)-1, getArray(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color")];
            _control lbSetPictureColor [(lbSize _control)-1, getArray(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color")];
            _control lbSetPictureColorSelected [(lbSize _control)-1, getArray(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color")];
        };
        if (!_hasLicense) then {
            _control lbSetValue [(lbSize _control)-1,-1];
            _control lbSetColor [(lbSize _control)-1, [1,1,1,0.3]];
        };
    };
} forEach _vehicleList;
[] call life_fnc_vehicleShopInit3DPreview;

((findDisplay 2300) displayCtrl 2302) lbSetCurSel 0;