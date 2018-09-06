/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Update and fill the virtual shop menu.
*/
disableSerialization;

private _display = findDisplay 2400;
private _item_list = _display displayCtrl 2401;
private _gear_list = _display displayCtrl 2402;

lbClear _item_list;
lbClear _gear_list;

if (!isClass(missionConfigFile >> "VirtualShops" >> life_shop_type)) exitWith {closeDialog 0; hint "Config does not exist?";};
ctrlSetText[2403,getText(missionConfigFile >> "VirtualShops" >> life_shop_type >> "name")];
private _shopItems = getArray(missionConfigFile >> "VirtualShops" >> life_shop_type >> "items");

{
	private _val = [0,_x] call life_fnc_handleVItem;
	if (_val > 0) then {
		private _dName = getText(missionConfigFile >> "VirtualItems" >> _x >> "displayName");
		private _icon = getText(missionConfigFile >> "VirtualItems" >> _x >> "icon");
		private _i = _gear_list lbAdd format["%2 [x%1]",_val,(localize _dName)];
		_gear_list lbSetData [_i,_x];
		if !(_icon isEqualTo "") then {
			_gear_list lbSetPicture [_i,_icon];
		};
	};
	nil;
} count _shopItems;

{
	private _price = getNumber(missionConfigFile >> "VirtualItems" >> _x >> "buyPrice");
	private _mPrice = ["BUY",_x] call life_fnc_marketGetPrice;
	if (_mPrice > 0) then {
		_price = _mPrice;
	};
	if (_price >= 0) then {
		private _dName = getText(missionConfigFile >> "VirtualItems" >> _x >> "displayName");
		private _icon = getText(missionConfigFile >> "VirtualItems" >> _x >> "icon");
		private _i = _item_list lbAdd format["%1 (€%2)",(localize _dName),[_price] call life_fnc_numberText];
		_item_list lbSetData [_i,_x];
		_item_list lbSetValue [_i,_price];
		if !(_icon isEqualTo "") then {
			_item_list lbSetPicture [_i,_icon];
		};
	};
	nil;
} count _shopItems;

[_shopItems] spawn life_fnc_marketShortView;