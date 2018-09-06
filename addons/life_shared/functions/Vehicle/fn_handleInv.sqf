#include "\life_shared\script_macros.hpp"
/*
	File:	fn_handleInv.sqf
	Date:   2017-04-10 16:30:35
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


private ["_return"];
params [
	["_type", "", [""]],
	["_vehicle", objNull, [objNull]],
	["_itemArray", [], [[]]]
];
_return = false;
call {
	if (_type isEqualTo "SAFE") exitWith {
		private ["_weapons","_mags","_items","_backpack"];
		_weapons = getWeaponCargo _vehicle;
		_mags = getMagazineCargo _vehicle;
		_items = getItemCargo _vehicle;
		_backpack = getBackpackCargo _vehicle;

		_return = [_weapons,_mags,_items,_backpack];
	};

	if (_type isEqualTo "GET") exitWith {
		private ["_weapons","_mags","_items","_backpack","_tmpItem","_tmpAmnt"];
		_weapons = _itemArray select 0;
		_mags = _itemArray select 1;
		_items = _itemArray select 2;
		_backpack = _itemArray select 3;

		{
			_tmpItem = _x;
			_tmpAmnt = _weapons select 1 select _forEachIndex;
			_vehicle addWeaponCargoGlobal [_tmpItem,_tmpAmnt];
		} forEach (_weapons select 0);

		{
			_tmpItem = _x;
			_tmpAmnt = _mags select 1 select _forEachIndex;
			_vehicle addMagazineCargoGlobal [_tmpItem,_tmpAmnt];
		} forEach (_mags select 0);

		{
			_tmpItem = _x;
			_tmpAmnt = _items select 1 select _forEachIndex;
			_vehicle addItemCargoGlobal [_tmpItem,_tmpAmnt];
		} forEach (_items select 0);

		{
			_tmpItem = _x;
			_tmpAmnt = _items select 1 select _forEachIndex;
			_vehicle addBackpackCargoGlobal [_tmpItem,_tmpAmnt];
		} forEach (_backpack select 0);
		_return = true;
	};
};	

_return;