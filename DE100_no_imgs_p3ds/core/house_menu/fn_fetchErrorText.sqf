/*
	File:	fn_fetchErrorText.sqf
	Date:   2017-05-03 14:35:44
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_d", displayNull, [displayNull]]
];

(_d getVariable ["errors",[]]) joinString ", ";
