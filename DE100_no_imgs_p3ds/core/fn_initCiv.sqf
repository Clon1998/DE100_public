/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_02_V1_F","Land_i_Shop_01_V1_F","Land_u_House_Small_02_V1_F","Land_u_House_Small_01_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_02_V1_F","Land_i_Shop_01_V1_F","Land_u_House_Small_02_V1_F","Land_u_House_Small_01_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_02_V1_F","Land_i_Shop_01_V1_F","Land_u_House_Small_02_V1_F","Land_u_House_Small_01_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_02_V1_F","Land_i_Shop_01_V1_F","Land_u_House_Small_02_V1_F","Land_u_House_Small_01_V1_F","Land_i_Stone_HouseBig_V1_F"],250];


if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
} else {
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

if ((profileNamespace getVariable ["life_crnt_title_de100",[]]) isEqualTo []) then {
	player setVariable ["life_crnt_title_de100",(profileNamespace getVariable ["life_crnt_title_de100",nil] select 0),true];
};

//House Limit
life_houseLimit = 5;
life_houseLimit = compileFinal (if( life_houseLimit isEqualType "") then {life_houseLimit} else {str life_houseLimit});
7 enableChannel [true,false];
[] spawn life_fnc_intro;