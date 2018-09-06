private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if (isNil "jumpActionTime") then {jumpActionTime = 0;};
if (time - jumpActionTime < 2) exitwith {
	["Du kannst nur alle 2 Sekunden Springen",false,"fast"] call life_fnc_notification_system;
};
if (_shif && !(animationState player isEqualTo "AovrPercMrunSrasWrflDf") && isTouchingGround player && stance player isEqualTo "STAND" && speed player > 2 && !life_is_arrested && (velocity player) select 2 < 2.5) then {
	jumpActionTime = time;
	[player] remoteExec ["life_fnc_jumpFnc",0];
	_stop=true;
};
_stop