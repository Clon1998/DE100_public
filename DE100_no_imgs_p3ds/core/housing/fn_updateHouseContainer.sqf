/*
	File:	fn_updateHouseContainer.sqf
	Date:   2017-06-14 18:15:22
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_house", objNull, [objNull]],
	"_tVar",
	"_iVar"
];
if(isNull _house) exitWith {systemChat "House null";};
private _il = _house isEqualTo lockers_obj;//is Locker

if (_il) then {
	_tVar = format["%1_%2_locker_Trunk",getPlayerUID player,playerSide];
	_iVar = format["%1_%2_locker_id",getPlayerUID player,playerSide];
} else {
	_tVar = "Trunk";
	_iVar = "house_id";
};

private _id = _house getVariable[_iVar,-1];
if(_id == -1) exitWith {systemChat "HouseID invalid";};
private _t = _house getVariable[_tVar,[[],0]];

private _w = 0;
{
	if (isClass (missionConfigFile >> "VirtualItems" >> (_x select 0))) then {
		_w = _w + (getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "weight")) * (_x select 1);
	};
	nil;
} count (_t select 0);
_t set [1,_w];
_house setVariable[_tVar,_t,true];

if (life_HC_isActive) then {
	[_house,playerSide,getPlayerUID player,call life_clientId select 0] remoteExecCall ["SS_fnc_saveinventory",HC_Life];
} else {
	[_house,playerSide,getPlayerUID player,call life_clientId select 0] remoteExecCall ["SS_fnc_saveinventory",2];
};

life_house_session = false;