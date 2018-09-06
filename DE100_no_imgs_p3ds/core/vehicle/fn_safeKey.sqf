/*
	File:	fn_safeKey.sqf
	Date:   2017-03-23 22:28:01
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life AND LYL.de server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_obj", objNull, [objNull]]
];

if (isNull _obj) exitwith {};

private _saved = (bank_obj getVariable [format["%1_Keys_%2",getPlayerUID player,playerSide],[]]) select {!isNull (objectFromNetId _x)};
_saved pushBackUnique (netId _obj);
life_vehicles pushBackUnique _obj;

bank_obj setVariable [format["%1_Keys_%2",getPlayerUID player,playerSide],_saved,true];