/*
	File:	fn_removeCrime.sqf
	Date:   2017-03-31 19:00:51
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", "", [""]],
	["_notify", false, [false]],
	"_c",
	"_v"
];

private _all = bank_obj getVariable ["Crimes",[]];
private _i = [_uid,_all] call life_fnc_index;

if (_i >= 0) then {
	_all deleteAt _i;
};

bank_obj setVariable ["Crimes",_all,true];
if (_notify) then {
	["Verbrechen wurden erlassen",false,"fast"] call life_fnc_notification_system;
};