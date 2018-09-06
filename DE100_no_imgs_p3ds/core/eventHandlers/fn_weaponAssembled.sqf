/*
	File:	fn_weaponAssembled.sqf
	Date:   25.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
params[
	["_unit", objNull, [objNull]],
	["_weapon", objNull, [objNull]]
];


if (typeOf _weapon in ["B_UAV_01_F"]) then {
	_weapon disableTIEquipment true;
};