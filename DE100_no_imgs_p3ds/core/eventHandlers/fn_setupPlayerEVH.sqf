/*
	File:	fn_setupPlayerEVH.sqf
	Date:   2016-08-15 02:47:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _d = findDisplay 46;
{
	player removeAllEventHandlers _x;
	nil;
} count ["Killed","handleDamage","Respawn","Take","Fired","Put","InventoryClosed","InventoryOpened","WeaponAssembled","GetInMan","GetOutMan","HandleRating"];

{
	removeAllMissionEventHandlers _x;
	nil;
} count ["Map","Draw3D", "MapSingleClick","EachFrame"];

{
	_d displayRemoveAllEventHandlers _x;
	nil;
} count ["KeyDown","KeyUp"];
onMapSingleClick {};

player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call life_fnc_onTake}];
player addEventHandler["Put",{_this call life_fnc_onPut}];
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["WeaponAssembled", {_this call life_fnc_weaponAssembled}];
player addEventHandler["GetInMan", {_this call life_fnc_getInMan}];
player addEventHandler["GetOutMan", {_this call life_fnc_getOutMan}];
player addEventHandler["InventoryOpened", {_this call life_fnc_onInventoryOpened;}];
player addEventHandler["InventoryClosed", {_this call life_fnc_onInventoryClosed;}];
player addEventHandler["HandleRating", {0;}];


addMissionEventHandler ["Map",{_this call life_fnc_map;}];
addMissionEventHandler ["Draw3D", {call life_fnc_draw3D;}];
addMissionEventHandler ["MapSingleClick",{_this call life_fnc_mapSingleClick;}];
addMissionEventHandler ["EachFrame", {call life_fnc_RscDisplayMPInterrupt;}];
call life_fnc_PlayerTags;

if (life_revealObjects) then {
	LIFE_ID_RevealObjects = addMissionEventHandler ["EachFrame", {call life_fnc_revealObjects}];
};

_d displayAddEventHandler["KeyDown",{[0,_this]call life_fnc_keyHandler}];
_d displayAddEventHandler["KeyUp",{[1,_this]call life_fnc_keyHandler}];

inGameUISetEventHandler ["Action",'
if (count _this > 0) then {
	((toLower (_this select 3) in ["takeitem","takeweapon","rearm"]) || (((toLower (_this select 3) find "getin" >= 0) || (toLower (_this select 3) find "moveto" >= 0) || (toLower (_this select 3) in ["getout","eject"])) && (player getVariable ["restrained",false])));
} else {
	false;
}'];