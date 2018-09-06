/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private["_itemArray","_handle","_virtItems"];
_itemArray = life_gear;
_virtItems = [];
waitUntil {!(isNull (findDisplay 46))};

[player] call life_fnc_stripDownUnit;

if(count _itemArray == 0) exitWith {
    if (playerSide isEqualTo civilian) exitWith {call life_fnc_civLoadout;};
    if (playerSide isEqualTo west) exitWith {call life_fnc_copLoadout;};
    if (playerSide isEqualTo independent) exitWith {call life_fnc_thrloadout;};
};

_itemArray params [
    "_loadoutArray",
    ["_yItems",[]]
];
_virtItems = _yItems;
if (_loadoutArray in [[[],[],[],["U_C_WorkerCoveralls",[]],[],[],"","",[],["","","","","",""]],[[],[],[],[],[],[],"","",[],["","","","","",""]],[[],[],[],[],[],[],"","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]]) then {
    if (playerSide isEqualTo civilian) exitWith {call life_fnc_civLoadout;};
    if (playerSide isEqualTo west) exitWith {call life_fnc_copLoadout;};
    if (playerSide isEqualTo independent) exitWith {call life_fnc_thrloadout;};
}else {
    player setUnitLoadout _loadoutArray;
};


life_maxWeight = 150;
{
    missionNamespace setVariable[format['life_inv_%1',getText(_x >> 'variable')],0];
    nil;
} count ('true'configClasses(missionConfigFile>>'VirtualItems'));    
life_carryWeight=0;

{
    if (_x isEqualType []) then {
        [true,_x select 0,_x select 1] call life_fnc_handleInv;
    };
    nil;
} count (_virtItems);

life_maxWeight = 24;
player setVariable ["vhcPro",str getUnitLoadout player];
[] call life_fnc_updateClothing;