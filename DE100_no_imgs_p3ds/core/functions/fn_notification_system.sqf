/*
	File:	fn_notification_system.sqf
	Date:   2016-07-23 18:15:17
	Author: Patrick "Lucian" Schmidt
	
	Description:
	Arguments:
		0: Text <STRING>
		1: Type <BOOLEAN>
		2: Speed <STRING>
*/

params[
	"_text",
	["_error",false,[false]],
	["_speed","",[""]]
];

if (!hasInterface) exitWith {};

disableSerialization;
private _display = finddisplay 46;
if (profileNamespace getVariable["de100_notify",true]) then {
	if (_error) then {
		playSound "3DEN_notificationWarning";
	} else {
		playSound "HintExpand";
	};
};
private _headerColor = if (_error) then {
	[0.538433,0,0,0.8];
} else {
	[(profileNamespace getVariable['GUI_BCG_RGB_R',0.3843]),(profileNamespace getVariable['GUI_BCG_RGB_G',0.7019]),(profileNamespace getVariable['GUI_BCG_RGB_B',0.8862]),(profileNamespace getVariable['GUI_BCG_RGB_A',0.7])];
};
if (_text isEqualType "") then {
	_text = parseText _text;
};

private _HeaderCords = profileNamespace getVariable["DE100_NOTIFY_CUSTOM_HEADER",[0.005 * safezoneW + safezoneX, 0.01 * safezoneH + safezoneY]];
private _Header = _display ctrlCreate ["RscText", -1];
_Header ctrlSetPosition [_HeaderCords select 0, _HeaderCords select 1, 0.2 * safezoneW, 0.011 * safezoneH];
_Header ctrlSetBackgroundColor _headerColor;
_Header ctrlSetFade 1;
_Header ctrlCommit 0;
_Header ctrlSetFade 0;
_Header ctrlCommit 0.4;

private _TextFieldCords = profileNamespace getVariable["DE100_NOTIFY_CUSTOM_TEXT",[0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY]];
private _TextField = _display ctrlCreate ["RscStructuredText", -1];
_TextField ctrlSetStructuredText _text;
_TextField ctrlSetPosition [_TextFieldCords select 0, _TextFieldCords select 1,0.2 * safezoneW, 0.5];
_TextField ctrlCommit 0;
_TextField ctrlSetPosition [_TextFieldCords select 0, _TextFieldCords select 1,0.2 * safezoneW, ((ctrlTextHeight _TextField) + (0.005 * safezoneH))];
_TextField ctrlSetBackgroundColor [0,0,0,0.85];
_TextField ctrlSetFade 1;
_TextField ctrlCommit 0;
_TextField ctrlSetFade 0;
_TextField ctrlCommit 0.4;

[_TextField,_Header,_speed] spawn {
	disableSerialization;
	if (_this select 2 isEqualTo "fast") then {
		uiSleep 5;
	} else {
		uiSleep 15;
	};
	private _TextField = _this select 0;
	private _Header = _this select 1;
	_TextField ctrlSetFade 1;
	_TextField ctrlCommit 0.3;
	_Header ctrlSetFade 1;
	_Header ctrlCommit 0.3;
	uiSleep 0.3;
	ctrlDelete _Header;
	ctrlDelete _TextField;
};

private _posText = (ctrlPosition (_TextField)) select 1;
private _posHeader = (ctrlPosition (_Header)) select 1;
private _textHigh = (ctrlPosition (_TextField)) select 3;
private _minus = if (_posText < (0.5 * safezoneH + safezoneY)) then {
	1;
} else {
	-1;
};
if (count life_open_notifications > 0) then {
	private _activeNotifications = 0;
	{
		private _ctrlHeader = _x select 0;
		private _ctrlText = _x select 1;
		if (!isNull _ctrlHeader && !isNull _ctrlText) then {
			_ctrlHeader ctrlSetPosition [_HeaderCords select 0, _posHeader + (_textHigh + 1.5*(0.011 * safezoneH)) * _minus];
			_ctrlText ctrlSetPosition [_TextFieldCords select 0, _posText + (_textHigh + 1.5*(0.011 * safezoneH)) * _minus];
			_ctrlHeader ctrlCommit 0.25;
			_ctrlText ctrlCommit 0.25;

			_posText = _posText + (_textHigh + 1.5*(0.011 * safezoneH)) * _minus;
			_posHeader = _posHeader + (_textHigh + 1.5*(0.011 * safezoneH)) * _minus;
			_textHigh = (ctrlPosition (_ctrlText)) select 3;
			if (_activeNotifications > 3) then {
				_ctrlText ctrlSetFade 1;
				_ctrlHeader ctrlSetFade 1;
				_ctrlText ctrlCommit 0.2;
				_ctrlHeader ctrlCommit 0.2;
			};
			_activeNotifications = _activeNotifications + 1;
		};
	} forEach life_open_notifications;
};
life_open_notifications = ([[_Header,_TextField]] + life_open_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)};