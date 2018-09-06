/*
	File:	fn_lbSelChange.sqf
	Date:   2017-03-30 16:20:22
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_lb", controlNull, [controlNull]],
	["_i", 0, [0]]
];
_m = _lb lbData _i;
if (_m isEqualTo "error") exitWith {};

mapAnimAdd [0.5, 0.05, markerPos _m];
mapAnimCommit;