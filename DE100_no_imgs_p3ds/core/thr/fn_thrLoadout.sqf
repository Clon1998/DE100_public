/*
	File:	fn_thrLoadout.sqf
	Date:   2016-12-27 00:31:02
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

player setUnitLoadout[[],[],[],["U_B_CombatUniform_mcam",[["FirstAidKit",2]]],[],[],"H_Cap_blu","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];

[] call life_fnc_updateclothing;
[player] call life_fnc_saveGear;
player setVariable ["vhcPro",str getUnitLoadout player];