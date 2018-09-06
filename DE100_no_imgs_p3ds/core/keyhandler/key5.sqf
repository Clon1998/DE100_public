private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if (!_shif) then {
	if (isNull objectParent player && !(player getVariable ["restrained", false]) &&(animationState player) != "Incapacitated" && !life_istazed) then {
		if (player getVariable ["surrendered", false]) then {
			player setVariable ["surrendered", false, true];
		} else {
			[] spawn life_fnc_surrender;
		};
	};
} else {
	if (call (life_adminlevel)>=5) then {
		private _vel = velocity (vehicle player);
		private _multi = if (_vel select 0 isEqualTo 0 && _vel select 1 isEqualTo 0) then {
			0;
		} else {
			4;
		};
		private _dir = getdir (vehicle player);
		if(isNull objectParent player)then {
			(vehicle player) setVelocity [(_vel select 0)+_multi*sin(_dir),(_vel select 1)+_multi*cos(_dir),8];
		} else {
			(vehicle player) setVelocity [(_vel select 0)+_multi*sin(_dir),(_vel select 1)+_multi*cos(_dir),20];
		};
	};
};

_stop;