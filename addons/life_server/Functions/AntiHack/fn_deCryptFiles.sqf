/*
	File:	fn_deCryptFiles.sqf
	Date:   2017-06-04 18:53:51
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
if (missionNamespace getVariable ["de100_compiled",false]) exitwith {};

private _key = "T8HwOuMfeVaJ8jdk1aQ07BZRB7N9x75QVecBh0vcKutvSUkrqw9UOO2SIquhhchH";
private _keyLen = count _key - 1;
private _sT = diag_tickTime;
private _cnt = 0;
_key = toArray _key;

{
	private _fnc = format["%1_fnc_%2",getText(_x >> "tag"),configName _x];
	private _file = toArray (loadFile getText(_x >> "crypted"));
	private _out = [];

	{
		_out pushBack (_x - (_forEachIndex mod (_key select (_forEachIndex mod _keyLen))) - (_key select (_keyLen - (_forEachIndex mod _keyLen))));
	} foreach _file;
	_out = toString _out;
	missionNamespace setVariable [_fnc,compileFinal ((format['private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};private _fnc_scriptName = "%1";scriptName _fnc_scriptName;',_fnc])+_out)];
	_cnt = _cnt + 1;
	nil;
} count ("true" configClasses (missionconfigfile >> "LucianCryptSys"));

diag_log format ["%1 Funktionen wurden in %2 Sek. compiled",_cnt,diag_tickTime - _st];

private _cnt = 0;
if (!isNil "Exec_After") then {
	{
		_x params[
			["_a", []],
			["_f", "", [""]],
			["_s", false, [false]]
		];
		if (_s) then {
			_a spawn (missionNamespace getVariable [_f,{}]);
		} else {
			_a call (missionNamespace getVariable [_f,{}]);
		};
		_cnt = _cnt + 1;
		nil;
	} count Exec_After;
	Exec_After = nil;
};
diag_log format ["%1 Funktionen wurden Exec_After",_cnt];
missionNamespace setVariable ["de100_compiled",true];