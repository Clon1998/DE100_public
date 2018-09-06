/*
	File:	fn_timeAdd.sqf
	Date:   2017-08-24 19:45:22
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_time", [], [[]]],
	["_add", 0, [0]],
	["_array",false]
];

private _unix = [_time] call life_fnc_timeUnix;
private _newTime = [_unix+_add] call life_fnc_timeUnix;

if (_array) exitWith {
	_newTime;
};
[0,_newTime] call life_fnc_timeToStr;