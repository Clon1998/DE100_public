/*
	File:	fn_startGather.sqf
	Date:   2017-03-03 18:32:17
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_altStat", false, [false]]
];

private _item = "";
if (life_action_inUse || life_interrupted) exitWith {};

{
	private _r = getNumber(_x >> "radius");
	private _i = getText(_x >> "item");
	{
		if (player distance getMarkerPos _x <= _r) exitWith {
			_item = _i;
		};
		nil;
	} count (getArray(_x >> "zones"));
	if !(_item isEqualTo "") exitWith {};
	nil;
} count ("!(getText(_x >> 'item') isEqualTo '') && (getNumber(_x >> 'mineral') isEqualTo 0)" configClasses (missionConfigFile >> "resourceFields"));

if (_item isEqualTo "" || !isNull objectParent player) exitWith {};

private _pData = (getText(missionConfigFile >> "VirtualItems" >> _item >> "profVar")) call life_fnc_getProf;
private _itemName = (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"));
private _cAdd = [_item,_pData select 1] call life_fnc_canAdd;

if (_cAdd == 0) exitWith {[localize "STR_NOTF_InvFull",true,"fast"] call life_fnc_notification_system;};
private _header = if (_altStat) then {
	format["Sammel %1 (Automatisch)",localize _itemName];
} else {
	format["Sammel %1",localize _itemName];
};
if (currentWeapon player != "") then {
	life_curWep_h = currentWeapon player; 
	player action ["SwitchWeapon", player, player, 100];
};
life_action_inUse = true;
[player,"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon",1,_pData select 0,{!isNull objectParent player || !life_action_inUse}] spawn life_fnc_doAnimation;
[_pData select 0,_header,{!isNull objectParent player || !life_action_inUse},[_altStat,_item,_cAdd,0],life_fnc_endGather,life_fnc_endGather] spawn life_fnc_progressBar;