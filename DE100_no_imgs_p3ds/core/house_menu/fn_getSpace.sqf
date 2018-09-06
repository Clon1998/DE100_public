/*
	File:	fn_getSpace.sqf
	Date:   2017-01-25 19:11:43
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
params[
	["_house", objNull, [objNull]]
];

private _spaceData = if (_house isEqualTo lockers_obj) then {
	_house getVariable [format["%1_%2_locker_container",getPlayerUID player,playerSide],[]];
} else {
	_house getVariable ["container",[]];
};

private _space = 0;
{
	_space = call {
		if (_x isEqualTo "cop_storageBox") exitWith {_space + 700;};
		if (_x isEqualTo "gang_storageBox") exitWith {_space + 4000;};
		if (_x isEqualTo "big_storageBox") exitWith {_space + 900;};
		if (_x isEqualTo "small_storageBox") exitWith {_space + 700;};
		if (_x isEqualTo "locker_storageBox") exitWith {_space + 300;};
	};
	nil;
} count _spaceData;

_space;