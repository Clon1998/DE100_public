/*
	File:	fn_prof_LB_res_change.sqf
	Date:   2016-07-28 20:51:07
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_rLB", controlNull, [controlNull]],
	["_index", 0, [-1]],
	"_nLvlV",
	"_cVal",
	"_nVal"
];

if (_index < 0) exitWith {};
private _display = ctrlParent _rLB;
private _typeListBox = 	_display displayCtrl 7730;

private _nAdv = _display displayCtrl 7734;
private _cAdv = _display displayCtrl 7735;
private _nLvl = _display displayCtrl 7736;
private _cLvl = _display displayCtrl 7737;

private _cEntry = _rLB lbData _index;
private _var = getText(missionConfigFile >> "ProfSys" >> _cEntry >> "variable");
private _pData = missionNamespace getVariable [_var,[0,0]];

private _needed = 500 max (_pData select 0)*(500 + (_pData select 0)*500);	
private _lvlClasses = "true" configClasses (missionConfigFile >> "ProfSys" >> _cEntry >> "Levels");

if ((_pData select 0) < (count _lvlClasses-1)) then {
	_nLvlV = (_pData select 0) + 2;
	_needed = [_needed] call life_fnc_numberText;
} else {
	_nLvlV = "Max.";
	_needed = "Max.";
};
private _params = getArray(missionConfigFile >> "ProfSys" >> _cEntry >> "Levels" >> "params");
private _cAdvTxt = "<t size='1.05' align='left'>";
private _nAdvTxt = "<t size='1.05' align='left'>";
{
	switch (_x select 1) do {
		case "ARRAY" : {
			_cVal = format["%1%2%3%4",_x select 2,(getArray((_lvlClasses select (_pData select 0)) >> (_x select 0))) select 0,if ((getArray((_lvlClasses select (_pData select 0)) >> (_x select 0)) select 1) >  0) then {format[" - %1",(getArray((_lvlClasses select (_pData select 0)) >> (_x select 0)) select 0)+(getArray((_lvlClasses select (_pData select 0)) >> (_x select 0)) select 1)]} else {""},_x select 3];
			_nVal = if ((_pData select 0) < (count _lvlClasses-1)) then {
				format["%1%2%3%4",_x select 2,(getArray((_lvlClasses select ((_pData select 0)+1)) >> (_x select 0))) select 0,if ((getArray((_lvlClasses select ((_pData select 0)+1)) >> (_x select 0)) select 1) > 0) then {format[" - %1",(getArray((_lvlClasses select ((_pData select 0)+1)) >> (_x select 0)) select 0)+(getArray((_lvlClasses select ((_pData select 0)+1)) >> (_x select 0)) select 1)]} else {""},_x select 3];
			} else {
				format["%1Max.",_x select 2];
			};
		};
		case "INT" : {
			_cVal = format["%1%2%3",_x select 2,getNumber((_lvlClasses select (_pData select 0)) >> (_x select 0)),_x select 3];
			_nVal = if ((_pData select 0) < (count _lvlClasses-1)) then {
				format["%1%2%3",_x select 2,getNumber((_lvlClasses select ((_pData select 0)+1)) >> (_x select 0)),_x select 3];
			} else {
				format["%1Max.",_x select 2];
			};
		};
		case "INTP" : {
			_cVal = format["%1%2%3",_x select 2,if ((getNumber((_lvlClasses select 0) >> (_x select 0))-(getNumber((_lvlClasses select (_pData select 0)) >> (_x select 0)))) != 0) then { format["%2%1",((getNumber((_lvlClasses select 0) >> (_x select 0))-(getNumber((_lvlClasses select (_pData select 0)) >> (_x select 0))))*-100/getNumber((_lvlClasses select 0) >> (_x select 0))) toFixed 1,if ((getNumber((_lvlClasses select 0) >> (_x select 0))-(getNumber((_lvlClasses select (_pData select 0)) >> (_x select 0)))) > 0) then {""} else {"+"}]} else {"+-0"},_x select 3];
			_nVal = if ((_pData select 0) < (count _lvlClasses-1)) then {
				format["%1%2%3",_x select 2,if ((getNumber((_lvlClasses select 0) >> (_x select 0))-getNumber((_lvlClasses select ((_pData select 0)+1)) >> (_x select 0))) != 0) then {format["%2%1",((getNumber((_lvlClasses select 0) >> (_x select 0))-(getNumber((_lvlClasses select ((_pData select 0))+1) >> (_x select 0))))*-100/getNumber((_lvlClasses select 0) >> (_x select 0))) toFixed 1,if ((getNumber((_lvlClasses select 0) >> (_x select 0))-(getNumber((_lvlClasses select ((_pData select 0))+1) >> (_x select 0)))) > 0) then {""} else {"+"}]} else {"+-0"},_x select 3];
			} else {
				format["%1Max.",_x select 2];
			};
		};
	};
	private _ext = "";
	if (_forEachIndex != 0) then {
		_ext = "<br/>"
	};
	_cAdvTxt = _cAdvTxt + _ext + _cVal;
	_nAdvTxt = _nAdvTxt + _ext + _nVal;
} forEach _params;
_cAdvTxt = _cAdvTxt + "</t>";
_nAdvTxt = _nAdvTxt + "</t>";

_cLvl ctrlSetStructuredText parseText format["<t size='1.05' align='left'>Level: %1<br/>Akt. Erf.: %2</t>",(_pData select 0) + 1, [_pData select 1]call life_fnc_numberText];
_nLvl ctrlSetStructuredText parseText format["<t size='1.05' align='left'>Level: %1<br/>Ben. Erf.: %2</t>",_nLvlV,_needed];
	
_cAdv ctrlSetStructuredText parseText _cAdvTxt;
_nAdv ctrlSetStructuredText parseText _nAdvTxt;