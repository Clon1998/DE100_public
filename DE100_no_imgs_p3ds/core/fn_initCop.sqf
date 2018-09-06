/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/

if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
};

if !((call life_coplevel) > 0 || (call life_adminlevel) > 0) exitWith {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
};

player setVariable["rank",((call life_coplevel)),true];
player setUnitTrait ["Medic",true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn life_fnc_intro;

[] execVM "core\joinerUI\GroupMonitor.sqf";