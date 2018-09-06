/*
	File:	fn_searchEdit.sqf
	Date:   2017-03-30 16:18:59
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_edit", controlNull, [controlNull]]
];
private _lb = findDisplay 12 getVariable ["MarkerSearchLb",controlNull];

if (isNull _lb) then {
	_lb = findDisplay 12  ctrlCreate ["RscListbox", -1];
	findDisplay 12 setVariable ["MarkerSearchLb",_lb];
	_lb ctrlSetPosition [0.402031 * safezoneW + safezoneX, 0.073 * safezoneH + safezoneY, 0.195937 * safezoneW, 0.143 * safezoneH];
	_lb ctrlCommit 0;
	_lb ctrlAddEventHandler ["LBSelChanged", {_this call life_fnc_lbSelChange}];
};
_input = ctrlText _edit;
lbClear _lb;

{
	if ((toLower markerText _x find toLower _input) >= 0) then {
		_lb lbSetData [_lb lbAdd markerText _x,_x];
	};
} forEach (allMapMarkers select {markerAlpha _x > 0 && !(markerText _x isEqualTo "") && markerPos _x distance [0,0,0] > 8000});

if (lbSize _lb isEqualTo 0) exitWith {
	_lb lbSetData [_lb lbAdd "Kein Suchergebniss","error"]; 
};
lbSort _lb;