/*
	File:	fn_initRadars.sqf
	Date:   2017-04-29 16:23:00
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _radars = bank_obj getVariable ["radars",[]];
if (_radars isEqualTo []) exitwith {};
{
	if !(isNull _x) then {
		_x call life_fnc_createRadar;
	};
	nil;
} count _radars