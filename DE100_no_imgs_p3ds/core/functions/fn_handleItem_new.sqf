/*
	File:	fn_handleItem_new.sqf
	Date:   19.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_item", "", [""]],
	["_mode", true, [true]],
	["_notify", true, [true]],
	["_override", false, [true]],
	"_return",
	"_itemType",
	"_txt",
	"_tmpDeatils",
	"_primaryCompatible",
	"_handgunCompatible",
	"_weapon",
	"_loadout",
	"_oldItem"
];
_return = false;
_loadout = "";
_oldItem = "";
_itemType = [_item] call BIS_fnc_itemType;
_displayname = ([_item] call life_fnc_fetchCfgDetails) select 1;
if (_mode) then {
	switch (true) do {
		case ((_itemType select 0) == "Equipment") : {
			switch (true) do {
				case ((_itemType select 1) == "Uniform") : {
					_oldItem = uniform player;
					if (_oldItem == "") then {
						player forceAddUniform _item;
					} else {
						_loadout = getUnitLoadout player;
						_loadout set [3,[_item,(_loadout select 3) select 1]];
						player setUnitLoadout _loadout;
					};
					_txt = format["%1 wurde als Uniform ausgerüstet",_displayname];
				};

				case ((_itemType select 1) == "Vest") : {
					_oldItem = vest player;
					if (_oldItem == "") then {
						player addVest _item;
					} else {
						_loadout = getUnitLoadout player;
						_loadout set [4,[_item,(_loadout select 4) select 1]];
						player setUnitLoadout _loadout;
					};
					_txt = format["%1 wurde als Weste ausgerüstet",_displayname];
				};

				case ((_itemType select 1) == "Backpack") : {
					_oldItem = backpack player;
					if (_oldItem == "") then {
						player addBackpack _item;
					} else {
						_loadout = getUnitLoadout player;
						_loadout set [5,[_item,(_loadout select 5) select 1]];
						player setUnitLoadout _loadout;
					};
					_txt = format["%1 wurde als Rucksack ausgerüstet",_displayname];
				};

				case ((_itemType select 1) == "Headgear") : {
					_oldItem = headgear player;
					player addHeadgear _item;
					_txt = format["%1 wurde als Kopfbedeckung ausgerüstet",_displayname];
				};

				case ((_itemType select 1) == "Glasses") : {
					_oldItem = goggles player;
					player addGoggles _item;
					_txt = format["%1 wurde als Brille ausgerüstet",_displayname];
				};
			};
			if (_oldItem != "" && !_override) then {
				if (player canAdd _oldItem) then {
					player addItem _oldItem;
					_txt = format["%1, %2 wurde in dein Inventar gelegt.",_txt,(([_oldItem] call life_fnc_fetchCfgDetails) select 1)];
				};
			};
			_return = true;
		};

		case ((_itemType select 0) == "Weapon" || (_itemType select 1) in ["NVGoggles","Binocular","LaserDesignator"]) : {
			switch (true) do {
				case ((_itemType select 1) in ["AssaultRifle","MachineGun","Rifle","SubmachineGun","SniperRifle"]) : {
					if (((primaryWeapon player) isEqualTo "")) then {
						_txt = format["%1 wurde als Primärwaffe ausgerüstet",_displayname];
						_return = true;
					};
				};

				case ((_itemType select 1) in ["Launcher","MissileLauncher"]) : {
					if (((secondaryWeapon player) isEqualTo "")) then {
						_txt = format["%1 wurde als Sekundärwaffe ausgerüstet",_displayname];
						_return = true;
					};
				};

				case ((_itemType select 1) in ["Handgun"]) : {
					if (((handgunWeapon player) isEqualTo "")) then {
						_txt = format["%1 wurde als Pistole ausgerüstet",_displayname];
						_return = true;
					};
				};

				case ((_itemType select 1) in ["Binocular","LaserDesignator"]) : {
					if (((binocular player) isEqualTo "")) then {
						_txt = format["%1 wurde als Fernglas ausgerüstet",_displayname];
						_return = true;
					};
				};

				case ((_itemType select 1) in ["NVGoggles"]) : {
					if (((hmd player) isEqualTo "")) then {
						_txt = format["%1 wurde als Nachtsichtgerät ausgerüstet",_displayname];
						_return = true;
					};
				};
			};

			if (_return) then {
				player addWeapon _item;
			} else {
				if (player canAdd _item) then {
					player addItem _item;
					_txt = format["%1 wurde in dein Inventar gelegt",_displayname];
					_return = true
				} else {
					_txt = format["%1 konnte nicht in dein Inventar gelegt werden, da du keinen Platz mehr hast.",_displayname];
					_return = false;
				};
			};
		};
		
		case ((_itemType select 1) in ["AccessoryMuzzle","AccessorySights","AccessoryPointer","AccessoryBipod"]) : {
			_primaryCompatible = [];
			_handgunCompatible = [];
			if ((primaryWeapon player) != "") then {
				_tmpDeatils = [primaryWeapon player] call life_fnc_fetchCfgDetails;
				_primaryCompatible = ([_tmpDeatils select 11] call ARR_fnc_toUpLow) + ([_tmpDeatils select 12] call ARR_fnc_toUpLow) + ([_tmpDeatils select 16] call ARR_fnc_toUpLow) + ([_tmpDeatils select 10] call ARR_fnc_toUpLow);
			};

			if ((handgunWeapon player) != "") then {
				_tmpDeatils = [handgunWeapon player] call life_fnc_fetchCfgDetails;
				_handgunCompatible = ([_tmpDeatils select 11] call ARR_fnc_toUpLow) + ([_tmpDeatils select 12] call ARR_fnc_toUpLow) + ([_tmpDeatils select 10] call ARR_fnc_toUpLow);
			};
			_weapon = "none";
			switch (true) do {
				case ((_itemType select 1) == "AccessoryMuzzle") : {
					if ((toUpper _item) in _primaryCompatible) then {
						if (((((primaryWeaponItems player) select 0)) isEqualTo "")) then {
							_txt = format["%1 wurde an deine Primärwaffe montiert",_displayname];
							_return = true;
							_weapon = "primaryWeapon";
						};
					} else {
						if ((toUpper _item) in _handgunCompatible) then {
							if (((((handgunItems player) select 0)) isEqualTo "")) then {
								_txt = format["%1 wurde an deiner Pistole montiert",_displayname];
								_return = true;
								_weapon = "handgunWeapon";
							};
						};
					};
				};

				case ((_itemType select 1) == "AccessoryPointer") : {
					if ((toUpper _item) in _primaryCompatible) then {
						if (((((primaryWeaponItems player) select 1)) isEqualTo "")) then {
							_txt = format["%1 wurde an deine Primärwaffe montiert",_displayname];
							_return = true;
							_weapon = "primaryWeapon";
						};
					} else {
						if ((toUpper _item) in _handgunCompatible) then {
							if (((((handgunItems player) select 1)) isEqualTo "")) then {
								_txt = format["%1 wurde an deiner Pistole montiert",_displayname];
								_return = true;
								_weapon = "handgunWeapon";
							};
						};
					};
				};

				case ((_itemType select 1) == "AccessorySights") : {
					if ((toUpper _item) in _primaryCompatible) then {
						if (((((primaryWeaponItems player) select 2)) isEqualTo "")) then {
							_txt = format["%1 wurde an deine Primärwaffe montiert",_displayname];
							_return = true;
							_weapon = "primaryWeapon";
						};
					} else {
						if ((toUpper _item) in _handgunCompatible) then {
							if (((((handgunItems player) select 2)) isEqualTo "")) then {
								_txt = format["%1 wurde an deiner Pistole montiert",_displayname];
								_return = true;
								_weapon = "handgunWeapon";
							};
						};
					};
				};

				case ((_itemType select 1) == "AccessoryBipod") : {
					if ((toUpper _item) in _primaryCompatible) then {
						if (((((primaryWeaponItems player) select 3)) isEqualTo "")) then {
							_txt = format["%1 wurde an deine Primärwaffe montiert",_displayname];
							_return = true;
							_weapon = "primaryWeapon";
						};
					};
				};
			};

			if (_return) then {
				if (_weapon == "primaryWeapon") then {
					player addPrimaryWeaponItem _item;
				} else {
					player addHandgunItem _item;
				};
			} else {
				if (player canAdd _item) then {
					player addItem _item;
					_txt = format["%1 wurde in dein Inventar gelegt",_displayname];
					_return = true
				} else {
					_txt = format["%1 konnte nicht in dein Inventar gelegt werden, da du keinen Platz mehr hast.",_displayname];
					_return = false;
				};
			};
		}; 
		
		case ((_itemType select 1) in ["Compass","GPS","Map","Radio","UAVTerminal","Watch"]) : {
			if (player canAdd _item) then {
				player addItem _item;
				player assignItem _item;
				_txt = format["%1 wurde ausgerüstet",_displayname];
				_return = true
			} else {
				_txt = format["%1 konnte nicht ausgerüstet oder in dein Invetar gelegt werden, da du keinen Platz mehr hast.",_displayname];
				_return = false;
			};
		};

		default {
			if (player canAdd _item) then {
				player addItem _item;
				_txt = format["%1 wurde in dein Inventar gelegt",_displayname];
				_return = true
			} else {
				_txt = format["%1 konnte nicht in dein Inventar gelegt werden, da du keinen Platz mehr hast.",_displayname];
				_return = false;
			};
		}; 
	};
	if (_notify) then {
		[_txt,false,"fast"] call life_fnc_notification_system;
	};
} else {
	_return = true;
	switch (true) do {
		case ((_itemType select 0) == "Equipment") : {
			switch (true) do {
				case ((_itemType select 1) == "Uniform") : {
					removeUniform player;
				};

				case ((_itemType select 1) == "Vest") : {
					removeVest player;
				};

				case ((_itemType select 1) == "Backpack") : {
					removeBackpack player;
				};

				case ((_itemType select 1) == "Headgear") : {
					removeHeadgear player;
				};

				case ((_itemType select 1) == "Glasses") : {
					removeGoggles player;
				};
			};
		};

		case ((_itemType select 0) == "Weapon" || (_itemType select 1) in ["NVGoggles","Binocular","LaserDesignator"]) : {
			player removeWeapon _item;
		};
		
		case ((_itemType select 1) in ["AccessoryMuzzle","AccessorySights","AccessoryPointer","AccessoryBipod"]) : {
			_primaryCompatible = [];
			_handgunCompatible = [];
			if ((primaryWeapon player) != "") then {
				_tmpDeatils = [primaryWeapon player] call life_fnc_fetchCfgDetails;
				_primaryCompatible = ([_tmpDeatils select 11] call ARR_fnc_toUpLow) + ([_tmpDeatils select 12] call ARR_fnc_toUpLow) + ([_tmpDeatils select 16] call ARR_fnc_toUpLow) + ([_tmpDeatils select 10] call ARR_fnc_toUpLow);
			};

			if ((handgunWeapon player) != "") then {
				_tmpDeatils = [handgunWeapon player] call life_fnc_fetchCfgDetails;
				_handgunCompatible = ([_tmpDeatils select 11] call ARR_fnc_toUpLow) + ([_tmpDeatils select 12] call ARR_fnc_toUpLow) + ([_tmpDeatils select 10] call ARR_fnc_toUpLow);
			};

			_weapon = if ((toUpper _item) in _primaryCompatible) then {
				"primaryWeapon";
			} else {
				if ((toUpper _item) in _handgunCompatible) then {
					"handgunWeapon";
				} else {
					"none";
				};
			};

			if (_weapon == "primaryWeapon") then {
				player removePrimaryWeaponItem _item;
			} else {
				if (_weapon == "handgunWeapon") then {
					player removeHandgunItem _item;
				} else {
					_return = false;
				};
			};
		}; 
		
		case ((_itemType select 1) in ["Compass","GPS","Map","Radio","UAVTerminal","Watch"]) : {
			player unassignItem _item;
			player removeItem _item
		};

		default {
			player removeItem _item;
		}; 
	};
};


_return;