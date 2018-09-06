/*
	File:	fn_clientBool.sqf
	Date:   02.09.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_in", 0, [false,0]]
];

if (_in isEqualType true) exitWith {
	[0,1] select _in;
};

if (_in isEqualType 0) exitWith {
	[false,true] select _in;
};