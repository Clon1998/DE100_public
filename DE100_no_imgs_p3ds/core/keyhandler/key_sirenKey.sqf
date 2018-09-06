private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if (!_shif && !_altk && !_ctrl) then {
    _veh = vehicle player;
    if(playerSide in [west,independent] && _veh != player && !life_siren_active && ((driver _veh) == player)) then {
        [] spawn {
            life_siren_active = true;
            uiSleep 0.5;
            life_siren_active = false;
        };
        if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
        if((_veh getVariable "siren")) then {
        	[localize "STR_MISC_SirensOFF",false,"fast"] call life_fnc_notification_system;
            _veh setVariable["siren",false,true];
        } else {
       		[localize "STR_MISC_SirensON",false,"fast"] call life_fnc_notification_system;
            _veh setVariable["siren",true,true];
            if(playerSide == west) then {
            	[_veh] remoteExec ["life_fnc_copSiren",0];
            } else {
          		[_veh] remoteExec ["life_fnc_thrSiren",0];
            };
        };
    };
};

_stop