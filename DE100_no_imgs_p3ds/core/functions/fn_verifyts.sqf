/*
   File:    fn_verifyts.sqf
   Date:    2017-10-28 18:56:32
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
private _token = ctrlText (_display displayCtrl 4001);

if (_token isEqualTo "") exitWith {["Du musst einen Token eingeben", true, "fast"] call life_fnc_notification_system;};
["Deine Anfrage wird an den Server geschickt", false, "fast"] call life_fnc_notification_system;
closeDialog 0;
if (life_HC_isActive) then {
	[getPlayerUID player, call life_clientId select 0,_token] remoteExec ["MSC_fnc_teamspeak",HC_Life];
} else {
    [getPlayerUID player, call life_clientId select 0,_token] remoteExec ["MSC_fnc_teamspeak",2];
};