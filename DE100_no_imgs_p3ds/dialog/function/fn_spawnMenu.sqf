/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_ctrl"];
disableSerialization;

if(life_is_arrested) exitWith {
	[] call life_fnc_respawned;
	cutText ["","BLACK IN",2];
};

if(life_respawned) then {
	[] call life_fnc_respawned;
};

if(!(createDialog "life_spawn_selection")) exitWith {[] call life_fnc_spawnMenu;};
life_pause_pos = true;
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_escBlock"];

_spCfg = [playerSide] call life_fnc_spawnPointCfg;

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
	_ctrl lnbAddRow[(_spCfg select _forEachIndex) select 1,(_spCfg select _forEachIndex) select 0,""];
	_ctrl lnbSetPicture[[_forEachIndex,0],(_spCfg select _forEachIndex) select 2];
	_ctrl lnbSetData[[_forEachIndex,0],(_spCfg select _forEachIndex) select 0];
} foreach _spCfg;
_ctrl lnbSetCurSelRow 0;
_sp = _spCfg select 0; //First option is set by default

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];
[getMarkerPos (_sp select 0)] spawn life_fnc_SpawnCam;