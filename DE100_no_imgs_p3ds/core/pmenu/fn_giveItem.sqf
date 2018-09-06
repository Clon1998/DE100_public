/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 2010;
ctrlShow[2002,false];
if((lbCurSel 2023) == -1) exitWith {["Du hast kein Ziel ausgewählt",true,"fast"] call life_fnc_notification_system;ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = objectFromNetId _unit;
if((lbCurSel 2005) == -1) exitWith {["Du hast kein Item ausgewählt",true,"fast"] call life_fnc_notification_system;ctrlShow[2002,true];};
_item = lbData [2005,(lbCurSel 2005)];
if(isNil "_unit") exitWith {ctrlShow[2002,true];};
if(_unit == player) exitWith {ctrlShow[2002,true];};
if(isNull _unit) exitWith {ctrlShow[2002,true];};
if (_item == "") exitWith {["Du hast nichts zum geben",true,"fast"] call life_fnc_notification_system;};
//A series of checks *ugh*
if(!([_val] call life_fnc_isnumber)) exitWith {["Du hast keine Zahl eingegeben",true,"fast"] call life_fnc_notification_system;ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {["Du musst einen positiven Wert eingeben",true,"fast"] call life_fnc_notification_system;ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; ["Das augewählte Ziel ist nicht in Reichweite",true,"fast"] call life_fnc_notification_system;};
_val = [false,_item,(parseNumber _val)] call life_fnc_handleInv;
if(_val == 0) exitWith {["Du hast nicht so viel von diesem Item",true,"fast"] call life_fnc_notification_system;ctrlShow[2002,true];};
[_unit,_val,_item,player] remoteExecCall ["life_fnc_receiveItem",_unit];
_itemName =  (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"));
[format["Du hast %1 %2 %3 gegeben","der Person vor dir",_val,localize _itemName],false,"fast"] call life_fnc_notification_system;
[] call life_fnc_p_updateMenu;

ctrlShow[2002,true];