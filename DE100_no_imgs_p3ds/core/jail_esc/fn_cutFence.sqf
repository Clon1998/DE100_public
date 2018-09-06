/*
	File : fn_cutFence.sqf
	Date:   26.10.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/



private["_fence"];
_fence = param [0,objNull,[objNull]];

if(isNull _fence) exitWith {};
if(!(_fence isKindOf "Land_Razorwire_F")) exitWith {["Du schaust nicht auf den Stacheldraht!",true,"fast"] call life_fnc_notification_system;};
if(life_fence_true) exitWith {["Du kannst nur immer einen Stacheldraht zerschneiden!",true,"fast"] call life_fnc_notification_system;};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};
_bool = true;
life_action_inUse = true;
//life_fence_true = true;

//Setup the progress bar
disableSerialization;
_title = "Zerschneide Stacheldraht";
_id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_cpRate = 0.055;

while {true} do
{
	if(animationState  player != "AinvPknlMstpSnonWnonDnon_medic0") then {
		[] spawn {
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic0";
		};
	};
	sleep 0.26;
	if(isNull _ui) then {
		_id cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {_id cutText ["","PLAIN"];};
	if(life_istazed) exitWith {_id cutText ["","PLAIN"];}; //Tazed
	if(life_interrupted) exitWith {_id cutText ["","PLAIN"];};
};

if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_id cutText ["","PLAIN"];life_fence_true = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_id cutText ["","PLAIN"];life_fence_true = false;};
if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system; _id cutText ["","PLAIN"]; life_action_inUse = false;life_fence_true = false;};
life_action_inUse = false;
_id cutText ["","PLAIN"];
["Du hast den Stacheldraht zerschnitten!",false,"fast"] call life_fnc_notification_system;
_fence setDamage 1;
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 5) then {
	["Der Bolzenschneider ist stumpf. Du wirfst ihn weg!",false,"fast"] call life_fnc_notification_system;
	[false,"boltcutter",1] call life_fnc_handleInv;
	life_boltcutter_uses = 0;
};
sleep 10;
["Der Stacheldraht wird in 2 Minuten wieder aufgebaut!",false,"fast"] call life_fnc_notification_system;
sleep 110;
_fence setDamage 0;
//life_fence_true = false;