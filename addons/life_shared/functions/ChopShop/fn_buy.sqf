#include "\life_shared\script_macros.hpp"
/*
	File:	fn_buy.sqf
	Date:   2017-03-24 11:56:27
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params [
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_vid", "", [""]],
	["_class", "", [""]],
	["_price", 0, [0]]
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitwith {};

private _dName = getText(configFile >> "CfgVehicles" >> _class >> "displayName");

[format["UPDATE vehicles SET alive='1', active='0', chopShop=NULL  WHERE id='%1'",_vid],1] call DB_fnc_asyncCall;

[format["BOUGHTBACK | %1 hat seinen %2(VID: %3) zurückgekauft",_unit call life_fnc_nameUID,_dName,_vid],"ChopShop"] call A3Log;
[getPlayerUID _unit, 19, format ["%1 hat seinen %2(VID:%3) für €%4 zurückgekauft.",_unit call life_fnc_nameUID,_dName,_vid,[_price] call life_fnc_numberText]] call MSC_fnc_log;
compile (format['de100_mSpace setVariable ["cT",diag_tickTime];de100_luciandjuli_bc = de100_luciandjuli_bc - %1;de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc]; life_action_inUse = false;',_price]) remoteExecCall ["call",_unit];
[2,format["Dein %1 wurde für €%2 zurückgekauft und in deine Garage gestellt.",_dName,[_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_unit];