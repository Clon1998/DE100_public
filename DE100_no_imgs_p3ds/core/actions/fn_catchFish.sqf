/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a fish that is near by.
*/

private _fish = param [0,objNull,[objNull]];
if (!(_fish isKindOf "Fish_Base_F")) exitWith {}; //Not a fishy!
if (player distance _fish > 3.5) exitWith {};
private _type = call {
	if ((typeOf _fish) isEqualTo "Salema_F") exitWith {"salema";};
	if ((typeOf _fish) isEqualTo "Ornate_random_F") exitWith {"ornate";};
	if ((typeOf _fish) isEqualTo "Mackerel_F") exitWith {"mackerel";};
	if ((typeOf _fish) isEqualTo "Tuna_F") exitWith {"tuna";};
	if ((typeOf _fish) isEqualTo "Mullet_F") exitWith {"mullet";};
	if ((typeOf _fish) isEqualTo "CatShark_F") exitWith {"catshark";};
	"";
};	

if (_type == "") exitWith {};

if (([true,_type,1] call life_fnc_handleInv) > 0) then
{
	deleteVehicle _fish;
	titleText[format[(localize "STR_NOTF_Fishing"),(getText(missionConfigFile >> "VirtualItems" >> _type >> "displayName"))],"PLAIN"];
};
