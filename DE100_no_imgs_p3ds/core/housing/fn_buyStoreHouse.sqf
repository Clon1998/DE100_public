/*
	File:	fn_buyStoreHouse.sqf
	Date:   2016-10-15 16:40:19
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _storeHouse = param [0,objNull,[objNull]];


if (isNull _storeHouse) exitWith {};
if (!(_storeHouse isKindOf "House_F")) exitWith {};
if (count (_storeHouse getVariable ["house_owner",[]]) > 0) exitWith {["Das Lagerhaus gehört bereits einer anderen Gang",true,"fast"] call life_fnc_notification_system;};


closeDialog 0;
private _gang = group player;
private _price = getNumber(missionConfigFile >> "life_gang_config" >> "gang_storeRoom_price");
private _storehouseMax = getNumber(missionConfigFile >> "life_gang_config" >> "levels" >> format["level_%1",(_gang getVariable ["gang_LEVEL",1])] >> "storehouses");

if (count (_gang getVariable ["gang_HOUSES",[]]) >= _storehouseMax) exitWith {
	[format["Du hast bereits die maximale Anzahl, %1 Lagerhäuser, an Lagerhäusern gekauft.",_storehouseMax],true,"fast"] call life_fnc_notification_system;
};
private _action = [
	format["Möchtest du das Lagerhaus für €%1 für deine Gang %2 kaufen?", [_price] call life_fnc_numberText, _gang getVariable ["gang_NAME",""]],
	"Lagerhaus kaufen?",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (!_action) exitwith {};
private _marker = ["Dealer1_pos1", "Dealer1_pos2", "Dealer1_pos3","Dealer2_pos1", "Dealer2_pos2", "Dealer2_pos3","Dealer3_pos1", "Dealer3_pos2", "Dealer3_pos3"] + getArray(missionConfigFile >> "Marker" >> "Resource_Fields_legal" >> "markers") + getArray(missionConfigFile >> "Marker" >> "Resource_Fields_illegal" >> "markers") + getArray(missionConfigFile >> "Marker" >> "Processing_legal" >> "markers") + getArray(missionConfigFile >> "Marker" >> "Processing_illegal" >> "markers") + getArray(missionConfigFile >> "Marker" >> "Dealer_legal" >> "markers") + getArray(missionConfigFile >> "Marker" >> "Dealer_illegal" >> "markers");
private _exit = false;

{
	if (getMarkerPos _x distance getPosATL _storeHouse < 500) exitWith {
		_exit = true;
	};
} forEach _marker;
if (_exit) exitwith {
	["Das Lagerhaus muss mindestens 500 m weit weg von Rohstoffhändler, Rohstoffquellen und Verabeitern sein.",false,"fast"] call life_fnc_notification_system;
};

life_storeHouse_verification = -1;
private _gangBank = _gang getVariable ["gang_BANK",0];

if (_gangBank < _price) exitWith {
	[format["Auf dem Gangkonto ist nicht genug Geld. Es fehlen €%1",[_price - _gangBank] call life_fnc_numberText],true,"slow"] call life_fnc_notification_system;
};
_gangBank = _gangBank - _price;
_gang setVariable ["gang_BANK",_gangBank,true];

if (life_HC_isActive) then {
	[_gang getVariable ["gang_ID",0],_storeHouse,clientOwner] remoteExec ["HC_fnc_addStoreHouse",HC_Life];
} else {
	[_gang getVariable ["gang_ID",0],_storeHouse,clientOwner] remoteExec ["TON_fnc_addStoreHouse",2];
};

waitUntil {life_storeHouse_verification >= 0};
if (life_storeHouse_verification > 0) exitwith {
	["Das Lagerhaus gehört bereits einer anderen Gang",true,"fast"] call life_fnc_notification_system;
	_gangBank = (_gang getVariable ["gang_BANK",0]) + _price;
	_gang setVariable ["gang_BANK",_gangBank,true];
};

_storeHouse setVariable["house_owner",[_gang getVariable ["gang_ID",0],_gang getVariable ["gang_NAME",""]],true];
_storeHouse setVariable["Trunk",[[],0],true];
_storeHouse setVariable["container",[],true];
_storeHouse setVariable["weapon_space",[],true];
_storeHouse setVariable["clothing_space",[],true];
_storeHouse setVariable["other_space",[],true];
_storeHouse setVariable["storehouse_level",1,true];
_storeHouse setVariable["isStorehouse",true,true];
_storeHouse allowDamage false;
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _storeHouse) >> "numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_storeHouse setVariable[format["bis_disabled_Door_%1",_i],1,true];
};
private _gangHouses = _gang getVariable ["gang_HOUSES",[]];
_gangHouses pushBackUnique _storeHouse;
_gang setVariable ["gang_HOUSES",_gangHouses,true];

[_storeHouse] remoteExecCall ["life_fnc_storeHouseInitLocal",units _gang];

if (life_HC_isActive) then {
	["Bank",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_BANK",1]]] remoteExecCall ["HC_fnc_gangUpdatePartial",HC_Life];
} else {
	["Bank",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_BANK",1]]] remoteExecCall ["TON_fnc_gangUpdatePartial",2];
};
["Lagerhaus gekauft",false,"fast"] call life_fnc_notification_system;