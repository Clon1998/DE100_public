/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle"];
if((life_action_delay != 0) && ((time - life_action_delay) < 2)) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;life_klickcount = life_klickcount + 1; if(life_klickcount> 2) then {closeDialog 0;life_klickcount = 0;};};
life_action_delay = time;

_control = ((findDisplay 2000) displayCtrl 2002);
_vehicle = objectFromNetId(_control lbData (lbCurSel _control));
_price = round (((getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "price")) * getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_chop_multiplier")));
if(isNull _vehicle) exitWith {};
if(_vehicle getVariable["rented",false]) exitWith {["Gemietete Fahrzeuge können aufgrund eines exploits nicht verkauft werden.",true,"fast"] call life_fnc_notification_system;};
if (life_action_inUse) exitwith {["Du verkaust bereits ein Fahrzeug",true,"fast"] call life_fnc_notification_system;};
life_action_inUse = true;

if (life_HC_isActive) then {
    [getPlayerUID player,call life_clientId select 0,_vehicle,_price] remoteExecCall ["CS_fnc_sell",HC_Life];
} else {
    [getPlayerUID player,call life_clientId select 0,_vehicle,_price] remoteExecCall ["CS_fnc_sell",2];
};
closeDialog 0;