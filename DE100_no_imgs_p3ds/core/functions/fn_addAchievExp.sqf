/*
	File:	fn_addAchievExp.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params [
	["_className", "", [""]],
	["_amount", 0, [0]]
];

private _side = getText (missionConfigFile >> "Achievements" >> _className >> "side");
private _playerSide = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
if !(_playerSide isEqualTo _side) exitWith {};

waitUntil {
	(uiNamespace getVariable ["Achi_Notifyer",displayNull]) isEqualTo displayNull;
};
private _AchiConfig = "true" configClasses (missionConfigFile >> "Achievements" >> _className >> "Titels");
private _variable = getText (missionConfigFile >> "Achievements" >> _className >> "variable");


private _data = missionNamespace getVariable [_variable,[0,0]];
private _counter = _data select 0;
private _reached = _data select 1;
if (_reached < 0) then {
	_reached = 0;
};
private _toUp = -1;

if (_reached + 1 <= count _AchiConfig) then {
	_toUp = getNumber ((_AchiConfig select _reached) >> "needed");
};
_amount = _amount + _counter;

if (_amount >= _toUp && _toUp >= 0) then {
	_reached = _reached + 1;
	missionNamespace setVariable [_variable,[_amount,_reached]];

	3 cutRsc["Achi_Notifyer","PLAIN"];
	private _dialog = 	uiNamespace getVariable "Achi_Notifyer";
	private _Bg 	= 	_dialog displayCtrl 3001;
	private _Txt 	= 	_dialog displayCtrl 3002;
	_Txt ctrlSetStructuredText parseText format["<t size='1.4'>Erfolg erhalten:<br/></t><t size='1.4'>%1 </t>",getText ((_AchiConfig select (_reached -1)) >> "displayName")];
	_Bg ctrlSetPosition [(0.329983 * safezoneW + safezoneX),(0.027 * safezoneH + safezoneY)];
	_Txt ctrlSetPosition [(0.40499 * safezoneW + safezoneX),(0.038 * safezoneH + safezoneY)];
	_Bg ctrlCommit 4;
	_Txt ctrlCommit 4;
	sleep 3;
	playSound "levelup";
	["ACHIV"] call SOCK_fnc_updatePartial;
} else {
	missionNamespace setVariable [_variable,[_amount,_reached]];
};

