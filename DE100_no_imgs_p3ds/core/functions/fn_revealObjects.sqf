/*
   File:    fn_revealObjects.sqf
   Date:    2017-10-25 19:15:38
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

{	
	player reveal _x;
	nil;
} count (nearestObjects[visiblePositionASL player, ["Man"]+(getArray(missionConfigFile >> "Life_Settings" >> "droped_items")), 15]);