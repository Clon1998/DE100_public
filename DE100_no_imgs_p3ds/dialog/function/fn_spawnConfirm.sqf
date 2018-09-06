/*
    File:   fn_spawnConfirm.sqf
    Date:   2016-08-15 02:47:26
    Author: Patrick "Lucian" Schmidt
    Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
    
    Description:
    Take a look for yourself.
*/

private["_spCfg", "_sp", "_spawnPos"];
closeDialog 0;
cutText["", "BLACK IN"];
if (count life_spawn_point == 0) then {
    private["_sp", "_spCfg"];
    _spCfg = [playerSide] call life_fnc_spawnPointCfg;
    _sp = _spCfg select 0;
    if (playerSide == civilian) then {
        if (isNil {
                (parseSimpleArray format["%1", _sp select 0])
            }) then {
            player setPos(getMarkerPos(_sp select 0));
        } else {
            _spawnPos = selectRandom(parseSimpleArray format["%1", _sp select 0]);
            _spawnPos = _spawnPos buildingPos 0;
            player setPos _spawnPos;
        };
    } else {
        player setPos(getMarkerPos(_sp select 0));
    };
    titleText["", "BLACK IN"];
} else {
    if (playerSide == civilian) then {
        if ((["house", life_spawn_point select 0] call BIS_fnc_inString)) then {
            private["_bPos", "_house", "_pos"];
            _house = nearestObjects[getMarkerPos(life_spawn_point select 0), ["House_F"], 10] select 0;
            _bPos = [_house] call life_fnc_getBuildingPositions;
            if (count _bPos == 0) exitWith {
                player setPos(getMarkerPos(life_spawn_point select 0));
            }; {
                _bPos = _bPos - [(_house buildingPos _x)];
            }
            foreach(_house getVariable["slots", []]);
            _pos = selectRandom _bPos;
            player setPosATL _pos;
        } else {
            player setPos(getMarkerPos(life_spawn_point select 0));
        };
    } else {
        player setPos(getMarkerPos(life_spawn_point select 0));
    };
    titleText["", "BLACK IN"];
};
player playMoveNow "";
[player,""] remoteExec ["switchMove",-2];
if (life_firstSpawn) then {
    life_firstSpawn = false;
    [] call life_fnc_hudSetup;
    [] spawn life_fnc_welcomeNotification;
    if (player getVariable ["newBee",false]) then {
        ["Neulingsstatus ist Aktiv<br/>Jeder kann deinen Namen sehen<br/>Nach 10 Stunden Spielzeit verfällt der Schutz, oder wenn du eine Waffe hast.",true,"slow"] call life_fnc_notification_system;
    };
} else {
    [] spawn {
        "DynamicBlur" ppEffectEnable true;
        "DynamicBlur" ppEffectAdjust [0];
        "DynamicBlur" ppEffectCommit 4;

        waitUntil {
            ppEffectCommitted "DynamicBlur"
        };
        "DynamicBlur" ppEffectEnable true;
    };
};
Camrunning = false;
player setVariable ["inMission",true,true];
call life_fnc_hudShow;
life_pause_pos = false;
if ((life_spawn_point select 0) == "nobody_spawn") then {
    ['join'] call life_fnc_initNobody;
};