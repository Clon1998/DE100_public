/*
	File:	fn_getBounty.sqf
	Date:   2017-04-02 15:31:47
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", "", [""]],
	"_c",
	"_b"
];
private _all = bank_obj getVariable ["Crimes",[]];
private _i = [_uid,_all] call life_fnc_index;

if (_i >= 0) then {
	_c = (_all select _i) select 2;
	_b = 0;
	{
		private _cEntry = _x select 0;
		private _stackable = getNumber(missionConfigFile >> "crimes" >> _cEntry >> "stackable") isEqualTo 1;
		if (_stackable) then {
			_b = _b + (getNumber(missionConfigFile >> "crimes" >> _cEntry >> "bounty") * _x select 1);
		} else {
			{
				_b = _b + getNumber(missionConfigFile >> "crimes" >> _cEntry >> "bounty");
			} forEach (_x select 1);
		};
	} forEach _c;
} else {
	30000;
};