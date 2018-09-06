/*
	File:	fn_progressBar.sqf
	Date:   2017-03-03 16:33:29
	Author: Patrick "Lucian" Schmidt
	Inspired by ACE and Exiles progressBar
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_time", 5, [0]],
	["_title", "", [""]],
	["_interrupt", {}, [{}]],
	["_args", []],
	["_onFinish", {}, [{}]],
	["_onFail", {}, [{}]],
	["_spawn",false]
];

private _perc = 0;
private _startTime = diag_tickTime;
private _step = _time/100;
("life_progress_adv" call BIS_fnc_rscLayer) cutRsc ["life_progress_adv","PLAIN",1,true];

private _display = uiNameSpace getVariable "life_progress_adv";

private _bar = _display displayCtrl 38201;
private _header = _display displayCtrl 38202;
private _barPos = _bar getVariable ["iniPos",ctrlPosition _bar];
_header ctrlSetText format["%1 - %2%3",_title,0,"%"];
_bar ctrlSetPosition _barPos;
_bar ctrlCommit _time;
try {
	for "_i" from 0 to 1 step 0 do {
		_perc = ((diag_tickTime - _startTime) / _time) min 1;;
		uiSleep _step;
		if (_perc >= 1) then {
			throw true;
		};
		if (call _interrupt || !alive player || missionNamespace getVariable ["life_interrupted",false] || !(player getVariable["isAlive",true])) then {
			life_interrupted = false;
			throw false;
		};
		_header ctrlSetText format["%1 - %2%3",_title,round(_perc*100),"%"];
		_bar ctrlSetBackgroundColor [0.7483-(_perc*0.7483),_perc*0.4,0,1];
	};
	throw true;
} catch {
	if (_args isEqualType []) then {
		_args pushBack _exception; 
	};
	if (_exception) then {
		_header ctrlSetText format["%1 - %2%3",_title,100,"%"];
		if (_spawn) then {
			_args spawn _onFinish;
		} else {
			_args call _onFinish;
		};
	} else {
		_bar ctrlSetPosition (ctrlPosition _bar);
		_bar ctrlCommit 0;
		if (_spawn) then {
			_args spawn _onFail;
		} else {
			_args call _onFail;
		};
	};
	("life_progress_adv" call BIS_fnc_rscLayer) cutFadeOut 1;
};