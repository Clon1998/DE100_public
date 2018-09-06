/*
	File:	fn_name.sqf
	Date:   14.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Returns the name of a unit. Including a work around cause auf the !alive bug with the name command
	in arma3.
*/

params[
	["_u", objNull, [objNull]]
];
format["%1%2",
	(group _u) getVariable ["gang_tag",""],
	if (alive _u && isPlayer _u) then {
		name _u;
	} else {
		_u getVariable ["realname","Unbekannt"];
	}
];