/*
    Community Lib - CLib

    Author: BadGuy

    Description:
    Converts a 3dGraphicsPosition into PositionAGL

    Parameter(s):
    0: 3dGraphicsPosition <Array>

    Returns:
    0: Position AGL <PositionAGL>
*/

params ["_positionIn"];

if (_positionIn isEqualType objNull) exitWith {
    _positionIn modelToWorldVisual [0,0,0]; // Return
};

if (_positionIn isEqualType []) exitWith {
    if ((_positionIn select 0) isEqualType 0) exitWith {
        _positionIn
    };
    if (count _positionIn isEqualTo 2) then {
        (_positionIn select 0)modelToWorldVisual(_positionIn select 1);
    };
    if ((_positionIn select 0) isEqualType objNull) exitWith {
        _positionIn params ["_refPos", ["_refPosSelection", [0, 0, 0]], ["_refPosOffset", [0, 0, 0]], ["_offset", [0, 0, 0]]];
        (_refPos modelToWorldVisual ((_refPos selectionPosition _refPosSelection) vectorAdd _refPosOffset)) vectorAdd _offset
    };
};
