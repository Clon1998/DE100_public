/*
	File:	fn_treeDblClickMarkerSystem.sqf
	Date:   2016-09-30 16:05:36
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_ctrl", controlNull, [controlNull]],
	["_path", [], [[]]],
	"_shown",
	"_markers",
	"_tmp"
];
if (count _path isEqualTo 1) exitwith {};

private _green = [0,0.8,0,1];
private _red = [0.8,0,0,1];

private _mainScope = _ctrl tvData [_path select 0];
private _type = _ctrl tvData [_path select 0,_path select 1];

_markers = if (_mainScope isEqualTo "Houses") then {
	_tmp = [];
	{
		_tmp pushBack format["house_%1",netId _x];
	} forEach (life_houses + ((group player) getVariable ["gang_HOUSES",[]]));
	_tmp
} else {
	(getArray(missionConfigFile >> "Marker" >> _mainScope >> "markers"));
};
switch (_type) do { 
	case "show" : {
		if (findDisplay 12 getVariable [format["%1_shown",_mainScope],true]) then {
			_ctrl tvSetPictureColor [_path, _red];
			_ctrl tvSetPictureColorSelected [_path, _red];
			_shown = 0;
		} else {
			_ctrl tvSetPictureColor [_path, _green];
			_ctrl tvSetPictureColorSelected [_path, _green];
			_shown = 1;
		};

		{
		  _x setMarkerAlphaLocal _shown;
		} forEach _markers;
		profileNamespace setVariable [format["%1_shown", _mainScope],!(findDisplay 12 getVariable [format["%1_shown",_mainScope],true])];
		findDisplay 12 setVariable [format["%1_shown",_mainScope],!(findDisplay 12 getVariable [format["%1_shown",_mainScope],true])];
	};

	case "color" : {
		if (count _path < 3) exitwith {};
		private _infoArray = parseSimpleArray format["%1",_ctrl tvData _path];
		private _colorMarker = _infoArray select 0;
		private _colorArray = _infoArray select 1;

		{
			if (markerType _x != "Empty") then {
				_x setMarkerColorLocal _colorMarker;
			};
		} forEach _markers;
		_ctrl tvSetPictureColor [[_path select 0,_path select 1], _colorArray];
		profileNamespace setVariable [format["%1_color", _mainScope],_infoArray];
	};

	case "size" : {
		if (count _path < 3) exitwith {};
		private _sizeInfo = _ctrl tvData _path;
		profileNamespace setVariable [format["%1_size", _mainScope],_sizeInfo];
		_sizeInfo = switch (_sizeInfo) do { 
			case "big" : {[2,2]}; 
			case "default" : {[1,1]};
			case "small" : {[0.5,0.5]}; 
		};

		{
			if (markerType _x != "Empty") then {
				_x setMarkerSizeLocal _sizeInfo;
			};
		} forEach _markers;
	};

	default {}; 
};