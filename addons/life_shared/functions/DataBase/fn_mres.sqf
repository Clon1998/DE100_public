#include "\life_shared\script_macros.hpp"
/*
	File:	fn_mres.sqf
	Date:   2017-03-22 17:46:27
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Escapes and/or converts all datatyps ready for database
*/

params[
	["_in", "", ["",[],0,true]]
];

if (_in isEqualType []) exitWith {
	str toString(toArray(str _in) apply {[_x,96] select (_x isEqualTo 34)});
};

if (_in isEqualType "") exitWith {
	toString(toArray _in - toArray "'\`|;{}-""<>");
};

if (_in isEqualType true) exitWith {
	[0,1] select _in;
};

if (_in isEqualType 0) exitWith {
	[false,true] select _in;
};