/*
	File:	fn_getProf.sqf
	Date:   2017-03-25 21:45:41
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_cEntry", "", [""]]
];
if !(isClass(missionConfigFile >> "ProfSys" >> _cEntry)) exitwith {[];};
private _ret = [];
private _levels = "true" configClasses (missionConfigFile >> "ProfSys"  >> _cEntry >> "Levels");
private _var = getText(missionConfigFile >> "ProfSys" >> _cEntry >> "variable");
private _params = getArray(missionConfigFile >> "ProfSys" >> _cEntry >> "Levels" >> "params");
private _crnt = (missionNamespace getVariable [_var,[0,0]]) select 0;
_levels = _levels select _crnt;

{
	if (_x select 1 in ["INT","INTP"]) then {
		_ret pushBack getNumber(_levels >> (_x select 0));
	};
	if (_x select 1 == "ARRAY") then {
		private _i = getArray(_levels >> (_x select 0));
		_ret pushBack round((_i select 0)+ random (_i select 1));
	};
	nil
} count _params;
_ret;