/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unlocks / locks the house.
*/
private["_house"];
_house = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

_state = _house getVariable["locked",true];
if(_state) then {
	_house setVariable["locked",false,true];
	[localize "STR_House_StorageUnlock",false,"fast"] call life_fnc_notification_system;
} else {
	_house setVariable["locked",true,true];
	[localize "STR_House_StorageLock",false,"fast"] call life_fnc_notification_system;
};