/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;


if (_data == "") exitWith {["Du hast nichts zum entfernen",true,"fast"] call life_fnc_notification_system;};
if (!([_value] call life_fnc_isnumber)) exitWith {["Du hast keine Zahl eingegeben",true,"fast"] call life_fnc_notification_system;};
if (parseNumber(_value) <= 0) exitWith {["Die Anzahl muss positiv sein",true,"fast"] call life_fnc_notification_system;};


if (((getNumber(missionConfigFile >> "VirtualItems" >> _data >> "illegal")) isEqualTo 1) && ([west,getPos player,100] call life_fnc_nearUnits) && playerSide isEqualTo civilian) exitWith {["Du kannst keine illegalen Items entfernen, wenn ein Polizist in der Nähe ist.",true,"fast"] call life_fnc_notification_system;};
if (player != vehicle player) exitWith {["Du kannst nicht entfernen, wenn du in einem Fahrzeug sitzt.",true,"fast"] call life_fnc_notification_system;};
_value = [false,_data,(parseNumber _value)] call life_fnc_handleInv;
if (_value == 0) exitWith {["Du hast nicht genug von diesem Item.",false,"fast"] call life_fnc_notification_system;};
_itemName =  getText(missionConfigFile >> "VirtualItems" >> _data >> "displayName");
[format["Sie haben erfolgreich %1 %2 aus dem Inventar entfernt.",_value, localize _itemName],false,"fast"] call life_fnc_notification_system;
[] call life_fnc_p_updateMenu;