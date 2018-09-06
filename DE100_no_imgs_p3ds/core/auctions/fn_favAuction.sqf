/*
   File:    fn_favAuction.sqf
   Date:    2017-9-17 16:01:00
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
	["_btn", controlNull, [controlNull]]
];

private _display = ctrlParent _btn;
private _aId = _display getVariable ["openAuction",-1];
if (_aId < 0) exitWith {["Ein Fehler ist aufgetreten. Bitte öffne das Auktionshaus neu.", true, "fast"] call life_fnc_notification_system;};
private _favs = profileNamespace getVariable ["de100_auc_watchlist",[]];
if (_aId in _favs) then {
	_favs deleteAt (_favs find _aId);
	[format["Die Auktion #%1 wurde aus deiner Watchliste entfernt",_aId], false, "fast"] call life_fnc_notification_system;
} else {
	_favs pushBackUnique _aId;
	[format["Die Auktion #%1 wurde deiner Watchliste hinzugefügt",_aId], false, "fast"] call life_fnc_notification_system;
};
profileNamespace setVariable ["de100_auc_watchlist",_favs];
saveProfileNamespace;