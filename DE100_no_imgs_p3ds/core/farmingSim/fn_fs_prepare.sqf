/*
	File:	fn_fs_prepare.sqf
	Date:   2017-07-01 23:04:49
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_d", displayNull, [displayNull]]
];
private _mD = _d displayCtrl 7;
_mD ctrlSetText format["MapGrid: %1",mapGridPosition player];

private _fI = [];
{
	_fI pushBackUnique [toLower configName _x, toLower getText(_x >> "newItem")];
	nil;
} count ("!(configName _x isEqualTo 'blueprint')" configClasses (missionConfigFile >> "ItemProcessing"));
_d setVariable ["finalItems",_fI];

private _rI = [];
{
	_rI pushBackUnique [toLower configName _x, toLower getText(_x >> "item")];
	nil;
} count ("!(getText(_x >> 'item') isEqualTo '')" configClasses (missionConfigFile >> "resourceFields"));
_d setVariable ["rawItems",_rI];
[_d] call life_fnc_fs_itemView;