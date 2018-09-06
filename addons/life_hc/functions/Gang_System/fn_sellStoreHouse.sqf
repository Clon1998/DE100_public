/*
	File:	fn_sellStoreHouse.sqf
	Date:   2016-10-16 17:41:39
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_storehouse", objNull, [objNull]],
	"_houseID",
	"_housePos",
	"_ownerID",
	"_query"
];

if(isNull _storehouse) exitWith {[":HC:sellStoreHouse: Storehouse is null"] call A3Log;};

_houseID = _storehouse getVariable["house_id",-1];
if(_houseID == -1) then {
	_housePos = getPosATL _storehouse;
	_ownerID = (_storehouse getVariable "house_owner") select 0;
	_query = format["DELETE FROM storehouses WHERE gid='%1' AND pos='%2' AND owned='1'",_ownerID,_housePos];
} else {
	_query = format["DELETE FROM storehouses WHERE id='%1';",_houseID];
};
_storehouse setVariable["clothing_space",nil,true];
_storehouse setVariable["container",nil,true];
_storehouse setVariable["house_id",nil,true];
_storehouse setVariable["house_owner",nil,true];
_storehouse setVariable["other_space",nil,true];
_storehouse setVariable["trunk",nil,true];
_storehouse setVariable["trunkuser",nil,true];
_storehouse setVariable["vehspawnpoint",nil,true];
_storehouse setVariable["weapon_space",nil,true];
_storeHouse setVariable["isStorehouse",nil,true];
_storeHouse setVariable["storehouse_level",nil,true];

[_query,1] call DB_fnc_asyncCall;