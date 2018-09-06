/*
    File:   fn_doAnimation.sqf
    Date:   2017-03-04 10:58:17
    Author: Patrick "Lucian" Schmidt
    Inpired by joko // Jonas
    Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
    
    Description:
    Take a look for yourself.
*/

params ["_unit", "_anim", ["_priority", 0],["_isLoop",-1],["_interrupt", {false}]];

if (_anim == "") then {
    _anim = _unit call life_fnc_getDefaultAnimation;
};


if (_isLoop > 0) then {
    private _startTime = diag_tickTime;
    if (call _interrupt || !alive player || missionNamespace getVariable ["life_interrupted",false] || !(player getVariable["isAlive",true])) exitwith {};
    for "_i" from 0 to 1 step 0 do {
        if (diag_tickTime - _startTime >= _isLoop) exitwith {};
        if (call _interrupt || !alive player || missionNamespace getVariable ["life_interrupted",false] || !(player getVariable["isAlive",true])) exitwith {};
        if (animationState _unit isEqualTo toLower(_unit call life_fnc_getDefaultAnimation)) then {
            call {
                if (_priority isEqualTo 1) exitWith {_unit playMoveNow _anim;};
                if (_priority isEqualTo 2) exitWith {_unit playActionNow _anim;};
                _unit playMove _anim;
            };
        };
    };
} else {
    call {
        if (_priority isEqualTo 1) exitWith {_unit playMoveNow _anim;};
        if (_priority isEqualTo 2) exitWith {_unit playActionNow _anim;};
        _unit playMove _anim;
    };
};
