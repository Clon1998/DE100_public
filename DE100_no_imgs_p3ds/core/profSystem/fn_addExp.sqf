/*
	File:	fn_addExp.sqf
	Date:   2016-10-31 18:12:40
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params [
	["_cEntry", "", [""]],
	["_add", 0, [0]]
];

if !(isClass(missionConfigFile >> "ProfSys" >> _cEntry)) exitwith {};
	
private _var = getText(missionConfigFile >> "ProfSys" >> _cEntry >> "variable");
private _data = missionNamespace getVariable [_var,[0,0]];
private _crnt = _data select 0;
private _exp = _data select 1;
private _needed = 500 max _crnt*(500 + _crnt*500);
_exp = _exp + _add;
if (_exp >= _needed) then {
	_maxC = count ("true" configClasses (missionConfigFile >> "ProfSys" >> _cEntry >> "Levels")) - 1;
	if (_crnt < _maxC) then {
		_exp = (_exp - _needed) max 0;
		_crnt = _crnt + 1;
		playSound "levelup";
		[format["<t size= '1.3' align='center'>Glückwunsch, die Fähigkeit: <t color='#f19727'>%1</t> <br/>ist nun auf Level: <br/><t color='#e74817'>%2</t></t>",getText(missionConfigFile >> "ProfSys" >> _cEntry >> "displayName"),_crnt+1],false,"slow"] call life_fnc_notification_system;
		["PROF"] call SOCK_fnc_updatePartial;
	};
};

missionNamespace setVariable [_var,[_crnt,_exp]];