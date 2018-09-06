/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param;
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];

[localize "STR_Jail_Warn",false,"fast"] call life_fnc_notification_system;
[localize "STR_Jail_LicenseNOTF",false,"fast"] call life_fnc_notification_system;
player setPos [16707,13683.1,4.3];

if(_bad) then
{
	cutText ["","BLACK IN",2];
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance [16707,13683.1,4.3] > 40) then
{
	player setPos [16707,13683.1,4.3];
};

[1] call life_fnc_removeLicenses;
{
	_amount = [0,configName _x] call life_fnc_handleVItem;
	if(_amount > 0) then {
		[false,configName _x,_amount] call life_fnc_handleInv;
	};
} forEach ("(getNumber(_x >> 'illegal')) == 1" configClasses (missionConfigFile >> "VirtualItems"));

life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} forEach (magazines player);
[player,_bad,_time] remoteExecCall ["life_fnc_jailSys",2];
["JAILED"] call SOCK_fnc_updatePartial;