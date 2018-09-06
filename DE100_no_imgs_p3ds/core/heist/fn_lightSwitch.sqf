/*
Author: McKenzie
Description: Switches off // Switches on the Lights for a pre definded Array of Lights. Use Lights which are on by default

Can be called with [] hst_fnc_LightWitch
*/

if (!isNull objectParent player) exitwith {
    [format["Dein Arm ist nicht lang genug um den Schalter zu erreichen"],true,"fast"] call life_fnc_notification_system;
};
if (!alive Player || !(player getVariable ["isAlive",true])) exitwith {};
if (player getVariable["restrained",false]) exitwith {
    [format["Du bist gefesselt"],true,"fast"] call life_fnc_notification_system;
};
if (life_istazed) exitwith {
    [format["Du bist getazerd worden"],true,"fast"] call life_fnc_notification_system;
};
if (life_action_inUse) exitwith {
    [format["Du musst noch warten"],true,"fast"] call life_fnc_notification_system;
};

private _onFinish = {
    params[
        ["_success", false, [false]]
    ];
    if (_success) then {
        private _bool = simulationEnabled L1;
        {
            _x setDamage 0;
            [getPlayerUID player, call life_clientId select 0,_x,!_bool] remoteExecCall ["MSC_fnc_enableSimulation",2];
            nil;
        } count [L1,L2,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,L14,L15,L16,L17,L18,L19,L20,L21,L22,L23,L24,L25,L26];
    } else {
        [format["Während du an den Kabeln arbeitest, musst du still halten"],true,"fast"] call life_fnc_notification_system;
    };
    life_action_inUse = false;
};

life_action_inUse = true;
[15,"Neuverkabelung läuft",{false},[],_onFinish,_onFinish] spawn life_fnc_progressBar;
