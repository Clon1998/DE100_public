/*
	File:	fn_SetTitle.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


disableSerialization;
private _dialog = findDisplay 7200;
private _AchivList = _dialog displayCtrl 7203;

private _className = _AchivList tvData [(tvCurSel _AchivList) select 0];
private _levelData = _AchivList tvData (tvCurSel _AchivList);

_titleData = if !(isNil {profileNamespace getVariable ["life_crnt_title_de100",nil]}) then {
	profileNamespace getVariable ["life_crnt_title_de100",nil];
} else {
	["Nope","Nope","Nope"];
};
private _set = true;
if ((_className isEqualTo (_titleData select 1)) && (_levelData isEqualTo (_titleData select 2))) then {
	_set = false;
};
if (!_set) then {
	profileNamespace setVariable ["life_crnt_title_de100",nil];
	player setVariable ["life_crnt_title_de100",nil,true];
	["Titel entfernt",false,"fast"] call life_fnc_notification_system;
} else {
	profileNamespace setVariable ["life_crnt_title_de100",[getText(missionConfigFile >> "Achievements" >> _className >> "Titels" >> _levelData >> "displayName"),_className,_levelData]];
	player setVariable ["life_crnt_title_de100",getText(missionConfigFile >> "Achievements" >> _className >> "Titels" >> _levelData >> "displayName"),true];
	[format["%1 wurde als Titel festgelegt",getText(missionConfigFile >> "Achievements" >> _className >> "Titels" >> _levelData >> "displayName")],false,"fast"] call life_fnc_notification_system;
};

closeDialog 0;