/*
	File:	fn_sellStorehouse.sqf
	Date:   2016-10-16 17:27:28
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_storehouse", objNull, [objNull]]
];
private _gang = group player;
private _price = getNumber(missionConfigFile >> "life_gang_config" >> "gang_storeRoom_price");

private _action = [
	format["Möchtest du das Lagerhaus von deiner Gang %2 für €%1 verkaufen? Alle Items, Upgrades und Kisten gehen verloren.", [_price/2] call life_fnc_numberText, _gang getVariable ["gang_NAME",""]],	
	"Lagerhaus verkaufen?",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (!_action) exitwith {};

private _gangBank = _gang getVariable ["gang_BANK",0];
_gangBank = _gangBank + (_price/2);
_gang setVariable ["gang_BANK",_gangBank,true];

private _gangHouses = _gang getVariable ["gang_HOUSES",[]];
_gangHouses deleteAt (_gangHouses find _storeHouse);
_gang setVariable ["gang_HOUSES",_gangHouses,true];

[_storehouse] remoteExecCall ["life_fnc_removeStorehoselocal",units _gang];

_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _storehouse) >> "numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_storehouse setVariable[format["bis_disabled_Door_%1",_i],0,true];
};
if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["HC_fnc_sellStoreHouse",false,[_storehouse]],
		["HC_fnc_gangUpdatePartial",false,["Bank",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_BANK",1]]]]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["TON_fnc_sellStoreHouse",false,[_storehouse]],
		["TON_fnc_gangUpdatePartial",false,["Bank",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_BANK",1]]]]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};
["Lagerhaus verkauft",false,"fast"] call life_fnc_notification_system;
[(findDisplay 2500),"storehouses","left"] call life_fnc_gangMenu;