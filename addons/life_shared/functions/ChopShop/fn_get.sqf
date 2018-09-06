#include "\life_shared\script_macros.hpp"
/*
	File:	fn_get.sqf
	Date:   2017-03-24 15:47:51
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params [
	["_uid", "", [""]],
	["_cid", "", [""]]
];

if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitwith {};

private _result = [format["SELECT id,classname FROM vehicles WHERE chopShop IS NOT NULL AND pid='%1'",_uid],2,true] call DB_fnc_asyncCall;

[_result] remoteExecCall ["life_fnc_chopShopMenu",_unit];