#include "\life_shared\script_macros.hpp"
/*
	File:	fn_sell.sqf
	Date:   2017-03-24 09:27:27
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_obj", objNull, [objNull]],
	["_price", 0, [0]]
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitwith {};
if (isNull _obj) exitwith {
	[missionNamespace,["life_action_inUse",false]] remoteExecCall ["setVariable",_unit];
};

private _class = typeOf _obj;
private _dName = getText(configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName");

private _vid = _obj getVariable ["vid",-1];
private _owner = _obj getVariable ["owner",["",""]];

if (_vid < 0 ) exitwith {
	[missionNamespace,["life_action_inUse",false]] remoteExecCall ["setVariable",_unit];
};

private _query = format["SELECT * FROM vehicles WHERE id='%1' AND chopShop IS NOT NULL",_vid];
private _result = [_query,2] call DB_fnc_asyncCall;

if (count _result > 0) exitwith {
	[format["%1 hat versucht einen %2(VID %3) zu verkaufen, obwhol dieser bereits verkauft war.",_uid,_dName,_vid],"AntiHackLog"] call A3Log;
};

[format["UPDATE vehicles SET alive='0',chopShop=NOW() WHERE id='%1'",_vid],1] call DB_fnc_asyncCall;

[_uid, 18, [format ["%1 hat ein %2(VID:%3) von %4(%5) verkauft.",_unit call life_fnc_nameUID,_dName,_vid,_owner select 1,_owner select 0],[_owner select 0, 22, format ["%1 hat ein %2(VID:%3) von %4(%5) verkauft.",_unit call life_fnc_nameUID,_dName,_vid,_owner select 1,_owner select 0]]]] call MSC_fnc_log;
[format ["%1 hat ein %2(VID:%3) von %4(%5) verkauft.",_unit call life_fnc_nameUID,_dName,_vid,_owner select 1,_owner select 0],"ChopShop"] call A3Log;

[_obj] call VEH_fnc_remContainer;
deleteVehicle _obj;

compile (format['de100_mSpace setVariable ["cT",diag_tickTime];de100_luciandjuli_mula = de100_luciandjuli_mula + %1;de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];',_price]) remoteExecCall ["call",_unit];
[2,format[(localize "STR_NOTF_ChopSoldCar"),_dName,[_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_unit];
[0,format["Ein %2 wurde von %1 verkauft.",_unit call life_fnc_name,_dName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

[missionNamespace,["life_action_inUse",false]] remoteExecCall ["setVariable",_unit];
if (_owner select 0 isEqualTo "") exitWith {};

if ({(getPlayerUID _x) isEqualTo (_owner select 0)} count allPlayers > 0) then {
	[3,format["Dein %1 wurde am Gebrauchtwagenhändler verkauft. Du kannst Dir das Fahrzeug 30 Tage lang an einem Gebrauchtwagenhändler zurückkaufen.",_dName]] remoteExecCall ["life_fnc_broadcast",(allPlayers select {(getPlayerUID _x) isEqualTo (_owner select 0)})];
};