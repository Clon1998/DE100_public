/*
	File:	fn_checkLicense.sqf
	Date:   19.05.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_target", objNull, [objNull]],
	["_mode", 0, [0]],
	["_val", ""]
];

if (_mode == 1) then {
	private _txt = if (_val select 1) then {
		format["hat eine/n %1",localize(getText(missionConfigFile >> "Licenses" >> (_val select 0) >> "displayName"))];
	} else {
		format["hat keine/n %1",localize(getText(missionConfigFile >> "Licenses" >> (_val select 0) >> "displayName"))];
	};
	[format ["%1 %2",_target call life_fnc_name,_txt],false,"fast"] call life_fnc_notification_system;
} else {
	if !(isClass (missionConfigFile >> "Licenses" >> _val)) exitWith {};
	private _b = [0,_val] call life_fnc_handleLicense;
	[format ["Du hast %1 deinen %2 gezeigt",_target call life_fnc_name,localize(getText(missionConfigFile >> "Licenses" >> _val >> "displayName"))],false,"fast"] call life_fnc_notification_system;
	[player,1,[_val,_b]] remoteExecCall ["life_fnc_checkLicense",_target];
};