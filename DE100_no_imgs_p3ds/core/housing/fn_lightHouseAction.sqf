/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lights up the house.
*/
private["_house"];
_house = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if(isNull (_house getVariable ["lightSource",objNull])) then {
	[_house,true] remoteExecCall ["life_fnc_lightHouse",-2];
} else {
	[_house,false] remoteExecCall ["life_fnc_lightHouse",-2];
};