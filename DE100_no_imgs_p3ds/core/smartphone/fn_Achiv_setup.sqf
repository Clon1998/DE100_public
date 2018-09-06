/*
	File:	fn_Achiv_setup.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_dialog", displayNull, [displayNull]]
];

private _AchivList = _dialog displayCtrl 7203;
private _description = _dialog displayCtrl 7204;
private _setTitel_btn = _dialog displayCtrl 7205;
private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};

tvClear _AchivList;
_setTitel_btn ctrlEnable false;

private _AchivmenArray = format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Achievements");

if (count _AchivmenArray == 0) exitWith {["Leider gibt es keine Erfolge für deine Fraktion.",true,"fast"] call life_fnc_notification_system; closeDialog 0;};

{
	private _titel = getText(_x >> "titel");
	private _variable = getText(_x >> "variable");
	private _data = missionNamespace getVariable [_variable,[0,0]];//0: Counter 1: Reached
	_AchivList tvAdd [[],_titel];
	_AchivList tvSetData [[_forEachIndex],(configName _x)];
	private _OuterforEachIndex = _forEachIndex;
	{
		private _displayName = getText (_x >> "displayName");
		private _picture = if ((_forEachIndex + 1) > _data select 1) then {"images\icons\ico_noreached.paa"} else {"images\icons\ico_reached.paa"};
		_AchivList tvAdd [[_OuterforEachIndex],_displayName];
		_AchivList tvSetPicture [[_OuterforEachIndex,_forEachIndex],_picture];
		_AchivList tvSetData [[_OuterforEachIndex,_forEachIndex],configName _x];
	} forEach ("true" configClasses (_x >> "Titels"));
} forEach _AchivmenArray;