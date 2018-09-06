/*
	File:	fn_addLocker.sqf
	Date:   2016-11-16 17:52:39
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _err = params[
	["_s", sideUnknown, [sideUnknown]],
	["_uid", "", [""]],
	["_cid", "", [""]],
	"_queryResult"
];
if (!_err) exitWith {};
if (!([_uid,_cid]call AH_fnc_verify)) exitWith {};

lockers_obj setVariable[format["%1_%2_locker_Trunk", _uid, _s],[[],0],true];
lockers_obj setVariable[format["%1_%2_locker_container", _uid, _s],[if (_s isEqualTo civilian) then {"locker_storageBox";} else {"cop_storageBox";}],true];
lockers_obj setVariable[format["%1_%2_locker_weapon_space", _uid, _s],[],true];
lockers_obj setVariable[format["%1_%2_locker_clothing_space", _uid, _s],[],true];
lockers_obj setVariable[format["%1_%2_locker_other_space", _uid, _s],[],true];
lockers_obj setVariable[format["%1_%2_locker_spawned", _uid, _s],true,true];

private _query = format["INSERT INTO lockers (pid, inventory, container, space_data, side) VALUES('%1', '""[[],0]""', '""[`%2`]""', '""[[],[],[]]""','%3')",_uid,if (_s isEqualTo civilian) then {"locker_storageBox";} else {"cop_storageBox";},call {
	if (_s isEqualTo civilian) exitWith {0;};
	if (_s isEqualTo west) exitWith {1;};
	if (_s isEqualTo independent) exitWith {2;};
}];
[_query,1] call DB_fnc_asyncCall;

for "_i" from 0 to 1 step 0 do {
	uiSleep 0.1;
	_query = format["SELECT id FROM lockers WHERE pid='%1' AND side='%2'",_uid,call {
	if (_s isEqualTo civilian) exitWith {0;};
	if (_s isEqualTo west) exitWith {1;};
	if (_s isEqualTo independent) exitWith {2;};
}];
	_queryResult = [_query,2] call DB_fnc_asyncCall;
	if (count _queryResult > 0) exitWith {};
};

lockers_obj setVariable[format["%1_%2_locker_id", _uid, _s],(_queryResult select 0),true];