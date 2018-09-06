/*
	File:	fn_intro.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


private [ "_camera", "_welcomeMessage", "_camDistance" ];
if (life_skipintro) exitWith {
	[] spawn {
		"DynamicBlur" ppEffectEnable true; 
		"DynamicBlur" ppEffectAdjust[0]; 
		"DynamicBlur" ppEffectCommit 3;
		waitUntil {ppEffectCommitted "DynamicBlur"};
		"DynamicBlur" ppEffectEnable true; 
	}; 
};
_camDistance = 150;
waitUntil {alive player};
showCinemaBorder true;
camUseNVG false;
playsound "Intro";
[] spawn {
	"DynamicBlur" ppEffectEnable true; 
	"DynamicBlur" ppEffectAdjust[0]; 
	"DynamicBlur" ppEffectCommit 12;
	waitUntil {ppEffectCommitted "DynamicBlur"};
	"DynamicBlur" ppEffectEnable true; 
}; 
_camera = "camera" camCreate [(position player select 0)-2, position player select 1,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit 16;
waitUntil {camCommitted _camera};
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
sleep 1;