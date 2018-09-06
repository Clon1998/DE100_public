/*
	File : fn_BlowUp.sqf
	Date:   26.10.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/



private["_wall"];
_wall = param [0,objNull,[objNull]];

if(isNull _wall) exitWith {};
if(!(player distance _wall <= 3)) exitWith {["Du stehst zu weit weg.",true,"fast"] call life_fnc_notification_system;};
if(!(_wall isKindOf "Land_CncWall1_F")) exitWith {["Du schaust nicht auf die Wand!",true,"fast"] call life_fnc_notification_system;};
if(life_bomb_true) exitWith {["Du kannst nur eine Bombe legen!",true,"fast"] call life_fnc_notification_system;};
jail_destroy_objects = nearestObjects [_wall,["Land_CncWall1_F","Land_Razorwire_F"], 5];
jail_destroy_objects_pos = [];
jail_destroy_objects_pos_vector = [];
jail_destroy_objects_pos_vector_up = [];
jail_destroy_objects_class = [];
_bool = true;
life_action_inUse = true;
life_bomb_true = true;

//Setup the progress bar
disableSerialization;
_title = "Bombe platzieren";
_id = "life_progress" call BIS_fnc_rscLayer;
_id cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_cpRate = 0.003;

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

if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_id cutText ["","PLAIN"];life_bomb_true = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_id cutText ["","PLAIN"];life_bomb_true = false;};
if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system; _id cutText ["","PLAIN"]; life_action_inUse = false;life_bomb_true = false;};
life_action_inUse = false;
_id cutText ["","PLAIN"];
[false,"blastingcharge",1] call life_fnc_handleInv;
bomb_acc= player addAction ["<t color='#B20000'>Bombe zünden!!!</t>",life_fnc_boom,"_wall",0,false,false,"",'player Distance [16707,13683.1,4.3] <= 200'];
["Bombe platziert",false,"fast"] call life_fnc_notification_system;
[player,"breakIn",1] call life_fnc_addCrime;