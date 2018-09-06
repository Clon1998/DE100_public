/*
	File : fn_SpawnCam.sqf
	Date:   30.01.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
cameratarget = _this select 0;
Camrunning = true; // set to false to stop the camera
_radius = 500; // circle radius
_angle = (getDir player); // starting angle
_altitude = 400; // camera altitude
_dir = 0; //Direction of camera movement 0: anti-clockwise, 1: clockwise
_speed = 0.4; //lower is faster

_coords = cameratarget getPos [_radius,_angle];
_coords set [2, _altitude];
_camera = "camera" camCreate _coords;
_camera cameraEffect ["INTERNAL","BACK"];
_camera camPrepareFOV 0.700;
_camera camPrepareTarget cameratarget;
_camera camCommitPrepared 0;
_pos = cameratarget;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust[1];
"DynamicBlur" ppEffectCommit 0;
cutText ["","BLACK IN",2];
while {Camrunning} do {
	_coords = cameratarget getPos [_radius,_angle];
	_coords set [2, _altitude];

	_camera camPreparePos _coords;
	_camera camCommitPrepared _speed;

	waitUntil {camCommitted _camera || !(Camrunning)};
	if (!(Camrunning)) then {
		//cutText["","BLACK OUT"];
		_camera cameraEffect ["terminate","back"];
		camDestroy _camera;
	};
	if !(_pos isEqualTo cameratarget) then {
		_pos = cameratarget;
		_camera camPrepareTarget cameratarget;
	};
	_camera camPreparePos _coords;
	_camera camCommitPrepared 0;
	
	_angle = (if (_dir == 0) then {_angle - 1} else {_angle + 1}) mod 360;
};