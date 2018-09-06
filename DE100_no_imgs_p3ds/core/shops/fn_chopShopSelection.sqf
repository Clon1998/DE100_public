/*
	File:	fn_chopShopSelection.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_listBox", controlNull, [controlNull]],
	["_index", 0, [0]]
];

private _display = ctrlParent _listBox;
if (_listBox lbData _index isEqualTo "exit") exitwith {};

private _className = if ((_display getVariable ["type",0]) == 0) then {
	typeOf (objectFromNetId (_listBox lbData _index));
} else {
	(_listBox lbData _index);
};
private _price = if ((_display getVariable ["type",0]) isEqualTo 0) then {
	round ((getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "price") * getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_chop_multiplier")));
} else {
    round ((getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "price") * getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_chop_bb_multiplier")));
};
private _vehInfo = [_className] call life_fnc_fetchVehInfo;

(_display displayCtrl 2001) ctrlSetStructuredText parseText format ["<t size='0.9'>Fahrzeug: %1<br/>Preis:<t color='#8cff9b'> €%2</t></t>",_vehInfo select 3,[_price] call life_fnc_numberText];	