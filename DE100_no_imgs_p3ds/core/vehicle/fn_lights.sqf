/*
	File:	fn_lights.sqf
	Date:   2017-02-26 23:48:37
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

if ((count _this) != 2) exitwith {};

_this execFSM "core\fsm\sirenLights.fsm";