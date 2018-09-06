#include "\life_shared\script_macros.hpp"
/*
	File:	fn_fetchHouse.sqf
	Date:   2016-09-23 18:01:40
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

if(_this == "") exitWith {[];};

private _query = format["SELECT id, pos, container, inventory, space_data, vehSpawnPoint FROM houses WHERE pid='%1' AND owned='1'",_this];
private _houses = [_query,2,true] call DB_fnc_asyncCall;

{
	private _pos = parseSimpleArray format["%1",_x select 1];
	private _house = nearestBuilding _pos;
	if !(_house getVariable ["house_spawned",false]) then {
		_house allowDamage false;
		private _containerData = [_x select 2] call DB_fnc_toArray;
		private _trunk = [_x select 3] call DB_fnc_toArray;
		private _spaceData = [_x select 4] call DB_fnc_toArray;
		private _vehSpawnPoint = [_x select 5] call DB_fnc_toArray;
		if (_spaceData isEqualTo []) then {_spaceData = [[],[],[]];};
		if (_vehSpawnPoint isEqualTo []) then {_vehSpawnPoint = [0,0,0];};
		_house setVariable["house_id",_x select 0,true];
		_house setVariable["Trunk",_trunk,true];
		_house setVariable["container",_containerData,true];
		_house setVariable["weapon_space",_spaceData select 0,true];
		_house setVariable["clothing_space",_spaceData select 1,true];
		_house setVariable["other_space",_spaceData select 2,true];
		_house setVariable["VehSpawnPoint",_vehSpawnPoint,true];
		_house setVariable["house_spawned",true,true];
	};
	_houses set [_forEachIndex,_house];
} foreach _houses;

_houses