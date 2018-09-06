/*
   File:    fn_sprayPaint.sqf
   Date:    2018-6-16 14:05:12
   Author: Patrick "Lucian" Schmidt, xFireFighter
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

params [
    ["_unit", player],
    ["_texture", ""]
];

private _startPosASL = eyePos _unit;
private _cameraPosASL =  AGLToASL positionCameraToWorld [0, 0, 0];
private _cameraDir = (AGLToASL positionCameraToWorld [0, 0, 1]) vectorDiff _cameraPosASL;
private _endPosASL = _startPosASL vectorAdd (_cameraDir vectorMultiply 2.5);

// Check for intersections below the unit
private _intersections = lineIntersectsSurfaces [_startPosASL, _endPosASL, _unit, objNull, true, 1, "GEOM", "FIRE"];
// If there's no intersections
if (_intersections isEqualTo []) exitWith {

  ["Es konnte leider keine Oberfläche gefunden werden",false,"fast"] call life_fnc_notification_system;
    false
};

(_intersections select 0) params ["_touchingPoint", "_surfaceNormal", "", "_object"];
//systemChat format["%1|%2|%3",_touchingPoint, _surfaceNormal, _object];

// Exit if trying to tag a non static object
if ((!isNull _object) && {
    // If the class is alright, do not exit
    if (_object isKindOf "Static") exitWith {false};
	if ((getModelInfo _object )select 0 in ["city2_8m_f.p3d","city2_4m_f.p3d"]) exitWith {false;};
	true;
}) exitWith {

    ["Es konnte leider keine Oberfläche gefunden werden",false,"fast"] call life_fnc_notification_system;
    false
};


// If the surface normal points away, flip it. This happens in weird places like the Stratis Pier
if (_surfaceNormal vectorDotProduct  (_endPosASL vectorDiff _startPosASL) > 0) then {
    _surfaceNormal = _surfaceNormal vectorMultiply -1;
};

// Check if its a valid surface: big enough, reasonably plane
private _v1 = vectorNormalized (_surfaceNormal vectorMultiply -1);
private _v2 = vectorNormalized (_v1 vectorCrossProduct (_endPosASL vectorDiff _startPosASL));
// If the surface is not horizontal (>20º), create vup _v2 pointing upward instead of away
if (abs (_v1 select 2) < 0.94) then {
    private _v3Temp = _v1 vectorCrossProduct [0, 0, 1];
    _v2 = _v3Temp vectorCrossProduct _v1;
};
private _v3 = _v2 vectorCrossProduct _v1;
//systemChat format["%1|%2|%3",_v1, _v2, _v3];

private _fnc_isOk = {
    params ["_rx", "_ry"];
    private _startPosASL2 = _touchingPoint vectorAdd (_v2 vectorMultiply _rx) vectorAdd (_v3 vectorMultiply _ry) vectorAdd (_v1 vectorMultiply (-0.06));
    private _endPosASL2   = _startPosASL2 vectorAdd (_v1 vectorMultiply (0.12));
    private _intersections = lineIntersectsSurfaces [_startPosASL2, _endPosASL2, _unit, objNull, true, 1, "GEOM", "FIRE"];
    // If there's no intersections
    if (_intersections isEqualTo []) exitWith {false;};

    if !(((_intersections select 0) select 3) isEqualTo _object) exitWith {false;};

    true
};

if ( !([ 0.5 * 0.6, 0.5 * 0.6] call _fnc_isOk) ||
    {!([ 0.5 * 0.6,-0.5 * 0.6] call _fnc_isOk) ||
    {!([-0.5 * 0.6, 0.5 * 0.6] call _fnc_isOk) ||
    {!([-0.5 * 0.6,-0.5 * 0.6] call _fnc_isOk)}}}) exitWith {

      ["Die Oberfläche ist zu klein",false,"fast"] call life_fnc_notification_system;
    false
};
private _vectorDirAndUp = if (abs (_v1 select 2) < 0.94) then {
	[_surfaceNormal vectorMultiply -1, _v2];
	} else {
	[_surfaceNormal vectorMultiply -1, _v3];
};


[_touchingPoint vectorAdd (_surfaceNormal vectorMultiply 0.06), _vectorDirAndUp, _texture, _object, _unit] call {
	params ["_tagPosASL", "_vectorDirAndUp", "_texture", "_object", "_unit"];
	private _tag = createSimpleObject ["UserTexture1m_F", _tagPosASL];
    player playActionNow "gestureHi" ;
    [_tag,"spray"] remoteExec ["say3D",-2];
    
    _tag setObjectTextureGlobal [0,_texture];
	_tag setVectorDirAndUp _vectorDirAndUp;
	if (isNull _object) exitWith {true};
};