/*
	File:	fn_ClientMresToArray.sqf
	Date:   14.06.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
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