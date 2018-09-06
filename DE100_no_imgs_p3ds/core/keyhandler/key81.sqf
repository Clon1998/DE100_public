/*
	File:	key81.sqf
	Date:   24.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
private["_shif","_ctrl","_altk","_stop","_inta"];
if (life_action_inUse || !isNull objectParent player) exitWith {};
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;
player playAction "gestureHiC";
_stop=true;
_stop