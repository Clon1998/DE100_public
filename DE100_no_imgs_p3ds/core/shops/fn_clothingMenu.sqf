/*
   File:    fn_clothingMenu.sqf
   Date:    2017-10-19 23:39:59
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

if (!isNull objectParent player) exitWith {[localize "STR_NOTF_ActionInVehicle",true,"fast"] call life_fnc_notification_system;};

private _cEntry = param [3,"",[""]];
private _data =+ [_cEntry,missionNamespace getVariable ["de100_Shops",[]]] call life_fnc_dataFromKey;
if (_data isEqualTo false) exitWith {["Der Shop ist noch nicht bereit, bitte versuche es später noch einmal.", false, "fast"] call life_fnc_notification_system;};
private _license = ["license",_data] call life_fnc_dataFromKey;
private _allowedSides = ["allowedSides",_data] call life_fnc_dataFromKey;
private _playerSide = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};

if (player getVariable["nobody",false]) then {_playerSide = "nobody";};
if (!(_playerSide in _allowedSides)) exitWith {["Du kannst dir nichts in diesem Laden kaufen",false,"fast"] call life_fnc_notification_system;};

if (!([0,_license] call life_fnc_handleLicense) && _license != "") exitWith {["Du besitzt die benötigte Lizenz nicht!",false,"fast"] call life_fnc_notification_system;};

private _helper = "Logic" createVehicleLocal [0,0,0];
_helper setPos [1000,1000,1000];

private _box = [];

for "_i" from 0 to 360 step 90 do {
    private _tmp =  "UserTexture10m_F" createVehicleLocal [0,0,0];
    _tmp attachTo [_helper,[round(sin _i )* 5,round(cos _i) * 5,5]];
    _tmp setDir _i;
    _tmp setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,1)"];
    _box pushBackUnique _tmp;
};

private _tmp =  "UserTexture10m_F" createVehicleLocal [0,0,0];
_tmp attachTo [_helper,[0,0,0]];
_tmp setObjectTexture [0,"a3\map_data\gdt_concrete_co.paa"];
_tmp setVectorDirAndUp [[0,0,-1],[0,1,0]];
_box pushBackUnique _tmp;

private _light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightBrightness 0.5;
_light setLightColor [1,1,1];
_light setLightAmbient [1,1,1];
_light lightAttachObject [_helper, [0,0,0]];

private _prevObj = (typeOf player) createVehicleLocal [0,0,0];
_prevObj setUnitLoadout (getUnitLoadout player);
_prevObj attachTo [_helper, [0,0,0]];
_prevObj call life_fnc_updateClothing;

private _cam = "camera" camCreate [1000,1000,1000];
_cam camSetTarget (_prevObj modelToWorld [0,0,1]);
_cam camSetPos (_prevObj modelToWorld [1,4,2]);
_cam camSetFov 0.33;
_cam cameraEffect ["INTERNAL","BACK"];
_cam camCommit 0;
showCinemaBorder false;
with uiNamespace do {
    shopCfg = _cEntry;
    helpers = [_helper,_prevObj,_light,_box];
    cam = _cam;
};

disableSerialization;
createDialog "Life_Clothing";
setMousePosition [0.5, 0.5];