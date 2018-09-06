/*
	File:	fn_introCamDestroy.sqf
	Date:   2017-06-03 01:59:13
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
life_intro_cam cameraEffect ["TERMINATE","BACK"];
life_intro_cam_ctrls params[
	["_textCtrl", controlNull, [controlNull]],
	["_barCtrl", controlNull, [controlNull]]
];

ctrlDelete _textCtrl;
ctrlDelete _barCtrl;
camDestroy life_intro_cam;
life_intro_cam_ctrls = nil;