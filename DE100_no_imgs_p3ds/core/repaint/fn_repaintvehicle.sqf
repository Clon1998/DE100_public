/*
	File:	fn_repaintvehicle.sqf
	Date:   05.02.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	"_dialog",
	"_colorList",
	"_VehList",
	"_veh",
	"_colorClass",
	"_vehOwner",
	"_price"
];
disableSerialization;
_dialog = findDisplay 2300;
_VehList = _dialog displayCtrl 2302;
_colorList = _dialog displayCtrl 2303;
_veh = objectFromNetId (_VehList lbData (lbcursel _VehList));
_colorClass = _colorList lbData (lbcursel _colorList);

_price = 10000;
_vehOwner = _veh getVariable ["owner",["",""]];
closeDialog 0;


if (de100_luciandjuli_mula < _price) exitWith {["Du hast nicht genug Geld mit",true,"fast"] call life_fnc_notification_system;};
if ((getPlayerUID player) != (_vehOwner select 0)) exitWith {["DAs Fahrzeug gehört dir nicht",true,"fast"] call life_fnc_notification_system;};
_action = [
	format["Möchtest du das Fahrzeug wirklich für €%1 umlackieren",[_price] call life_fnc_numberText],
	"Fahrzeug umlackieren",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;
if(!_action) exitWith {["Umlackieren abgebrochen",true,"fast"] call life_fnc_notification_system;};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula - _price;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["VEH_fnc_updateC",false,[getPlayerUID player,call life_clientId select 0,_veh getVariable ["vid",-1],_colorClass]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["VEH_fnc_updateC",false,[getPlayerUID player,call life_clientId select 0,_veh getVariable ["vid",-1],_colorClass]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};
[_veh,_colorClass,true] call life_fnc_colorVehicle;
[_veh,_colorClass] call life_fnc_vehicleAnimate;