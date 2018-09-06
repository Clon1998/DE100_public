/*
	File:	fn_screenItem.sqf
	Date:   2017-01-25 20:17:40
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_item", "", ["",[]]],
	["_types", [], [[]]],
	["_cIndex", 0, [0]],//containerIndex
	["_lIndex", 0, [0]],//LoadoutContainerIndex
	["_playerlist",controlNull,[controlNull]],
	"_t",
	"_cfgDetail",
	"_dname",
	"_icon",
	"_index",
	"_ext",
	"_ctName"//containertypNAME
];

disableSerialization;

if (count _item > 0) then {
	if (_item isEqualType []) then {_item = _item select 0;};
	_t = [_item] call BIS_fnc_itemType;
	if (_t select 0 in _types || _t select 1 in _types) then {
		_cfgDetail = [_item] call life_fnc_fetchCfgDetails;
		_dname = _cfgDetail select 1;
		_icon = _cfgDetail select 2;
		_ctName = switch (_lIndex) do { 
			case 0 : {"Prim. Waffe";}; 
			case 1 : {"Secondary";}; 
			case 2 : {"Pistol";};
			case 3 : {"Uniform";};
			case 4 : {"Weste";}; 
			case 5 : {"Rucksack";}; 
			case 6 : {"Helm";};
			case 7 : {"Brille";}; 
			case 8 : {"Ferngläser";}; 
			case 9 : {"Miscs";}; 
		};
		_ext = switch (_lIndex) do { 
			case 0 : {format["Montiert an %1",_ctName];}; 
			case 1 : {format["Montiert an %1",_ctName];};
			case 2 : {format["Montiert an %1",_ctName];};
			default {format["In %1",_ctName];}; 
		};

		if (_cIndex == 0 || _lIndex == 9) then {
			_ext = "Ausgerüstet";
		};

		_index = _playerlist lnbAddRow ["","[1]",format["%1 (%2)",_dname,_ext]];
		_playerlist lbSetTooltip [_index*3,format["%1 (%2)",_dname,_ext]];

		_playerlist lnbSetPicture [[_index,0], _icon];
		_playerlist lnbSetData [[_index,0],_item];
		_playerlist lnbSetValue [[_index,0],_lIndex];
		if ((toLower(str getArray(missionConfigFile >> "Life_Settings" >> "illegal_arma_items"))) find (toLower _item) >= 0) then {
			_playerlist lnbSetColor [[_index,2], getArray(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color")];
		};	
	};
};