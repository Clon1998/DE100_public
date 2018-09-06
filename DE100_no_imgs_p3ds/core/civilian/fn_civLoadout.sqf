/*
	File: fn_civLoadout.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Description:
	Loads the civs out with the default gear, with randomized clothing.
*/

if(player getVariable["nobody",false])exitWith{
	_ldt=[[],[],[],["U_B_CombatUniform_mcam",[]],[],["B_ViperHarness_blk_F",[]],"H_Beret_Colonel","G_Bandanna_blk",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]];
	player setUnitLoadout _ldt;
	[_ldt]spawn{
		scriptName"Nobody-Vest-Confirmation";
		_ldt=param[0,[],[[]]];
		_action=["Willst du die Weste der Nobody-Fraktion für 30.000 € kaufen?","Weste kaufen?","Kaufen","Abbrechen"]call BIS_fnc_GUIMessage;
		if(_action)then{
			_ldt set[4,["V_PlateCarrier2_blk",[]]];
			player setUnitLoadout _ldt;
		};
	};
};


player forceAddUniform "U_C_Man_casual_6_F";
_ldt = getUnitLoadout player;
_ldt set[9,["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
player setUnitLoadout _ldt;

[player] call life_fnc_saveGear;
player setVariable ["vhcPro",str getUnitLoadout player];
[] call life_fnc_updateclothing;