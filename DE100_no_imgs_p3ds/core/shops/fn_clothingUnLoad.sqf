/*
   File:    fn_clothingUnLoad.sqf
   Date:    2017-10-20 13:17:36
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]]
];

private _cam = uiNamespace getVariable ["cam",objNull];
(uiNamespace getVariable ["helpers",[]]) params[
	["_helper", objNull],
	["_prevObj", objNull],
	["_light", objNull],
	["_box", objNull]
];

if (!isNull _cam) then {
	_cam cameraEffect ["Terminate", "BACK"];
	camDestroy _cam;
};

if (!isNull _prevObj) then {
	deleteVehicle _prevObj;	
};

if (!isNull _light) then {
	deleteVehicle _light;	
};

{
	if (!isNull _x) then {
		deleteVehicle _x;	
	};
	nil;
} count _box;

if (!isNull _helper) then {
	deleteVehicle _helper;	
};
