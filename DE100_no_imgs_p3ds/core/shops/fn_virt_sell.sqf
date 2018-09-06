/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_price","_amount","_name","_marketprice"];
if((life_action_delay != 0) && ((time - life_action_delay) < 2)) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;life_klickcount = life_klickcount + 1; if(life_klickcount> 2) then {closeDialog 0;life_klickcount = 0;};};
life_action_delay = time;

if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_price = getNumber(missionConfigFile >> "VirtualItems" >> _type >> "sellPrice");

_marketprice = ["SELL",_type] call life_fnc_marketGetPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};

_amount = ctrlText 2405;
if(!([_amount] call life_fnc_isnumber)) exitWith {[localize "STR_Shop_Virt_NoNum",true,"fast"] call life_fnc_notification_system;};
_amount = parseNumber (_amount);
if (_this select 0 == "All") then {
	_amount = [0,_type] call life_fnc_handleVItem;
};

if (_amount > ([0,_type] call life_fnc_handleVItem)) exitWith {[localize "STR_Shop_Virt_NotEnough",true,"fast"] call life_fnc_notification_system;};

if (_type == "fissileMaterial") then {
	["fissileMaterial",_amount] spawn life_fnc_addAchievExp;
	1 call life_fnc_setTrader;
};

_price = (_price * _amount);
_name = getText(missionConfigFile >> "VirtualItems" >> _type >> "displayName");
if(([false,_type,_amount] call life_fnc_handleInv) > 0) then {
	[format[localize "STR_Shop_Virt_SellItem",_amount,localize _name,[_price] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
	de100_mSpace setVariable ["cT",diag_tickTime];
	de100_luciandjuli_mula = de100_luciandjuli_mula + _price;
	de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	if((["SELL",_type] call life_fnc_marketGetPrice) > 0) then {
		["SELL",_type,_amount] call life_fnc_dynMarketChangePrice;
	};
	[] call life_fnc_virt_update;
};

if(((life_shop_type isEqualTo "drugdealer"))) then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call life_fnc_index;
	if (!((_ind isEqualTo -1))) then {
		_val =  (_array select _ind) select 2;
		_val = _val + _amount;
		_array set[_ind,[getPlayerUID player,player call life_fnc_name,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	} else {
		_array pushBack [getPlayerUID player,player call life_fnc_name,_amount];
		life_shop_npc setVariable["sellers",_array,true];
	};
};

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["PL_fnc_updateP",false,[["GEAR","CASH"],true] call SOCK_fnc_updatePartial],
		["MSC_fnc_log",false,[getPlayerUID player,45,format["%1 hat x%2 %3 verkauft für %4€",player call life_fnc_nameUid, _amount, localize _name, [_price] call life_fnc_numberText]]]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["PL_fnc_updateP",false,[["GEAR","CASH"],true] call SOCK_fnc_updatePartial],
		["MSC_fnc_log",false,[getPlayerUID player,45,format["%1 hat x%2 %3 verkauft für %4€",player call life_fnc_nameUid, _amount, localize _name, [_price] call life_fnc_numberText]]]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};
