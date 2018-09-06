/*
	File:	fn_replace.sqf
	Date:   2017-08-02 11:31:00
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_i", "", [""]],
	["_o", "", [""]],
	["_n", "", [""]]
];
private _arr = [];
private _oL = count _o;
while {(_i find _o) >= 0} do {
	private _f = _i find _o;
	if (_f > 0) then {
		_arr pushBack (_i select [0, _f]);
	};
	_i = _i select [_f+_oL];
};
_arr pushBack _i;
_arr joinString _n;
