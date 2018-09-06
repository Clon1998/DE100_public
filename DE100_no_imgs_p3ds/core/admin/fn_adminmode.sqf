/*
	File:	fn_adminmode.sqf
	Date:   2016-08-02 18:15:42
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

if((call life_adminlevel) == 0) exitWith {};

if(time - life_adminmode_delay < 2)exitWith{};
life_adminmode_delay = time;
private["_display","_list","_side"];

if (player getVariable ["admin",0] == 0) then {
    [player] call life_fnc_saveGear;
    life_safeGear = life_gear;
    player setVariable ["admin",(call life_adminlevel),true];

    player setUnitLoadout [["LMG_03_F","muzzle_snds_M","","optic_ERCO_blk_F",["200Rnd_556x45_Box_F",40000],[],""],[],["hgun_P07_F","","","",["30Rnd_9x21_Mag",40000],[],""],["U_I_HeliPilotCoveralls",[]],[],["B_Carryall_cbr",[]],"","",[],["","ItemGPS","ItemRadio","","","NVGoggles"]];

    if !(missionNamespace getVariable ["life_godmode",false]) then {    
        player removeAllEventHandlers"HandleDamage";
        player addEventHandler["HandleDamage",{false}];
    };

    ["Adminmodus aktiviert",false,"fast"] call life_fnc_notification_system;
    if (life_HC_isActive) then {
        [format["%1(UID: %2) hat den Adminmodus aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
    } else {
        [format["%1(UID: %2) hat den Adminmodus deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
    };
} else {
    player setVariable ["admin",nil,true];
    if !(missionNamespace getVariable ["life_godmode",false]) then {    
        player removeAllEventHandlers"HandleDamage";
        player addEventHandler["HandleDamage",{_this call life_fnc_handleDamage}];
    };
    life_gear = life_safeGear;
    [] call life_fnc_Loadgear;
    ["Adminmodus deaktiviert",false,"fast"] call life_fnc_notification_system;
};

[] call life_fnc_updateClothing;