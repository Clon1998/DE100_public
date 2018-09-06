/*
   File:    fn_deleteAuction.sqf
   Date:    2017-9-17 17:03:41
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
if !(missionNamespace getVariable ["life_ac_ready",false]) exitWith {
	_display closeDisplay 0;
	["Oooops,<br/>es scheint so als wäre das Auktionshaus noch nicht bereit. Bitte versuche es in 1-2 Minuten nochmal.", true, "slow"] call life_fnc_notification_system;
};
private _aId = _display getVariable ["openAuction",-1];
if (_aId < 0) exitWith {["Ein Fehler ist aufgetreten. Bitte öffne das Auktionshaus neu.", true, "fast"] call life_fnc_notification_system;};
private _aData = [_aId,_display getVariable ["tableData",[]]] call life_fnc_dataFromKey;
private _bHisData = de100_ac_storage getVariable [format["%1_auction_history",_aId],[]];
if !(_aData select 0 isEqualTo getPlayerUID player) exitWith {
	closeDialog 0;
	["Entschuldigung es scheint so, als wäre ein Fehler aufgetreten.", true, "fast"] call life_fnc_notification_system;
};

if (count _bHisData > 1) exitWith {
    ["Du kannst eine laufende Auktion nicht zurückziehen", false, "fast"] call life_fnc_notification_system;
};

["Deine Anfrage wird an den Server geschickt", false, "fast"] call life_fnc_notification_system;
if (life_HC_isActive) then {
	[getPlayerUID player, call life_clientId select 0,_aId] remoteExec ["AC_fnc_delete",HC_Life];
} else {
    [getPlayerUID player, call life_clientId select 0,_aId] remoteExec ["AC_fnc_delete",2];
};