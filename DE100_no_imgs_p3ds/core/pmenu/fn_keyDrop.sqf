/*
	File:	fn_keyDrop.sqf
	Date:   01.08.16
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
private _vLb = _display displayCtrl 2701;

if ((lbCurSel _vLb) == -1) exitWith {["Kein Schlüssel ausgewählt",true,"fast"] call life_fnc_notification_system;};
private _veh = objectFromNetId (_vLb lbData (lbCurSel _vLb));

if(_veh isKindOf "House_F") exitWith {["Die Schlüssel deines Hauses kannst du nicht wegwerfen",true,"fast"] call life_fnc_notification_system;};
private _owners = _veh getVariable ["key_owners",[]];
life_vehicles deleteAt (life_vehicles find _veh);

_owners deleteAt ([(getPlayerUID player),_owners] call life_fnc_index);
_veh setVariable ["key_owners",_owners,true];

[_display] call life_fnc_keyMenu;