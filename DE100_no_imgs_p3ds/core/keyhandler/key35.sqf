private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if(_shif && !_ctrl && currentWeapon player != "") then {
	life_curWep_h = currentWeapon player;
	player action ["SwitchWeapon", player, player, -1];
	player switchcamera cameraView;
};

if(!_shif && _ctrl && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
	if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
		player selectWeapon life_curWep_h;
	};
};

_stop