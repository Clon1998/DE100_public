/*
   File:    fn_numberText.sqf
   Date:    2017-11-13 22:03:45
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

params[
	["_num", 0, [0]],
	["_mod", 3]
];
private _out = "";
_num =+ (_num call bis_fnc_numberDigits);
reverse _num;

private _max = count _num -1;
{
	_out = format["%3%1%2",_x,_out,["",","] select ((_foreachindex+1) % (_mod) == 0 && _foreachindex != _max)];
} forEach _num;
_out