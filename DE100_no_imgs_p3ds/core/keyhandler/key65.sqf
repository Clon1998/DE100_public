private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if ((call life_adminlevel) >= 3) then {
	private _units = player nearEntities 15;
	_units = _units - crew (vehicle player);//Just make sure a all units appare only 1 time
	_units append crew (vehicle player);
	{
		_x setDamage 0;
		if ((_x isKindOf "LandVehicle" || _x isKindOf "Air" || _x isKindOf "Tank" || _x isKindOf "Ship")) then {
			if (local _x) then {
				_x setFuel 1;
			} else {
				[_x,1] remoteExec ["setFuel",_x];
			};
		};
	} forEach _units;
	["Du hast alle Entities im Umkreis von 15 Meter geheilt und refueled",false,"fast"] call life_fnc_notification_system;
	life_thirst = 100;
	life_hunger = 100;
	if (life_HC_isActive) then {
		[format["%1(UID: %3) hat alle Entities im Umkreis von 15 Meter um %2 geheilt und refueled.",player call life_fnc_name,mapGridPosition player,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
	} else {
		[format["%1(UID: %3) hat alle Entities im Umkreis von 15 Meter um %2 geheilt und refueled.",player call life_fnc_name,mapGridPosition player,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
	};
};

_stop