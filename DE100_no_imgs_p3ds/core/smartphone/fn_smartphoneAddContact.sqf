/*
	File:	fn_smartphoneAddContact.sqf
	Date:   2016-07-31 02:49:19
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]]
];
private _infoText = _display displayCtrl 9202;
_infoText ctrlSetStructuredText parseText "Gib die Nummer eines anderen Spielers ein.<br/>Falls die Nummer existiert, wird der Spieler automatisch zu deinen Kontakten hinzugefügt.";