/*
   File:    fn_initHouses.sqf
   Date:    2017-10-6 13:26:45
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

{
	if !(_x getVariable ["forSale",false]) then {
		_marker = createMarkerLocal [format["house_%1",netId _x],getPosATL _x];
		_marker setMarkerTextLocal (getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName"));
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "loc_Lighthouse";
	};
	nil;
} count life_houses;