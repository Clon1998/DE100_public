/*
	File:	fn_weaponShopBuy.sqf
	Date:   15.07.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
private _display = findDisplay 3400;
private _itemList = _display displayCtrl 3401;

if ((count tvCurSel _itemList) == 0) exitWith {[localize "STR_Shop_Weapon_NoSelect",true,"fast"] call life_fnc_notification_system;};
_className = _itemList tvData (tvCurSel _itemList);
_price = _itemList tvValue (tvCurSel _itemList);
_itemInfo = [_className] call life_fnc_fetchCfgDetails;

if (_price > de100_luciandjuli_mula) exitWith {[localize "STR_NOTF_NotEnoughMoney",true,"fast"] call life_fnc_notification_system;};
if (!([_className,true,true] call life_fnc_handleItem_new)) exitWith {["Bezahlvorgang abgebrochen",true,"fast"] call life_fnc_notification_system;};
[format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula - _price;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];

private _bItems = _display getVariable ["boughtItems",[]];
private _i = [_itemInfo select 1,_bItems] call life_fnc_index;
if (_i < 0) then {
	_bItems pushBackUnique [_itemInfo select 1,1,_price];
} else {
	_bItems set [_i,[_itemInfo select 1,((_bItems select _i) select 1) + 1,((_bItems select _i) select 2)+_price]];
};

_display setVariable ["boughtItems",_bItems];