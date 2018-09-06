private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if (call (life_adminlevel)>=5) then {
	_curTarget = (if(isNull cursorObject)then{cursorTarget}else{cursorObject});
	if (!isNull _curTarget) then {
		if (time - life_conf_del < 5) then {
			deleteVehicle _curTarget;
			life_conf_del = 0;
		} else {
			life_conf_del = time;
			[format["Möchtest du %1 löschen?",typeOf _curTarget],false,"fast"] call life_fnc_notification_system;
		};
	};
};

_stop;