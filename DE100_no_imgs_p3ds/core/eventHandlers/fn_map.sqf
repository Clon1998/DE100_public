/*
	File:	fn_map.sqf
	Date:   2016-08-17 01:33:55
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_mapIsOpened", true, [true]],
	["_mapIsForced", true, [true]]
];

if (!_mapIsOpened) exitWith {
	call life_fnc_hudShow;
	if (findDisplay 12 getVariable ["MarkerSystemPos",false]) then {
		["instant"] spawn life_fnc_hideMarkerSystem;
	};

	if (!isNull (findDisplay 12 getVariable ["MarkerSearchEdit",controlNull])) then {
		ctrlDelete (findDisplay 12 getVariable ["MarkerSearchEdit",controlNull]);
	};

	if (!isNull (findDisplay 12 getVariable ["MarkerSearchLb",controlNull])) then {
		ctrlDelete (findDisplay 12 getVariable ["MarkerSearchLb",controlNull]);
	};
};
1 call life_fnc_hudHide;
if !(findDisplay 12 getVariable ["MarkerSystemInit",false]) then {call life_fnc_createMarkerSystem;};

call {
	if (playerSide isEqualTo civilian) exitWith {[] spawn life_fnc_civMarker;};
	if (playerSide isEqualTo west) exitWith {[] spawn life_fnc_copMarkers;};
	if (playerSide isEqualTo independent) exitWith {[] spawn life_fnc_thrMarker;};
};	