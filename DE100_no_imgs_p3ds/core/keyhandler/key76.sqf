/*
	File:	key76.sqf
	Date:   24.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
private["_shif","_ctrl","_altk","_stop","_inta"];
if (life_action_inUse || !isNull objectParent player || missionNamespace getVariable ["life_interrupted",false] || player getVariable ["restrained",false]) exitWith {_stop;};
if ((call life_adminlevel) == 0) exitWith {_stop;};
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;
if (tolower(animationState player) in ["ainvpknlmstpslaywrfldnon_medic","ainvppnemstpslaywrfldnon_medic"]) exitWith {};
player playMoveNow "";
[player,""] remoteExec ["switchMove",-2];
["Animationen zurückgesetzt",false,"fast"] call life_fnc_notification_system;
_stop=true;
_stop