private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if((life_action_delay != 0) && ((time - life_action_delay) < 0.5)) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;life_klickcount = life_klickcount + 1; if(life_klickcount> 2) then {closeDialog 0;life_klickcount = 0;};};
life_action_delay = time;		
if ((playerSide in [west,independent]) && (!isNull objectParent player)) then {
	[] call life_fnc_copOpener;
};