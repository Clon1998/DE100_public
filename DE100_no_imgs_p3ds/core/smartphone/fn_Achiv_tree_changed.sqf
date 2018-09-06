/*
	File:	fn_Achiv_tree_changed.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_AchivList", controlNull, [controlNull]],
	["_path", [], [[]]]
];

private _dialog = findDisplay 7200;
private _description = _dialog displayCtrl 7204;
private _setTitel_btn = _dialog displayCtrl 7205;

private _className = _AchivList tvData [_path select 0];
private _levelData = _AchivList tvData _path;
private _variable = getText (missionConfigFile >> "Achievements" >> _className >> "variable");
private _descriptionText = getText(missionConfigFile >> "Achievements" >> _className >> "description"); 

private _data = missionNamespace getVariable [_variable,[0,0]]; 

private _titleData = if !(isNil {profileNamespace getVariable ["life_crnt_title_de100",nil]}) then {
	profileNamespace getVariable ["life_crnt_title_de100",nil];
} else {
	["Nope","Nope","Nope"];
};


_description ctrlSetStructuredText parseText format[_descriptionText,[_data select 0] call life_fnc_numberText,[getNumber (missionConfigFile >> "Achievements" >> _className >> "Titels" >> _levelData >> "needed")] call life_fnc_numberText];

if (_levelData isEqualTo _className) then {
	_description ctrlSetStructuredText parseText "";
};

if (_className isEqualTo (_titleData select 1) && _levelData isEqualTo (_titleData select 2)) then {
	_setTitel_btn ctrlSetText "Titel entfernen";
} else {
	_setTitel_btn ctrlSetText "Als Titel festlegen";
};

if (_data select 0 < getNumber (missionConfigFile >> "Achievements" >> _className >> "Titels" >> _levelData >> "needed") || _levelData isEqualTo _className || !(playerSide in [civilian,west])) then {
	_setTitel_btn ctrlEnable false;
} else {
	_setTitel_btn ctrlEnable true;
};