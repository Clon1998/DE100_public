/*
	File:	fn_draw3D.sqf
	Date:   2017-05-18 19:40:27
	Author: Patrick "Lucian" Schmidt
	Inspired/Based on the CLIB 3dGraphics-System
	
	
	Description:
	Take a look for yourself.
*/

if (!isNull (findDisplay 49) || dialog || (player getVariable ["SackDrauf",false]) || !life_tagson) exitWith {};

private _fov = (([0.5, 0.5] distance2D worldToScreen positionCameraToWorld [0, 3, 4]) * (getResolution select 5) / 2) * 3;
private _cameraPosition = positionCameraToWorld [0, 0, 0];


if (de100_3dCache_v != de100_3dCache_f) then {
	de100_3dCache_v = de100_3dCache_f;
	call life_fnc_build3dCache;
};

{
	if (!isNil "_x") then {
		call {
			if ((_x select 0) isEqualTo "ICON") exitWith {
                _x params ["_type", "_texture", "_color", "_position", "_width", "_height", "_angle", "_text", "_shadow", "_textSize", "_font", "_align", "_drawSideArrows", "_code"];
                private _isVisible = call _code;
                if (_isVisible) then {
                    _position = [_position] call life_fnc_3dGraphicsPosition;
                    drawIcon3d [_texture, _color, _position, _width, _height, _angle, _text, _shadow, _textSize, _font, _align, _drawSideArrows];
                };
			};
		
			if ((_x select 0) isEqualTo "LINE") exitWith {
			 	_x params ["_type", "_start", "_end", "_lineColor", "_code"];
                private _isVisible = call _code;
                if (_isVisible) then {
                    _start = [_start] call life_fnc_3dGraphicsPosition;
                    _end = [_end] call life_fnc_3dGraphicsPosition;
                    drawLine3d [_start, _end, _lineColor];
                };
			};
		};
	};
	nil;
} count (missionNamespace getVariable ["de100_3dCache",[]]);