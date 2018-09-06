/*
	File:	fn_upgradeStorehouse.sqf
	Date:   2016-10-16 14:21:37
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _gang = group player;
private _storeHouse = objectFromNetId (((findDisplay 2500) displayCtrl 2502) lbData (lbCurSel ((findDisplay 2500) displayCtrl 2502)));
//Place it here so we doesnt safe vars to early
private _action = [
	format["Möchtest du das Lagerhaus wirklich für €%1 von Level %2 auf Level %3 ausbauen?", [getNumber(missionConfigFile >> "life_gang_config" >> "storehouslevels" >> (format["level_%1",(_storeHouse getVariable ["storehouse_level",1]) + 1]) >> "price")] call life_fnc_numberText,(_storeHouse getVariable ["storehouse_level",1]),(_storeHouse getVariable ["storehouse_level",1]) + 1],
	"Gang Upgraden?",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (!_action) exitwith {};

private _gangBank = _gang getVariable ["gang_BANK",0];
private _gangMembers = _gang getVariable ["gang_MEMBERS",[]];
private _playerPermissions = (_gangMembers select ([getPlayerUID player,_gangMembers] call life_fnc_index)) select 1;

if !("OWNER" in _playerPermissions) exitwith {["Das kann nur der Besitzer der Gang machen.",true,"slow"] call life_fnc_notification_system;};
if ((_gang getVariable ["gang_LEVEL",1]) < getNumber(missionConfigFile >> "life_gang_config" >> "storehouslevels" >> (format["level_%1",(_storeHouse getVariable ["storehouse_level",1]) + 1]) >> "neededGanglevel")) exitwith {
	["Das Ganglevel reicht dafür nicht aus.",true,"fast"] call life_fnc_notification_system;
};

private _nextLevel = format["level_%1",(_storeHouse getVariable ["storehouse_level",1]) + 1];
private _nextLevelPrice = getNumber(missionConfigFile >> "life_gang_config" >> "storehouslevels" >> _nextLevel >> "price");

if (_nextLevelPrice > _gangBank) exitwith {
	[format["Auf dem Gangkonto ist nicht genug Geld. Es fehlen €%1",[_nextLevelPrice - _gangBank] call life_fnc_numberText],true,"slow"] call life_fnc_notification_system;
};

_gangBank = _gangBank - _nextLevelPrice;

_storeHouse setVariable ["storehouse_level",(_storeHouse getVariable ["storehouse_level",1]) + 1,true];
_gang setVariable ["gang_BANK",_gangBank,true];
[format["Das Lagerhaus ist nun auf Level %1.",_storeHouse getVariable ["storehouse_level",1]],false,"fast"] call life_fnc_notification_system;

if (life_HC_isActive) then {
	["StorehouseLevel",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_BANK",1],_storeHouse getVariable ["house_id",0],_storeHouse getVariable ["storehouse_level",0]]] remoteExec ["HC_fnc_gangUpdatePartial",HC_Life];
} else {
	["StorehouseLevel",_gang getVariable ["gang_ID",1],[_gang getVariable ["gang_BANK",1],_storeHouse getVariable ["house_id",0],_storeHouse getVariable ["storehouse_level",0]]] remoteExec ["TON_fnc_gangUpdatePartial",2];
};
[(findDisplay 2500),"storehouses","left"] call life_fnc_gangMenu;