/*
	File : fn_smartphone_map.sqf
	Date:   29.10.2015	
	Author: Patrick "Lucian" Schmidt

	Description:
	Take a look for yourself.
*/


switch (playerSide) do {
	case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
	case independent: {if(!visibleMap) then {[] spawn life_fnc_thrMarker;}};
	case civilian: {if(!visibleMap) then {[] spawn life_fnc_civMarker;};};
};