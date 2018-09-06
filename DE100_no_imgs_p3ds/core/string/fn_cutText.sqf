/*
   File:    fn_cutText.sqf
   Date:    2017-10-16 13:21:40
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_t", "", [""]],
	["_m", 20],
	["_c",".."]
];

if (count _t > _m) then {
	format["%1%2",_t select [0,_m],_c];
} else {
	_t;
};