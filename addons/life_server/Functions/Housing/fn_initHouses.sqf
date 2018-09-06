/*
	File:	fn_initHouses.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


private _start = diag_tickTime;
private _queryResult = ["SELECT `houses`.`id`, `houses`.`pid`,(SELECT `players`.`name` FROM `players` WHERE `players`.`playerid` = `houses`.`pid`),`houses`.`pos`,`houses`.`forSale`,`houses`.`inventory`,`houses`.`container`,`houses`.`space_data` FROM `houses` WHERE `houses`.`owned`='1' AND `houses`.`paid`='1'",2,true] call DB_fnc_asyncCall;

[format["House Count: %1",count _queryResult],"HouseInit"] call A3Log;

{
	[format["House initialized: %1",_x],"HouseInit"] call A3Log;
	private _p = parseSimpleArray (_x select 3);
	private _b = nearestBuilding _p;
	_b allowDamage false;
	_b setVariable["house_id",_x select 0,true];
	_b setVariable["house_owner",[_x select 1,_x select 2],true];
	for "_i" from 1 to getNumber(configFile >> "CfgVehicles" >> (typeOf _b) >> "numberOfDoors") do {
		_b setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
	if ((_x select 4) == 1) then {
		_b setVariable ["forSale",true,true];
		private _t = [_x select 5] call DB_fnc_toArray;
		private _c = [_x select 6] call DB_fnc_toArray;
		private _s = [_x select 7] call DB_fnc_toArray;
		_b setVariable["trunk",_t,true];
		_b setVariable["container",_c,true];
		_b setVariable["weapon_space",_s select 0,true];
		_b setVariable["clothing_space",_s select 1,true];
		_b setVariable["other_space",_s select 2,true];
	};
	nil;
} count _queryResult;
diag_log format ["Haus init after %1 sek",diag_tickTime - _start];
_start = diag_tickTime;
private _queryResult = ["SELECT `storehouses`.`id`,`storehouses`.`gid`,(SELECT `gang_system`.`name` FROM `gang_system` WHERE `gang_system`.`id`=`storehouses`.`gid`),`storehouses`.`pos`,`storehouses`.`forSale`,`storehouses`.`inventory`,`storehouses`.`container`,`storehouses`.`space_data` FROM `storehouses` WHERE `storehouses`.`owned`='1';",2,true] call DB_fnc_asyncCall;

[format["Storehouse Count: %1",count _queryResult],"HouseInit"] call A3Log;


{
	[format["Storehouse initialized: %1",_x],"HouseInit"] call A3Log;
	private _p = parseSimpleArray (_x select 3);
	private _b = nearestBuilding _p;
	_b allowDamage false;
	_b setVariable["house_id",_x select 0,true];
	_b setVariable["house_owner",[_x select 1,_x select 2],true];
	for "_i" from 1 to getNumber(configFile >> "CfgVehicles" >> (typeOf _b) >> "numberOfDoors") do {
		_b setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
	if ((_x select 4) == 1) then {
		_b setVariable ["forSale",true,true];
		private _t = [_x select 5] call DB_fnc_toArray;
		private _c = [_x select 6] call DB_fnc_toArray;
		private _s = [_x select 7] call DB_fnc_toArray;
		_b setVariable["trunk",_t,true];
		_b setVariable["container",_c,true];
		_b setVariable["weapon_space",_s select 0,true];
		_b setVariable["clothing_space",_s select 1,true];
		_b setVariable["other_space",_s select 2,true];
	};
	nil;
} count _queryResult;
diag_log format ["Lagerhaus init after %1 sek",diag_tickTime - _start];
