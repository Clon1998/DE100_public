/*
	File:	fn_addStoreHouse.sqf
	Date:   2016-10-15 17:07:40
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_gangID", 0, [0]],
	["_storeHouse", objNull, [objNull]],
	["_unitID", 0, [0]],
	"_query",
	"_queryResult"
];

private _storeHousePos = getPosATL _storeHouse;
_query = format["SELECT * FROM storehouses WHERE pos = '%1'",_storeHousePos];
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (count _queryResult > 0) exitwith {
	life_storeHouse_verification = 1;
	_unitID publicVariableClient "life_storeHouse_verification";
};

_query = format["INSERT INTO storehouses (gid, pos, inventory, container, owned, space_data, level) VALUES('%1', '%2', '""[[],0]""', '""[]""', '1', '""[[],[],[]]""', '1')",_gangID,_storeHousePos];
[_query,1] call DB_fnc_asyncCall;

for "_i" from 0 to 1 step 0 do {
	uiSleep 0.1;
	_query = format["SELECT id FROM storehouses WHERE pos='%1' AND gid='%2' AND owned='1'",_storeHousePos,_gangID];
	_queryResult = [_query,2] call DB_fnc_asyncCall;
	if (count _queryResult > 0) exitWith {};
};

_storeHouse setVariable["house_id",(_queryResult select 0),true];

life_storeHouse_verification = 0;
_unitID publicVariableClient "life_storeHouse_verification";