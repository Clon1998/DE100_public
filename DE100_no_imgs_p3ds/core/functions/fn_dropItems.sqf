/*
   File:    fn_dropItems.sqf
   Date:    2017-10-25 18:39:04
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_corpse", objNull, [objNull]],
	"_item",
	"_val"
];

private _loadout = getUnitLoadout _corpse;
private _pos = ((vehicle _corpse) modelToWorld [2+random 4,2+random 4,0]);
//Pseudo Code um die Kiste am StraßenRand zu spawnen
if (isOnRoad _pos) then {
	_pos = if (isNull roadAt _pos) then {
		(_pos nearRoads 10) select 0;
	} else {
		roadAt _pos
	};
    private _rInt = random 10;
    private _lR = (-1)^(round random 1);
	_pos = _pos modelToWorld [_lR*(_rInt-10),_lR*_rInt,0];
};
_pos set [2,0];
private _crate = "Box_NATO_Equip_F" createVehicle _pos;
_crate setPosAtl _pos;

_crate setVariable ["isDeathCreate",true,true];
_crate setVariable ["isLocked",getPlayerUID player,true];
_corpse call life_fnc_stripDownUnit;
clearWeaponCargoGlobal _crate; 
clearBackpackCargoGlobal _crate; 
clearItemCargoGlobal _crate; 
clearMagazineCargoGlobal _crate; 
clearWeaponCargoGlobal _crate; 

{
	if (!(_x isEqualTo "") && !(_x isEqualTo [])) then {
		if (_x isEqualType "") then {
			_crate addItemCargoGlobal [_x, 1];
		} else {
			_crate addItemCargoGlobal [_x select 0, 1];
		};
	};
	nil;
} count ((_loadout select 0)+(_loadout select 1)+(_loadout select 2)+(_loadout select 8)+(_loadout select 9));

{
	if (!(_x isEqualTo "") && !(_x isEqualTo [])) then {
		if (_x isEqualType "") then {
			if ((([_x] call BIS_fnc_itemType) select 1) isEqualTo "Backpack") then {
				_crate addBackpackCargoGlobal [_x, 1];
			} else {
				_crate addItemCargoGlobal [_x, 1];
			};
		} else {
			{
				if ((_x select 0) isEqualType "") then {
					_crate addItemCargoGlobal [_x select 0, _x select 1];
				} else {
					for "_i" from 1 to (_x select 1) step 1 do {
						{
							if (!(_x isEqualTo "") && !(_x isEqualTo [])) then {
								if (_x isEqualType "") then {
									_crate addItemCargoGlobal [_x, 1];
								} else {
									_crate addItemCargoGlobal [_x select 0, 1];
								};
							};
							nil;
						} count (_x select 0);
					};
				};
				nil;
			} count _x;
		};
	};
	nil;
} count ((_loadout select 3)+(_loadout select 4)+(_loadout select 5));

_crate addItemCargoGlobal [_loadout select 6, 1];
_crate addItemCargoGlobal [_loadout select 7, 1];


{
	if (_x isEqualType "") then {
		_item = _x;
		_val = missionNamespace getVariable [_x,0];
	} else {
		_item = configName _x;
		_val = [0,_item] call life_fnc_handleVItem;
	};
	if (_val > 0) then {
		[1,[_item,0]] call life_fnc_handleVItem;
		private _obj = (call {
			if (_item isEqualTo "waterBottle") exitWith {"Land_BottlePlastic_V1_F";};
			if (_item isEqualTo "tbacon") exitWith {"Land_TacticalBacon_F";};
			if (_item isEqualTo "redgull") exitWith {"Land_Can_V3_F";};
			if (_item isEqualTo "fissileMaterial") exitWith {"Land_MetalBarrel_F";};
			if (_item isEqualTo "fuelEmpty" || _item isEqualTo "fuelFull") exitWith {"Land_CanisterFuel_F";};
			if (_item isEqualTo "coffee") exitWith {"Land_Can_V3_F";};
			if (_item isEqualTo "de100_luciandjuli_mula") exitWith {"Land_Money_F";};
			"Land_FoodContainer_01_White_F";
		}) createVehicle [0,0,0];
		_obj setPos ((vehicle _corpse) modelToWorld [random 2,random 2,0]);
		_obj setVariable ["item",[_item,_val],true];
	};
	nil;
} count (["de100_luciandjuli_mula"]+("true" configClasses (missionConfigFile >> "VirtualItems")));