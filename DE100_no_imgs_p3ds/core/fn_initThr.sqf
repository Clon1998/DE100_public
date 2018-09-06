/*
	File:	fn_initThr.sqf
	Date:   2016-12-27 00:28:05
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private["_end"];

if(((call life_thrlevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
};

player setUnitTrait ["Medic",true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn life_fnc_intro;
if ("U_B_CombatUniform_mcam" != uniform player) then { [] call life_fnc_thrloadout; };