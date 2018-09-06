/*
   File:    fn_clothingBuy.sqf
   Date:    2017-10-21 01:05:59
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
	["_btn", controlNull, [controlNull]]
];
private _display = ctrlParent _btn;
private _lb = _display displayCtrl 4003;
if (lbSize _lb == 0) exitWith {[localize "STR_Shop_NoClothes",true,"fast"] call life_fnc_notification_system;};
private _price = 0;
private _items = [];
for "_i" from 0 to (lbsize _lb)-1 do {
	_price = _price + (_lb lbValue _i);
	_items pushbackunique (_lb lbData _i);
};

if(_price > de100_luciandjuli_mula) exitWith {[localize "STR_Shop_NotEnoughClothes",true,"fast"] call life_fnc_notification_system;};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula - _price;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];

{
	[_x,true,true] call life_fnc_handleItem_new;
	nil;
} count _items;

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 13, format ["%1 hat %2 im Wert von %3€ gekauft",player call life_fnc_nameUID, _items joinString ",",[_price] call life_fnc_numberText]]],
		["PL_fnc_updateP",false,[["CASH","GEAR"],true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 13, format ["%1 hat %2 im Wert von %3€ gekauft",player call life_fnc_nameUID, _items joinString ",",[_price] call life_fnc_numberText]]],
		["PL_fnc_updateP",false,[["CASH","GEAR"],true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};

[] call life_fnc_updateClothing;
closeDialog 0;