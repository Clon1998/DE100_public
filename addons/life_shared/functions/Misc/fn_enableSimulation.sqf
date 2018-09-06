/*
   File:    fn_enableSimulation.sqf
   Date:    2018-1-19 16:35:16
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_o", objNull, [objNull]],
	["_e", false, [false]]
];
if !([_uid,_cid]call AH_fnc_verify) exitWith {};

_o enableSimulationGlobal _e;