/*
	File:	fn_canAdd.sqf
	Date:   2017-03-26 00:27:50
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_i", "", [""]],
	["_v", -1, [0]],
	["_c", life_carryWeight],
	["_m", life_maxWeight]
];

if (_i isEqualTo "" || _v <= 0 || _m <= 0 || _c > _m) exitwith {0;};

private _iW = getNumber(missionConfigFile >> "VirtualItems" >> _i >> "weight");

if ((_c + (_iW * _v)) > _m) then {
	_v = floor ((_m-_c) / _iW);
};

_v max 0;