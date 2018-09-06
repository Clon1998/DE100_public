/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Allows cops to 'kick' in the door?
*/
params[
	["_house", objNull, [objNull]]
];

if (isNull _house) exitwith {};
private _online = if (_house getVariable ["isStorehouse",false]) then {
	{_x getVariable ["gang_ID",0] isEqualTo ((_house getVariable ["house_owner",[0,""]]) select 0)} count allGroups > 0;
} else {
	[(_house getVariable ["house_owner",[0,""]]) select 0] call life_fnc_isUIDActive;
};

if (!_online) exitwith {
	[localize "STR_House_Raid_OwnerOff",true,"fast"] call life_fnc_notification_system;
};

private _door = [_house] call life_fnc_nearestDoor;
if (_door == 0) exitWith {[localize "STR_Cop_NotaDoor",true,"fast"] call life_fnc_notification_system;};
if ((_house getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {[localize "STR_House_Raid_DoorUnlocked",true,"fast"] call life_fnc_notification_system;};

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
private _title = localize "STR_House_Raid_Progress";
private _id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;
private _cpRate = 0.0092;

[2,"STR_House_Raid_NOTF",true,[(_house getVariable "house_owner") select 1]] remoteExecCall ["life_fnc_broadcast",-2];

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,""] remoteExec ["switchMove",(allPlayers select {player distance _x < 500})];
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
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
_id cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system; life_action_inUse = false;};
life_action_inUse = false;
_house animate [format["door_%1_rot",_door],1];
_house setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.