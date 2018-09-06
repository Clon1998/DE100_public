/*
	File:	fn_copIM.sqf
	Date:   2016-10-29 01:05:51
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _target = param [0,objNull,[objNull]];
if (isNull _target) exitwith {};
private _escorting = _target getVariable["Escorting",false];
private _fSit = _target getVariable["forceSit",false];
private _execRdy = _target getVariable["executionReady",false];
private _civBlind = _target getVariable["SackDrauf",false];
private _copRestrained = _target getVariable["restrained",false];
private _hasIDCart = _target getVariable["Perso_has_IdCard",false];
private _canArrest = player distance (getMarkerPos "police_hq_1") < 30 || player distance (getMarkerPos "police_hq_2") < 30 || player distance (getMarkerPos "cop_spawn_3") < 30 || player distance (getMarkerPos "police_hq_1_1") < 30 || player distance (getMarkerPos "Correctional Facility") < 30 || player distance (getMarkerPos "cop_spawn_5") < 30;
private _actions = [];
if (_target distance player > 5) exitwith {};

if (_target getVariable ["isAlive",true]) then {
	if (_copRestrained) then {
		_actions pushBackUnique [10,localize "STR_pInAct_Unrestrain","closeDialog 0; [life_action_target] call life_fnc_unrestrain;"];
		if (_execRdy) then {
			_actions pushBackUnique [9,"Aufstehen","closeDialog 0; life_action_target setVariable ['executionReady',false,true]"];
		} else {
			if (_fSit) then {
				_actions pushBackUnique [9,"Aufstehen","closeDialog 0; life_action_target setVariable ['forceSit',false,true];"];
			} else {
				_actions pushBackUnique [9,"Hinsetzen","closeDialog 0; life_action_target setVariable ['forceSit',true,true];"];
			};
		};
		_actions pushBackUnique [8,localize "STR_pInAct_SearchPlayer","closeDialog 0; [life_action_target] call life_fnc_searchAction;"];
		_actions pushBackUnique [7,localize "STR_pInAct_checkLicenses","closeDialog 0; [player] remoteExecCall [""life_fnc_licenseCheck"",life_action_target];"];
		_actions pushBackUnique [6,localize "STR_pInAct_TicketBtn","closeDialog 0; [life_action_target] call life_fnc_ticketAction;"];
		_actions pushBackUnique [5,localize "STR_pInAct_PutInCar","closeDialog 0; [life_action_target] call life_fnc_putInCar;"];
		
		if (_escorting) then {
			_actions pushBackUnique [9,localize "STR_pInAct_StopEscort","closeDialog 0; [life_action_target] call life_fnc_stopEscorting;"];
		} else {
			_actions pushBackUnique [9,localize "STR_pInAct_Escort","closeDialog 0; [life_action_target] call life_fnc_escortAction;"];
		};

		if (_canArrest) then {
			_actions pushBackUnique [-1,localize "STR_pInAct_Arrest","closeDialog 0; [] call life_fnc_showArrestDialog;"];
		};

		if (_hasIDCart) then {
			_actions pushBackUnique [-1,"Perso ansehen","closeDialog 0; [0, life_action_target] call life_fnc_handleIDCard;"];
		};
	};

	if (_civBlind) then {
		_actions pushBackUnique [-1,"Sack entfernen","closeDialog 0; [] remoteExecCall ['life_fnc_bag',life_action_target];"];
	};

	_actions pushBackUnique [-1,"Ausweis zeigen","closeDialog 0; [1 , life_action_target] call life_fnc_handleIDCard;"];	
} else {
	if (_target getVariable ["painKiller",false]) then {
        _actions pushBackUnique [-1,"Epinephrin injizieren","closeDialog 0; [life_action_target,1] call life_fnc_revive;"];
    } else {
        _actions pushBackUnique [-1,"Morphium injizieren","closeDialog 0; [life_action_target,0] call life_fnc_revive;"];
    };
	_actions pushBackUnique [-1,"Ziehen","closeDialog 0; [0,life_action_target] call life_fnc_drag;"];
};

[_target,_actions,"Polizeiinteraktionsmenü"] call life_fnc_openMenu;