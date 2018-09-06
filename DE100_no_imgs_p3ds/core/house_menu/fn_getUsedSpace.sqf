/*
	File:	fn_getUsedSpace.sqf
	Date:   2017-04-30 22:00:27
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_house", objNull, [objNull]],
	["_type", "", [""]]
];

private _used = 0;
private _wFactor = getNumber(missionConfigFile >> "Life_Settings" >> "houseInv_weightFactor");
if (_house isEqualTo lockers_obj) then {
	_type = format["%1_%3_locker_%2",getPlayerUID player,_type,playerSide];
};
private _items = [];
{
	_items append (_x select 1);
	nil;
} count (_house getVariable [_type,[]]);

{
	_x params[
		["_class", ""],
		["_val", 0]
	];
	if (!(_class isEqualTo "") && _val > 0) then {
		_used = _used + round((([_class] call life_fnc_fetchCfgDetails) select 15) * _wFactor * _val);
	};
	nil;
} count _items;

_used