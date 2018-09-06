/*
   File:    fn_handleHeist.sqf
   Date:    2018-2-24 15:11:50
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

params [
	["_vendor", objNull],
	["_caller", objNull],
	["_addactionId", 0],
	["_mode", 0]
];

call {
    if (_mode == 0) exitWith {
        if (isRemoteExecuted) exitWith {};
        if (isNull _caller || _caller distance fed_bank > 5) exitWith {};
        if (!isNull (fed_bank getVariable ["src",objNull])) exitWith {
            ["Der Behälter wird bereits aufgebrochen", true, "fast"] call life_fnc_notification_system;
        };

        if !(fed_bank getVariable ["locked",true]) exitWith {
            ["Der Behälter ist bereits offen", true, "fast"] call life_fnc_notification_system;
        };

        if (west countSide playableUnits < 8) exitWith {
            [format["Es sind nicht genügend Polizisten im Dienst"],true,"fast"] call life_fnc_notification_system;
        };

        fed_bank setVariable ["src",player,true];

        [[0,3],"In das Kernforschungslabor wird eingebrochen"] remoteExecCall ["life_fnc_broadcast",-2];
        ["Solltest du sterben wird der Timer abgebrochen!", false, "fast"] call life_fnc_notification_system;
        [fed_bank,["citySiren",1000]] remoteExecCall ["say3d",-2];
        [nil,nil,nil,1] remoteExec ["life_fnc_handleHeist",[west,group player]];
    };
    if (_mode == 1) exitWith {
        disableSerialization;
        private _id = "life_timer" call BIS_fnc_rscLayer;
        _id cutRsc ["life_timer","PLAIN"];
        private _uiDisp = uiNamespace getVariable "life_timer";
        private _timer = _uiDisp displayCtrl 38301;
        private _time = time + (25 * 60);

        while {true;} do {
            if(isNull _uiDisp) then {
                _id cutRsc ["life_timer","PLAIN"];
                _uiDisp = uiNamespace getVariable "life_timer";
                _timer = _uiDisp displayCtrl 38301;
            };
            if (round(_time - time) < 1) exitWith {};
            if (isnull (fed_bank getVariable["src",objNull])) exitWith {};
            if !(fed_bank getVariable["locked",true]) exitWith {};
            _timer ctrlSetText format["%1",[(_time - time),"MM:SS"] call BIS_fnc_secondsToString];
            sleep 0.08;
        };
        _id cutText["","PLAIN"];

        if (player isEqualTo (fed_bank getVariable["src",objNull])) then {
            fed_bank setVariable ["locked",false,true];
            fed_bank setVariable ["stock",true,true];
            [[0,3],"Der Sicherheitsbehälters wurde geknackt!"] remoteExecCall ["life_fnc_broadcast",-2];
            [[12128.7,10553.9,0.00252819],[12165.8,10530.6,0.00213432], 50 + random 30] remoteExecCall ["life_fnc_smokeCanon",-2];
            ["Der Kontaktmann für den Verkauf der Ware ist auf dem Radar aufgetaucht!!",true,"fast"] call life_fnc_notification_system;
            call life_fnc_setTrader;
        };
    };
    if (_mode == 2) exitWith {
        fed_bank setVariable ["src",nil,true];
        fed_bank setVariable ["locked",true,true];
        [[0,3],"Der Sicherheitsbehälter wurde versiegelt!"] remoteExecCall ["life_fnc_broadcast",-2];
    };
};
