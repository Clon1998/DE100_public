/*
	File : fn_chopShopBuyBack.sqf
	Date:   20.11.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


disableSerialization;
if((life_action_delay != 0) && ((time - life_action_delay) < 2)) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;life_klickcount = life_klickcount + 1; if(life_klickcount> 2) then {closeDialog 0;life_klickcount = 0;};};
life_action_delay = time;

private _control = ((findDisplay 2000) displayCtrl 2002);
private _class = _control lbData (lbCurSel _control);
private _vid = [_control lbValue (lbCurSel _control)] call life_fnc_number;
private _price = round ((getNumber(missionConfigFile >> "lifeVehicles" >> _class >> "price") * getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_chop_bb_multiplier")));

if (de100_luciandjuli_bc < _price) exitWith {["Du hast nicht genug Geld auf der Bank",true,"fast"] call life_fnc_notification_system;};
if (_price+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
};
life_action_inUse = true;
if (life_HC_isActive) then {
    [getPlayerUID player,call life_clientId select 0,_vid,_class,_price] remoteExecCall ["CS_fnc_buy",HC_Life];
} else {
    [getPlayerUID player,call life_clientId select 0,_vid,_class,_price] remoteExecCall ["CS_fnc_buy",2];
};
closeDialog 0;