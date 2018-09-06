/*
	File:	fn_copHQLoad.sqf
	Date:   2017-03-31 16:03:46
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_search", "", [""]],
	["_index", [], [[]]],
	"_i",
	"_ii",
	"_iii",
	"_unit",
	"_picture"
];

findDisplay 3000 call life_fnc_bgBlure;
private _tree = (finddisplay 3000) displayCtrl 6;
private _txt = (finddisplay 3000) displayCtrl 7;
private _btn = (finddisplay 3000) displayCtrl 8;
_txt ctrlSetStructuredText parseText "";
_txt ctrlSetPosition [0,0,0.273281 * safezoneW,ctrlTextHeight _txt];
_txt ctrlCommit 0;
_btn ctrlShow false;
tvClear _tree;
private _req = bank_obj getVariable ["Requests",[]];
_search = toLower _search;
_i = _tree tvAdd [[],"Notrufe"];
_tree tvSetData [[_i],"error"];
_tree tvSetPicture[[_i],"a3\3den\data\displays\display3den\toolbar\help_updates_ca.paa"];

{
	_unit = objectFromNetId (_x select 0);
	if (!isNull _unit && {alive _unit}) then {
		if (toLower(_unit call life_fnc_name) find _search >= 0 || _search isEqualTo "") then {
			_ii = _tree tvAdd [[_i],_unit call life_fnc_name];
			_tree tvSetValue [[_i,_ii],_forEachIndex];
			_tree tvSetData [[_i,_ii],"error"];
			_picture = call {
				if ((side _unit) isEqualTo civilian) exitWith {"A3\3den\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";};
				if ((side _unit) isEqualTo west) exitWith {"A3\3den\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";};
				if ((side _unit) isEqualTo independent) exitWith {"A3\3den\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";};
				"A3\3den\Data\Displays\Display3DEN\PanelRight\side_empty_ca.paa";
			};
			_tree tvSetPicture [[_i,_ii],_picture];
			{
				_iii = _tree tvAdd [[_i,_ii],_x select 0];
				_tree tvSetValue [[_i,_ii,_iii],_forEachIndex];
				_tree tvSetData [[_i,_ii,_iii],"req"];
				_tree tvSetPicture [[_i,_ii,_iii],"a3\modules_f_curator\data\portraitskiptime_ca.paa"];
			} forEach (_x select 1);
		};
	};
} forEach _req;
_tree tvExpand [_i];
private _zones = bank_obj getVariable ["Zones",[]];

_i = _tree tvAdd [[],"Sperrzonen"];
_tree tvSetData [[_i],"error"];
_tree tvSetPicture[[_i],"a3\ui_f\data\igui\cfg\simpletasks\types\danger_ca.paa"];

{
	if (toLower(markerText _x) find _search >= 0 || _search isEqualTo "") then {
		_ii = _tree tvAdd [[_i],markerText _x];
		_tree tvSetValue [[_i,_ii],_forEachIndex];
		_tree tvSetData [[_i,_ii],"zone"];
	};
} forEach _zones;
_tree tvExpand [_i];

private _crimes = bank_obj getVariable ["Crimes",[]];

_i = _tree tvAdd [[],"Verbrecher"];
_tree tvSetData [[_i],"error"];
_tree tvSetPicture[[_i],"A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa"];

{
	if ((_x select 0) call life_fnc_isUIDActive) then {
		if (toLower(_x select 1) find _search >= 0 || _search isEqualTo "") then {
			_ii = _tree tvAdd [[_i],_x select 1];
			_tree tvSetValue [[_i,_ii],_forEachIndex];
			_tree tvSetData [[_i,_ii],"crime"];
		};
	};
} forEach _crimes;
_tree tvExpand [_i];

if (count _index > 0) then {
	_tree tvSetCurSel _index;
};