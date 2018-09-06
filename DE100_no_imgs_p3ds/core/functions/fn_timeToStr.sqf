/*
	File:	fn_timeToStr.sqf
	Date:   2016-10-30 20:48:50
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Transforms time var into a nice looking string.
	Returns time and date in two seperate strings

	_mode
	0 - str
	1 - db
	2 - array
*/
params[
	["_mode", 0],
	["_date",life_real_time]
];
private _addZero = {
	params[
		["_number", 0, [0]]
	];
	if (_number < 10) exitWith {
		format ["0%1",_number];
	};
	_number;
};

private _year = _date select 0;
private _month = [_date select 1] call _addZero;
private _day = [_date select 2] call _addZero;
private _hr = [_date select 3] call _addZero;
private _min = [_date select 4] call _addZero;

private _return = call {
	if (_mode == 0) exitWith {
		format["%1.%2.%3 %4:%5",_day,_month,_year,_hr,_min];
	};

	if (_mode == 1) exitWith {
		format["%1-%2-%3 %4:%5:00",_year,_month,_day,_hr,_min];
	};

	if (_mode == 2) exitWith {
		[format["%1:%2", _hr, _min],format["%1.%2.%3", _day, _month, _year]];
	};
};

_return;