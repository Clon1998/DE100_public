/*
	File:	fn_nearUnits.sqf
	Date:   2016-09-23 18:01:41
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _error = params[
	["_side", sideUnknown, [sideUnknown]],
	["_pos", [], [[]]],
	["_rad", 30, [0]]
];

if (!_error) exitwith {false;};

{_x != player && side _x isEqualTo _side && alive _x && _pos distance _x <= _rad} count allPlayers > 0;