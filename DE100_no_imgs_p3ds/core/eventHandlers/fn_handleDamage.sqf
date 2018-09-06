/*
    File:   fn_handleDamage.sqf
    Date:   2017-03-10 14:08:57
    Author: Patrick "Lucian" Schmidt
    Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
    
    Description:
    Take a look for yourself.
*/

params[
    ["_unit", objNull, [objNull]],
    ["_selectionName", "", [""]],
    ["_damage", 0, [0]],
    ["_source", objNull, [objNull]],
    ["_projectile", "", [""]],
    ["_hitPartIndex", 0, [0]],
    ["_instigator", objNull, [objNull]],
    ["_hitPoint", "", [""]]
];
if (!(local _unit) || !(alive _unit) || !(_unit isEqualTo player)) exitwith {};
if !(_unit getVariable ["isAlive",true]) exitWith {
    false;
};
private _retDmg = _damage; 

private _weapon = if (!isNull _source) then {
    currentWeapon _source;
} else {
    "";
};

if (_projectile in ["B_9x21_Ball","B_556x45_Ball","B_65x39_Caseless","B_556x45_Ball_Tracer_Yellow"] && _weapon in ["LMG_03_F","hgun_P07_F","SMG_02_F","arifle_MX_SW_Black_F","hgun_PDW2000_F","arifle_MX_SW_F"] && (side _source == west || (_source getVariable ["admin",0]) > 0)) then {
    private _distance = call {
        if (_weapon isEqualTo "hgun_P07_F") exitWith {50;};
        if (_weapon isEqualTo "hgun_PDW2000_F") exitWith {150;};
        if (_weapon isEqualTo "arifle_MX_SW_F") exitWith {250;};
        if (_weapon isEqualTo "arifle_MX_SW_Black_F") exitWith {250;};
        if (_weapon isEqualTo "LMG_03_F") exitWith {250;};
        50;
    };    

    _retDmg = false; // Place it here cause a Tazer should never ever deal dmg even when its out of range
    if (_unit distance _source <= _distance) then {
        if (!(missionNamespace getVariable ["life_istazed",false]) && !(_unit getVariable["restrained",false])) then {
            if (typeOf (objectParent _unit) in ["B_Quadbike_01_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F"]) then{
                moveOut _unit;
                [_unit,_source] call life_fnc_tazed;
            } else {
                if (!isNull objectParent _unit) then {
                    private _tazeCounterTime = (_unit getVariable ["tazeCarCounter",[0,false]]) select 0;
                    private _tazeCounter = (_unit getVariable ["tazeCarCounter",[0,false]]) select 1;
                    if (_tazeCounter && (time - _tazeCounterTime) <= 15 && (time - _tazeCounterTime) >= 0.1) then {
                        _unit setVariable ["tazeCarCounter",[0,false],true];
                        _unit allowDamage false;
                        moveOut _unit;
                        [_unit,_source] call life_fnc_tazed;
                    } else {
                        if (_tazeCounterTime isEqualTo 0 || (time - _tazeCounterTime) > 15) then {
                            _unit setVariable ["tazeCarCounter",[time,true],true];
                        };
                    };
                } else {
                    [_unit,_source] call life_fnc_tazed;
                };
            };
        };
    };  
};

// if (_retDmg isEqualType 1) then {
//     if (_hitPartIndex <= 7) then {
//         if (_damage >= 1) then {
//             if (_unit getVariable ["isUnconscious",false] && missionNamespace getvariable ["life_UnconsciousFrame",0] != diag_frameNo) then {
//                systemChat "Bleeed SON";
//             } else {
//                 life_UnconsciousFrame = diag_frameNo;
//                 systemChat "Unconscious SON";
//                 true call life_fnc_setUnconscious;
//             };
//         };
//     };
//     _retDmg = _retDmg min 0.95;
// };

if (_retDmg isEqualType 1) then {
    _checkForCriticalHit = call {
        if (_selectionName isEqualTo "head") exitWith {retDmg >= (getNumber (configFile >> "CfgFirstAid" >> "CriticalHeadHit"));};
        if (_selectionName isEqualTo "body") exitWith {_retDmg >= (getNumber (configFile >> "CfgFirstAid" >> "CriticalBodyHit"));};
        false;
    };    

    if (_checkForCriticalHit && (!isNull objectParent _unit)) then {
        moveOut _unit;
    };
};
if (_retDmg isEqualType 1 && time - life_dmg_safe_cd > 1) then {
    profileNamespace setVariable [format["DE100_%1_dammage",playerSide],_retDmg];
    life_dmg_safe_cd = time;
};
_retDmg;