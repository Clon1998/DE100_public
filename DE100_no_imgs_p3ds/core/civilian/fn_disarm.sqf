/*
   File:    fn_disarm.sqf
   Date:    2017-12-29 18:38:22
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
private _src = param [0,objNull,[objNull]];
private _wea = weaponCargo player + magazineCargo player;
private _loadout = getUnitLoadout player;
private _crate = "WeaponHolderSimulated" createVehicle (player modelToWorld [random 1,random 1,0]);
if ("ItemRadio" in assignedItems player) then {
	_wea pushBack "ItemRadio";
};
{
	if ((([_x] call BIS_fnc_itemType) select 1) in ["Grenade","Bullet","SmokeShell"]) then {
		player removeMagazine _x;
	} else {
		player removeItem _x;
	};
	_crate addItemCargoGlobal [_x, 1];
	nil;
} count _wea;

{
	_x params[
		"_gun",
		"_sup",
		"_rail",
		"_sight",
		"_mag",
		"_shell",
		"_pot"
	];
	if !(_gun isEqualTo "") then {
		player removeWeapon _gun;
	};
	{
		if !(_x isEqualTo "") then {
			
			_crate addItemCargoGlobal [_x, 1];
		};
		nil;
	} count [_gun,_sup,_rail,_sight,_pot,_mag select 0, _shell select 0];
	nil;
} count (_loadout select [0,3]);

[format["%1 wurde entwaffnet.",player call life_fnc_name],false,"fast"] remoteExecCall ["life_fnc_notification_system",_src];