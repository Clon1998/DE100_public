/*
	File:	fn_timeUnix.sqf
	Date:   2017-08-24 22:33:24
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Calcs seconds since 1 Feb. 00:00 _startYear(def. 2015)
	
	Note:
	Timerange getting longer mins are getting unpercise
*/

params[
	["_input", 0, [0,[]]],
	["_startYear",2015]
];

if (_input isEqualType []) exitWith {
	private _d = 0;
	for "_i" from _startYear to (_input select 0) - 1 do 
	{
		_d = _d + round linearConversion [0, 1, dateToNumber [_i, 12, 31, 23, 59], 0, 365, false];
	};
	_d = _d + floor(linearConversion [0, 1, dateToNumber (_input select[0,5]), 0, 365, false]);
	_d *60*60*24+((_input select 3))*60*60+(_input select 4)*60;

};
private _y = _startYear;
private _m = 1;
private _d = 0;
private _h = 0;
private _mi = 0;
private _ticks = _input;
for "_i" from 0 to 1 step 0 do {
	private _yD = if (_y call BIS_fnc_isLeapYear) then {
		366;
	} else {
		365;
	};
	_ticks = _ticks - _yD*24*60*60;
	if (_ticks < 0) exitWith {
		_d = (_yD*24*60*60 - abs(_ticks))/60/60/24;
	};
	_y = _y + 1;
};
private _months = [
	["Jan",31],
	["Feb",if (_y call BIS_fnc_isLeapYear) then {29;} else {28;}],
	["Mrz",31],
	["April",30],
	["Mai",31],
	["Juni",30],
	["Juli",31],
	["August",31],
	["September",30],
	["Oktober",31],
	["November",30],
	["Dezember",31]
];
_ticks = _d;
{
	_ticks = _ticks - (_x select 1);
	if (_ticks < 0) exitWith {
		_m = _forEachIndex + 1;
		_d = (_x select 1)-abs _ticks+1;
		_h = (_d - floor _d)*24;
		_mi = (_h - (floor _h))*60;
	};
} forEach _months;

[_y,_m,floor _d,floor _h,round _mi,0];