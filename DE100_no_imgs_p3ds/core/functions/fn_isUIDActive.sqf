/*
	File:	fn_isUIDActive.sqf
	Date:   2016-09-23 18:01:41
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", "", [""]],
	["_side",sideUnknown]
];
if (_uid isEqualTo "") exitwith {false;};

{getPlayerUID _x isEqualTo _uid && (side _x isEqualTo _side || _side isEqualTo sideUnknown)} count allPlayers > 0;