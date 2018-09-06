/*
   File:    fn_index.sqf
   Date:    2018-5-30 12:38:59
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

private _i = _this select 0;
private _s = _this select 1;
private _r = -1;

if (count _s == 0) exitwith {_r};

{
	if(_i in _x) exitWith {
		_r = _forEachIndex;
	};
} foreach _s;

_r;