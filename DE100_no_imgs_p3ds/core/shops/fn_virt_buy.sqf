/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buy a virtual item from the store.
*/
if((life_action_delay != 0) && ((time - life_action_delay) < 0.2)) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;life_klickcount = life_klickcount + 1; if(life_klickcount> 2) then {closeDialog 0;life_klickcount = 0;};};
life_action_delay = time;

if((lbCurSel 2401) == -1) exitWith {[localize "STR_Shop_Virt_Nothing",true,"fast"] call life_fnc_notification_system;};
private _item = lbData[2401,(lbCurSel 2401)];
private _price = if ((["BUY",_item] call life_fnc_marketGetPrice) > 0) then {
	["BUY",_item] call life_fnc_marketGetPrice;
} else {
	getNumber(missionConfigFile >> "VirtualItems" >> _item >> "buyPrice");
};
private _amount = ctrlText 2404;
if(!([_amount] call life_fnc_isnumber)) exitWith { [localize "STR_Shop_Virt_NoNum",true,"fast"] call life_fnc_notification_system;};
_amount = parseNumber(_amount);

private _cAdd = [_item,_amount] call life_fnc_canAdd;

if(_cAdd <= 0) exitWith { [localize "STR_NOTF_NoSpace",true,"fast"] call life_fnc_notification_system;};
_amount = _cAdd;
if((_price * _amount) > de100_luciandjuli_mula) exitWith { [localize "STR_NOTF_NotEnoughMoney",true,"fast"] call life_fnc_notification_system;};

_name = getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName");

if(([true,_item,_amount] call life_fnc_handleInv) > 0) then {
	[format[localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
	de100_mSpace setVariable ["cT",diag_tickTime];
	de100_luciandjuli_mula = de100_luciandjuli_mula - _price * _amount;
	de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	if((["BUY",_item] call life_fnc_marketGetPrice) > 0) then { 
		["BUY",_item,_amount] call life_fnc_dynMarketChangePrice;		
	};
	[] call life_fnc_virt_update;
};

[["GEAR","CASH"]] call SOCK_fnc_updatePartial;