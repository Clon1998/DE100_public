/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_bool","_progress","_pgText","_cP","_previousState","_refill"];
if (life_action_inUse) exitwith {};
_vehicle = cursorObject;
life_interrupted = false;
if(isNull _vehicle) exitWith {[localize "STR_ISTR_Jerry_NotLooking",true,"fast"] call life_fnc_notification_system;};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {[localize "STR_ISTR_Jerry_NotNear",true,"fast"] call life_fnc_notification_system;};
_bool = true;
if(([false,"fuelFull",1] call life_fnc_handleInv) == 0) exitWith {};
life_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_upp = format[localize "STR_ISTR_Jerry_Process",_displayName];
//Setup our progress bar.
disableSerialization;
_id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	if(animationState  player != "AinvPknlMstpSnonWnonDnon_medic0") then {
		[] spawn {
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic0";
		};
	};
	sleep 0.2;
	if(isNull _ui) then {
		_id cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_id cutText ["","PLAIN"];};
	if(!alive player) exitWith {_id cutText ["","PLAIN"];};
	if(life_interrupted) exitWith {_id cutText ["","PLAIN"];};
};
life_action_inUse = false;
_id cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;_id cutText ["","PLAIN"];};

_refill = ((fuel _vehicle) + (30 / (getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "Fuel"))));

if(local _vehicle) then {
	_vehicle setFuel _refill;
} else {
	[_vehicle,_refill] remoteExec ["setFuel",_vehicle];
};
[format[localize "STR_ISTR_Jerry_Success",_displayName],false,"fast"] call life_fnc_notification_system;
[true,"fuelEmpty",1] call life_fnc_handleInv;
_id cutText ["","PLAIN"];