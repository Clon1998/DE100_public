/*
	File:	fn_hideMarkerSystem.sqf
	Date:   2016-09-27 14:45:29
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
params[
	["_mode", "", [""]]
];

disableSerialization;
findDisplay 12 setVariable ["MarkerSystemPos",false];

private _Background = findDisplay 12 getVariable ["MarkerSystemBackGround",controlNull];
private _Settings_Icon = findDisplay 12 getVariable ["MarkerSystemSettings_Icon",controlNull];
private _Settings_Btn = findDisplay 12 getVariable ["MarkerSystemSettings_Btn",controlNull];
private _Header = findDisplay 12 getVariable ["MarkerSystemHeader",controlNull];
private _Tree = findDisplay 12 getVariable ["MarkerSystemBOX",controlNull];

private _allCtrls = [_Background,_Header,_Tree];
private _distance = (safezoneW + safezoneX) - (0.768125 * safezoneW + safezoneX);

if (_mode isEqualTo "instant") then {
	{
		private _pos = ctrlPosition _x;
		_x ctrlSetPosition [((_pos select 0) + _distance),_pos select 1];
		_x ctrlCommit 0;
	} forEach _allCtrls;

	_Settings_Icon ctrlSetPosition [0.972312 * safezoneW + safezoneX, 0.9532 * safezoneH + safezoneY];
	_Settings_Btn ctrlSetPosition [0.972312 * safezoneW + safezoneX, 0.9532 * safezoneH + safezoneY];
	_Settings_Icon ctrlCommit 0;
	_Settings_Btn ctrlCommit 0;
} else {
	{
		private _pos = ctrlPosition _x;
		_x ctrlSetPosition [((_pos select 0) + _distance),_pos select 1];
		_x ctrlCommit 0.5;
	} forEach _allCtrls;

	_Settings_Icon ctrlSetPosition [0.972312 * safezoneW + safezoneX, 0.9532 * safezoneH + safezoneY];
	_Settings_Btn ctrlSetPosition [0.972312 * safezoneW + safezoneX, 0.9532 * safezoneH + safezoneY];
	_Settings_Icon ctrlCommit 0.4275;
	_Settings_Btn ctrlCommit 0.4275;

	_Settings_Icon ctrlSetFade 1;
	_Settings_Icon ctrlCommit 0.44/2;
	private _fadeTimer = time;
	waitUntil {time >= (0.4375/2 + _fadeTimer)};
	_Settings_Icon ctrlSetFade 0;
	_Settings_Icon ctrlCommit 0.44/2;
};

_Settings_Icon ctrlSetText "images\dialog\ico_settings.paa";
_Settings_Btn buttonSetAction "[] spawn life_fnc_showMarkerSystem";