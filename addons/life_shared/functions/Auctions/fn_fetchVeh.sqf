/*
   File:    fn_fetchVeh.sqf
   Date:    2017-9-19 17:28:27
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
	["_uid", "", [""]],
	["_cid", "", [""]]
];
if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitWith {};
private _side = side _unit;
_side = call {if (_side isEqualTo civilian) exitWith {"civ";};if (_side isEqualTo west) exitWith {"cop";};if (_side isEqualTo independent) exitWith {"thr";};};

private _queryResult = [format["SELECT id, classname, type, plate, color, inventory, upgrade FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND depository='0' AND forSale='0'",_uid,_side],2,true] call DB_fnc_asyncCall;
[controlNull,0,_queryResult] remoteExecCall ["life_fnc_setupSellVeh",_unit];