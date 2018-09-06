/*
	File:   fn_settingsMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then
{
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;
private _display = findDisplay 2900;

ctrlSetText[2902, format["%1", de100_vd_foot]];
ctrlSetText[2912, format["%1", de100_vd_car]];
ctrlSetText[2922, format["%1", de100_vd_air]];

//Setup Sliders range
{
	slidersetRange [_x,100,12000];
} foreach [2901,2911,2921];
//Setup Sliders speed
{ 
	((findDisplay 2900) displayCtrl _x) sliderSetSpeed [100,100,100]; 
} foreach [2901,2911,2921];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,de100_vd_foot],[2911,de100_vd_car],[2921,de100_vd_air]];


(_display displayCtrl 2971) cbSetChecked life_sidechat;
(_display displayCtrl 2970) cbSetChecked life_tagson;
(_display displayCtrl 2972) cbSetChecked life_revealObjects;
(_display displayCtrl 2973) cbSetChecked life_skipintro;
(_display displayCtrl 2974) cbSetChecked life_screenshot;
(_display displayCtrl 2975) cbSetChecked (profileNamespace getVariable["de100_notify",true]);
(_display displayCtrl 2976) cbSetChecked (profileNamespace getVariable["DarkPhone",false]);