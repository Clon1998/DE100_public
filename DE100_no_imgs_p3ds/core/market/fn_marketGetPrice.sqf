/*
	File : fn_marketGetPrice.sqf
	Date:   07.01.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params [
	["_mode", "", [""]],
	["_shortname", "", [""]],
	"_ret"
];

_ret = -1;

private _vIndex = [_shortname,DYN_Price_array] call life_fnc_index;
if (_vIndex >= 0) then {
	_ret = DYN_Price_array select _vIndex select 1;
};

if (_mode isEqualTo "BUY" && _vIndex >= 0) then {
	_ret = _ret * 5;
};

_ret;