/*
   File:    fn_handleItem.sqf
   Date:    2017-10-21 11:29:12
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/


blub = {
params[
	["_class", "", [""]],
	["_mode", true, [true]],
	"_i"
];
private _return = true;
private _iT = _class call BIS_fnc_itemType;
private _iC = _iT select 0;
_iT = _iT select 1;
private _l = getUnitLoadout player;
private _o = "";
private _dN = {
	getText(configFile >> (call {
		if (isClass (configFile >> "CfgWeapons" >> _this)) exitWith {"CfgWeapons";};
		if (isClass (configFile >> "CfgMagazines" >> _this)) exitWith {"CfgMagazines";};
		if (isClass (configFile >> "CfgVehicles" >> _this)) exitWith {"CfgVehicles";};
		"CfgGlasses";
	}) >> _this >> "displayName");
};
private _msg = "";
if (_mode) then {
	call {
		if (_iC isEqualTo "Equipment") exitWith {
			call {
				if (_iT in ["Uniform","Vest","Backpack"]) exitWith {
					_i = (["Uniform","Vest","Backpack"] find _iT) + 3;
					_o = _l select _i;
					if (_o isEqualTo []) then {
						_o = "";
						_l set [_i,[_class,[]]];
					} else {
						_l set [_i,[_class,_l select _i select 1]];
					};
				};
				if (_iT in ["Headgear","Glasses"]) exitWith {
					_i = (["Headgear","Glasses"] find _iT) + 6;
					_o = _l select _i;
					_l set [_i,_class];
				};
			};
			_msg = format ["%1 wurde ausgerüstet.",_class call _dN];
			player setUnitLoadout _l;
			private _tmp = if (_o isEqualType []) then {
				_o select 0;
			} else {
				_o;
			};
			if !(_tmp isEqualTo "") then {
				if (player canAdd _tmp && !(_iT isEqualTo "Backpack")) then {
					player addItem _tmp;
					_msg = format["%1 wurde ausgerüstet. %2 wurde in dein Inventar gelegt.",_class call _dN,_tmp call _dN];
				} else {
					_return = false;
					_l set [_i,_o];
					player setUnitLoadout _l;
					_msg = format["%1 konnte nicht ausgerüstet werden, da %2 nicht in dein Invetar gelegt werden konnte.",_class call _dN,_tmp call _dN];
				};
			}
		};
		if (_iC isEqualTo "Weapon") exitWith {
			
		};
	};

} else {
	
};
hint _msg;
_return;
}
