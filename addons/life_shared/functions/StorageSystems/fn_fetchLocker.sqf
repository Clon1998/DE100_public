#include "\life_shared\script_macros.hpp"
/*
	File:	fn_fetchLocker.sqf
	Date:   2016-11-15 16:01:09
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _query = format ["SELECT id, container, inventory, space_data, side FROM lockers WHERE pid='%1'",_this];
private _queryResult = [_query,2,true] call DB_fnc_asyncCall;
{
	private _side = [civilian,west,independent] select (_x select 4);
	if !(lockers_obj getVariable [format["%1_%2_locker_spawned", _this, _side],false]) then {
		private _containerData = [_x select 1] call DB_fnc_toArray;
		private _trunk = [_x select 2] call DB_fnc_toArray;
		private _spaceData = [_x select 3] call DB_fnc_toArray;

		lockers_obj setVariable[format["%1_%2_locker_spawned",_this,_side],true,true];
		lockers_obj setVariable[format["%1_%2_locker_id",_this,_side],_x select 0,true];
		lockers_obj setVariable[format["%1_%2_locker_Trunk",_this,_side],_trunk,true];
		lockers_obj setVariable[format["%1_%2_locker_container",_this,_side],_containerData,true];
		lockers_obj setVariable[format["%1_%2_locker_weapon_space",_this,_side],_spaceData select 0,true];
		lockers_obj setVariable[format["%1_%2_locker_clothing_space",_this,_side],_spaceData select 1,true];
		lockers_obj setVariable[format["%1_%2_locker_other_space",_this,_side],_spaceData select 2,true];
	};
	_queryResult set [_forEachIndex,_x select 0];
} foreach _queryResult;

_queryResult;