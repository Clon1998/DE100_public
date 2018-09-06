/*
   File:    fn_clothingSkinsMenu.sqf
   Date:    2018-4-29 12:21:52
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

disableSerialization;
params[
	["_display", displayNull, [displayNull]]
];

private _unifroms = "getNumber(_x >> 'type') isEqualTo 0" configClasses (missionConfigFile >> "skins");
private _backpacks = "getNumber(_x >> 'type') isEqualTo 1" configClasses (missionConfigFile >> "skins");

private _cnt = {
	!((configProperties [
		(_x >> "TextureSources"), 
		format["getNumber(_x >> 'tier') <= %1 && '%2' in getArray(_x >> 'factions') && call compile getText(_x >> 'permission')", call life_skin_tier, playerSide], 
		true
	]) isEqualTo []);
} count (_unifroms+_backpacks);
if (_cnt == 0) exitWith {
	_display closeDisplay 0;
	["Du hast keine Skins, die du einstellen köntest.", true, "fast"] call life_fnc_notification_system;
};
private _ub = [uniform player, backpack player];
private _tv = _display displayCtrl 4001;
private _gS = (group player) getVariable ["gang_SKIN",[["",""],["",""]]];
{
	_x params[
		"_title",
		"_items"
	];
	if !(_items isEqualTo []) then {
		private _pI = _tv tvAdd [[],_title];
		{
			private _skins = configProperties [
				(_x >> "TextureSources"), 
				format["getNumber(_x >> 'tier') <= %1 && '%2' in getArray(_x >>'factions') && call compile getText(_x >> 'permission')", call life_skin_tier, playerSide], 
				true
			];
			private _class = configName _x;
			if (!(_skins isEqualTo []) || _class in [(_gS select 0) select 0, (_gS select 1) select 0]) then {
				private _cfg = call {
					if (isClass (configFile >> "CfgWeapons" >> _class)) exitWith {"CfgWeapons";};
					if (isClass (configFile >> "CfgMagazines" >> _class)) exitWith {"CfgMagazines";};
					if (isClass (configFile >> "CfgVehicles" >> _class)) exitWith {"CfgVehicles";};
					"CfgGlasses";
				};
				private _crntSkin = profileNamespace getVariable [format["de100_skin_%1_%2", _class, playerSide],""];
				private _cI = _tv tvAdd [[_pI],getText(configFile >> _cfg >> _class >> "displayName")];
				_tv tvSetData [[_pI,_cI],_class];
				_tv tvSetPicture [[_pI,_cI],getText(configFile >> _cfg >> _class >> "picture")];
				if (_class in _ub) then {
					_tv tvSetColor [[_pI,_cI],[0,0.569,0.102,1]];
				};
				{
					if (_x select 0 isEqualTo _class) then {
						private _gcI = _tv tvAdd [[_pI,_cI], "Gang-Skin"];	
						_tv tvSetData [[_pI,_cI,_gcI],"gang"];
						if ("gang" isEqualTo _crntSkin) then {
							_tv tvSetColor [[_pI,_cI,_gcI],[0,0.569,0.102,1]];
							_tv setVariable [format["de100_%1_index",_class],[_pI,_cI,_gcI]];
						};
					};
					nil;
				} count _gS;

				{
					private _gcI = _tv tvAdd [[_pI,_cI],getText(_x >> "displayName")];
					_tv tvSetData [[_pI,_cI,_gcI],configName _x];
					if (configName _x isEqualTo _crntSkin) then {
						_tv tvSetColor [[_pI,_cI,_gcI],[0,0.569,0.102,1]];
						_tv setVariable [format["de100_%1_index",_class],[_pI,_cI,_gcI]];
					};
					nil;
				} count _skins;
			};
			nil;
		} count _items;
	};
	nil;
} count [["Bekleidungen",_unifroms],["Rucksäcke",_backpacks]];