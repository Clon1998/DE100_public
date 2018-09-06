/*
	File:	fn_setUnconscious.sqf
	Date:   2017-04-29 22:49:26
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_state", false, [false]]
];

if (_state) then {
	if !(player getVariable ["isUnconscious",false]) then {
        player setVariable ["isUnconscious",true,true];
        player setUnconscious true;
        [player,"dead"] remoteExecCall ["setMimic",-2];
        if (!isNull objectParent player) then {
            [player,player call life_fnc_getDeathAnimation,1] call life_fnc_doAnimation;
        };
    };
} else {
	if (player getVariable ["isUnconscious",false]) then {
        player setVariable ["isUnconscious", false, true];
        player setUnconscious false;
        [player,"",0] call life_fnc_doAnimation;
        [player, "neutral"] remoteExecCall ["setMimic",-2];
    };
};