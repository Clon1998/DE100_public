private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if(_shif) then {_stop = true;};
if(_shif && playerSide == civilian && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 4 && speed cursorObject < 1) then
{
	if((animationState cursorObject) != "Incapacitated" && (currentWeapon player == primaryWeapon player or currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
	{
		[cursorTarget] spawn life_fnc_knockoutAction;
	};
};

_stop