/*
	File:	fn_openLocker.sqf
	Date:   2017-08-09 19:26:49
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
closeDialog 0; 

if ((lockers_obj getVariable [(format["%1_%2_locker_id",getPlayerUID player,playerSide]),-1]) < 0) then {
	["Bitte habe einen Moment Gedult, dein Spind wird eingerichtet.", false, "slow"] call life_fnc_notification_system;
	if (life_HC_isActive) then {
		[playerSide, getPlayerUID player, call life_clientId select 0] remoteExec ["SS_fnc_addLocker",HC_Life];
	} else {
		[playerSide, getPlayerUID player, call life_clientId select 0] remoteExec ["SS_fnc_addLocker",2];
	};
	waitUntil {(lockers_obj getVariable [format["%1_%2_locker_id", getPlayerUID player, playerSide],-1]) >= 0};
};
uiNamespace setVariable ['De100_SSys',true];
createDialog 'virt_houseMenu';