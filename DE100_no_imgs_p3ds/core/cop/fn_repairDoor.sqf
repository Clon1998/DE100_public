/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Re-locks the door mainly for the federal reserve structures.
*/

params[
	["_house", objNull, [objNull]],
	"_selPos",
	"_worldSpace"
];

if (isNull _house) exitWith {};
if !(typeOf _house in ["Land_Dome_Small_F"]) exitwith {};

private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "NumberOfDoors");
private _door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _house selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _house modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};

if(_door isEqualTo 0) exitWith {[localize "STR_Cop_NotaDoor",true,"fast"] call life_fnc_notification_system;}; //Not near a door to be broken into.
if((_house getVariable[format["bis_disabled_Door_%1",_door],0]) isEqualTo 1) exitWith {["Die Tür ist bereits versiegelt!",true,"fast"] call life_fnc_notification_system;};

life_action_inUse = true;

closeDialog 0;
//Setup the progress bar
disableSerialization;
_title = "Tür wird versiegelt";
_id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

private _cpRate = call {
	if ((typeOf _house) isEqualTo "Land_Dome_Big_F") exitWith {0.008;};
	if ((typeOf _house) isEqualTo "Land_Dome_Small_F") exitWith {0.008;};
	if ((typeOf _house) isEqualTo "Land_Research_house_V1_F") exitWith {0.005;};
	0.008;
};	

while {true;} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["switchMove",(allPlayers select {player distance _x < 500})];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		_id cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 or !alive player) exitWith {};
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
_id cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system; life_action_inUse = false;};
life_action_inUse = false;
[_house,format["Door_%1A_move",_door],format["Door_%1B_move",_door]] call BIS_fnc_TwoWingSlideDoorClose;
_house setVariable[format["bis_disabled_Door_%1",_door],1,true]; //Door Locked