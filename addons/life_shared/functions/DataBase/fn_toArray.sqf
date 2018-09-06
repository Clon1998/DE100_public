#include "\life_shared\script_macros.hpp"
/*
	File:	fn_toArray.sqf
	Date:   2017-03-22 18:33:52
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_in", "",["",[]]]
];

if (_in isEqualType []) exitwith {
	_in;
};

if (_in isEqualTo "") exitwith {
	[];
};

parseSimpleArray toString(toArray _in apply {if (_x == 96) then {34;} else {_x;};});