/*
	File:	fn_savefuelstation.sqf
	Date:   18.06.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_name", "", [""]],
	["_volumen", 0, [0]]
];
if (_volumen < 0) then {_volumen = 0;};

_query = format["UPDATE Tankstellen SET tankvolumen='%2' WHERE shop='%1'",_name,_volumen];
[_query,1] call DB_fnc_asyncCall;

_index = [_name ,tankstellen] call life_fnc_index;
if (_index < 0) then {
	tankstellen pushback [ _name, _volumen, getmarkerpos _name];
} else {
	tankstellen set [_index,[ _name, _volumen, getmarkerpos _name]];
};
publicVariable "tankstellen";