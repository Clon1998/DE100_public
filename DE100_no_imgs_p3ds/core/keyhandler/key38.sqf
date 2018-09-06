private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

//If cop run checks for turning lights on.
_veh = vehicle player;
if (_shif && !_altk && !_ctrl) then {
    if(playerSide in [west,independent] && _veh != player && ((driver _veh) == player)) then {
        if(!isNil {_veh getVariable "lights"}) then {
            [_veh,playerSide] call life_fnc_sirenLights;
        };
    };
    _stop = true;
};

if(!_altk && !_ctrl) then { [] call life_fnc_radar; };

_stop;