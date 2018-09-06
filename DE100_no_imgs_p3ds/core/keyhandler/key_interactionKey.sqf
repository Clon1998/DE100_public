private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if(!life_action_inUse) then {
	[_altk] call life_fnc_actionKeyHandler;
};

_stop