/*
	File:	fn_faq_init.sqf
	Date:   2016-07-26 01:32:34
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]]
];

private _header = _display displayCtrl 4001;
private _textBox = _display displayCtrl 4002;
private _listBox = _display displayCtrl 4004;
private _faqClasses = "getText(_x >> 'type') != ''" configClasses (missionConfigFile >> "frequently_asked_questions");

_header ctrlSetStructuredText parseText "<t size='6' align='center'>DE100-Infocenter</t>";

lbClear _listBox;
{
	_listBox lbAdd getText(_x >> "displayname");
	_listBox lbSetData [(lbSize _listBox)-1,configName _x];
} forEach _faqClasses;
lbSort _listBox;
_listBox lbSetCurSel 0;
[_listBox] spawn {
	disableSerialization;
	private _listBox = _this select 0;
	[_listBox,0] call life_fnc_faq_lbChange;	
};