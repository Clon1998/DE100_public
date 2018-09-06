/*
	File : fn_handleTimes.sqf
	Date:   17.02.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params [
	["_Display", "", [displayNull]],
	"_money",
	"_player",
	"_gameTimeCtrl",
	"_batteryCtrl",
	"_timeData"
];

_money = de100_luciandjuli_bc;
_player = player;
_gameTimeCtrl = _Display displayCtrl 6513;
_batteryCtrl = _Display displayCtrl 6512;

if (player getVariable["restrained",false]) exitWith {
	_Display closeDisplay 2;
	["Du bist gefesselt!",true,"fast"] call life_fnc_notification_system;
};

while{!isNull _Display && life_battery > 0} do
{
	_timeData = [2] call life_fnc_timeToStr;
	_gameTimeCtrl ctrlSetText (_timeData select 0);
	_batteryCtrl ctrlSetText format["%1%2",round (life_battery),"%"];
	sleep 3;
};
