#include "hc_macros.hpp"
/*
    File: fn_initHC.sqf
    Author: Nanou
    Description:
    Initialize the headless client.
*/
["Starting HeadlessClinet initialization"] call A3Log;

CONST(life_adminlevel,0);
CONST(life_coplevel,0);
CONST(life_thrlevel,0);
waitUntil {missionNamespace getVariable ["de100_compiled",false]};
waitUntil{!isNil "bank_obj"};
waitUntil{(missionNamespace getVariable ["life_server_isReady",false]) isEqualTo true};

if !(call DB_fnc_load) exitwith {
    life_HC_isActive = "extDB Error";
    publicVariable "life_HC_isActive";
};

[] spawn HC_fnc_dynMarketinit;
[] execFSM "\life_hc\FSM\realtime.fsm";
[] execFSM "\life_shared\fsm\dbStats.fsm";
[] execFSM "\life_shared\fsm\refreshAuctions.fsm";
cleanupFSM = [] execFSM "\life_hc\FSM\cleanup.fsm";
call AC_fnc_loadAuctions;

HC_Life = clientOwner;
publicVariable "HC_Life";
["HeadlessClinet initialized"] call A3Log;