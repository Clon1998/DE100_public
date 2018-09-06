/*
	File:	fn_smartphoneCall.sqf
	Date:   2016-07-30 23:22:16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
private _display = findDisplay 4000;
private _infoText = _display displayCtrl 9499;
private _editField = _display displayCtrl 9500;

_infoText ctrlSetStructuredText parseText format["Eigene Rufnummer:<br/> %1 <br/>€5,000 pro Minute",player getVariable ["phoneNumber","nope"]];
_editField ctrlSetText format["%1",player getVariable ["phoneNumber","nope"]];