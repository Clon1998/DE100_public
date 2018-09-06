#include "\life_shared\script_macros.hpp"
/*
	File:	fn_getUnit.sqf
	Date:   2017-03-22 23:22:37
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", "", [""]]
];
private _unit = objNull;

{
	if (getPlayerUID _x isEqualTo _uid) exitwith {
		_unit = _x;
	};
	nil
} count allPlayers;

_unit;