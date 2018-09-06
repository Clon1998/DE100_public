/*
	File:	fn_timeDiff.sqf
	Date:   2017-08-13 01:47:09
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
params[
	["_date1", [], [[]]],
	["_date2", [], [[]]]
];

private _raw = ([_date1] call life_fnc_timeUnix) - ([_date2] call life_fnc_timeUnix);
private _left = abs _raw;
private _week = floor(_left/(60*60*24*7));
_left = _left - _week*60*60*24*7;
private _day = floor(_left/(60*60*24));
_left = _left - _day*60*60*24;
private _hr = floor(_left/(60*60));
_left = _left - _hr*60*60;
private _min = floor(_left/(60));
_left = _left - _min*60;
private _sec = _left;

private _ret = call {
	if (_week > 0) exitWith {
		if (_week > 1) then {
			format["%1 Wochen",_week];
		} else {
			format["%1 Woche",_week];
		};
	};

	if (_day > 0) exitWith {
		if (_day > 1) then {
			format["%1 Tage",_day];
		} else {
			format["%1 Tag",_day];
		};
	};

	if (_hr > 0) exitWith {
		if (_hr > 1) then {
			format["%1 Stunden",_hr];
		} else {
			format["%1 Stunde",_hr];
		};
	};

	if (_min > 0) exitWith {
		if (_min > 1) then {
			format["%1 Minuten",_min];
		} else {
			format["%1 Minute",_min];
		};
	};

	if (_sec > 0) exitWith {
		if (_sec > 1) then {
			format["%1 Sekunden",_sec];
		} else {
			format["%1 Sekunde",_sec];
		};
	};
};

[_raw <= 0,_ret,_raw];