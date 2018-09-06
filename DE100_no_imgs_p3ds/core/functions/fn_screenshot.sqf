/*
	File:	fn_screenshot.sqf
	Date:   10.05.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
if (life_screenshot) then {
	life_hud_settings = shownHUD;
	showHUD [false,false,false,false,false,false,false,false];
	showChat false;
} else {
	showHUD life_hud_settings;
	life_hud_settings = [];
	showChat true;
};