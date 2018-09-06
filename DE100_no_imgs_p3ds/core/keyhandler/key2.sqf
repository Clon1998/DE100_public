private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if(side player == west)then {
	closeDialog 0;
	createDialog "life_copHQ";
};

if(side player == independent) then {
	closeDialog 0;
	createDialog "THR_HQ";
};

_stop
