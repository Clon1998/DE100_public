/*
	File:	fn_setSections.sqf
	Date:   2017-09-08 22:26:29
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_display", displayNull, [displayNull]],
	["_settings", [], [[]]]
];

private _grp = _display displayCtrl 4200;

for "_i" from 4201 to 4207 do {
	(_grp controlsGroupCtrl _i) ctrlShow false;
};

{
	private _ctrl = _grp controlsGroupCtrl (4201+_forEachIndex);
	_ctrl ctrlShow true;
	_ctrl ctrlEnable true;
	_ctrl ctrlSetTooltip (_x select 0);
	_ctrl ctrlSetText (_x select 1);
	_ctrl ctrlSetEventHandler ["ButtonClick",_x select 2];
} forEach _settings;