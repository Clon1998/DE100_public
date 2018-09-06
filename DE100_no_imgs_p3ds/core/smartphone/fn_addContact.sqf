/*
	File:	fn_addContact.sqf
	Date:   2016-07-31 02:16:40
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
private _display = findDisplay 9200;
private _numberCtrl = _display displayCtrl 9201;
private _number = ctrlText _numberCtrl;
private _target = allPlayers select {_x getVariable ["phoneNumber","nope"] isEqualTo _number};
(findDisplay 9200) closeDisplay 2;

if (count _target == 0) exitWith {["Die Nummer wurde nicht gefunden. Eventuell ist der Spieler, dem die Nummer gehört nicht online.",false,"fast"] call life_fnc_notification_system;};
_target = _target select 0; 
if (_target == player) exitWith {["Du kannst dich nicht als Kontakt hinzufügen",false,"fast"] call life_fnc_notification_system; };

private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
private _infoContact = profileNamespace getVariable [format["DE100_contacts_%1",_flag],[]];

if (getPlayerUID _target in _infoContact) exitWith {["Du hast diesen Kontakt bereits",false,"fast"] call life_fnc_notification_system;};
_infoContact pushBack getPlayerUID _target;
profileNamespace setVariable [format["DE100_contacts_%1",_flag],_infoContact];
[format["%1 wurde zu deinen Kontakten hinzugefügt",_target call life_fnc_name],false,"fast"] call life_fnc_notification_system;