/*
    File: fn_survival.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    All survival? things merged into one thread.
*/
private["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkTimer","_lastPos","_curPos","_type","_data","_backpackFaktor","_crntData"];
_fnc_food =  {
    if (life_hunger < 2) then {
        player setDamage 1; 
        profileNamespace setVariable [format["DE100_%1_hunger",playerSide],100];
        [localize "STR_NOTF_EatMSG_Death",false,"fast"] call life_fnc_notification_system;
    } else {
        life_hunger = life_hunger - 10;
        profileNamespace setVariable [format["DE100_%1_hunger",playerSide],life_hunger];
        if (life_hunger < 2) then {player setDamage 1; [localize "STR_NOTF_EatMSG_Death",false,"fast"] call life_fnc_notification_system;};
        switch (life_hunger) do {
            case 30: {[localize "STR_NOTF_EatMSG_1",true,"fast"] call life_fnc_notification_system; };
            case 20: {[localize "STR_NOTF_EatMSG_2",true,"fast"] call life_fnc_notification_system; };
            case 10: {[localize "STR_NOTF_EatMSG_3",true,"fast"] call life_fnc_notification_system;  life_prof_noXp = true;};
        };
    };
};

_fnc_water = {
    if (life_thirst < 2) then {
        player setDamage 1;
        profileNamespace setVariable [format["DE100_%1_thirst",playerSide],100];
       [localize "STR_NOTF_DrinkMSG_Death",true,"fast"] call life_fnc_notification_system; 
    } else {
        life_thirst = life_thirst - 10;
        profileNamespace setVariable [format["DE100_%1_thirst",playerSide],life_thirst];
        if (life_thirst < 2) then {player setDamage 1; [localize "STR_NOTF_DrinkMSG_Death",false,"fast"] call life_fnc_notification_system; };
        switch(life_thirst) do
        {
            case 30: {[localize "STR_NOTF_DrinkMSG_1",true,"fast"] call life_fnc_notification_system; };
            case 20: {[localize "STR_NOTF_DrinkMSG_2",true,"fast"] call life_fnc_notification_system; life_prof_noXp = true;};
            case 10: {[localize "STR_NOTF_DrinkMSG_3",true,"fast"] call life_fnc_notification_system; life_prof_noXp = true;};
        };
    };
};

//Setup the time-based variables.
_foodTime = time;
_waterTime = time;
_walkTimer = time;
private _radTimer = time;
_bp = "";
_lastPos = visiblePosition player;
_lastPos = [(_lastPos select 0),(_lastPos select 1),0];
_lastState = vehicle player;
_setPosNil = false;
_type = call {if (playerSide isEqualTo civilian) exitWith {"carrying_Prof";};if (playerSide isEqualTo west) exitWith {"carrying_cop_Prof";};if (playerSide isEqualTo independent) exitWith {"carrying_thr_Prof";};};
_crntData = (missionNamespace getVariable [getText(missionConfigFile >> "ProfSys" >> _type >> "variable"),[0,0]]) select 0;
for "_i" from 0 to 1 step 0 do {
    /* Thirst / Hunger adjustment that is time based */
    if ((time - _waterTime) > 600 && player getVariable ["isAlive",true]) then {[] call _fnc_water; _waterTime = time;};
    if ((time - _foodTime) > 850 && player getVariable ["isAlive",true]) then {[] call _fnc_food; _foodTime = time;};
    if ((time - _walkTimer) > 30) then {
        profileNamespace setVariable [format["DE100_%1_dammage",playerSide],(getDammage player)];
        _lastPos = visiblePosition player;
        _lastPos set[2,0];
        if (alive player && playerSide in [civilian,west] && player getVariable ["isAlive",true]) then {
            if (!life_session_completed || life_firstSpawn || life_pause_pos)exitWith{};

            bank_obj setVariable [(format["DE100_UID_%2_%1",(getPlayerUID player),playerSide]),_lastPos,true];
            if (!isNil "DE100_Diagnostic") then {
                systemChat "Set/update Pos";
            };
            _setPosNil = false;
        } else {
            if (!_setPosNil) then {
                bank_obj setVariable [(format["DE100_UID_%2_%1",(getPlayerUID player),playerSide]),nil,true];
                _setPosNil = true;
                if (!isNil "DE100_Diagnostic") then {
                    systemChat "Set/update NilPos";
                };
            };
        };
        _walkTimer = time;
    };

    /* Adjustment of carrying capacity based on backpack changes */
    if (backpack player isEqualTo "") then {
        life_maxWeight = life_maxWeightT;
        _bp = backpack player;
    } else {
        _data = (missionNamespace getVariable [getText(missionConfigFile >> "ProfSys" >> _type >> "variable"),[0,0]]) select 0;
        if (!(backpack player isEqualTo "") && !(backpack player isEqualTo _bp) || _data != _crntData) then {
            _bp = backpack player;
            _crntData = _data;
            _backpackFaktor = (_type call life_fnc_getProf) select 0;
            life_maxWeight = (life_maxWeightT + round((getNumber(configFile >> "CfgVehicles" >> _bp >> "maximumload") / 8) * _backpackFaktor));
        };
    };

    /* Check if the player's state changed? */
    if (vehicle player != _lastState || {!alive player}) then {
        [] call life_fnc_updateViewDistance;
        _lastState = vehicle player;
    };

    if (playerSide isEqualTo civilian && (player getVariable ["newBee",false]) && !((currentWeapon player) isEqualTo "") && !((currentWeapon player) isEqualTo (binocular player))) then {
        ["NEWBEE"] call SOCK_fnc_updatePartial;
        player setVariable ["newBee",false,true];
        ["Neulingsstatus erloschen",false,"fast"] call life_fnc_notification_system;
    };

    /* Check if the weight has changed and the player is carrying to much */
    if (life_carryWeight > life_maxWeight && {!isForcedWalk player}) then {
        player forceWalk true;
        life_prof_noXp = true;
        [localize "STR_NOTF_MaxWeight",false,"fast"] call life_fnc_notification_system; 
    } else {
        if (isForcedWalk player && (getFatigue player) isEqualTo 0) then {
            player forceWalk false;
        };
    };
    if (isNil "de100_luciandjuli_bc") then {
        de100_luciandjuli_bc = 0;
    };
    if (isNil "de100_luciandjuli_mula") then {
        de100_luciandjuli_mula = 0;  
    };
    private _rObj = fed_bank getVariable ["radiationObject", objNull];
    if !(isNull _rObj) then {
        if (time - _radTimer < 5) exitWith {};
        private _dis = player distance _rObj;
        if (_dis <= getNumber(missionConfigFile >> "Life_Settings" >> "radiation_range") && !(uniform player isEqualTo getText(missionConfigFile >> "Life_Settings" >> "radiation_suit"))) then {
            _dis call life_fnc_handleRadiation;
            _radTimer = time;
        };
    };
    uiSleep 1;
};
