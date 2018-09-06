/*
	File:	fn_introCamCreate.sqf
	Date:   2017-06-03 01:51:30
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
life_intro_cam = "camera" camCreate [4853.47,21959.3,5.22043];
life_intro_cam cameraEffect ["INTERNAL","BACK"];
life_intro_cam camSetFOV 0.700;
life_intro_cam_last = 0;

private _text = (findDisplay 46) ctrlCreate ["RscStructuredText",-1];
private _bar = (findDisplay 46) ctrlCreate ["RscText",-1];

_text ctrlSetPosition [0.314375 * safezoneW + safezoneX,0.888 * safezoneH + safezoneY,0.37125 * safezoneW,0.033 * safezoneH];
_bar ctrlSetPosition [(0.314375 * safezoneW + safezoneX) + 0.185625 * safezoneW,0.921 * safezoneH + safezoneY,0,0.033 * safezoneH];
_text ctrlCommit 0;
_bar ctrlCommit 0;
life_intro_cam_ctrls = [_text,_bar];

0 call life_fnc_introCamSetPerc;