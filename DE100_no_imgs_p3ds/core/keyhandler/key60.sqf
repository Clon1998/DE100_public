private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if ((call life_adminlevel) >= 1) then {
	if (isNull (findDisplay 2900)) then {
		closeDialog 0;
		call life_fnc_adminMenu;
	} else {
		closeDialog 0;
	};
	//closeDialog 0;
};

_stop