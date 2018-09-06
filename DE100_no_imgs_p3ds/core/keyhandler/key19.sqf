private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if(_shif) then {_stop = true;};
if(_shif && playerSide == west && !isNull cursorObject && !life_knockout && !life_istazed && cursorObject isKindOf "Man" && (isPlayer cursorObject) && (side cursorObject in [civilian,independent]) && alive cursorObject && cursorObject distance player < 3.5 && !(cursorObject getVariable ["Escorting",false]) && !(cursorObject getVariable ["restrained",false]) && speed cursorObject < 1) then
{
	[] call life_fnc_restrainAction;
};

if(_shif && playerSide == civilian && !isNull cursorObject && !(player getVariable ["restrained",false]) && !life_knockout && !life_istazed && cursorObject isKindOf "Man" && player distance cursorObject < 3.5 && alive cursorObject && isPlayer cursorObject && animationState cursorObject == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" && speed cursorObject < 1) then
{ 
	if(([false,"zipties",1] call life_fnc_handleInv) > 0) then
	{	
		[] call life_fnc_restrainAction;
		["Benutze die linke Windows-Taste, um weitere Aktionen anzuzeigen",false,"fast"] call life_fnc_notification_system;
	} 
	else
	{
		["Du hast keine Kabelbinder dabei!",true,"fast"] call life_fnc_notification_system;
	};
};
// Anhalte Ansage
if(playerSide in [west] && !isNull objectParent player && ((driver vehicle player) == player)) then
{	
	if((life_action_delay != 0) && ((time - life_action_delay) < 4)) exitWith {};
	life_action_delay = time;
	if (_shif) then {
		[vehicle player,"yelp"] remoteExec ["say3D",0];	
	} else {
		[vehicle player,"hupe"] remoteExec ["say3D",0];
	};
};

_stop