/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type","_varName","_displayName","_sideFlag","_price"];
_type = _this select 3;

if (!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
_displayName = getText(missionConfigFile >> "Licenses" >> _type >> "displayName");
_price = getNumber(missionConfigFile >> "Licenses" >> _type >> "price");

if(de100_luciandjuli_mula < _price) exitWith {[format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,localize _displayName],false,"fast"] call life_fnc_notification_system; };
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula - _price;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];

titleText[format[localize "STR_NOTF_B_1", localize _displayName,[_price] call life_fnc_numberText],"PLAIN"];
[1,[_type,true]] call life_fnc_handleLicense;

if (getNumber(missionConfigFile >> "Licenses" >> _type >> "illegal") == 1 && player getVariable ["newbee",false]) then {
	[["CASH","LICENSE","NEWBEE"]] call SOCK_fnc_updatePartial;
	player setVariable ["newBee",false,true];
	["Neulingsstatus erloschen",false,"fast"] call life_fnc_notification_system;
} else {
	[["CASH","LICENSE"]] call SOCK_fnc_updatePartial;
};