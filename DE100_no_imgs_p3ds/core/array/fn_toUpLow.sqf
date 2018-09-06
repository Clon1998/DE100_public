/*
	File:	fn_toUpLow.sqf
	Date:   2017-08-02 13:52:29
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
params[
	["_i", [""], [[]]],
	["_l",true]
];
if (_l) exitWith {
	_i apply {toUpper _x};
};
_i apply {toLower _x};