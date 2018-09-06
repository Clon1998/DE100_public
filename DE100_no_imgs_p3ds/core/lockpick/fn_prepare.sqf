/*
	File:	fn_prepare.sqf
	Date:   2017-05-31 12:28:41
	Author: Patrick "Lucian" Schmidt (DE100) & - RamBob(Team ELAN)
	Disclaimer: This script was developted as a result of a co-operation betwen DE100-Altis.Life and Team-Elan.de.
				No one besides the two mentioned communitys is allowed to use and/or edit the script.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_display", displayNull, [displayNull]]
];
setMousePosition [0.5, 0.5];
_display call life_fnc_bgBlure;
private _pickRange = getNumber(missionConfigFile >> "Life_Settings" >> "lpick_sys_range");
private _lpick = _display ctrlCreate ["RscPictureKeepAspect",-1];
_lpick ctrlSetPosition [0.223 * safezoneW + safezoneX,-0.07 * safezoneH + safezoneY,0.541406 * safezoneW,0.913 * safezoneH];
_lpick ctrlCommit 0;
_lpick ctrlSetText "images\dialog\lockpick.paa";
private _pos = ctrlPosition _lpick;
_lpick setVariable ["iniPos",_pos];
_display setVariable ["lockPick",_lpick];
_display setVariable ["targetAngle",_pickRange/2 - random _pickRange];
_display setVariable ["eachFrameEVH",addMissionEventHandler ["EachFrame", {call lpick_fnc_checkLock;}]];

_display setVariable ["params",uiNamespace getVariable ["de100_lPickSys_params",[]]];
_display setVariable ["code",uiNamespace getVariable ["de100_lPickSys_code",{}]];
_display setVariable ["tolerance",uiNamespace getVariable ["de100_lPickSys_tol",getNumber(missionConfigFile >> "Life_Settings" >> "lpick_sys_tolerance")]];
_display setVariable ["perc",uiNamespace getVariable ["de100_lPickSys_perc",getNumber(missionConfigFile >> "Life_Settings" >> "lpick_sys_perc")]];

uiNamespace setVariable ["de100_lPickSys_code",nil];
uiNamespace setVariable ["de100_lPickSys_params",nil];
uiNamespace setVariable ["de100_lPickSys_tol",nil];
uiNamespace setVariable ["de100_lPickSys_perc",nil];
_display call lpick_fnc_rotateLPick;