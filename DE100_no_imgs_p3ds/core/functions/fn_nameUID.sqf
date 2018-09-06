/*
	File:	fn_nameUID.sqf
	Date:   2017-01-15 12:33:59
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
params[
	["_u", objNull, [objNull]]
];
format ["%1(%2)",_u call life_fnc_name,_u getVariable ["steam64id",getPlayerUID _u]];