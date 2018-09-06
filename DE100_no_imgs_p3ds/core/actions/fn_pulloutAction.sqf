/*
   File:    fn_pulloutAction.sqf
   Date:    2017-12-25 17:50:37
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

{
	player remoteExecCall ["life_fnc_pulloutVeh",_x];
	nil;
} count (crew _this);