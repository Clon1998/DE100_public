private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if(!life_action_inUse) then {
	if(([false,"redgull",1] call life_fnc_handleInv) > 0) then {
		life_thirst = 100;
		[] spawn {
			life_redgull_effect = time;
			life_water_boy = true;
			[localize "STR_ISTR_RedGullEffect",false,"fast"] call life_fnc_notification_system;
			waitUntil {!alive player || ((time - life_redgull_effect) > (3 * 60))};
			["Die Wirkung des Redgull lässt nach...",false,"fast"] call life_fnc_notification_system;
			uiSleep 1;
			life_redgull_effect = nil;
		};
	};
};

_stop