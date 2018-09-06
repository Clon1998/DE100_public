#include "\life_shared\script_macros.hpp"
/*
	File:	fn_fetchGang.sqf
	Date:   2017-03-22 23:44:43
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


private _query = format ["SELECT id, name, members, level, bank, skin, tag FROM gang_system WHERE active='1' AND members LIKE '%2%1%2'",_this,"%"];
private _queryResult = [_query,2] call DB_fnc_asyncCall;

if (count _queryResult == 0) exitWith {
	[];
};

private _tmp = [_queryResult select 2] call DB_fnc_toArray;
_queryResult set[2, _tmp];

private _return = _queryResult;

private _query = format ["SELECT id, pos, container, inventory, space_data, vehSpawnPoint, level FROM storehouses WHERE gid='%1' AND owned='1'",_return select 0];
private _queryResult = [_query,2,true] call DB_fnc_asyncCall;
{
	_tmp = [_x select 0,_x select 1];
	private _containerData = [_x select 2] call DB_fnc_toArray;
	private _trunk = [_x select 3] call DB_fnc_toArray;
	private _spaceData = [_x select 4] call DB_fnc_toArray;
	private _vehSpawnPoint = [_x select 5] call DB_fnc_toArray;
	if (_spaceData isEqualTo []) then {_spaceData = [[],[],[]];};
	if (_vehSpawnPoint isEqualTo []) then {_vehSpawnPoint = [0,0,0];};

	_tmp pushBackUnique _containerData;
	_tmp pushBackUnique _trunk;
	_tmp pushBackUnique _spaceData;
	_tmp pushBackUnique _vehSpawnPoint;
	_tmp pushBackUnique (_x select 6);
	_queryResult set [_forEachIndex,_tmp];
} foreach _queryResult;
_return pushBackUnique _queryResult;
_return;