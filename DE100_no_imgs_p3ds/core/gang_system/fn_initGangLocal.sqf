/*
	File:	fn_initGangLocal.sqf
	Date:   2016-10-13 14:57:10
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
_error = params[
	["_gangID", -1, [1]],
	["_gangName", "", [""]],
	["_members", [], [[]]],
	["_gangLevel", -1, [1]],
	["_gangBank", -1, [0]],
	["_gangSkin", [], [[],""]],
	["_gangTag", "", [""]],
	["_gangHouses", [], [[]]],
	"_gang",
	"_playerPermissions",
	"_pos",
	"_storeHouse"
];

if (!_error) exitwith {
	life_gang_init = true; 
};

_gang = allGroups select {_x getVariable ["gang_ID",0] isEqualTo _gangID};

if (count _gang isEqualTo 0) then {
	[player] joinSilent (createGroup civilian);
	_gang = group player;

	_gang setVariable ["gang_ID",_gangID,true];
	_gang setVariable ["gang_NAME",_gangName,true];
	_gang setVariable ["gang_TAG",format ["[%1] ",_gangTag],true];
	_gang setVariable ["gang_MEMBERS",_members,true];
	_gang setVariable ["gang_LEVEL",_gangLevel,true];
	_gang setVariable ["gang_BANK",_gangBank,true];
	_gang setVariable ["gang_SKIN",[_gangSkin,[["",""],["",""]]] select (_gangSkin isEqualTo ""),true];

	{
		_x params[
			["_id", 0, [0]],
			["_pos", "", [""]],
			["_containerData", [], [[]]],
			["_trunk", [], [[]]],
			["_spaceData", [], [[]]],
			["_vehSpawnPoint", [], [[]]],
			["_level", 0, [0]]
		];
		_pos = parseSimpleArray format["%1",_pos];
		_storeHouse = nearestBuilding _pos;
		_storeHouse allowDamage false;
		_storeHouse setVariable["house_id",_id,true];
		_storeHouse setVariable["Trunk",_trunk,true];
		_storeHouse setVariable["container",_containerData,true];
		_storeHouse setVariable["weapon_space",_spaceData select 0,true];
		_storeHouse setVariable["clothing_space",_spaceData select 1,true];
		_storeHouse setVariable["other_space",_spaceData select 2,true];
		_storeHouse setVariable["VehSpawnPoint",_vehSpawnPoint,true];
		_storeHouse setVariable["storehouse_level",_level,true];
		_storeHouse setVariable["isStorehouse",true,true];
		_gangHouses set [_forEachIndex,_storeHouse];
	} forEach _gangHouses;
	_gang setVariable ["gang_HOUSES",_gangHouses,true];
	[_gang getVariable ["gang_HOUSES",[]]] call life_fnc_storeHouseInitLocal;
} else {
	_gang = _gang select 0;
	[player] joinSilent _gang;
	_playerPermissions = (_members select ([getPlayerUID player,_members] call life_fnc_index)) select 1;
	[_gang getVariable ["gang_HOUSES",[]]] call life_fnc_storeHouseInitLocal;
	if ("OWNER" in _playerPermissions) then {
		player setRank "COLONEL";
		[_gang,player] remoteExec ["selectLeader",units _gang];
		["Du wurdest zum Leader der Gang ernannt!",false,"fast"] call life_fnc_notification_system; 
	};
};
life_gang_init = true;