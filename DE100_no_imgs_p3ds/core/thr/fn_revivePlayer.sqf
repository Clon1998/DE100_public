/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the revive process on the player.
*/

if (life_action_inUse || life_interrupted) exitWith {};
private _target = param [0,objNull,[objNull]];
if (isNull _target) exitWith {};
if (_target getVariable["isAlive",true]) exitwith {};
if (!isNull (_target getVariable ["reviver",objNull])) exitWith {[localize "STR_Medic_AlreadyReviving",true,"fast"] call life_fnc_notification_system;};
if (player distance _target > 5) exitWith {["Du stehst zu weit weg!",true,"fast"] call life_fnc_notification_system;}; //Not close enough.
if !("Medikit" in (items player)) exitWith {["Du hast keinen Verbandskasten", true, "fast"] call life_fnc_notification_system;};
_target setVariable["reviver",player,true];


private _pData = "revive_Prof" call life_fnc_getProf;
private _onFinish = {
	params[
		["_target", objNull, [objNull]],
		["_medBox", objNull],
		["_success", false, [false]]
	];
	player playAction "medicStop";
	if (!isNull _medBox) then {
		deleteVehicle _medBox;
	};
	if (_success) then {
		if (life_HC_isActive) then {
			[getPlayerUID player, 33, [format["%1 hat %2 wiederbelebt",player call life_fnc_nameUID, _target call life_fnc_nameUID],[getPlayerUID _target,34,format["%2 wurde von %1 wiederbelebt",player call life_fnc_nameUID, _target call life_fnc_nameUID]]]] remoteExecCall ["MSC_fnc_log",HC_Life];
		} else {
			[getPlayerUID player, 33, [format["%1 hat %2 wiederbelebt",player call life_fnc_nameUID, _target call life_fnc_nameUID],[getPlayerUID _target,34,format["%2 wurde von %1 wiederbelebt",player call life_fnc_nameUID, _target call life_fnc_nameUID]]]] remoteExecCall ["MSC_fnc_log",2];
		};
		[player] remoteExec ["life_fnc_revived",_target];
		[format[localize "STR_Medic_RevivePayReceive",_target call life_fnc_name,[(call life_revive_fee)] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
		de100_mSpace setVariable ["cT",diag_tickTime];
		de100_luciandjuli_bc = de100_luciandjuli_bc + (call life_revive_fee);
		de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
		_getXp = round ((random 55)+88);
		if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
			_getXp = _getXp * 2;
		};
		["revive_Prof", _getXp] call life_fnc_addExp;
		["Revived",1] call life_fnc_addAchievExp;
		player reveal _target;
		["CASH"] call SOCK_fnc_updatePartial;
	} else {
		_target setVariable["reviver",nil,true];
		[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
	};
	life_action_inUse = false;
};
life_action_inUse = true;
private _medBox = "Land_FirstAidKit_01_open_F" createVehicle [0,0,0];
_medBox attachTo [player, [-0.65,0.5,0.05]];
[player,"MedicOther",2,_pData select 0,compile format["!isNull objectParent player || !life_action_inUse || (objectFromNetId '%1') getVariable['isAlive',true] || (player distance %2) > 4",netId _target,getPos _target]] spawn life_fnc_doAnimation;
[_pData select 0,format[localize "STR_Medic_Progress",_target call life_fnc_name],compile format["!isNull objectParent player || !life_action_inUse || (objectFromNetId '%1') getVariable['isAlive',true] || (player distance %2) > 4",netId _target,getPos _target],[_target,_medBox],_onFinish,_onFinish] spawn life_fnc_progressBar;