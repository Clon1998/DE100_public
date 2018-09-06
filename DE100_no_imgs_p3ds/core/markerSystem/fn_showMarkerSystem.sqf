/*
	File:	fn_showMarkerSystem.sqf
	Date:   2016-09-27 14:45:21
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;

findDisplay 12 setVariable ["MarkerSystemPos",true];

private _Background = findDisplay 12 getVariable ["MarkerSystemBackGround",controlNull];
private _Settings_Icon = findDisplay 12 getVariable ["MarkerSystemSettings_Icon",controlNull];
private _Settings_Btn = findDisplay 12 getVariable ["MarkerSystemSettings_Btn",controlNull];
private _Header = findDisplay 12 getVariable ["MarkerSystemHeader",controlNull];
private _Tree = findDisplay 12 getVariable ["MarkerSystemBOX",controlNull];


private _allCtrls = [_Background,_Header,_Tree];
private _distance = (safezoneW + safezoneX) - (0.768125 * safezoneW + safezoneX);

private _moveTimer = time + 0.5;
{
	private _pos = ctrlPosition _x;
	_x ctrlSetPosition [((_pos select 0) - _distance),_pos select 1];
	_x ctrlCommit (_moveTimer - time);
} forEach _allCtrls;

waitUntil {(ctrlPosition _Background select 0) <= (0.977 * safezoneW + safezoneX)};
_Settings_Icon ctrlSetPosition [0.773281 * safezoneW + safezoneX, 0.9532 * safezoneH + safezoneY];
_Settings_Btn ctrlSetPosition [0.773281 * safezoneW + safezoneX, 0.9532 * safezoneH + safezoneY];

_Settings_Icon ctrlCommit (_moveTimer - time);
_Settings_Btn ctrlCommit (_moveTimer - time);
_Settings_Icon ctrlSetFade 1;
_Settings_Icon ctrlCommit (_moveTimer - time)/2;
private _fadeTimer = time;
waitUntil {time >= ((_moveTimer - time)/2 + _fadeTimer)};
_Settings_Icon ctrlSetText "images\dialog\ico_back.paa";
_Settings_Btn buttonSetAction "[] spawn life_fnc_hideMarkerSystem";
_Settings_Btn ctrlSetTooltip "";
_Settings_Icon ctrlSetFade 0;
_Settings_Icon ctrlCommit (_moveTimer - time)/2;