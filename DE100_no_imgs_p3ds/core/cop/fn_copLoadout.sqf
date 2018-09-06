/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/

player setUnitLoadout [[],[],["hgun_P07_F","","","",["30Rnd_9x21_Mag",30],[],""],["U_Rangemaster",[]],["V_Rangemaster_belt",[["30Rnd_9x21_Mag",4,30]]],[],"","",[],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
[] call life_fnc_updateclothing;
[player] call life_fnc_saveGear;
player setVariable ["vhcPro",str getUnitLoadout player];