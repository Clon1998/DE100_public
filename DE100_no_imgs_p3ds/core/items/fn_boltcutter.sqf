/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_bool"];
_building = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(!(player distance (getMarkerPos "fed_reserve") < 500)) exitWith {["Das kannst du nur an der Bank benutzen oder am Gefängnis, wenn auf einen Stacheldraht schaust!",true,"fast"] call life_fnc_notification_system;};
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};
if(((nearestObjects  [(getMarkerPos "fed_reserve"),["Land_Dome_Small_F"],200 ]) select 0) == _building OR (nearestObject [(getMarkerPos "fed_reserve"),"Land_Research_house_V1_F"]) == _building) then {
	[5,"Jemand versucht ein Tor zur Zentralbank zu öffnen."] remoteExecCall ["life_fnc_broadcast",west];
};
_bool = true;
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {[localize "STR_Cop_NotaDoor",true,"fast"] call life_fnc_notification_system;}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
_id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.003;};
	case "Land_Dome_Small_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
	default {_cpRate = 0.08;}
};

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

//Kill the UI display and check for various states
_id cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_id cutText ["","PLAIN"];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_id cutText ["","PLAIN"];};
if(life_interrupted) exitWith {life_interrupted = false; 
[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
_id cutText ["","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 5) then {
	["Der Bolzenschneider ist stumpf. Du wirfst ihn weg!",false,"fast"] call life_fnc_notification_system;
	[false,"boltcutter",1] call life_fnc_handleInv;
	life_boltcutter_uses = 0;
};
_id cutText ["","PLAIN"];
_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
if((_building getVariable["locked",false])) then {
	_building setVariable["locked",false,true];
};
[player,"breakIn",1] call life_fnc_addCrime;