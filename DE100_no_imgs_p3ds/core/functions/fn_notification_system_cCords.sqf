/*
	File:	fn_notification_system_cCords.sqf
	Date:   2016-12-31 15:08:56
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_display", displayNull, [displayNull]],
	["_exitCode", 0, [0]],
	"_headerPos",
	"_textPos"
];
if (_display getVariable ["reset",false]) then {
	_headerPos = nil;
	_textPos = nil;
} else {
	_headerPos = ctrlPosition (_display displayCtrl 1);
	_textPos = ctrlPosition (_display displayCtrl 2);
};
profileNamespace setVariable["DE100_NOTIFY_CUSTOM_HEADER",_headerPos select [0,2]];
profileNamespace setVariable["DE100_NOTIFY_CUSTOM_TEXT",_textPos select [0,2]];
[] spawn {
	uiSleep 1;
	["Die neue Position wurde gespeichert.",false,"fast"] call life_fnc_notification_system;
}