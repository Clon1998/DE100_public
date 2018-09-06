/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
if(!isNull objectParent player) exitWith {};
_shop = _this select 3;
life_shop_type = _shop;
life_shop_npc = _this select 0;

private _side = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};

if !(_side in getArray(missionConfigFile >> "VirtualShops" >> _shop >> "side")) exitwith {
	["Du kannst darauf nicht zugreifen.",true,"fast"] call life_fnc_notification_system;
};

createDialog "shops_menu";
setMousePosition [0.5, 0.5];
[] call life_fnc_virt_update;