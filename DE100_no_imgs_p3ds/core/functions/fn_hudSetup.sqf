/*
	File:	fn_hudSetup.sqf
	Date:   2016-08-15 02:47:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

if (isNull (uiNameSpace getVariable ["playerHUD",displayNull])) then {
	private _layer = "playerHUD" call BIS_fnc_rscLayer;
	_layer cutRsc ["playerHUD","PLAIN"];
	call life_fnc_hudUpdate;
};
if (isNull (uiNamespace getVariable ["statusBar",displayNull])) then {
	private _layer = "statusBar" call BIS_fnc_rscLayer;
	_layer cutRsc["statusBar","PLAIN"];
};
if !(missionNamespace getVariable ["Life_HUD_Thread",false]) then {
	[{.6},time,life_fnc_hudUpdate] call life_fnc_threadControl;
	missionNamespace setVariable ["Life_HUD_Thread",true];
};
[if ((profileNamespace getVariable ["life_HUD_Mode_de100",1]) isEqualTo 2) then {3;} else {(profileNamespace getVariable ["life_HUD_Mode_de100",1]);}] call life_fnc_moveUi;
