/*
    File:   fn_saveGear.sqf
    Date:   2016-09-10 01:32:06
    Author: Patrick "Lucian" Schmidt
    Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
    
    Description:
    Take a look for yourself.
*/

params[
    ["_unit", objNull, [objNull]],
    "_return",
    "_val",
    "_yItems"
];

_return = [];
_yItems = [];
_return pushBack (getUnitLoadout _unit);

if (hasInterface && isPlayer _unit) then {
    {
        _val = [0,configName _x] call life_fnc_handleVItem;
        if (_val > 0) then {
            _yItems pushBack [(configName _x),_val];
        };
    } forEach ("(getNumber(_x >> 'safeToDB')) == 1" configClasses (missionConfigFile >> "VirtualItems"));

    _unit setVariable ["TrunkSave",_yItems,true];
    _return pushBack _yItems;
    _unit setVariable ["vhcPro",str getUnitLoadout _unit];
    life_gear = _return;
} else { 
    _return pushBack (_unit getVariable ["TrunkSave",[]]);
};

_return;