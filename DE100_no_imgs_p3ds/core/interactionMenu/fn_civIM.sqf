/*
	File:	fn_civIM.sqf
	Date:   2016-10-29 01:05:44
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _target = param [0,objNull,[objNull]];
if (isNull _target) exitwith {};
if (_target distance player > 5) exitwith {};
private _escorting = _target getVariable["Escorting",false];
private _restrained = _target getVariable["restrained",false] && {side objectFromNetId(_target getVariable ["restrainSource",""]) != west} && {objectFromNetId(_target getVariable ["restrainSource",""]) in units (group player)};
private _fSit = _target getVariable["forceSit",false];
private _execRdy = _target getVariable["executionReady",false];
private _civBlind = _target getVariable["SackDrauf",false];
private _hasIDCart = _target getVariable["Perso_has_IdCard",false];
private _actions = [];

if (_target getVariable ["isAlive",true]) then {
    if (_restrained) then {
        _actions pushBackUnique [10,localize "STR_pInAct_Unrestrain","closeDialog 0; [life_action_target] call life_fnc_unrestrain;"];
        _actions pushBackUnique [5,localize "STR_pInAct_PutInCar","closeDialog 0; [life_action_target] call life_fnc_putInCar;"];
        _actions pushBackUnique [4,"Entwaffnen","closeDialog 0; if(!isNull life_action_target) then {player remoteExecCall ['life_fnc_disarm',life_action_target];}"];

        if (_fSit) then {
            _actions pushBackUnique [8,"Aufstehen","closeDialog 0; life_action_target setVariable ['forceSit',false,true];"];
        } else {
            if (_execRdy) then {
                _actions pushBackUnique [8,"Aufstehen","closeDialog 0; life_action_target setVariable ['executionReady',false,true]"];
                _actions pushBackUnique [7,"Vorhand","closeDialog 0; [life_action_target,'Forhand'] spawn life_fnc_torture"];
                _actions pushBackUnique [7,"Rückhand","closeDialog 0; [life_action_target,'Backhand'] spawn life_fnc_torture"];
            } else { 
                _actions pushBackUnique [7,"Hinrichtung","closeDialog 0; life_action_target setVariable ['executionReady',true,true]"];
            };
        };

        
        if (_escorting) then {
            _actions pushBackUnique [9,localize "STR_pInAct_StopEscort","closeDialog 0; [life_action_target] call life_fnc_civstopEscorting;"];
        } else {
            _actions pushBackUnique [9,localize "STR_pInAct_Escort","closeDialog 0; [life_action_target] call life_fnc_civescortAction;"];
        };

        if (_hasIDCart) then {
            _actions pushBackUnique [3,"Perso ansehen","closeDialog 0; [0, life_action_target] call life_fnc_handleIDCard;"];
        };

        if (_civBlind) then {
            _actions pushBackUnique [2,"Sack entfernen","closeDialog 0; [] remoteExecCall ['life_fnc_bag',life_action_target];"];
        } else {
            if (life_inv_bag > 0) then {
                _actions pushBackUnique [2,"Sack benutzen","closeDialog 0; [] remoteExecCall ['life_fnc_bag',life_action_target]; [false,'bag',1] call life_fnc_handleInv;"];
            };
        };
    };

    _actions pushBackUnique [-1,"Ausweise","life_action_target call life_fnc_licenseIM;"];
} else {
    if (_target getVariable ["painKiller",false]) then {
        _actions pushBackUnique [-1,"Epinephrin injizieren","closeDialog 0; [life_action_target,1] call life_fnc_revive;"];
    } else {
        _actions pushBackUnique [-1,"Morphium injizieren","closeDialog 0; [life_action_target,0] call life_fnc_revive;"];
    };
    _actions pushBackUnique [-1,"Ziehen","closeDialog 0; [0,life_action_target] call life_fnc_drag;"];
    //_actions pushBackUnique [-1,"Tragen","closeDialog 0; [0,life_action_target] spawn life_fnc_carry;"];
};


[_target,_actions,"Spielerinteraktionsmenü"] call life_fnc_openMenu;