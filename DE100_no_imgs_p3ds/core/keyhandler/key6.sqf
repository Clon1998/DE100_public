private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if (!_shif && !_altk) then {
	if ((uiNamespace getVariable ["hudPos",0]) < 2) then {
		["Du hast die UI verkleinert.",false,"fast"] call life_fnc_notification_system;
		2 call life_fnc_moveUi;
	} else {
		["Du hast die UI vergrößert.",false,"fast"] call life_fnc_notification_system;
		0 call life_fnc_moveUi;
	};	
};
if (_shif) then {
	if (call (life_adminlevel)>=5) then {			
		private _distance = 10;
		private _veh = vehicle player;
		if!(crew _veh isEqualTo [player])exitWith{};
		if(!local _veh)exitWith{};
		private _dir = getdir _veh;
		private _pos = getPos _veh;
		_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
		_veh setPos _pos;
	};
};

_stop