/*
	File:	fn_lockersIM.sqf
	Date:   2016-11-16 17:40:36
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _locker = param [0,objNull,[objNull]];
private _actions = [];
if (isNull _locker) exitwith {};

_actions pushBackUnique [5,"Spind öffnen","[] spawn life_fnc_openLocker;"];

if (count _actions == 0) exitwith {};
[_locker,_actions,"Spindinteraktionsmenü"] call life_fnc_openMenu;