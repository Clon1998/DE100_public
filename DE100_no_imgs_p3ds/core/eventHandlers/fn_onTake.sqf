/*
	File:	fn_onTakeItem.sqf
	Date:   2016-08-15 02:47:27
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _error = params[
	["_unit", objNull, [objNull]],
	["_container", objNull, [objNull]],
	["_item", "", [""]]
];


if (!_error) exitWith {};
call {
	if (playerSide isEqualTo civilian) exitWith {
		if((call life_adminlevel) isEqualTo 0) then {
			if(_item in ["U_I_HeliPilotCoveralls","LMG_03_F","Medikit"]) then {
				[_item,false,false] call life_fnc_handleItem_new;
			};
		};
	};

	if (playerSide isEqualTo west) exitWith {
		if((call life_adminlevel) isEqualTo 0) then {
			if(_item in ["U_I_HeliPilotCoveralls","LMG_03_F"]) then {
				[_item,false,false] call life_fnc_handleItem_new;
			};
		};
	};

	if (playerSide isEqualTo independent) exitWith {
		if((call life_adminlevel) isEqualTo 0) then {
			if(_item in ["LMG_03_F"]) then {
				[_item,false,false] call life_fnc_handleItem_new;
			};
		};
	};
};	

_unit setVariable ["vhcPro",str getUnitLoadout _unit];
[] call life_fnc_updateClothing;