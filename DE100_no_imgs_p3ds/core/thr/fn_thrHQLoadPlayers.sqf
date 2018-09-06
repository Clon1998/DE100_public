/*
	File:	fn_thrHQLoadPlayers.sqf
	Date:   2016-12-27 22:42:18
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
	"_picture"
];

private _tree = ((finddisplay 3000) displayCtrl 6);
tvClear _tree;
private _deadReqCop = [];
private _deadReqCiv = [];
private _deadReqThr = [];
{
 	if (_x getVariable ["request",false] && !isObjectHidden _x && !(_x getVariable ["isAlive",true])) then {
 		switch (_x getVariable ["side",sideUnknown]) do { 
 			case west : {_deadReqCop pushBack [_x call life_fnc_name,_x];}; 
 			case independent : {_deadReqThr pushBack [_x call life_fnc_name,_x];}; 
 			default {_deadReqCiv pushBack [_x call life_fnc_name,_x];};
 		};
 	};
	nil;
} count (allPlayers select {!(_x getVariable ["isAlive",true])});
_deadReqCop sort true;
_deadReqCiv sort true;
_deadReqThr sort true;

private _carReqCop = [];
private _carReqCiv = [];
private _carReqThr = [];
{
 	if (!isNull(_x getVariable ["requestveh",objNull]) && _x getVariable ["isAlive",true]) then {
 		switch (side _x) do { 
 			case west : {_carReqCop pushBack [_x call life_fnc_name,_x];}; 
 			case independent : {_carReqThr pushBack [_x call life_fnc_name,_x];}; 
 			default {_carReqCiv pushBack [_x call life_fnc_name,_x];};
 		};
 	};
	 nil;
} count allPlayers;
_carReqCop sort true;
_carReqCiv sort true;
_carReqThr sort true;

_i = _tree tvAdd [[],"Bewusstlose Spieler"];
_tree tvSetPicture[[_i],"A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa"];
{
	if (toLower (_x select 0) find toLower _search > -1 || _search isEqualTo "") then {
		_picture=(switch((_x select 1) getVariable ["side",sideUnknown])do{case west:{"A3\3den\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa"};case independent:{"A3\3den\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa"};case civilian:{"A3\3den\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa"};case default{"A3\3den\Data\Displays\Display3DEN\PanelRight\side_empty_ca.paa"}});
	 	if (!isNull ((_x select 1) getVariable ["thrClerk",objNull])) then {
	 		_picture = "A3\ui_f\data\IGUI\Cfg\Simpletasks\Types\walk_ca.paa";
	 	};
	 	_ii = _tree tvAdd [[_i],_x select 0];
	 	_tree tvSetData [[_i,_ii],netId(_x select 1)];
	 	_tree tvSetPicture[[_i,_ii],_picture];
	};
} forEach (_deadReqThr + _deadReqCop + _deadReqCiv);
_tree tvExpand [_i];
_i = _tree tvAdd [[],"Unfälle"];
	_tree tvSetPicture[[_i],"A3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa"];
{
	if (toLower (_x select 0) find toLower _search > -1 || _search isEqualTo "") then {
		_picture=(switch(side (_x select 1))do{case west:{"A3\3den\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa"};case independent:{"A3\3den\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa"};case civilian:{"A3\3den\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa"};case default{"A3\3den\Data\Displays\Display3DEN\PanelRight\side_empty_ca.paa"}});
		if (!isNull ((_x select 1) getVariable ["thrClerk",objNull])) then {
	 		_picture = "A3\ui_f\data\IGUI\Cfg\Simpletasks\Types\walk_ca.paa";
	 	};
	 	_ii = _tree tvAdd [[_i],_x select 0];
	 	_tree tvSetData [[_i,_ii],netId(_x select 1)];
	 	_tree tvSetPicture[[_i,_ii],_picture];
	};
} forEach (_carReqThr + _carReqCop + _carReqCiv);
_tree tvExpand [_i];
if (count _index > 0) then {
	_tree tvSetCurSel _index;
};