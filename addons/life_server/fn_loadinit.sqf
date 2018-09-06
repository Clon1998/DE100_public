#include "script_macros.hpp"
/*
	File:	fn_loadinit.sqf
	Date:   31.05.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.

	Description:
	Take a look for yourself.
*/
["Starting Server initialization"] call A3Log;
//de100_compiled = true;
//publicVariable "de100_compiled";

[[],TON_fnc_deCryptFiles]execFSM"core\fsm\call.fsm";
waitUntil {missionNamespace getVariable ["de100_compiled",false]};
life_HC_isActive = false;
life_HC_init = false;
HC_Life = false;
publicVariable "life_HC_isActive";
publicVariable "HC_Life";
// JIP integration of an hc
"HC_Life" addPublicVariableEventHandler {
    HC_UID = getPlayerUID hc_1;
    HC_LIFE publicVariableClient "AH_ADMIN_KEY";
    HC_Life publicVariableClient "DYN_Ready";
    HC_Life publicVariableClient "life_radio_west";
    HC_Life publicVariableClient "life_radio_civ";
    HC_Life publicVariableClient "life_radio_indep";
    HC_LIFE publicVariableClient "AH_PLAYER_CIDS";
    cleanupFSM setFSMVariable ["stopfsm",true];
    realtimeFSM setFSMVariable ["stopfsm",true];
    dbStatsFSM setFSMVariable ["stopfsm",true];
	//aucFSM setFSMVariable ["stopfsm",true];
    terminate dynMarket;
    life_HC_isActive = true;
    publicVariable "life_HC_isActive";
    [["*****************************************","HeadlessClient connected","Server terminated HC threats","*****************************************"]] call A3Log;
};

if !(call DB_fnc_load) exitwith {
	life_server_isReady = "extDB Error";
	publicVariable "life_server_isReady";
};

["CALL runFromGame",1] call DB_fnc_asyncCall;
AH_ADMIN_KEY = "battleye\CREATE_ID" callExtension "44";
[format["AdminKey erstellt %1",AH_ADMIN_KEY],"AH_CIDS"] call A3Log;
[] call TON_fnc_initHouses;
onPlayerConnected{[_uid,_owner] call TON_fnc_createID};
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];

//Starting some loops
dynMarket = [] spawn life_fnc_dynMarketInit;

waitUntil{!isNil "bank_obj"};
call AC_fnc_loadAuctions;
call CFG_fnc_load;
//General cleanup for clients disconnecting.

cleanupFSM = [] execFSM "\life_server\fsm\cleanup.fsm";
realtimeFSM = [] execFSM "\life_server\fsm\realtime.fsm";
cleanupGroupFSM = [] execFSM "\life_server\fsm\cleanupGroups.fsm";
dbStatsFSM = [] execFSM "\life_shared\fsm\dbStats.fsm";
//aucFSM = [] execFSM "\life_shared\fsm\refreshAuctions.fsm";
// Set up some Vars
life_wanted_list = [];
client_session_list = [];
alleTaxifahreronDuty = [];
life_nextrob = {0};

life_adminlevel = {0};
life_thrlevel = {0};
life_coplevel = {0};
CONST(JxMxE_PublishVehicle,"false");

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Polizei Funk", "%UNIT_NAME", [], false];
publicVariable "life_radio_west";
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Zivilisten Funk", "%UNIT_NAME", [], false];
publicVariable "life_radio_civ";
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "THR Funk", "%UNIT_NAME", [], false];//8
publicVariable "life_radio_indep";

life_telekom_1 = radioChannelCreate [[0, 0.95, 1, 0.8], "Mobilnetz 1", "%UNIT_NAME", [], false];
life_telekom_2 = radioChannelCreate [[0, 0.95, 1, 0.8], "Mobilnetz 2", "%UNIT_NAME", [], false];
life_telekom_3 = radioChannelCreate [[0, 0.95, 1, 0.8], "Mobilnetz 3", "%UNIT_NAME", [], false];
life_telekom_4 = radioChannelCreate [[0, 0.95, 1, 0.8], "Mobilnetz 4", "%UNIT_NAME", [], false];
life_telekom_5 = radioChannelCreate [[0, 0.95, 1, 0.8], "Mobilnetz 5", "%UNIT_NAME", [], false];
life_telekom_6 = radioChannelCreate [[0, 0.95, 1, 0.8], "Mobilnetz 6", "%UNIT_NAME", [], false];
life_telekom_7 = radioChannelCreate [[0, 0.95, 1, 0.8], "Mobilnetz 7", "%UNIT_NAME", [], false];

life_telekomInUse = [];
publicVariable "life_telekomInUse";

life_admin_moreXp = false;
publicVariable "life_admin_moreXp";

life_gamble_lastwinner = ["Niemand",0,0];
publicVariable "life_gamble_lastwinner";

life_gamble_zi = false;
publicVariable "life_gamble_zi";

[] spawn {
	life_gamble_serverCooldown = true;
	publicVariable "life_gamble_serverCooldown";
	uiSleep 360;
	life_gamble_serverCooldown = false;
	publicVariable "life_gamble_serverCooldown";
};

life_Lucian_Want_test = false;
publicVariable "life_Lucian_Want_test";


life_attachment_point = "Land_HelipadEmpty_F" createVehicle [0,0,0];
life_attachment_point setPosASL [0,0,0];
life_attachment_point setVectorDirAndUp [[0,1,0], [0,0,1]];
publicVariable "life_attachment_point";
waitUntil{!isNil "life_real_date"};
private _cfgFile = parseSimpleArray(("BattlEye\CfgReader" callExtension ["config\A3_InGame.cfg", ["SpendenShopStart","SpendenShopEnde"]]) select 0);
de100_Ty_ShopAktivated = (life_real_date >= (_cfgFile select 0) && life_real_date <= (_cfgFile select 1));

de100_ac_storage setVariable ["auc_max_packages",(parseSimpleArray(("BattlEye\CfgReader" callExtension ["config\A3_InGame.cfg", ["auc_max_packages"]]) select 0)) select 0,true];

publicVariable "de100_Ty_ShopAktivated";

//Strip NPC's of weapons
{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

_fault = ((nearestObjects  [(getMarkerPos "fed_reserve"),["Land_Dome_Small_F"],200 ]) select 0);
private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _fault) >> "NumberOfDoors");
for "_i" from 1 to _doors do {
	_fault setVariable [format ["bis_disabled_Door_%1",_i],1,true];
	[_fault,format["Door_%1A_move",_i],format["Door_%1B_move",_i]] call BIS_fnc_TwoWingSlideDoorClose;
};
_fault setVariable ["locked",true,true];
_fault allowDamage false;

diag_log format["Init start: %1 (in seconds)",time];
_handler = [] execVM "\life_server\tankstellen.sqf";
waitUntil { scriptDone _handler};
_handler = [] execVM "\life_server\tankbehaelter.sqf";
waitUntil { scriptDone _handler};
diag_log format["init ende: %1 (in seconds)",time];
[] execVM "\life_server\Functions\Dealer\fn_spawnDealer.sqf";

life_server_isReady = true;
publicVariable "life_server_isReady";
["Server initialized"] call A3Log;
