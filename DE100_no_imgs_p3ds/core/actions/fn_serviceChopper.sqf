/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
disableSerialization;
private["_search","_ui","_progress","_cP","_pgText","_title"];
if(life_action_inUse) exitWith {[localize "STR_NOTF_Action",true,"fast"] call life_fnc_notification_system;};
_search = nearestObjects[getPos air_sp, ["Air"],5];
if(count _search == 0) exitWith {[localize "STR_Service_Chopper_NoAir",true,"fast"] call life_fnc_notification_system;};
if(de100_luciandjuli_mula < 1000) exitWith {[localize "STR_Serive_Chopper_NotEnough",true,"fast"] call life_fnc_notification_system;};

de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula - 1000;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
life_action_inUse = true;
_title = localize "STR_Service_Chopper_Servicing";
_id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_title];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true;} do
{
	sleep  0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%2 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1) exitWith {};
};
if (!alive (_search select 0) || (_search select 0) distance air_sp > 10) exitWith {life_action_inUse = false; [localize "STR_Service_Chopper_Missing",true,"fast"] call life_fnc_notification_system;};
if (!local (_search select 0)) then {
	[_search select 0,1] remoteExec ["setFuel",_search select 0];
} else {
	(_search select 0) setFuel 1;
};
(_search select 0) setDamage 0;

_id cutText ["","PLAIN"];
[localize "STR_Service_Chopper_Done",false,"fast"] call life_fnc_notification_system;
life_action_inUse = false;